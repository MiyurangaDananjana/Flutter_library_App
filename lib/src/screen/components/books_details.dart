import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BookDetails extends StatefulWidget {
  final int bookId;

  const BookDetails({Key? key, required this.bookId}) : super(key: key);

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  late Future<Map<String, dynamic>> _bookDetails;

  @override
  void initState() {
    super.initState();
    _bookDetails = getBookDetails(widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _bookDetails,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // or some loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          Map<String, dynamic> bookData = snapshot.data!;
          return _buildBookDetails(bookData);
        }
      },
    );
  }

  Widget _buildBookDetails(Map<String, dynamic> bookData) {
    print("Building Book Details"); // Debugging print
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Snapshot', style: TextStyle(fontSize: 16.0)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              // Handle love icon tap
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/5306597_2785751.jpg',
                height: 110.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 231, 231, 231),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Color.fromARGB(255, 248, 93, 93),
                    ),
                    onPressed: () {
                      // Handle love icon tap
                    },
                  ),
                  _buildDetailRow(bookData['title']),
                  _buildDetailRow(bookData['author']),
                  _buildDetailRow(bookData['year'].toString()),
                  // Adjust the key according to your API response
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 60.0),
      child: Text(
        value,
        style: TextStyle(fontSize: 12.0),
      ),
    );
  }

  Future<Map<String, dynamic>> getBookDetails(int bookId) async {
    final _baseUrl = 'http://localhost:5107'; // Replace with your API base URL
    final response = await http
        .get(Uri.parse('$_baseUrl/api/Books/get-book-data?id=$bookId'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      print(data);
      return data;
    } else {
      throw Exception('Failed to load book details');
    }
  }
}
