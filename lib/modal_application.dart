final String tableApplication = 'application';

class ApplicationFields {

  // static final List<String> values = [
  //   id, student_name, date_of_birth, gender, maritial_status, institute_name, created_on
  // ];

  static final String id = '_id';
  static final String institute_vib = 'institute_vib';
  static final String branch = 'branch';
  static final String unique_id = 'unique_id';
  static final String has_unique_id = 'has_unique_id';
  static final String parent_name = 'parent_name';
  static final String date_of_birth = 'date_of_birth';
  static final String gender = 'gender';
  static final String maritial_status = 'maritia_status';
  static final String created_on = 'created_on';
}

class ApplicationList {
  final int id;
  final String institute_vib;
  final String branch;
  final String unique_id;
  final String has_unique_id;
  final String parent_name;
  final String date_of_birth;
  final String gender;
  final String maritial_status;
  final String created_on;

  ApplicationList(this.id, this.institute_vib, this.branch, this.unique_id, this.has_unique_id, this.parent_name, this.date_of_birth, this.gender, this.maritial_status, this.created_on);
}