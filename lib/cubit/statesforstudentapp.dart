import 'package:lecture10example/model/student.dart';

abstract class StatesForStutentsApp {}

class InitialStateForStutentsApp extends StatesForStutentsApp {}

class StateReadyForFetchingStudentsData extends StatesForStutentsApp {}

class StateFetchingStudentsDataSuccessfully extends StatesForStutentsApp {
  final List<Student> students;

  StateFetchingStudentsDataSuccessfully({required this.students});
}

class StateFetchingStudentsDataUnsuccessfully extends StatesForStutentsApp {
  final String errorExp;

  StateFetchingStudentsDataUnsuccessfully({required this.errorExp});
}

class StateReadyForAddStudentsData extends StatesForStutentsApp {}

class StateAddingtudentsDataSuccessfully extends StatesForStutentsApp {}

class StateAddStudentDataUnsuccessfully extends StatesForStutentsApp {
  final String errorExp;

  StateAddStudentDataUnsuccessfully({required this.errorExp});
}

class StateReadyForDeleteStudentsData extends StatesForStutentsApp {}

class StateDeletingtudentsDataSuccessfully extends StatesForStutentsApp {}

class StateDeleteStudentDataUnsuccessfully extends StatesForStutentsApp {
  final String errorExp;

  StateDeleteStudentDataUnsuccessfully({required this.errorExp});
}
