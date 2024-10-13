import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_app/Service/database.dart';
import 'package:crud_app/pages/Student.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  @override
  void initState() {
    getontheload();
    super.initState();

  }


getontheload()async{
  studentStream=await DatabaseMethods().getStudentDetails();
  setState(() {});
}


  Stream? studentStream;

  Widget ShowStudentList() {
    return StreamBuilder(
        stream: studentStream,
        builder: (context, AsyncSnapshot snapshots) {
          return snapshots.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: snapshots.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshots.data.docs[index];
                    return  Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          
                          padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Text(
                                      'Student Name : ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                
                                    Text(
                                       ds["Name"],
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8.0,),
                                   // Spacer(),
                                    GestureDetector(
                                      onTap: ()async{
                                        await DatabaseMethods().deleteStudentdata(ds.id);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 10.0),
                                        child: Icon(Icons.delete,color: Colors.black,size: 30.0,),
                                      ),
                                    )
                                
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Regd No : ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                     ds["Regd No"],
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 19.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Age : ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    ds["Age"],
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 19.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Attendance : ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                ds["Present"]==false? 
                                GestureDetector(
                                  onTap: ()async{
                                    await DatabaseMethods().updateAttendence("Present", ds.id);
                          
                                  },
                                  child: Container(
                                      width: 50,
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                         border: Border.all(),
                                          borderRadius: BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          'P',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                ): Container(
                                    width: 50,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        'P',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                          
                                   ds["Absent"]==false? 
                          
                                  GestureDetector(
                                    onTap: ()async{
                                       await DatabaseMethods().updateAttendence("Absent", ds.id);
                                    },
                                    child: Container(
                                      width: 50,
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                         border: Border.all(),
                                          borderRadius: BorderRadius.circular(5)),
                                      child: Center(
                                        child: Text(
                                          'A',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ):Container(
                                    width: 50,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        'A',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddStudent(),
              ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          top: 60,
          left: 20.0,
          right: 20.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Student  ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Attendance',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            ShowStudentList(),
          ],
        ),
      ),
    );
  }
}
