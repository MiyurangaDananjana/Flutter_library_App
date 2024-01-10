import 'package:flutter/material.dart';
import './discover_books.dart';
import './books_details.dart';

class selection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => discover_books()),
              );
            },
            child: Text(
              'Discover Books',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Color(0xFF9FA4DB)),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookDetails(bookId: 1)),
              );
            },
            child: Text(
              'Library Overview',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Color(0xFF9FA4DB)),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle Most View button click
              print('Most View button clicked');
            },
            child: Text(
              'Refine Selection',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                backgroundColor: Color(0xFF9FA4DB)),
          ),
        ],
      ),
    );
  }
}
