class LoginModel{
  bool? status;
  String? message;
  UserData? data;

  LoginModel.fromJson(Map<String,dynamic>json){
    this.status=json["status"];
    this.message=json["message"];
    this.data= json["data"]==null ? null :UserData.fromJson(json["data"]);
  }

}

class UserData{
  int? id;
  int? points;
  int? credit;
  String? name ;
  String? email ;
  String? phone;
  String? image;
  String? token;

  UserData.fromJson(Map<String,dynamic>json){
    this.id=json["id"];
    this.name=json["name"];
    this.email=json["email"];
    this.phone=json["phone"];
    this.image=json["image"];
    this.token=json["token"];
    this.points=json["points"];
    this.credit=json["credit"];
  }

}