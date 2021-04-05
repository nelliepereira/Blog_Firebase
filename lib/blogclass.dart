import 'package:flutter/material.dart';

class data1 {
  String cltitle;
  String clcategory;
  String cldesc;
  String climage;

  data1({this.clcategory, this.cldesc, this.climage, this.cltitle});

  data1.fromJson(Map<String, dynamic> json) {
    cltitle = json['Title'];
    clcategory = json['Category'];
    cldesc  =json['Desc'];
    climage =json['Image'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data2 = new Map<String,dynamic>();
    data2['Title']= this.cltitle;
    data2['Category']= this.clcategory;
    data2['Desc']= this.cldesc;
    data2['Image']= this.climage;
  }
}