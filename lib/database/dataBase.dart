import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_fire_base/model/Brew.dart';
import 'package:flutter_fire_base/model/userDataModel.dart';

class DatabasseService {
  final String uid;

  DatabasseService({this.uid});

  // collection referance
  final CollectionReference browCollection =
      Firestore.instance.collection("brews");
  final vdvdv = Firestore.instance.collection("fdf");
  Future updateUserData(String sugar, String name, int strength) async {
    return await browCollection.document(uid).setData({
      'sugar': sugar,
      'name': name,
      'strength': strength,
    });
  }

  // userData from SnapShote
  UserData _userDataFromSnapShot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      sugar: snapshot.data['sugar'],
      strength: snapshot.data['strength'],
    );
  }

  // list of brewss
  List<Brews> _brewListFromSnapShot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brews(
        name: doc.data['name'] ?? '',
        sugar: doc.data['sugar'] ?? '0',
        strength: doc.data['strength'] ?? 0,
      );
    }).toList();
  }

  // get brews stream
  Stream<List<Brews>> get brews {
    return browCollection.snapshots().map(_brewListFromSnapShot);
  }

  //get user doc stream
  Stream<UserData> get getUserData {
    return browCollection.document(uid).snapshots().map(_userDataFromSnapShot);
  }

  void sup() {
    browCollection.document(uid).delete();
  }
}
