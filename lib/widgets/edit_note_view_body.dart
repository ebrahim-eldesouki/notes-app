import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_snack_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/edit_notes_color_list.dart';

class EditNoteViewBody extends StatefulWidget {
   EditNoteViewBody({super.key, required this.note});
  final NoteModel note;
  final snackBar = customSnackBar();

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 43,
            ),
            CustomAppBar(
              title: 'Edit Note',
              icon: Icons.done,
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = content ?? widget.note.subTitle;
                widget.note.save();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(widget.snackBar);

                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              },
            ),
            const SizedBox(
              height: 27,
            ),
            CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hintText: widget.note.title,
            ),
            const SizedBox(
              height: 17,
            ),
            CustomTextField(
              onChanged: (value) {
                content = value;
              },
              hintText: widget.note.subTitle,
              maxLines: 5,
            ),
            const SizedBox(
              height: 20,
            ),
            EditNoteColorsList(
              note: widget.note,
            )
          ],
        ),
      ),
    );
  }
}
