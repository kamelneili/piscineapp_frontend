import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:piscine_app/home/models/actualite_model.dart';

class ActualiteRepository {
  final FirebaseFirestore _firebaseFirestore;

  ActualiteRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  Stream<List<Actualite>> getAllActualites() {
    return _firebaseFirestore
        .collection('actualites')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Actualite.fromSnapshot(doc)).toList();
    });
  }
}
