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

    TextEditingController name = TextEditingController();
    TextEditingController pass = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(controller: txtName,),
            TextField(controller: txtPass,),
            ElevatedButton(onPressed: () async {
              Map m1 = await getData();
              if(m1['name']==txtName.text && m1['pass']==txtPass.text)
              {
                SnackBar snackBar = SnackBar(content: Text("Success"),backgroundColor: Colors.green,);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              else
                {
                  SnackBar snackBar = SnackBar(content: Text("Failed !"),backgroundColor: Colors.red,);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

            }, child: Text("Login"),),

            TextField(controller: name,),
            TextField(controller: pass,),
            ElevatedButton(onPressed: ()  {
              addData(name.text,pass.text);
              name.clear();
              pass.clear();
            }, child: Text("SignIn"),),
          ],
        ),
      ),
    );
  }
}



Future<void> addData(String name , String pass)
async {
  SharedPreferences s1 =  await SharedPreferences.getInstance();
  s1.setString('name', name);
  s1.setString('pass', pass);
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
