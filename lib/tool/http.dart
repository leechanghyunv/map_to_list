import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/Tmap_Model.dart';
class SK_OPENDATA extends GetxController {

  final String APIKEY = 'ceevGND92fauEWQ8gfEnJ2i2gTlX1sxT2DBh3XRh';

  Future<void> getData() async {
    try {
      final url = Uri.parse('http://apis.openapi.sk.com/transit/routes');
      final headers = {
        'accept': 'application/json',
        'appKey': '$APIKEY',
        'content-type': 'application/json',
      };
      final body = jsonEncode({
        'startX': '126.986325',
        'startY': '37.560989',
        'endX': '126.738714',
        'endY': '37.362357',
        "lang": 0,
        "format": "json",
        "count": 10
      });
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final Map<String, dynamic> utf8String = jsonDecode(Utf8Decoder().convert(response.bodyBytes))['metaData']['plan'];

        // Map<String, dynamic> utfIntoList = utf8String.entries.map((e) => Itinerary.fromJson(e.value)) as Map<String, dynamic>;
        // Itinerary itinerary = Itinerary.fromJson(utf8String);
        // List<Itinerary> utfIntoList = utf8String.entries.map((e) => e.value).toList();
        // List<Itinerary> utfIntoList = utf8String.map((e) => Itinerary.fromJson(e)).toList();
        // List<Itinerary> utfIntoList = utf8String.values.map((e) => Itinerary.fromJson(e)).toList();
       /// var map1 = Map.fromIterable(list, key: (e) => e.name, value: (e) => e.age);
       //  List<List<Itinerary>> subList = [];
       //  utf8String.forEach((key, value) => subList.add(value));
       //  utf8String.entries.map((e) => subList.add(e.value));
       //  List<Itinerary> utfIntoList = utf8String.map((e) => Itinerary.fromJson(e)).toList();
       //  List<Itinerary> utfIntoList = utf8String.entries.map((e) => Itinerary.fromJson(e)).to
        print(utf8String);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
