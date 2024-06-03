class DataAnak {
  final String namaAnak;
  final DateTime dob;
  final String gender;
  final String parentName;
  final String parentContact;

  DataAnak({
    required this.namaAnak,
    required this.dob,
    required this.gender,
    required this.parentName,
    required this.parentContact,
  });
}

final List<DataAnak> childrenData = [
  DataAnak(
    namaAnak: 'John Doe',
    dob: DateTime(2018, 7, 12),
    gender: 'Male',
    parentName: 'Jane Doe',
    parentContact: '123-456-7890',
  ),
  DataAnak(
    namaAnak: 'Emily Smith',
    dob: DateTime(2017, 6, 21),
    gender: 'Female',
    parentName: 'Robert Smith',
    parentContact: '123-555-7890',
  ),
  DataAnak(
    namaAnak: 'Michael Brown',
    dob: DateTime(2019, 3, 14),
    gender: 'Male',
    parentName: 'Laura Brown',
    parentContact: '123-777-7890',
  ),
  DataAnak(
    namaAnak: 'Sophia Johnson',
    dob: DateTime(2020, 5, 22),
    gender: 'Female',
    parentName: 'Tom Johnson',
    parentContact: '123-888-7890',
  ),
  DataAnak(
    namaAnak: 'David Wilson',
    dob: DateTime(2016, 11, 8),
    gender: 'Male',
    parentName: 'Emma Wilson',
    parentContact: '123-999-7890',
  ),
];
