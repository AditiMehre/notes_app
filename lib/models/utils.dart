import 'dart:math';
import 'dart:ui';

import 'package:notes_app/models/note.dart';

import '../constants/colors.dart';

//Top-level functions

class Utils {
  static Color getRandomColor() {
    Random random = Random();
    int randomColor = random.nextInt(backgroundColors.length);
    return backgroundColors[randomColor];
  }

  static List<Note> onSearchTextChanged2(String query) {
    List<Note> filteredNotes = [];
    for (int i = 0; i < sampleNotes.length; i++) {
      Note sampleNote = sampleNotes[i];
      String lowerCaseQuery = query.toLowerCase();
      bool b1 = sampleNote.title.toLowerCase().contains(lowerCaseQuery);
      bool b2 = sampleNote.content.toLowerCase().contains(lowerCaseQuery);
      if (b1 || b2) {
        filteredNotes.add(sampleNote);
      } //if
    } //for
    print(filteredNotes);
    return filteredNotes;
  } //method

// SORTING Method
  void sortNotesAlphabetically(List<Note> notes) {
    int n = notes.length;
    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n-1 ; j++) {
        String title1 = notes[j].title.toLowerCase(); // Convert titles to lowercase for case-insensitive sorting
        String title2 = notes[j + 1].title.toLowerCase();
        if(title1.compareTo(title2) > 0){
          // Swap notes[j] and notes[j+1]
          Note temp = notes[j];
          notes[j] = notes[j + 1];
          notes[j + 1] = temp;
        }
      }
    }
  }
  void sortNotesByDateCreated(List<Note> notes) {
    int n = notes.length;

    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - i - 1; j++) {
        if (notes[j].createdAt.isAfter(notes[j + 1].createdAt)) {
          // Swap notes[j] and notes[j + 1]
          Note temp = notes[j];
          notes[j] = notes[j + 1];
          notes[j + 1] = temp;
        }
      }
    }
  }
  void sortNotesByDateModified(List<Note> notes) {
    int n = notes.length;

    for (int i = 0; i < n - 1; i++) {
      for (int j = 0; j < n - i - 1; j++) {
        if (notes[j].dateModified.isAfter(notes[j + 1].dateModified)) {
          // Swap notes[j] and notes[j + 1]
          Note temp = notes[j];
          notes[j] = notes[j + 1];
          notes[j + 1] = temp;
        }
      }
    }
  }


}
