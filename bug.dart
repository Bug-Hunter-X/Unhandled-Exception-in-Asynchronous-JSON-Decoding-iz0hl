```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Here's where the problem might occur if you don't handle the case
      // where the JSON response is malformed or doesn't contain the expected keys.
      final jsonData = jsonDecode(response.body);
      // Accessing jsonData['key'] might throw an exception if 'key' is missing.
      print(jsonData['key']); 
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    // Important to rethrow if you want the calling function to handle the error.
    rethrow; // This is an important detail, often overlooked.
  }
}
```