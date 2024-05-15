import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lecture10example/cubit/cubitforstudentsapp.dart';
import 'package:lecture10example/cubit/statesforstudentapp.dart';
import 'package:lecture10example/model/student.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 210,
          title: Column(children: [
            const Text(
              "الطلاب الغائبين",
              style: TextStyle(color: Colors.red),
            ),
            Container(
              height: 10,
            ),
            TextField(
              autofocus: true,
              controller: context.read<CubitForStudentApp>().nameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.limeAccent[100],
                hintText: "Enter student name",
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(21),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.red),
                  borderRadius: BorderRadius.circular(21),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.amber),
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
            ),
            Container(
              height: 10,
            ),
            TextField(
              controller: context.read<CubitForStudentApp>().courseController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.limeAccent[100],
                hintText: "Enter  course",
                prefixIcon: const Icon(Icons.book),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.circular(21),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.red),
                  borderRadius: BorderRadius.circular(21),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.amber),
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
            ),
          ]),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<CubitForStudentApp>().addNewStudent();
                  context.read<CubitForStudentApp>().fetchingStudentsData();
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.cyanAccent,
                ))
          ],
          backgroundColor: Colors.green,
        ),
        body: BlocBuilder<CubitForStudentApp, StatesForStutentsApp>(
          builder: (context, state) {
            if (state is StateReadyForFetchingStudentsData) {
              return const LinearProgressIndicator();
            } else if (state is StateFetchingStudentsDataSuccessfully) {
              List<Student> students = state.students;
              return ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        trailing: IconButton(
                          onPressed: () {
                            context
                                .read<CubitForStudentApp>()
                                .deleteStudent(id: students[index].id!);
                            context
                                .read<CubitForStudentApp>()
                                .fetchingStudentsData();
                          },
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.blue,
                          ),
                        ),
                        leading: Text("${students[index].id}"),
                        title: Text(students[index].name),
                        subtitle: Text(students[index].course),
                      ),
                    );
                  });
            } else if (state is StateFetchingStudentsDataUnsuccessfully) {
              return Text(state.errorExp);
            } else if (state is StateAddingtudentsDataSuccessfully) {
              return Text("تمت اضافة الطالب بنجاج");
            }else if(state is StateDeletingtudentsDataSuccessfully){
              return Text("تم حذف الطالب بنجاح");
            }
            return Text("حالة لم يتم تعريفها بعد");
          },
        ));
  }
}
