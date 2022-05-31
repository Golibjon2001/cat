class CatFactModel{
  String text;
  String updatedAt;
  CatFactModel({required this.text,required this.updatedAt});
  factory CatFactModel.fromJson(Map<String,dynamic>json){
    return CatFactModel(
      text:json["text"],
      updatedAt:json["updatedAt"],
    );
  }
}