import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:slideable_yotube_tutorial/model/contact.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Contact> _contactsList = contactsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Contact"),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: _contactsList.length,
                itemBuilder: (context, index) {
                  Contact c = _contactsList[index];
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: ListTile(
                      tileColor:
                          (c.isFavorite) ? Colors.blue.shade100 : Colors.white,
                      leading: Icon(Icons.person),
                      title: Text("${c.name}"),
                      subtitle: Text("${c.phoneNumber}"),
                    ),
                    actions: [
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.redAccent,
                        icon: Icons.delete,
                        onTap: () {
                          setState(() {
                            _contactsList.removeAt(index);
                          });
                        },
                      ),
                    ],
                    secondaryActions: [
                      (c.isFavorite)
                          ? IconSlideAction(
                              caption: 'Unfavorite',
                              color: Colors.orange,
                              icon: Icons.check_box,
                              onTap: () {
                                setState(() {
                                  _contactsList[index].isFavorite = false;
                                });
                              },
                            )
                          : IconSlideAction(
                              caption: 'Favorite',
                              color: Colors.blueAccent,
                              icon: Icons.check_box,
                              onTap: () {
                                setState(() {
                                  _contactsList[index].isFavorite = true;
                                });
                              },
                            ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
