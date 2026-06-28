import 'package:flutter/material.dart';
import 'package:ideo/data/model/ideo_model.dart';
import 'package:ideo/ui/provider.dart';
import 'package:provider/provider.dart';

class AddIdeaPage extends StatelessWidget {
  final titleController = TextEditingController();
  final remarkController = TextEditingController();

  AddIdeaPage({super.key});


  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Idea Page'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: EdgeInsets.all(21),
        child: Column(children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
                hintText: "Enter title here...",
                label: Text("Title"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11)
                ),
                enabledBorder: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            controller: remarkController,
            decoration: InputDecoration(
                hintText: "Enter remark here...",
                label: Text("Remark"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11)
                ),
                enabledBorder: OutlineInputBorder()
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              var title = titleController.text.trim();
              var remark = remarkController.text.trim();

              if (title.isNotEmpty && remark.isNotEmpty) {
                context.read<IdeaProvider>().addIdea(
                    newIdea: IdeoModel(title: title, remark: remark));
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please fill all fields!')),
                );
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Save'),
          )
        ]),
      ),
    );
  }
}

/*
For Bloc
    context.read<IdeaBloc>().add(AddIdeaEvent(
                    newIdea: IdeoModel(title: title, remark: remark)));
 */