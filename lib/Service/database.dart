import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {

  //CREATE
  Future addStudent(Map<String, dynamic> studentInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Students")
        .doc(id)
        .set(studentInfoMap);
  }

//READ
  Future<Stream<QuerySnapshot>> getStudentDetails()async{
    return await FirebaseFirestore.instance.collection('Students').snapshots();
  }


//UPDATE
  updateAttendence(String attendancecase , String id) async {
    return await FirebaseFirestore.instance
    .collection("Students")
    .doc(id)
    .update({attendancecase: true});

}
//DELETE
  deleteStudentdata(String id) async {
    return await FirebaseFirestore.instance
    .collection("Students")
    .doc(id)
    .delete();

}



}