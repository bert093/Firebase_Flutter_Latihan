import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of notes
  final CollectionReference notesCollection =
  // (final CollectionReference notesCollection =): Mendeklarasikan variabel notesCollection yang bertipe CollectionReference. Kata kunci final menandakan bahwa setelah variabel ini diinisialisasi, nilai dari variabel tersebut tidak dapat diubah lagi.
  FirebaseFirestore.instance.collection('notes');
  // (FirebaseFirestore.instance.collection('notes');): Inisialisasi notesCollection dengan referensi ke koleksi notes di database Firestore. FirebaseFirestore.instance mengacu pada instance singleton dari FirebaseFirestore yang merupakan titik akses utama ke operasi database Firestore. .collection('notes') adalah metode yang digunakan untuk mengakses koleksi dengan nama notes di database. Secara keseluruhan, baris ini digunakan untuk mengatur akses ke koleksi notes di Firestore, yang kemudian dapat digunakan untuk operasi CRUD (Create, Read, Update, Delete) pada catatan dalam aplikasi.

  // CREATE: add a new note
  Future<void> addNote(String note) { // note yang menerima parameter dengan bertipe String. Adanya Future<void> menandakan bahwa fungsi ini adalah asynchronous dan tidak mengembalikan nilai apa pun.
    return notesCollection.add({ // total object yang ditambahkan di bawah ini adalah 2
      'note': note, // Menyimpan teks catatan yang diberikan melalui parameter fungsi.
      'timestamp': Timestamp.now(), // waktu sekarang.
    });
  } // Secara keseluruhan, fungsi addNote ini digunakan untuk menambahkan catatan baru dengan teks dan timestamp ke dalam database Firestore.
  // READ: get notes from database (listen any changes from database)
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream = notesCollection.orderBy('timestamp', descending: true).snapshots();
    return notesStream;
  }
  // UPDATE: update notes given a doc id
  // Future<void> updateNote(String docId, String updatedNote) {
  //   return notesCollection.doc(docId).update({
  //     'note': updatedNote,
  //     'timestamp': Timestamp.now(), // update timestamp to current time
  //   });
  // }

  // DELETE: delete notes given a doc id
  // Future<void> deleteNote(String docId) {
  //   return notesCollection.doc(docId).delete();
  // }
}