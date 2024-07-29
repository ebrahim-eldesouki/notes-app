import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNotesCubit extends Cubit<AddNoteState> {
  AddNotesCubit() : super(AddNoteInitial());

Color color =const  Color(0xff448AFF) ; 
  addNote(NoteModel note) async {
    note.color = color.value ; 
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);

      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(
        AddNoteFailure(e.toString()),
      );
    }
  }
}
