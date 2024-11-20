import 'package:flutter/material.dart';
import 'package:ngdemo11/models/user_model.dart';
import 'package:ngdemo11/pages/details_page.dart';
import 'package:ngdemo11/services/prefs_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> userList = [];

  callDetailsPage() async {
    var result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return const DetailsPage();
    }));

    if (result) {
      _loadUserList();
    }
  }

  _loadUserList() async {
    List<User>? result = await PrefsSevice.loadUserList();
    if (result != null) {
      setState(() {
        userList = result;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Shared Preferences",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (BuildContext context, int index) {
          return _itemOfUser(userList[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          callDetailsPage();
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _itemOfUser(User user) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            user.userName.toString(),
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            user.id.toString(),
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
