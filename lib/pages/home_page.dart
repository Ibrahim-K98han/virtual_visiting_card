import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_visiting_card/pages/form_page.dart';
import 'package:virtual_visiting_card/providers/contact_provider.dart';
import 'package:virtual_visiting_card/utils/hepers.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  bool isFirst = true;

  @override
  void didChangeDependencies() {
    if (isFirst) {
      Provider.of<ContactProvider>(context, listen: false).getAllContacts();
    }
    isFirst = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contact List'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, FormPage.routeName);
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.zero,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: Colors.blue.shade50,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            currentIndex: selectedIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'All'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorites')
            ],
          ),
        ),
        body: Consumer<ContactProvider>(
          builder: (context, provider, _) {
            if (provider.contactList.isEmpty) {
              return const Center(
                child: Text('Nothing to show'),
              );
            }
            return ListView.builder(
              itemCount: provider.contactList.length,
              itemBuilder: (context, index) {
                final contact = provider.contactList[index];
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    padding: const EdgeInsets.only(right: 20),
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  confirmDismiss: _showConfirmationDialog,
                  onDismissed: (direction) async {
                    await provider.deleteContact(contact.id);
                    showMsg(context, 'Deleted');
                  },
                  key: UniqueKey(),
                  child: ListTile(
                    title: Text(contact.name),
                    trailing: IconButton(
                      onPressed: () {
                        provider.updateContactField(contact);
                      },
                      icon: Icon(contact.favorite
                          ? Icons.favorite
                          : Icons.favorite_border),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }

  Future<bool?> _showConfirmationDialog(DismissDirection direction) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Contact'),
        content: const Text('Are you sure to delete this contact?'),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: const Text('NO'),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: const Text('YES'),
          )
        ],
      ),
    );
  }
}
