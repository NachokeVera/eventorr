import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //obtener lista de estudiantes
  Stream<QuerySnapshot> eventos() {
    // return FirebaseFirestore.instance.collection('estudiantes').snapshots();
    return FirebaseFirestore.instance
        .collection('eventos')
        .orderBy('fecha')
        .snapshots();
    // return FirebaseFirestore.instance.collection('estudiantes').where('edad', isLessThanOrEqualTo: 25).snapshots();
  }
}
