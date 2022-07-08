class QuestionModel {
  String? name;
  String? img;
  bool? yes = false;
  bool? no = false;


  QuestionModel.fromJson(var jsonData) {
    name = jsonData['name'];
    img = jsonData['img'];
  }
}
