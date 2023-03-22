class ContactData {
  // Inisialisasi parameter kontak list
  final String name;
  final String lastName;
  final String numberPhone;

  ContactData(
      {required this.name, required this.lastName, required this.numberPhone});
}

// Contoh kontak list
List<ContactData> cList = [
  ContactData(name: "Caleb", lastName: "Rivera", numberPhone: "(555) 123-4567"),
  ContactData(
      name: "Isabella", lastName: "White", numberPhone: "(555) 234-5678"),
  ContactData(
      name: "Jackson", lastName: "Palel", numberPhone: "(555) 345-6789"),
  ContactData(name: "Mia", lastName: "Lee", numberPhone: "(555) 456-7890"),
  ContactData(name: "Owen", lastName: "Wright", numberPhone: "(555) 567-8901"),
  ContactData(
      name: "Benjamin", lastName: "Chen", numberPhone: "(555) 678-9012"),
];
