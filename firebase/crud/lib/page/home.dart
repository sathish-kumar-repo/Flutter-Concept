import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/services/firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController _textController = TextEditingController();
  void openNoteBox({String? docID, String? note}) {
    if (docID != null) {
      _textController.text = note!;
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: _textController,
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (docID == null) {
                firestoreService.addNote(_textController.text);
              } else {
                firestoreService.updateNote(docID, _textController.text);
              }
              _textController.clear();
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('N O T E S'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openNoteBox(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(CupertinoIcons.add),
      ),
      body: StreamBuilder(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Some error'),
            );
          } else if (snapshot.hasData) {
            List<QueryDocumentSnapshot<Map<String, dynamic>>> notesList =
                snapshot.data!.docs;
            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                QueryDocumentSnapshot<Map<String, dynamic>> document =
                    notesList[index];
                // id
                String docID = document.id;
                // Data
                Map<String, dynamic> data = document.data();
                String noteText = data['note'];
                return Container(
                  height: 100,
                  margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: ListTile(
                    title: Text(
                      noteText,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () =>
                              openNoteBox(docID: docID, note: noteText),
                          icon: const Icon(CupertinoIcons.settings),
                        ),
                        IconButton(
                          onPressed: () => firestoreService.deleteNote(docID),
                          icon: const Icon(
                            CupertinoIcons.delete,
                            color: CupertinoColors.systemRed,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No Notes'),
            );
          }
        },
      ),
    );
  }
}
