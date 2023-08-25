import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'register_page.dart';
import '../widgets/app_theme.dart';
import '../home.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();

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
                      'Login to Awesome Store',
                      style: AppTheme.of(context).title2,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppTheme.of(context).primaryBackground,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                                child: Icon(
                                  Icons.mail,
                                  color: Color(0xFF95A1AC),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: TextFormField(
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                      labelText: 'E-Mail',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style:
                                        AppTheme.of(context).bodyText1.override(
                                              fontFamily: 'Poppins',
                                              color: const Color(0xFF95A1AC),
                                            ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppTheme.of(context).primaryBackground,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                                child: Icon(
                                  Icons.remove_red_eye,
                                  color: Color(0xFF95A1AC),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      labelText: 'Password',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style:
                                        AppTheme.of(context).bodyText1.override(
                                              fontFamily: 'Poppins',
                                              color: const Color(0xFF95A1AC),
                                            ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: 120,
                        child: ElevatedButton(
                          onPressed: () {
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: emailTextController.text,
                                    password: passwordTextController.text)
                                .then((value) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyHomePage(
                                            title: 'title',
                                          )));
                            }).onError((error, stackTrace) {
                              // ignore: avoid_print
                              print("Error ${error.toString()}");
                            });
                          },
                          child: const Text('Login'),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyHomePage(
                                  title: 'Home Page',
                                ),
                              ),
                            );
                          },
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
                                  'Sign in using Google',
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
                            child: const Text('New User? Register here'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MyRegistrationPage(),
                                ),
                              );
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
