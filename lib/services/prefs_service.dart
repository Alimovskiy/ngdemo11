import 'dart:convert';

import 'package:ngdemo11/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsSevice {

  /*
  * String related
  * */


  static void storeName(String name) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", name);

  }
  static Future<String> loadName () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString("name");
    return name!;
  }

  static Future<bool> removeName () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("name");
  }

  /*
  * User related
  * */
  static void storeUser(User user)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userString = jsonEncode(user.toMap());
    prefs.setString("user", userString);
  }

  static Future<User?> loadUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString= prefs.getString("user");
    if (userString == null || userString.isEmpty) return null;
    Map<String, dynamic> map = jsonDecode(userString);
    return User.fromMap(map);

  }


  static Future<bool> removeUser () async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("User");
  }



/*
  * List<User> related
  * */
  static void storeUserList(List<User> userList)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> userListString = userList.map((user) => jsonEncode(user.toMap())).toList();
    await prefs.setStringList("user_list", userListString);
  }


  static Future<List<User>?> loadUserList() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? userListString = prefs.getStringList("user_list");
    if (userListString == null || userListString.isEmpty) return null;

    List<User> userList = userListString
        .map((userString) => User.fromMap(json.decode(userString)))
        .toList();
    return userList;
  }


  static Future<bool> removeUserList() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("User_list");
  }


}
