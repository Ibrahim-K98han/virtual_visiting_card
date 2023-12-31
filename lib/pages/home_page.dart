// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:virtual_visiting_card/pages/contact_details_page.dart';
// import 'package:virtual_visiting_card/pages/form_page.dart';
// import 'package:virtual_visiting_card/pages/scan_page.dart';
// import 'package:virtual_visiting_card/providers/contact_provider.dart';
// import 'package:virtual_visiting_card/utils/hepers.dart';
//
// import '../models/contact_model.dart';
//
// class HomePage extends StatefulWidget {
//   static const String routeName = '/';
//
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int selectedIndex = 0;
//   bool isFirst = true;
//
//   @override
//   void didChangeDependencies() {
//     if (isFirst) {
//       Provider.of<ContactProvider>(context, listen: false).getAllContacts();
//     }
//     isFirst = false;
//     super.didChangeDependencies();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Contact List'),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Navigator.pushNamed(context, ScanPage.routeName);
//           },
//           shape: const CircleBorder(),
//           child: const Icon(Icons.add),
//         ),
//         bottomNavigationBar: BottomAppBar(
//           padding: EdgeInsets.zero,
//           shape: const CircularNotchedRectangle(),
//           notchMargin: 10,
//           clipBehavior: Clip.antiAlias,
//           child: BottomNavigationBar(
//             backgroundColor: Colors.blue.shade50,
//             onTap: (index) {
//               setState(() {
//                 selectedIndex = index;
//               });
//             },
//             currentIndex: selectedIndex,
//             items: const [
//               BottomNavigationBarItem(icon: Icon(Icons.person), label: 'All'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.favorite), label: 'Favorites')
//             ],
//           ),
//         ),
//         body: Consumer<ContactProvider>(
//           builder: (context, provider, _) {
//             if (provider.contactList.isEmpty) {
//               return const Center(
//                 child: Text('Nothing to show'),
//               );
//             }
//             return ListView.builder(
//               itemCount: provider.contactList.length,
//               itemBuilder: (context, index) {
//                 final contact = provider.contactList[index];
//                 return Dismissible(
//                   direction: DismissDirection.endToStart,
//                   background: Container(
//                     padding: const EdgeInsets.only(right: 20),
//                     alignment: Alignment.centerRight,
//                     color: Colors.red,
//                     child: const Icon(
//                       Icons.delete,
//                       color: Colors.white,
//                     ),
//                   ),
//                   confirmDismiss: _showConfirmationDialog,
//                   onDismissed: (direction) async {
//                     await provider.deleteContact(contact.id);
//                     showMsg(context, 'Deleted');
//                   },
//                   key: UniqueKey(),
//                   child: ListTile(
//                     onTap: () => Navigator.pushNamed(
//                         context, ContactDetailsPage.routeName,
//                         arguments: contact.id),
//                     title: Text(contact.name),
//                     trailing: IconButton(
//                       onPressed: () {
//                         provider.updateContactField(
//                             contact, tableContactFavorite);
//                       },
//                       icon: Icon(contact.favorite
//                           ? Icons.favorite
//                           : Icons.favorite_border),
//                     ),
//                   ),
//                 );
//               },
//             );
//           },
//         ));
//   }
//
//   Future<bool?> _showConfirmationDialog(DismissDirection direction) {
//     return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Delete Contact'),
//         content: const Text('Are you sure to delete this contact?'),
//         actions: [
//           OutlinedButton(
//             onPressed: () {
//               Navigator.pop(context, false);
//             },
//             child: const Text('NO'),
//           ),
//           OutlinedButton(
//             onPressed: () {
//               Navigator.pop(context, true);
//             },
//             child: const Text('YES'),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:virtual_visiting_card/models/contact_model.dart';
import 'package:virtual_visiting_card/pages/scan_page.dart';

import '../providers/contact_provider.dart';
import '../utils/hepers.dart';
import 'contact_details_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  const HomePage({super.key});

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
        title: const Text(
          'Contact List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue.shade200,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
              ),
              child: const Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    maxRadius: 45,
                    child: Text(
                      'V V C',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Virtual Visiting Card',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: const ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    'All Contact',
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: const ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text(
                    'Favorite',
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, ScanPage.routeName);
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
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
            _fetchData();
          },
          currentIndex: selectedIndex,
          backgroundColor: Colors.white,
          fixedColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                label: 'All Contacts'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorite Contacts'),
          ],
          selectedLabelStyle: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
          unselectedLabelStyle: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
        ),
      ),
      body: Consumer<ContactProvider>(
        builder: (context, provider, _) {
          if (provider.contactList.isEmpty) {
            return const Center(
              child: Text(
                'Nothing to show',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
            );
          }
          return ListView.builder(
            itemCount: provider.contactList.length,
            itemBuilder: (context, index) {
              final contact = provider.contactList[index];
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                background: Container(
                  padding: const EdgeInsets.only(right: 20),
                  alignment: FractionalOffset.centerRight,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Card(
                    color: Colors.white,
                    elevation: 2,
                    child: ListTile(
                      onTap: () => Navigator.pushNamed(
                          context, ContactDetailsPage.routeName,
                          arguments: contact.id),
                      title: Text(
                        contact.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                      ),
                      subtitle: Text(
                        contact.mobile,
                        style: const TextStyle(
                            color: Colors.black54, fontFamily: 'Poppins'),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          provider.updateContactField(
                              contact, tableContactFavorite);
                        },
                        icon: Icon(
                          contact.favorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
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
                ),
              ],
            ));
  }

  void _fetchData() {
    switch (selectedIndex) {
      case 0:
        Provider.of<ContactProvider>(context, listen: false).getAllContacts();
        break;
      case 1:
        Provider.of<ContactProvider>(context, listen: false)
            .getAllFavoriteContacts();
        break;
    }
  }
}
