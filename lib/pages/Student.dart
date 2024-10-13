import 'package:crud_app/Service/database.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController regdnocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 60, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_outlined)),
                const SizedBox(
                  width: 80.0,
                ),
                const Text(
                  'Add  ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Student',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),

            //Add Student details:::::::::::::::::::::::::::::::::
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              'Student Name ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: namecontroller,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Enter Student Name"),
              ),
            ),
            //
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              'Student Age',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: agecontroller,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Enter Student Age"),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              'Student Regd No',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0),
              decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                controller: regdnocontroller,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Student Regd No"),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),

            //FireStore Work will be start here:::::::::::::::::::::::::::::::::::::
            GestureDetector(
              onTap: () async {
                if (namecontroller.text != "" &&
                    agecontroller.text != "" &&
                    regdnocontroller.text != "") {
                  String addID = randomAlphaNumeric(10);
                  Map<String, dynamic> StudentInfoMap = {
                    "Name": namecontroller.text,
                    "Age": agecontroller.text,
                    "Regd No": regdnocontroller.text,
                    "Absent": false,
                    "Present": false
                  };
                  await DatabaseMethods()
                      .addStudent(StudentInfoMap, addID)
                      .then((Value) {
                    namecontroller.text = "";
                    agecontroller.text = "";
                    regdnocontroller.text = "";
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                          "Student data has been Uploaded",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        )));
                  });
                }
              },
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  width: 135,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
