import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {


    TextEditingController txtName = TextEditingController();
    TextEditingController txtPass = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(controller: txtName,),
            TextField(controller: txtPass,),
            ElevatedButton(onPressed: () {
              addData();
            }, child: Text("Login"),),

            TextField(),
            TextField(),
            ElevatedButton(onPressed: () {

            }, child: Text("SignIn"),),
          ],
        ),
      ),
    );
  }
}


String? name,password;

Future<void> addData()
async {
  SharedPreferences s1 =  await SharedPreferences.getInstance();
  s1.setString('name', name!);
  s1.setString('pass', password!);
}

Future<Map> getData()
async {
  SharedPreferences s1 =  await SharedPreferences.getInstance();
  String? name = s1.getString('name');
  String? pass = s1.getString('pass');
  Map m1 = {
    'name':name,
    'pass':pass,
  };
  return m1;
}
