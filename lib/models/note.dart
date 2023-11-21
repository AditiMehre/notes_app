import 'package:flutter/material.dart';
import 'package:notes_app/models/utils.dart';

class Note {
  int id;
  String title;
  String content;
  DateTime createdAt;
  Color color;
  DateTime dateModified;

  Note(
      {required this.id,
      required this.title,
      required this.content,
      required this.createdAt,
      this.color = Colors.white,
      required this.dateModified}) {
    color = Utils.getRandomColor();
  }
}

List<Note> sampleNotes = [
  Note(
    id: 1,
    title: 'Grocery List',
    content: 'Get organic apples, oat milk, and spices for cooking.',
    createdAt: DateTime.now(),
    dateModified: DateTime.now(),
  ),
  Note(
    id: 2,
    title: 'Weekly Work Targets',
    content: 'Prepare the client deck and meet the design team.',
    createdAt: DateTime.now(),
    dateModified: DateTime.now(),
  ),
  Note(
    id: 3,
    title: 'Reading List',
    content: 'Finish reading "Sapiens" and start with "Educated".',
    createdAt: DateTime.now(),
    dateModified: DateTime.now(),
  ),
  Note(
    id: 4,
    title: 'Reflections',
    content: 'Practice patience and make time for hobbies.',
    createdAt: DateTime.now(),
    dateModified: DateTime.now(),
  ),
  Note(
    id: 5,
    title: 'Travel Plans',
    content: 'Research hiking trails and book cozy cafes.',
    createdAt: DateTime.now(),
    dateModified: DateTime.now(),
  ),
  Note(
    id: 6,
    title: 'Car Service Reminder',
    content: 'Schedule a service for the car, check tires and brakes.',
    createdAt: DateTime.now().subtract(Duration(days: 1)),
    dateModified: DateTime.now(),
  ),
  Note(
    id: 7,
    title: 'Gym Routine',
    content: 'Update the gym routine to include more cardio.',
    createdAt: DateTime.now().subtract(Duration(days: 2)),
    dateModified: DateTime.now(),
  ),
  Note(
    id: 8,
    title: 'Book Club Meeting',
    content:
        'Organize next book club meeting and choose the next book to read.',
    createdAt: DateTime.now().subtract(Duration(days: 3)),
    dateModified: DateTime.now(),
  ),
  Note(
    id: 9,
    title: 'Family Dinner Plan',
    content: 'Plan a family dinner for Saturday night, maybe Italian theme?',
    createdAt: DateTime.now().subtract(Duration(days: 4)),
    dateModified: DateTime.now(),
  ),
  Note(
    id: 10,
    title: 'Budget Review',
    content: 'Review monthly budget and adjust savings goals.',
    createdAt: DateTime.now().subtract(Duration(days: 5)),
    dateModified: DateTime.now(),
  ),
  Note(
    id: 11,
    title: 'Garden Work',
    content: 'Spend some time weeding the garden and planting new herbs.',
    createdAt: DateTime.now().subtract(Duration(days: 6)),
    dateModified: DateTime.now(),
  ),
  Note(
    id: 12,
    title: 'Language Learning',
    content: 'Practice Spanish for 30 minutes each day using the app.',
    createdAt: DateTime.now().subtract(Duration(days: 7)),
    dateModified: DateTime.now(),
  ),
  Note(
    id: 13,
    title: 'Meditation Routine',
    content: 'Start a morning meditation routine to reduce stress.',
    createdAt: DateTime.now().subtract(Duration(days: 8)),
    dateModified: DateTime.now(),
  ),
  Note(
    id: 14,
    title: 'Learn to Code',
    content: 'Complete the next module in the online coding course.',
    createdAt: DateTime.now().subtract(Duration(days: 9)),
    dateModified: DateTime.now(),
  ),
  Note(
    id: 15,
    title: 'Recipe Experimentation',
    content: 'Try cooking a new recipe from the cookbook, maybe a dessert?',
    createdAt: DateTime.now().subtract(Duration(days: 10)),
    dateModified: DateTime.now(),
  ),
];
