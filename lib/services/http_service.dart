import 'dart:convert';
import 'package:http/http.dart';
import '../models/std.dart';

class HttpService{
  final String stdUrl = "https://657f0a279d10ccb465d5d45e.mockapi.io/api/students";

  Future<List<std>> getstd() async{
    Response res = await get(Uri.parse(stdUrl));
    if(res.statusCode==200) {
      List<dynamic> body = jsonDecode(res.body);
      List<std> stds = body.map((dynamic item) => std.fromJson(item))
          .toList();
      return stds;
    }else {
      throw "can't get posts";
    }
  }

  Future<void> deletestd(String id) async{
    Response res=await delete(Uri.parse("$stdUrl/$id"));
    if(res.statusCode==200){
      print("deleted");
    }
  }
  Future<std> addstd(std s) async {
    Response res=await post (Uri.parse(stdUrl),
        headers: <String,String>{
          'Content-type':'application/json; charset=UTF-8',

        },
        body: jsonEncode(<String,dynamic>{
          'firstName':s.firstName,
          'lastName':s.lastName,
          'university':s.university,
          'specialization':s.specialization,
          'age':s.age,
          'id':s.id
        }
        )
    );
    if(res.statusCode==201){
      return std.fromJson(jsonDecode(res.body));
    }else{
      throw 'could not create user';
    }
  }
}
