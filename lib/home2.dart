import 'package:flutter/material.dart';

class Note extends StatefulWidget {
  const Note ({super.key});

  @override
  State<Note > createState() => _NoteState();
}

class _NoteState extends State<Note > {
  TextEditingController _controller =TextEditingController();
  List<String> items=[];
void addnote(){
  if(_controller.text.isNotEmpty){
    setState(() {
      items.add(_controller.text);
      _controller.clear();
    });

  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(35)
      ,child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        
          children: [
           Center(
            child: 
            Column(
              children: [
                 SizedBox(height: 80,),
            Image.asset("assets/download (2).png",width: 100,height: 100,fit: BoxFit.cover,),
            SizedBox(height: 20,),
           Text("My notes",style: TextStyle(fontSize: 35),),
          //  SizedBox(height: 100,),
           Text(" ${items.length} notes",
        
           ),
           SizedBox(height: 20,),
           TextField(
            controller: _controller,
             decoration: InputDecoration(
              hintText: "Enter Your Note",
              
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(10)
              ),
              suffixIcon: Icon(Icons.edit)
             ),
        
                 onSubmitted: (value) => addnote()
            
           )
           ,
           SizedBox(height: 15,),
        
         Column(
         children: items
                          .map((note) => Container(
                                width: double.infinity,
                                height: 100,
                                margin: EdgeInsets.only(bottom: 15),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 5,
                                      blurRadius: 10,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Text(note),
                              ))
                          .toList(),
            )
              ]
            
            ),
           )
          
          
           
        
          
        
          ]
        ),
      )
    )
    );


    
  }
}