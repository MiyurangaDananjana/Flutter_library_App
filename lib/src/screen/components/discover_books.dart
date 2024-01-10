import 'package:flutter/material.dart';
import 'package:flutter_application/src/screen/components/books_details.dart';
import 'package:flutter_application/src/services/ApiService.dart';

class discover_books extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<discover_books> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _foundUsers = [];

  // This list holds the data for the list view
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // This function is called whenever the text field changes
  Future<void> _loadData() async {
    final title = _searchController.text;
    final apiService = ApiService();

    try {
      final List<Map<String, dynamic>> responseData =
          await apiService.getBooksByTitle(title);
      setState(() {
        _foundUsers = responseData;
      });
    } catch (e) {
      print('Error: $e');
      // Handle error, show a snackbar, or any other error handling logic
    }
  }

  void _runFilter(String enteredKeyword) {
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Discover Books',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _searchController,
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          // Handle the click event here
                          int bookId = _foundUsers[index]["bookId"];
                          print("Clicked on book with ID: $bookId");
                          _handleBookTap(context, bookId);
                        },
                        child: Card(
                          key: ValueKey(_foundUsers[index]["bookId"]),
                          color: Colors.blue,
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading: Text(
                              _foundUsers[index]["bookId"].toString(),
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.white),
                            ),
                            title: Text(
                              _foundUsers[index]['title'],
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              '${_foundUsers[index]["author"]} - ${_foundUsers[index]["year"]}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 10),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleBookTap(BuildContext context, int bookId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetails(bookId: bookId),
      ),
    );
  }
}
