import 'package:flutter/material.dart';
import 'package:flutter_app_rest/models/note_for_listing.dart';
import 'package:flutter_app_rest/views/modify_note.dart';
import 'package:flutter_app_rest/views/note_delete.dart';

class NoteList extends StatelessWidget {
  final notes = [
    new NoteForListing(
      noteID: '1',
      noteTitle: 'Note 1',
      createDateTime: DateTime.now(),
      lastEditDateTime: DateTime.now(),
    ),
    new NoteForListing(
      noteID: '2',
      noteTitle: 'Note 2',
      createDateTime: DateTime.now(),
      lastEditDateTime: DateTime.now(),
    ),
    new NoteForListing(
      noteID: '3',
      noteTitle: 'Note 3',
      createDateTime: DateTime.now(),
      lastEditDateTime: DateTime.now(),
    ),
  ];

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of notes'),
      ),
      
      
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add new note',
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => NoteModify()));
        },
        child: Icon(Icons.add),
      ),



      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(
          //divider - обычная линия
          height: 1,
          //thickness: 1.0, толщина линии
          color: Colors.blue
        ),
        itemBuilder: (_, index) {
          return Dismissible(
            key: ValueKey(notes[index].noteID),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {

            },
            confirmDismiss: (direction) async {
              final reult = await showDialog(
                context: context, 
                builder: (_) => NoteDelete(),
              );
              print(reult);
              return reult;
            },

            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 12),
              child: Align(
                child: Icon(Icons.delete,
                  color: Colors.white,
                ),
                alignment: Alignment.centerLeft,
              ),
            ),

            child: ListTile(
              title: Text(
                notes[index].noteTitle,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              subtitle: Text(
                  'Last edited on ${formatDateTime(notes[index].lastEditDateTime)}'
                  ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => NoteModify(noteID: notes[index].noteID)));
              },
            ),
          );
        },
        itemCount: notes.length,
      ),
    );
  }
}
