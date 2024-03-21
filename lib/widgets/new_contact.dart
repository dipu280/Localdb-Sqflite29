import 'package:flutter/material.dart';
import 'package:localdb_sqflite29/db_helper/mydb_helper.dart';
import 'package:localdb_sqflite29/model/contact.dart';

class NewContact extends StatefulWidget {
  const NewContact({super.key});

  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {
   final TextEditingController  _nameController = TextEditingController();
   final TextEditingController  _phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('Add new contact')),
       body: Padding(padding: EdgeInsets.all(15.0),
       child: Container(child: Column(
        children: [
          TextField(
            controller:_nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius:   BorderRadius.circular(20)),
                labelText: "Name",
                hintText: " Enter name",
                prefixIcon: Icon(Icons.person)),
          ),
          SizedBox( height: 10),
          TextField(
            controller:_phoneController ,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius:   BorderRadius.circular(20)),
                labelText: "Phone",
                hintText: " Enter phone number",
                prefixIcon: Icon(Icons.phone)),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: ()async {
              await MydbHelper.createContact(
                Contact(name: _nameController.text, phone: _phoneController.text));
              Navigator.pop(context);
            },
               child: Text("Save Contact"),)
           
            
          
        ],
       ),),),
    );
  }
}