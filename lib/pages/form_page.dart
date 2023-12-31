// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:virtual_visiting_card/models/contact_model.dart';
// import 'package:virtual_visiting_card/pages/home_page.dart';
// import 'package:virtual_visiting_card/providers/contact_provider.dart';
//
// import '../utils/hepers.dart';
//
// class FormPage extends StatefulWidget {
//   static const String routeName = '/form';
//
//   const FormPage({Key? key}) : super(key: key);
//
//   @override
//   State<FormPage> createState() => _FormPageState();
// }
//
// class _FormPageState extends State<FormPage> {
//   final nameController = TextEditingController();
//   final mobileController = TextEditingController();
//   final emailController = TextEditingController();
//   final designationController = TextEditingController();
//   final companyController = TextEditingController();
//   final addressController = TextEditingController();
//   final websiteController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//   late ContactModel contactModel;
//
//   @override
//   void didChangeDependencies() {
//     contactModel = ModalRoute.of(context)!.settings.arguments as ContactModel;
//     nameController.text = contactModel.name;
//     emailController.text = contactModel.email;
//     mobileController.text = contactModel.mobile;
//     companyController.text = contactModel.company;
//     designationController.text = contactModel.designation;
//     addressController.text = contactModel.address;
//     websiteController.text = contactModel.website;
//     super.didChangeDependencies();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         //backgroundColor: Colors.blue.shade50,
//         title: const Text('New Contact'),
//         actions: [
//           IconButton(
//             onPressed: _saveContact,
//             icon: const Icon(Icons.save),
//           )
//         ],
//       ),
//       body: Form(
//         key: formKey,
//         child: ListView(
//           padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 4),
//               child: TextFormField(
//                 controller: nameController,
//                 decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.person),
//                     labelText: 'Contact Name (Required)',
//                     filled: true),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'This field must not be empty';
//                   }
//                   if (value.length > 30) {
//                     return 'Name should not be more than 30 chars long';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 4),
//               child: TextFormField(
//                 keyboardType: TextInputType.phone,
//                 controller: mobileController,
//                 decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.call),
//                     labelText: 'Contact Number (Required)',
//                     filled: true),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'This field must not be empty';
//                   }
//
//                   return null;
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 4),
//               child: TextFormField(
//                 controller: emailController,
//                 decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.email),
//                     labelText: 'Email Address',
//                     filled: true),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 4),
//               child: TextFormField(
//                 controller: companyController,
//                 decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.label),
//                     labelText: 'Company Name',
//                     filled: true),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 4),
//               child: TextFormField(
//                 controller: designationController,
//                 decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.label),
//                     labelText: 'Designation',
//                     filled: true),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 4),
//               child: TextFormField(
//                 controller: addressController,
//                 decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.location_on),
//                     labelText: 'Street Address',
//                     filled: true),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 4),
//               child: TextFormField(
//                 controller: websiteController,
//                 decoration: const InputDecoration(
//                     prefixIcon: Icon(Icons.web),
//                     labelText: 'Website',
//                     filled: true),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _saveContact() async {
//     if (formKey.currentState!.validate()) {
//       contactModel.name = nameController.text;
//       contactModel.mobile = mobileController.text;
//       contactModel.email = emailController.text;
//       contactModel.company = companyController.text;
//       contactModel.designation = designationController.text;
//       contactModel.address = addressController.text;
//       contactModel.website = websiteController.text;
//
//       Provider.of<ContactProvider>(context, listen: false)
//           .insertContact(contactModel)
//           .then((rowId) {
//         if (rowId > 0) {
//           showMsg(context, 'Saved');
//           Navigator.popUntil(context, ModalRoute.withName(HomePage.routeName));
//         }
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     nameController.dispose();
//     mobileController.dispose();
//     emailController.dispose();
//     designationController.dispose();
//     companyController.dispose();
//     addressController.dispose();
//     websiteController.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/contact_model.dart';
import '../providers/contact_provider.dart';
import '../utils/hepers.dart';
import 'home_page.dart';

class FormPage extends StatefulWidget {
  static const String routeName = '/form';

  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final designationController = TextEditingController();
  final companyController = TextEditingController();
  final addressController = TextEditingController();
  final websiteController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late ContactModel contactModel;

  @override
  void didChangeDependencies() {
    contactModel = ModalRoute.of(context)!.settings.arguments as ContactModel;
    nameController.text = contactModel.name;
    emailController.text = contactModel.email;
    mobileController.text = contactModel.mobile;
    companyController.text = contactModel.company;
    designationController.text = contactModel.designation;
    addressController.text = contactModel.address;
    websiteController.text = contactModel.website;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Contact'),
        actions: [
          IconButton(
            onPressed: _saveContact,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  labelText: 'Contact Name(required)',
                  labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field must not be empty';
                  }
                  if (value.length > 20) {
                    return 'Name should not be more than 30 chars long';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: mobileController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.call),
                  labelText: 'Mobile Number(required)',
                  labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field must not be empty';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email),
                labelText: 'Email Address',
                labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: companyController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.label),
                labelText: 'Company Name',
                labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: designationController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.label),
                labelText: 'Designation',
                labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.location_city),
                labelText: 'Street Address',
                labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.url,
              controller: websiteController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.web),
                labelText: 'Website',
                labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                filled: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveContact() async {
    if (formKey.currentState!.validate()) {
      contactModel.name = nameController.text;
      contactModel.mobile = mobileController.text;
      contactModel.email = emailController.text;
      contactModel.company = companyController.text;
      contactModel.designation = designationController.text;
      contactModel.address = addressController.text;
      contactModel.website = websiteController.text;

      Provider.of<ContactProvider>(context, listen: false)
          .insertContact(contactModel)
          .then((rowId) {
        if (rowId > 0) {
          showMsg(context, 'Saved');
          Navigator.popUntil(context, ModalRoute.withName(HomePage.routeName));
        }
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    designationController.dispose();
    companyController.dispose();
    addressController.dispose();
    websiteController.dispose();
    super.dispose();
  }
}
