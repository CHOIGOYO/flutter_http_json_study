import 'package:untitle/user.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Services {
  static String url = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<User>> getInfo() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // 성공한 경우
        final List<User> user = userFromJson(response.body);
        return user;
      } else{
        Fluttertoast.showToast(msg: 'Error occurred. Please try again');
        return <User>[];
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return <User>[];
    }
  }
}
