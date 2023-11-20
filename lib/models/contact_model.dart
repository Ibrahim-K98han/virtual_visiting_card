const String tableContact = 'tbl_contact';
const String tableContactId = 'id';
const String tableContactName = 'name';
const String tableContactMobile = 'mobile';
const String tableContactLandLine = 'phone';
const String tableContactEmail = 'email';
const String tableContactAddress = 'address';
const String tableContactWebsite = 'website';
const String tableContactImage = 'image';
const String tableContactFavorite = 'favorite';
const String tableContactCompany = 'company';
const String tableContactDesignation = 'designation';

class ContactModel {
  int id;
  String name;
  String mobile;
  String landLine;
  String email;
  String company;
  String designation;
  String address;
  String website;
  bool favorite = false;
  String image;

  ContactModel(
      {this.id = -1,
      required this.name,
      required this.mobile,
      this.landLine = '',
      this.email = '',
      this.company = '',
      this.designation = '',
      this.address = '',
      this.website = '',
      this.favorite = false,
      this.image = 'assets/images/placeholder.jpg'});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      tableContactName: name,
      tableContactMobile: mobile,
      tableContactLandLine: landLine,
      tableContactEmail: email,
      tableContactCompany: company,
      tableContactDesignation: designation,
      tableContactAddress: address,
      tableContactWebsite: website,
      tableContactImage: image,
      tableContactFavorite: favorite ? 1 : 0,
    };
    if (id > 0) {
      map[tableContactId] = id;
    }
    return map;
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) => ContactModel(
        id: map[tableContactId],
        name: map[tableContactName],
        mobile: map[tableContactMobile],
        landLine: map[tableContactLandLine],
        email: map[tableContactEmail],
        company: map[tableContactCompany],
        designation: map[tableContactDesignation],
        address: map[tableContactAddress],
        website: map[tableContactWebsite],
        image: map[tableContactImage],
        favorite: map[tableContactFavorite] == 1 ? true : false,
      );

  @override
  String toString() {
    return 'ContactModel{id: $id, name: $name, mobile: $mobile, landLine: $landLine, email: $email, company: $company, designation: $designation, address: $address, website: $website, favorite: $favorite, image: $image}';
  }
}
