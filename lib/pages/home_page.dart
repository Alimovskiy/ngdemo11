import 'package:flutter/material.dart';
import 'package:ngdemo11/models/user_model.dart';
import 'package:ngdemo11/services/prefs_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = 'No name';

  List <User> userList = [
  User(id: 2, userName: "Sevara"),
  User(id: 3, userName: "Nozima"),
  ];



  @override
  void initState() {
    super.initState();
    // PrefsSevice.storeName("Alimovskiy");


    // _removeName();

    // _loadName();



    // User user =User(id: 1, userName: "Alimovskiy");
    // PrefsSevice.storeUser(user);

    // _loadUser();

    // PrefsSevice.storeUserList(userList);
    // _loadUserList();
    _removeUserList();

  }

  _loadUserList() async{
    List<User>? result = await PrefsSevice.loadUserList();
    if(result!= null){
      setState(() {
        text = result.first.toMap().toString();
      });
    }
  }



  _removeUserList() async {
    await PrefsSevice.removeUserList();
  }



  _loadUser() async{
    User? user = await PrefsSevice.loadUser();
    if(user != null){
      setState(() {
        text= user.toMap().toString();
      });

    }
  }




  _loadName() async{
    String result = await PrefsSevice.loadName();
    setState(() {
      text = result;
    });

  }



  _removeName() async{
    await PrefsSevice.removeName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Shared Preferences",style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
