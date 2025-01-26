```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        //Properly handle potential missing keys
        final keyValue = jsonData['key'] ?? 'Key not found'; //Handle missing keys gracefully
        print(keyValue); 
      } catch (e) {
        print('Error decoding JSON: $e');
        rethrow; //Re-throw the exception for higher level handling
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    rethrow;
  }
}
```