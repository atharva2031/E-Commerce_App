import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/firebase_auth_methods.dart';
import '../widgets/text_field.dart';
import '../widgets/app_theme.dart';
import '../home.dart';

class MyRegistrationPage extends StatefulWidget {
  const MyRegistrationPage({super.key});

  @override
  State<MyRegistrationPage> createState() => _MyRegistrationPageState();
}

class _MyRegistrationPageState extends State<MyRegistrationPage> {
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();



    void signUpUser() async {
    context.read<FirebaseAuthMethods>().signUpWithEmail(
          email: emailTextController.text,
          password: passwordTextController.text,
          context: context,
        );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Image.network(
                        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.yK11aU4JRs-atXxp5-fxyQHaE8%26pid%3DApi&f=1&ipt=ab285e6fd7d30cd70420981d53cbb11c392153c7f056e0d2c2ee2ebd4c814e60&ipo=images'),
                    Text(
                      'Register to Awesome Store',
                      style: AppTheme.of(context).title2,
                    ),
                    MyTextField(
                      obscuretext: false,
                      labelText: 'Name',
                      icon: const Icon(Icons.person),
                      controller: nameTextController,
                    ),
                    MyTextField(
                      obscuretext: false,
                      labelText: 'E-Mail',
                      icon: const Icon(Icons.email),
                      controller: emailTextController,
                    ),
                    MyTextField(
                      obscuretext: true,
                      labelText: 'Password',
                      icon: const Icon(Icons.remove_red_eye),
                      controller: passwordTextController,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 120,
                        child: ElevatedButton(
                          onPressed: signUpUser,
                          child: const Text('Register'),
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(327, 50),
                              backgroundColor: Colors.green,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 250,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Image.network(
                                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.HG6XtzIxf4Nbo_vZt8T3EAHaHa%26pid%3DApi&f=1&ipt=01d499ffa80d3f81762baf6a2ee69793c9a095e1c88e61990756b42bcfe24da6&ipo=images',
                                height: 30,
                                width: 40,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  'Sign Up using Google',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: const Text('Already a user? Login here'),
                            onTap: () async {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
