import 'package:flutter/material.dart';
import 'package:movie2url/services/user.dart';
import 'package:movie2url/widgets/alert.dart';

class RegisterUserView extends StatefulWidget {
  const RegisterUserView({super.key});

  @override
  State<RegisterUserView> createState() => _RegisterUserViewState();
}

class _RegisterUserViewState extends State<RegisterUserView> {
  insertUser() async {
    var data = {
      "name": name.text,
      "email": email.text,
      "role": role,
      "password": password.text,
    };
    var result = await UserService().registerUser(data);
    print(result.status);
    print(result.message);
  }

  @override
  void initState() {
    super.initState();
    insertUser();
  }

  final formKey = GlobalKey<FormState>();
  UserService user = UserService();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  List roleChoice = ["admin", "user"];
  TextEditingController addres = TextEditingController();
  TextEditingController ulang_tahun = TextEditingController();
  String? role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register User"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Text(
                    "Register User",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: name,
                            decoration: InputDecoration(label: Text("Name")),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Nama harus diisi';
                              } else {
                                return null;
                              }
                            },
                          ),
                          TextFormField(
                            controller: email,
                            decoration: InputDecoration(label: Text("Email")),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email harus diisi';
                              } else {
                                return null;
                              }
                            },
                          ),
                          DropdownButtonFormField(
                            isExpanded: true,
                            value: role,
                            items: roleChoice.map((r) {
                              return DropdownMenuItem(value: r, child: Text(r));
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                role = value.toString();
                              });
                            },
                            hint: Text("Pilih role"),
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return 'Role harus dipilih';
                              } else {
                                return null;
                              }
                            },
                          ),
                          TextFormField(
                            controller: password,
                            decoration:
                                InputDecoration(label: Text("Password")),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password harus diisi';
                              } else {
                                return null;
                              }
                            },
                          ),
                          TextFormField(
                            controller: addres,
                            decoration: InputDecoration(label: Text("addres")),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'harus diisi';
                              } else {
                                return null;
                              }
                            },
                          ),
                          TextFormField(
                            controller: ulang_tahun,
                            decoration:
                                InputDecoration(label: Text("ulang tahun")),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'harus diisi';
                              } else {
                                return null;
                              }
                            },
                          ),
                          MaterialButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                var data = {
                                  "name": name.text,
                                  "email": email.text,
                                  "role": role,
                                  "password": password.text,
                                  "addres": addres.text,
                                  "ulang_tahun": ulang_tahun.text,
                                };
                                var result = await user.registerUser(data);
                                if (result.status == true) {
                                  name.clear();
                                  email.clear();
                                  password.clear();
                                  addres.clear();
                                  ulang_tahun.clear();
                                  setState(() {
                                    role = null;
                                  });
                                  AlertMessage()
                                      .showAlert(context, result.message, true);
                                } else {
                                  AlertMessage().showAlert(
                                      context, result.message, false);
                                }
                              }
                            },
                            child: Text("Register"),
                            color: Colors.lightGreen,
                          ),
                        ],
                      ))
                ],
              ))),
    );
  }
}
