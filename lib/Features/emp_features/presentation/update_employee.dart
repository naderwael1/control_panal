import 'package:bloc_v2/Features/emp_features/Data/udage_employee.dart';
import 'package:bloc_v2/Features/emp_features/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateEmployeeScreen extends StatefulWidget {
  const UpdateEmployeeScreen({Key? key}) : super(key: key);

  @override
  _UpdateEmployeeScreenState createState() => _UpdateEmployeeScreenState();
}

class _UpdateEmployeeScreenState extends State<UpdateEmployeeScreen> {
  String? email;
  String? password;
  String? confirmPassword;
  String? position;
  String? state;
  String? imageUrl;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final employee = Get.arguments;
    return ModalProgressHUD(
      // Corrected the widget name
      inAsyncCall: isLoading, // Set the loading state
      child: Scaffold(
        appBar: AppBar(
          title: Text('Update Employees'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Employee Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    confirmPassword = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Position',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.work),
                ),
                onChanged: (value) {
                  setState(() {
                    position = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'State',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                ),
                onChanged: (value) {
                  setState(() {
                    state = value;
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Image URL',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.image),
                ),
                onChanged: (value) {
                  setState(() {
                    imageUrl = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  isLoading = true;
                  setState(() {});
                  print('Email: $email');
                  print('Password: $password');
                  print('Confirm Password: $confirmPassword');
                  print('Position: $position');
                  print('State: $state');
                  print('Image URL: $imageUrl');
                  try {
                    UpdateEmployee().updateEmployee(
                      id: employee.id,
                        title: email == null ? employee.title:email!,
                        description: position== null ? employee.title:position!,
                        category: state== null ? employee.title:state!,
                        image: imageUrl== null ? employee.title:imageUrl!);
                  } on Exception catch (e) {
                    print(e.toString());
                  }
                  isLoading = false;
                  setState(() {});
                },
                child: Text('Update', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
