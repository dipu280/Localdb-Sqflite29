
import 'package:flutter/material.dart';
import 'package:localdb_sqflite29/db_helper/mydb_helper.dart';
import 'package:localdb_sqflite29/model/contact.dart';
import 'package:localdb_sqflite29/widgets/new_contact.dart';

class Demo extends StatefulWidget {


  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.transparent,
        title: Text('Contact List'),centerTitle: true,),
      body:FutureBuilder(
        future: MydbHelper.readContact(),
         builder:(BuildContext context,AsyncSnapshot<List<Contact>> snapshot){
          if (!snapshot.hasData){
            return Center(
              child: Column(
                children: [
              CircularProgressIndicator(),
              Text("Loding...")
            ],),);
          } 
          return snapshot.data!.isEmpty?Center(
            child: Text("Vi Data Nai"),)
            : ListView(
              children: snapshot.data!. map((e) => Center(
                child: ListTile(
                  title: Text(e.name),
                  subtitle: Text(e.phone),
                  trailing: IconButton(
                    onPressed: ()async{
                    await  MydbHelper.deleteContact(e.id!);
                    setState(() {
                      
                    });
                    },
                     icon: Icon(Icons.delete),
                     
                     ),
                  ),
                  )).toList()
            );
         }),
       floatingActionButton:   FloatingActionButton(
        onPressed: (){

      Navigator.of(context).push( MaterialPageRoute(builder: (_c)=> NewContact( )));
          setState(() {
          
          });
         
          
        },
        child: Icon(Icons.add)
        ),
       
        
  );}
  
}
