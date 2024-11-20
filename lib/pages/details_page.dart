import 'package:flutter/material.dart';
import 'package:ngdemo11/models/user_model.dart';
import 'package:ngdemo11/services/prefs_service.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();


  _saveNewUser() {
    int id = int.parse(idController.text.toString().trim());
    String username = nameController.text.toString();

    User user = User(id: 1000, userName: "Alimovskiy");

    PrefsSevice.storeNewUser(user);

    Navigator.of(context).pop(true);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User add"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(

          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(
                hintText: "Enter user id",

              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: "Enter user name"
              ),
            ),
            SizedBox(height: 10,),
            MaterialButton(
              onPressed: () {
                _saveNewUser();
              },
              child: Text("Add"),
              color: Colors.blue,

            ),
          ],
        ),
      ),
    );
  }
}
