import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  // get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<List<Map<String, dynamic>>> getUsertsStream() {
    return _firestore.collection("Users").snapshots().map((event) {
      return event.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }
}
