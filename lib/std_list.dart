import 'package:flutter/material.dart';
import './std_detail.dart';
import './models/std.dart';
import './services/http_service.dart';

class StudentList extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student List"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: httpService.getstd(),
        builder: (BuildContext ctx, AsyncSnapshot<List<std>> snapshot) {
          if (snapshot.hasData) {
            List<std>? stds = snapshot.data;
            return ListView(
              children: stds!
                  .map(
                    (std s) => ListTile(
                  title: Text('${s.firstName} ${s.lastName}'),
                  subtitle: Text('Age: ${s.age}'),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => stdDetail(s: s),
                    ),
                  ),
                ),
              )
                  .toList(),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
