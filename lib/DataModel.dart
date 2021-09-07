class DataModel {
  late String groupName;
  late List<Information> subGroup;
  DataModel({
    required this.groupName,
    required this.subGroup,
  });
}

class Information {
  late String name;
  late String password;
  Information({
    required this.name,
    required this.password,
  });
}
