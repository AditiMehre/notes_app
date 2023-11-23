import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/models/note.dart';

import '../constants/colors.dart';
import '../models/utils.dart';
import '../widgets/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Note> filteredNotes = [];
  late TextEditingController searchController;
  Note? deletedNote;

  void initState() {
    super.initState();
    setState(() {
      filteredNotes = sampleNotes;
    });
    searchController = TextEditingController();
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        setState(() {
          filteredNotes = sampleNotes;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MainDrawer(),
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) {
                    return IconButton(
                      icon: Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    );
                  },
                ),
                const Text(
                  'Notes',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                PopupMenuButton(
                  icon: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.sort,
                      color: Colors.white,
                    ),
                  ),
                  onSelected: (value) {
                    // Handle the selected sorting option here
                    setState(() {
                      if (value == 'alphabetical') {
                        Utils().sortNotesAlphabetically(filteredNotes);
                      } else if (value == 'date_created') {
                        Utils().sortNotesByDateCreated(filteredNotes);
                      } else if (value == 'date_modified') {
                        Utils().sortNotesByDateModified(filteredNotes);
                      }
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'alphabetical',
                      child: Text('Sort Alphabetically'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'date_created',
                      child: Text('Sort by Date Created'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'date_modified',
                      child: Text('Sort by Date Modified'),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  filteredNotes = Utils.onSearchTextChanged2(value);
                });
              },
              controller: searchController,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                hintText: 'Search notes',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.grey.shade800,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 30),
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.only(bottom: 20),
                    color: filteredNotes[index].color,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ListTile(
                        title: RichText(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: ' ${filteredNotes[index].title} \n',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              height: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: ' ${filteredNotes[index].content}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  height: 1.5,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Text(
                            ' Edited : ${DateFormat('EEE , dd MMM yyyy , hh:mm a ').format(filteredNotes[index].createdAt)}',
                            style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () async {
                            final result = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.grey.shade900,
                                  icon: const Icon(
                                    Icons.info,
                                    color: Colors.grey,
                                  ),
                                  title: const Text(
                                    "Are you sure you want to delete?",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 15.0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context, true);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                          ),
                                          child: const Text(
                                            "Delete",
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context, false);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey,
                                          ),
                                          child: const Text(
                                            "Back",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );

                            if (result == true) {
                              Utils().deleteNoteById(filteredNotes[index].id,
                                  () {
                                setState(
                                  () {
                                    filteredNotes.removeAt(index);
                                  },
                                );
                              });
                            }
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: filteredNotes.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        backgroundColor: Colors.grey.shade800,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 38,
        ),
      ),
    );
  }
}
