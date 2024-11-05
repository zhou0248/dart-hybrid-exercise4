import 'package:hybrid_exercise4/hybrid_exercise4.dart' as hybrid_exercise4;
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  try {
    var url = Uri.parse(
        'https://random-data-api.com/api/v2/users?size=10&response_type=json');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      List<String> output = [];
      jsonResponse.forEach((person) {
        var personInfo =
            'User Info: UID - ${person['uid']}, First - ${person['first_name']}, Last - ${person['last_name']}';
        output.add(personInfo);
      });
      output.forEach((user) {
        print(user);
      });
    }
  } catch (error) {
    print("Got an Error: $error");
  }
}
