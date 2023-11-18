import 'package:flutter/material.dart';
import 'package:virtual_visiting_card/db/dbhelper.dart';
import 'package:virtual_visiting_card/models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> contactList = [];
  final db = DBHelper();

  Future<int> insertContact(ContactModel contactModel) async {
    final rowId = await db.insertContact(contactModel);
    contactModel.id = rowId;
    contactList.add(contactModel);
    notifyListeners();
    return rowId;
  }

  Future<void> getAllContacts() async {
    contactList = await db.getAllContacts();
    notifyListeners();
  }

  Future<int> deleteContact(int id) {
    return db.deleteContact(id);
  }

  Future<void> updateContactField(ContactModel contactModel) async {
    await db.updateContactField(
        contactModel.id, {tableContactFavorite: contactModel.favorite ? 0 : 1});
    final index = contactList.indexOf(contactModel);
    contactList[index].favorite = !contactList[index].favorite;
    notifyListeners();
  }
}
