import 'package:flutter/material.dart';
import 'package:std/services/http_service.dart';

import './models/std.dart';

class NewStd extends StatefulWidget {

  const NewStd({Key? key}) : super(key: key);

  @override
  _NewStdState createState() => _NewStdState();
}

class _NewStdState extends State<NewStd> {
  final HttpService httpService = HttpService();
  late String id;
  late String firstName;
  late String lastName;
  late String university;
  late String specialization;
  late int age;
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  Widget createId() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'ID'),
      validator: (val) {
        if (val!.isEmpty) {
          return ('ID is required');
        }
      },
      onSaved: (val) => id = val as String,
    );
  }

  // TextFormField
  Widget createFirstName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'First Name'),
      validator: (val) {
        if (val!.isEmpty) {
          return ('First name is requied');
        }
      },
      onSaved: (val) => firstName = val as String,
    );
  }
  Widget createLastName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Last Name'),
      validator: (val) {
        if (val!.isEmpty) {
          return ('last name is requied');
        }
      },
      onSaved: (val) => lastName = val as String,
    );
  }
  Widget createuniversity() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'university'),
      validator: (val) {
        if (val!.isEmpty) {
          return ('university is requied');
        }
      },
      onSaved: (val) => university = val as String,
    );
  }
  Widget createspecialization() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'specialization'),
      validator: (val) {
        if (val!.isEmpty) {
          return ('specialization is requied');
        }
      },
      onSaved: (val) => specialization = val as String,
    );
  }
  Widget createAge() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'age'),
      validator: (val) {
        if (val!.isEmpty) {
          return ('age is requied');
        }
      },
      onSaved: (val) => age = int.parse(val!),
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('add new user'),
        centerTitle: true,
      ) ,

      body: Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            createId(),
            createFirstName(),
            createLastName(),
            createuniversity(),
            createspecialization(),
            createAge(),
            ElevatedButton(
              onPressed: () {
                if (!_key.currentState!.validate()) {
                  return;
                }
                _key.currentState!.save();
               std s = std(id: id, firstName: firstName, lastName: lastName,university:university,specialization:specialization, age: age);
                setState(() {
                  httpService.addstd(s);
                });
                Navigator.of(context).pop();
              },
              child: Text('submit'),
            )
          ],
        ),
      ),

    );
  }
}