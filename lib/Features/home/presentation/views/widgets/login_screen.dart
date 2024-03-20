import 'package:bloc_v2/Features/emp_features/presentation/add_emp.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../emp_features/presentation/add_emp.dart';
import '../../../../emp_features/presentation/all_emp_screen.dart';
class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var mail = TextEditingController();
  var pass = TextEditingController();

  passLoginData() async{
    var res =await http.post("https:4000/admin/auth/login" as Uri,
    body:{"email":mail.text,"pass":pass.text},) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null) {
                          return "you must put your mail";
                        }
                        if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b').hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                      controller: mail,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Emplyee mail',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) {
                        if (value == null) {
                          return "you must put your pass";
                        }
                      },
                      controller: pass,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'passWord',
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AllEmployeeScreen()), // Corrected the builder
                        );
                        if (formKey.currentState?.validate() ?? false) {
      // Form is valid, proceed with login action
                          passLoginData();
                        }
                      },
                      child: const Text('Login'),
                    ),
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
