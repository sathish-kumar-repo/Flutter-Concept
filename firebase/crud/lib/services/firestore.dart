import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
// get collection of notes
  final CollectionReference<Map<String, dynamic>> notes =
      FirebaseFirestore.instance.collection('notes');

// CREATE: add a new note
  Future<void> addNote(String note) {
    return notes.add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }
// READ: get notes from database

  Stream<QuerySnapshot<Map<String, dynamic>>> getNotesStream() {
    final Stream<QuerySnapshot<Map<String, dynamic>>> notesStream =
        notes.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }

// UPDATE: update notes given a doc id
  Future<void> updateNote(String docId, String newNote) {
    return notes.doc(docId).update({
      'note': newNote,
      'timestamp': Timestamp.now(),
    });
  }

// DELETE: delete notes given a doc id
  Future<void> deleteNote(String docId) {
    return notes.doc(docId).delete();
  }
}
