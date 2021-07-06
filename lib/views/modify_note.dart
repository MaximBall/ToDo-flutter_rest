import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {

  final String noteID;
  
  bool get isEditing => noteID != '';

  NoteModify({this.noteID = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing  ? 'Edit Note' : 'Create Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Note Title',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Note content',
              ),
            ),
           
           SizedBox(
             height: 20.0,
           ),
           
            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // background
                  onPrimary: Colors.white // foreground
                ),
                onPressed: () {
                  if (isEditing) { //update note

                  } else { //create note

                  }

                  Navigator.of(context).pop();
                },

                child: Text(isEditing ? 'Update note' : 'Create note'),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
