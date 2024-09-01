import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routs.dart';

class loginpage extends StatefulWidget {
  @override
  State<loginpage> createState() =>
      _loginpageState(); //_name use for make any var private
}

class _loginpageState extends State<loginpage> {
  String name = "";
  bool changebutton = false;

  final _formkey = GlobalKey<FormState>();

  movetohome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      // Assuming _formkey is non-null
      setState(() {
        changebutton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, myrouts.homerout);
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login2.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "welcome $name",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "enter username",
                        labelText: "username",
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "enter password",
                        labelText: "password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 8) {
                          return "Password length should be at least 8 characters";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(changebutton ? 50 : 8),
                      child: InkWell(
                        onTap: () => movetohome(context),
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changebutton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changebutton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                          //     changebutton ? BoxShape.circle : BoxShape.rectangle,
                        ),
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, myrouts.homerout);
                    //   },
                    //   child: Text("login"),
                    //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
