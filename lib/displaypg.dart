import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:myblogapp/blogclass.dart';


class displaypg extends StatefulWidget {
  final data1 listdatap;

  displaypg(this.listdatap);

  @override
  _displaypgState createState() => _displaypgState();
}

class _displaypgState extends State<displaypg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.listdatap.clcategory,style: TextStyle(letterSpacing: 2),),
          backgroundColor: Colors.blue[200],
          toolbarHeight: 30,
          automaticallyImplyLeading: false,
        ),

      body: SafeArea(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 800, width: 400,
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('20'),
                      Icon(CupertinoIcons.heart_solid, color: Colors.red,),
                      SizedBox(width: 260,),
                      CircleAvatar(
                        foregroundColor: Colors.grey,
                        child: Text('NP'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Image.network(widget.listdatap.climage, fit: BoxFit.contain,),
                  SizedBox(height: 20,),
                  Center(child: Text(widget.listdatap.cltitle, style: TextStyle(fontSize: 28, color: Colors.grey),)),
                  SizedBox(height: 20,),
                  Container(
                    height: 200,
                    child: Text(widget.listdatap.cldesc,textAlign: TextAlign.justify,style: TextStyle(fontSize: 18, color: Colors.grey)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.grey,
      child: MaterialButton(
        onPressed:(){
          Navigator.pop(context);
        },

        child: Icon(Icons.arrow_back,color: Colors.white,),
      ),
    ) ,
    );
  }
}
