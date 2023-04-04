import 'package:http/http.dart';
import 'dart:convert';
import './../globals.dart' as globals;

class QuoteOfDay {
  late String quote;
  late String initiator;
  String url = 'http://api.forismatic.com/api/1.0/';

  Future<Map<String, String>> getOne() async {
    String body = 'method=getQuote&format=json&lang=en';

    try {
      Response response =
          await post(Uri.parse(url), headers: globals.headers, body: body);
      if (response.statusCode == 200) {
        // Success!
        Map<String, dynamic> json = jsonDecode(response.body);
        String quoteText = json['quoteText'];
        String quoteAuthor = json['quoteAuthor'];
        quote = quoteText;
        initiator = quoteAuthor;
        return {"quote": quote, "initiator": initiator};
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (ex) {
      print('Exception: $ex');
    }
    return {};
  }
}
