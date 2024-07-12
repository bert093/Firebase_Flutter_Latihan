import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_syahril/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
  // text controller
  final TextEditingController textController = TextEditingController();
  
class _HomePageState extends State<HomePage> {

  // firestore
  final FirestoreService firestoreService = FirestoreService();

  // open a dialog vox to add a note
  void openNoteBox() {
    showDialog(context: context,
    builder: (context) => AlertDialog(
      content: TextField(
        controller: textController,
      ),
      actions: [
        // button to save
        ElevatedButton(onPressed: () {
          // add a new note
          firestoreService.addNote(textController.text);

          // clear the text controller
          textController.clear();

          // close the box
          Navigator.pop(context);
        },
        child: const Text("Add")
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notes")),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          // if we have data get all the docs
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;

            // display as a list
            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                // get each individual doc
                DocumentSnapshot document = notesList[index]; // The error you're encountering is due to using parentheses instead of square brackets to access elements from a list. In Dart, you should use square brackets to access list elements by index.
                String docID = document.id; // To resolve the warning about the unused variable docID, you can either use the variable in your code or remove it if it's not needed. Here's how you can modify the code to include the use of docID by displaying it in the ListTile: subtitle: Text('ID: $docID'), This modification adds a subtitle to each ListTile that displays the document ID, thus utilizing the docID variable. If you do not need the document ID in your UI, you should remove the docID variable to clean up the code.
                // get note from each doc
                Map<String, dynamic> data = 
                document.data() as Map<String, dynamic>;
                String noteText = data['note']; // The error you're encountering is because you're using parentheses () instead of square brackets [] to access a value from the map data. In Dart, you should use square brackets to access values from a map by their keys.

                // display as a list tile
                return ListTile(
                  title: Text(noteText),
                  subtitle: Text('ID: $docID'),
                );
              },
            );
            // if there is no data return nothing
          } else {
            return const Text("No notes...");
          }
        }
      ),
    );
  }
} 