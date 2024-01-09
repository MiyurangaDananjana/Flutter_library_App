import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Snapshot', style: TextStyle(fontSize: 16.0)),
        centerTitle: true,
        actions: [
          // Add love icon to the app bar
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
            // Image at the top
            Container(
              padding: EdgeInsets.all(16.0),
              child: Image.network(
                'http://books.google.com/books/content?id=sDzU8TpKvQAC&printsec=frontcover&img=1&zoom=1&source=gbs_api',
                height: 100.0,
                width: 70.0,
                fit: BoxFit.cover,
              ),
            ),
            // Details section
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
                  _buildDetailRow('Visual Studio'),
                  _buildDetailRow('Author 1, Author 2'),
                  _buildDetailRow('January 1, 2023'),
                  _buildDetailRow('Fiction'),
                  _buildDetailRow('Publisher XYZ'),
                  _buildDetailRow('ISBN: 1234567890'),
                  _buildDetailRow('Language: English'),
                  _buildDetailRow('Pages: 300'),
                  _buildDetailRow('Format: Paperback'),
                  _buildDetailRow('878'),
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
}
