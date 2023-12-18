import 'package:flutter/material.dart';
import './new_std.dart';
import './std_list.dart';
import './std_detail.dart';
import './models/std.dart';
import './services/http_service.dart';

class stdPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NewStd(),
                ));
              },
              child: Text('Add Student'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => StudentList(),
                ));
              },
              child: Text('List Students'),
            ),
          ],
        ),
      ),
    );
  }
}
