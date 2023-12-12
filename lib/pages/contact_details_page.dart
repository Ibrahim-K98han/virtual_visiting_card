// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher_string.dart';
// import 'package:virtual_visiting_card/providers/contact_provider.dart';
// import 'package:virtual_visiting_card/utils/hepers.dart';
//
// class ContactDetailsPage extends StatefulWidget {
//   static const String routeName = '/details';
//
//   const ContactDetailsPage({Key? key}) : super(key: key);
//
//   @override
//   State<ContactDetailsPage> createState() => _ContactDetailsPageState();
// }
//
// class _ContactDetailsPageState extends State<ContactDetailsPage> {
//   int id = 0;
//
//   @override
//   void didChangeDependencies() {
//     id = ModalRoute.of(context)!.settings.arguments as int;
//     super.didChangeDependencies();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Details'),
//       ),
//       body: Consumer<ContactProvider>(
//         builder: (context, provider, child) => FutureBuilder(
//           future: provider.getContactById(id),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final contact = snapshot.data!;
//               return ListView(
//                 children: [
//                   Image.file(
//                     File(contact.image),
//                     width: double.infinity,
//                     height: 250,
//                     fit: BoxFit.cover,
//                   ),
//                   ListTile(
//                     title: Text(contact.name),
//                   ),
//                   ListTile(
//                     title: Text(contact.mobile),
//                     trailing: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                             onPressed: () {
//                               _smsContact(contact.mobile);
//                             },
//                             icon: Icon(Icons.sms)),
//                         IconButton(
//                             onPressed: () {
//                               _callContact(contact.mobile);
//                             },
//                             icon: Icon(Icons.call))
//                       ],
//                     ),
//                   ),
//                   ListTile(
//                     title: Text(
//                         contact.email.isEmpty ? 'Not Found' : contact.email),
//                     trailing: IconButton(
//                       onPressed: () {
//                         _sendEmail(contact.email);
//                       },
//                       icon: Icon(Icons.email),
//                     ),
//                   ),
//                   ListTile(
//                     title: Text(contact.address.isEmpty
//                         ? 'Not Found'
//                         : contact.address),
//                     trailing: IconButton(
//                       onPressed: () {
//                         _openMap(contact.address);
//                       },
//                       icon: Icon(Icons.map),
//                     ),
//                   ),
//                   ListTile(
//                     title: Text(contact.website.isEmpty
//                         ? 'Not Found'
//                         : contact.website),
//                     trailing: IconButton(
//                       onPressed: () {
//                         _sendBrowser(contact.website);
//                       },
//                       icon: Icon(Icons.web),
//                     ),
//                   )
//                 ],
//               );
//             }
//             if (snapshot.hasError) {
//               return const Center(
//                 child: Text('Failed to fetch data'),
//               );
//             }
//             return const Center(
//               child: Text('Please Wait'),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   void _smsContact(String mobile) async {
//     final url = 'sms:$mobile';
//     if (await canLaunchUrlString(url)) {
//       await launchUrlString(url);
//     } else {
//       showMsg(context, 'Cannot Perform this task');
//     }
//   }
//
//   void _callContact(String mobile) async {
//     final url = 'tel:$mobile';
//     if (await canLaunchUrlString(url)) {
//       await launchUrlString(url);
//     } else {
//       showMsg(context, 'Cannot Perform this task');
//     }
//   }
//
//   void _sendEmail(String email) {}
//
//   void _openMap(String address) {}
//
//   void _sendBrowser(String website) {}
// }

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../providers/contact_provider.dart';
import '../utils/hepers.dart';

class ContactDetailsPage extends StatefulWidget {
  static const String routeName = '/details';

  const ContactDetailsPage({super.key});

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  int id = 0;

  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)?.settings.arguments as int;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: Consumer<ContactProvider>(
        builder: (context, provider, child) => FutureBuilder(
          future: provider.getContactById(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final contact = snapshot.data!;
              return ListView(
                children: [
                  Image.file(
                    File(contact.image),
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  ListTile(
                    title: Text(
                      contact.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                    ),
                  ),
                  ListTile(
                    title: Text(contact.mobile),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            _smsContact(contact.mobile);
                          },
                          icon: const Icon(Icons.sms),
                        ),
                        IconButton(
                          onPressed: () {
                            _callContact(contact.mobile);
                          },
                          icon: const Icon(Icons.call),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text(
                        contact.email.isEmpty ? 'Not found' : contact.email),
                    trailing: IconButton(
                      onPressed: () {
                        _sendEmail(contact.email);
                      },
                      icon: const Icon(Icons.email),
                    ),
                  ),
                  ListTile(
                    title: Text(contact.address.isEmpty
                        ? 'Not found'
                        : contact.address),
                    trailing: IconButton(
                      onPressed: () {
                        _openMap(contact.address);
                      },
                      icon: const Icon(Icons.map),
                    ),
                  ),
                  ListTile(
                    title: Text(contact.website.isEmpty
                        ? 'Not found'
                        : contact.website),
                    trailing: IconButton(
                      onPressed: () {
                        _openBrowser(contact.website);
                      },
                      icon: const Icon(Icons.web),
                    ),
                  ),
                ],
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('Failed to fetch data'),
              );
            }
            return const Center(
              child: Text('Please wait'),
            );
          },
        ),
      ),
    );
  }

  void _smsContact(String mobile) async {
    final url = 'sms:$mobile';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      showMsg(context, 'Cannot perform this task');
    }
  }

  void _callContact(String mobile) async {
    final url = 'tel:$mobile';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      showMsg(context, 'Cannot perform this task');
    }
  }

  void _sendEmail(String email) async {
    final url = 'mailto:$email';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      showMsg(context, 'Could not perform this operation');
    }
  }

  void _openBrowser(String website) async {
    final url = 'https://$website';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      showMsg(context, 'Could not perform this operation');
    }
  }

  void _openMap(String address) async {
    String url = '';
    if (Platform.isAndroid) {
      url = 'geo:0,0?q=$address';
    } else {
      url = 'http://maps.apple.com/?q=$address';
    }
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      showMsg(context, 'Could not perform this operation');
    }
  }
}
