import 'dart:math';

import 'package:simple_group_list_demo/DataModel.dart';

List<Map<String, String>> elements = [
  {
    'name': 'Ad',
    'group': 'CIB',
    'password': '${getRandomPassword()}',
  },
  {
    'name': 'Will',
    'group': 'AAIB',
    'password': '${getRandomPassword()}',
  },
  {
    'name': 'My User',
    'group': 'CIB',
    'password': '${getRandomPassword()}',
  },
  {
    'name': 'Miranda',
    'group': 'AAIB',
    'password': '${getRandomPassword()}',
  },
  {
    'name': 'Mike',
    'group': 'AUB',
    'password': '${getRandomPassword()}',
  },
  {
    'name': 'Danny',
    'group': 'AUB',
    'password': '${getRandomPassword()}',
  },
  {
    'name': 'SQL Password',
    'group': 'CIB',
    'password': '${getRandomPassword()}',
  },
];

const _chars =
    'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890!@#\$%^&*()';
Random _rnd = Random();
String getRandomPassword() => String.fromCharCodes(Iterable.generate(
    8, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

List<DataModel> initData(List data) {
  Map<String, List<Information>> tempList = {};
  List<DataModel> output = [];
  data.forEach((element) {
    String name = element['name'] as String;
    String groupName = element['group'] as String;
    String password = element['password'] as String;
    List<Information>? temp = tempList[groupName] ?? [];
    temp.add(Information(name: name, password: password));
    tempList[groupName] = temp;
  });
  tempList.forEach(
      (key, value) => output.add(DataModel(groupName: key, subGroup: value)));
  return output;
}
