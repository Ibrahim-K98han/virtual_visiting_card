import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:virtual_visiting_card/db/contact_model.dart';

class DBHelper {
  final String _createTableContact = '''create table $tableContact(
    $tableContactId integer primary key autoincrement,
    $tableContactName text,
    $tableContactMobile text,
    $tableContactEmail text,
    $tableContactAddress text,
    $tableContactCompany text,
    $tableContactDesignation text,
    $tableContactWebsite text,
    $tableContactImage text,
    $tableContactFavorite integer)''';

  Future<Database> _open() async {
    final root = await getDatabasesPath();
    final dbPath = p.join(root, 'contact.db');
    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute(_createTableContact);
      },
    );
  }

  Future<int> insertContact(ContactModel contactModel) async {
    final db = await _open();
    return db.insert(tableContact, contactModel.toMap());
  }

  Future<List<ContactModel>> getAllContacts() async {
    final db = await _open();
    final mapList = await db.query(tableContact);
    return List.generate(
      mapList.length,
      (index) => ContactModel.fromMap(
        mapList[index],
      ),
    );
  }
}