class Contact {
  int? id;
  String name;
  String phone;
  Contact({this.id,required this.name,required this.phone});

  factory Contact.fromMap(Map<String,dynamic>map)=>
  Contact(id: map["id"], name:map["name"], phone: map["phone"]);
  Map<String , dynamic> toMap()=>{"id":id,"name": name,"phone" : phone};
}