import 'dart:convert';
import 'package:movie2url/models/user_login.dart';
import 'package:movie2url/services/url.dart' as url;
import 'package:http/http.dart' as http;
import 'package:movie2url/models/response_data_map.dart';


class UserService {
  Future registerUser(data) async {
    var uri = Uri.parse(url.BaseUrl + "/register_admin");
    var register = await http.post(uri, body: data);


    if (register.statusCode == 200) {
      var data = json.decode(register.body);
      if (data["status"] == true) {
        ResponseDataMap response = ResponseDataMap(
            status: true, message: "Sukses menambah user", data: data);
        return response;
      } else {
        var message = '';
        for (String key in data["message"].keys) {
          message += data["message"][key][0].toString() + '\n';
        }
        ResponseDataMap response =
            ResponseDataMap(status: false, message: message);
        return response;
      }
    } else {
      ResponseDataMap response = ResponseDataMap(
          status: false,
          message:
              "gagal menambah user dengan code error ${register.statusCode}");
      return response;
    }
  }

  Future loginUser(data) async {
    var uri = Uri.parse(url.BaseUrl + "/login");
    // print(uri);
    var loginUser = await http.post(uri, body: data);
    // print(loginUser.statusCode);

    if (loginUser.statusCode == 200) {
      var data = json.decode(loginUser.body);
      print(data["status"]);
      if (data["status"] == true) {
        UserLogin userLogin = UserLogin(
            status: data["status"],
            token: data["authorisation"]["token"],
            message: data["message"],
            id: data["data"]["id"],
            name : data["data"]["name"],
            email: data["data"]["email"],
            role: data["data"]["role"]);
        await userLogin.prefs();
        ResponseDataMap response = ResponseDataMap(
            status: true, message: "Sukses login user", data: data);
        return response;
      } else {
        ResponseDataMap response =
            ResponseDataMap(status: false, message: 'Email dan password salah');
        return response;
      }
    } else {
      ResponseDataMap response = ResponseDataMap(
          status: false,
          message:
              "gagal menambah user dengan code error ${loginUser.statusCode}");
      return response;
    }
  }

}