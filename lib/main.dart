import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';
import 'package:simple_group_list_demo/DataModel.dart';
import 'package:simple_group_list_demo/RawDataExample.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<DataModel> myData = initData(elements);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GroupListView(
        itemBuilder: (context, index) => Card(
          child: Container(
            child: ListTile(
              title: Text(
                  'Name: ${myData[index.section].subGroup[index.index].name}'),
              subtitle: Text(
                  'Password: ${myData[index.section].subGroup[index.index].password}'),
              leading: Icon(
                Icons.face,
                size: 50,
              ),
              minLeadingWidth: 2,
            ),
          ),
        ),
        countOfItemInSection: (section) {
          return myData[section].subGroup.length;
        },
        groupHeaderBuilder: (context, section) => Card(
          child: Container(
            color: Colors.lightGreen,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${myData[section].groupName}'),
            ),
          ),
        ),
        sectionsCount: myData.length,
      ),
    );
  }
}
