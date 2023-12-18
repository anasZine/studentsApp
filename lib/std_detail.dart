import 'package:flutter/material.dart';
import './models/std.dart';
import './services/http_service.dart';

class stdDetail extends StatelessWidget {
  final std s;
  final HttpService httpService = HttpService();

  stdDetail({required this.s});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(s.firstName),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.42,
          height: MediaQuery.of(context).size.height * 0.41,
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                gradient: LinearGradient(
                  colors: [Color(0xFF51BFF0), Color(0xFFFEE7D1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      CircleAvatar(
                        radius: 24.0,
                        backgroundImage: AssetImage('assets/images/std.jpg'), // Provide the correct path

                      ),
                    ],
                  ),
                  Text(
                    'ID: ${s.id}',
                    style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'First Name: ${s.firstName}',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Last Name: ${s.lastName}',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'University: ${s.university}',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Specialization: ${s.specialization}',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Age: ${s.age}',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirm Deletion'),
                            content: Text('Are you sure you want to delete this student?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await httpService.deletestd(s.id);
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop(); // Close the detail page
                                },
                                child: Text('Delete'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    ),
                    child: Text('Delete Student'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
