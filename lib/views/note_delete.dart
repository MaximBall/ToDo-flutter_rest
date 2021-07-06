import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget {
  //const NoteDelete({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning'),
      content: Text('Are you sure want to delete this note'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          }, 
          child: Text('Yes'),
        ),

        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          }, 
          child: Text('No'),
        ),
      ],
    );
  }
}