import 'package:flutter/material.dart';
import 'package:ideo/data/model/ideo_model.dart';
import 'package:ideo/ui/add_idea_page.dart';
import 'package:ideo/ui/provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Fetch ideas when the page is first loaded
    context.read<IdeaProvider>().fetchAllIdea();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Consumer<IdeaProvider>(
        builder: (context, provider, child) {
          List<IdeoModel> allIdea = provider.getIdea();

          if (allIdea.isEmpty) {
            return const Center(
              child: Text('No Idea Yet!'),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(11),
            child: ListView.builder(
              itemCount: allIdea.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 18,
                    child: Text(allIdea[index].id?.toString() ?? ""),
                  ),
                  title: Text(allIdea[index].title),
                  subtitle: Text(allIdea[index].remark),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddIdeaPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
