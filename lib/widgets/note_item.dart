import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/widgets/custom_snack_bar.dart';

class NoteItem extends StatelessWidget {
   NoteItem({super.key, required this.note});

  final snackBar = customSnackBar();

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  EditNoteView(note: note,),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 10, top: 26, bottom: 26),
        decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:  Text(
                note.title,
                style:const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w800),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete(); 
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes() ;
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                },
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  size: 23,
                ),
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, top: 10),
              child: Text(
                note.date,
                style: TextStyle(color: Colors.black.withOpacity(0.4)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
