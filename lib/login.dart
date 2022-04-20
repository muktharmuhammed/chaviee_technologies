import 'package:chaviee_technologies/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class logIn extends StatefulWidget {
  const logIn({Key? key}) : super(key: key);


  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  final username1 = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20 ),
        child: Column(children: [SizedBox(height: 100,),Container(
          height: 20,
          width: 500,
          child: Text(
            'Username',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
          Container(
              child: TextFormField(controller: username1,
                decoration: InputDecoration(
                    hintText: 'Username',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10))),
              )),SizedBox(height: 10,),
          Container(
            height: 20,
            width: 500,
            child: Text(
              'Password',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              child: TextFormField(controller:password,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: '**********',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10))),
              )),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color(0xFF19543E),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 300,
                  minimumSize: Size(150, 50)),
              onPressed: () {login();},
              child: Text('Login',style: TextStyle(fontSize: 18),)),
          SizedBox(
            height: 80,
          ),
          Container(
            child: Text(
              'Forgot your password?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),],),
      ),
    );
  }
  Future<void>login() async{
    if(username1.text.isNotEmpty && password.text.isNotEmpty) {
      var response = await http.post(Uri.parse('https://reqres.in/api/login'),
          body: ({
        'username' : username1.text,
        'password' : password.text
      }));
      if(response.statusCode==200){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
      }
  }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Blank field')));
    }
    }
}

