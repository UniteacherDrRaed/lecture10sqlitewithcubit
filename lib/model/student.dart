class Student {
  int? id;
  final String name;
  final String course;

  Student({this.id, required this.name, required this.course});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'course': course};
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Student (id:$id,name:$name)';
  }
}
