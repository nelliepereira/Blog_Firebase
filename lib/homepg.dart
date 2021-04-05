import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:myblogapp/displaypg.dart';
import 'package:myblogapp/blogclass.dart';

class homepg extends StatefulWidget {
  @override
  _homepgState createState() => _homepgState();
}

class _homepgState extends State<homepg> {
  TextEditingController titlectrl = TextEditingController();
  TextEditingController categoryctrl = TextEditingController();
  TextEditingController descctrl = TextEditingController();
  TextEditingController imagectrl = TextEditingController();
  Map<String, dynamic> addtoblog;

  submitblog(){
    addtoblog={
      'Title' : titlectrl.text,
      'Category' : categoryctrl.text,
      'Desc' : descctrl.text,
      'Image' : imagectrl.text,
    };
    ref.add(addtoblog).whenComplete(() => Navigator.pop(context));
    titlectrl.text = " ";
    categoryctrl.text= " ";
    descctrl.text= " ";
    imagectrl.text= " ";
  }
  final ref = Firestore.instance.collection('myblogapp');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(' Hello there!!!',
          style: TextStyle(
              color: Colors.black, fontFamily: "DancingScript", fontSize: 24),),
      ),*/
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2,
                ),
                Stack(children: [
                  Container(
                    height: 200,
                    width: 500,
                    color: Colors.blue[100],
                    child: Image.network(
                      'https://www.webnode.com/blog/wp-content/uploads/2019/04/blog2.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Text('''
 Lets 
    Bloggg!''',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,fontWeight: FontWeight.bold,letterSpacing: 3)),
                ]),
                SizedBox(
                  height: 20,
                ),
                Text('Popular',
                    style: TextStyle(color: Colors.grey, fontSize: 24)),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 150,
                  width: 600,
                  color: Colors.blue[100],
                  child: StreamBuilder(
                    stream: ref.snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        List<data1> datalist  = snapshot.data.documents.map((e) => data1.fromJson(e.data)).toList();
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: datalist.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => displaypg(datalist[index])));
                                  /*snapshot.data.documents[index].data['Title'], snapshot.data.documents[index].data['Category'],
                                     snapshot.data.documents[index].data['Desc'], snapshot.data.documents[index].data['Image']*/
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            height: 100,
                                            width: 100,
                                            child: Image.network(datalist[index].climage,
                                              fit: BoxFit.fill,
                                            )),
                                      ),
                                      Text(datalist[index].cltitle,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            });
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text('All Articles',
                    style: TextStyle(color: Colors.grey, fontSize: 24)),
                SizedBox(
                  height: 5,
                ),
                Container(
                  //height: 600,
                  color: Colors.blue[100],
                  child: StreamBuilder(
                    stream: ref.snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        List<data1> datalist  = snapshot.data.documents.map((e) => data1.fromJson(e.data)).toList();
                          return ListView.builder(
                          reverse: true,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: datalist.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                   Navigator.push(context, MaterialPageRoute(builder: (_) => displaypg(datalist[index])));
                                  /*snapshot.data.documents[index].data['Title'], snapshot.data.documents[index].data['Category'],
                                     snapshot.data.documents[index].data['Desc'], snapshot.data.documents[index].data['Image']*/
                                },
                                child: Container(
                                  height: 120,
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Card(
                                      elevation: 2,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 80,
                                            child: Image.network(
                                              datalist[index].climage,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:5.0, right: 2),
                                            child: Container(
                                              width: 180,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    datalist[index].clcategory,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.grey,
                                                        letterSpacing: 1),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    datalist[index].cltitle,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.grey),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Text(datalist[index].cldesc, style: TextStyle(fontSize: 16,color: Colors.grey), maxLines: 3,),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              InkWell(
                                                onTap: (){
                                                  titlectrl.text =datalist[index].cltitle;
                                                  categoryctrl.text =datalist[index].clcategory;
                                                  descctrl.text =datalist[index].cldesc;
                                                  imagectrl.text =datalist[index].climage;
                                                  showDialog(context: context, builder: (context)=> Dialog(
                                                    child: SingleChildScrollView(
                                                      child: Container(
                                                        height: 300,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(10.0),
                                                          child: Column(
                                                            children: [
                                                              Text('Enter your Blog Details', style: TextStyle( fontSize: 20), ),
                                                              SizedBox(height: 5,),
                                                              TextFormField(
                                                                controller: titlectrl,
                                                                autocorrect: true,
                                                                decoration: InputDecoration(
                                                                  labelText: 'Title',
                                                                  hintText:  'Enter the blog title',
                                                                ),
                                                              ),
                                                              TextFormField(
                                                                controller: categoryctrl,
                                                                autocorrect: true,
                                                                decoration: InputDecoration(
                                                                  labelText: 'Category',
                                                                  hintText:  'Enter type of Blog',
                                                                ),
                                                              ),
                                                              TextFormField(
                                                                controller: descctrl,
                                                                autocorrect: true,
                                                                decoration: InputDecoration(
                                                                  labelText: 'Description',
                                                                  hintText:  'Type in your article',
                                                                ),
                                                              ),
                                                              TextFormField(
                                                                controller: imagectrl,
                                                                autocorrect: true,
                                                                decoration: InputDecoration(
                                                                  labelText: 'Image Link',
                                                                  hintText:  'Enter the Http address',
                                                                ),
                                                              ),
                                                              SizedBox(height: 8,),
                                                              MaterialButton(
                                                                onPressed: (){
                                                                 snapshot.data.documents[index].reference.updateData(
                                                                      {'Title': titlectrl.text,
                                                                        'Category': categoryctrl.text,
                                                                        'Desc':descctrl.text,
                                                                        'Image': imagectrl.text,
                                                                      }).whenComplete(() => Navigator.pop(context));
                                                                 // to clear text
                                                                 titlectrl.text = " ";
                                                                 categoryctrl.text= " ";
                                                                 descctrl.text= " ";
                                                                 imagectrl.text= " ";

                                                                  /*ref.add({'Title': titlectrl.text,
                                                                    'Category': categoryctrl.text,
                                                                    'Desc':descctrl.text,
                                                                    'Image': imagectrl.text,}).whenComplete(() => Navigator.pop(context));*/
                                                                },
                                                                child: Container(
                                                                  alignment: Alignment.center,
                                                                  height: 40, width: 120,
                                                                  decoration: BoxDecoration(color:Colors.blue[100],borderRadius: BorderRadius.circular(20)),
                                                                  child: Text('Update Blog', style: TextStyle(color: Colors.white),), ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ));
                                                } ,
                                                child: Icon(
                                                  Icons.edit,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 50,
                                              ),
                                              InkWell(
                                                onTap: (){
                                                snapshot.data.documents[index].reference.delete();
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.grey,
        splashColor: Colors.grey,
        backgroundColor: Colors.grey,
        child: InkWell(
            onTap: (){
              showDialog(context: context, builder: (context)=> Dialog(
                child: SingleChildScrollView(
                  child: Container(
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text('Enter your Blog Details', style: TextStyle( fontSize: 20), ),
                          SizedBox(height: 5,),
                          TextFormField(
                            controller: titlectrl,
                            autocorrect: true,
                            decoration: InputDecoration(
                              labelText: 'Title',
                              hintText:  'Enter the blog title',
                            ),
                          ),
                          TextFormField(
                            controller: categoryctrl,
                            autocorrect: true,
                            decoration: InputDecoration(
                              labelText: 'Category',
                              hintText:  'Enter type of Blog',
                            ),
                          ),
                          TextFormField(
                            controller: descctrl,
                            autocorrect: true,
                            decoration: InputDecoration(
                              labelText: 'Description',
                              hintText:  'Type in your article',
                            ),
                          ),
                          TextFormField(
                            controller: imagectrl,
                            autocorrect: true,
                            decoration: InputDecoration(
                              labelText: 'Image Link',
                              hintText:  'Enter the Http address',
                            ),
                          ),
                          SizedBox(height:8),
                          MaterialButton(
                            onPressed: (){
                              submitblog();
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 40, width: 120,
                                decoration: BoxDecoration(color:Colors.blue[100],borderRadius: BorderRadius.circular(20)),
                              child: Text('Submit Blog', style: TextStyle(color: Colors.white),), ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
            } ,
            child: Icon(Icons.add)),
      ),
    );
  }
}
