import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ideo/ui/add_idea_page.dart';
import 'package:ideo/ui/bloc/idea_bloc.dart';
import 'package:ideo/ui/bloc/idea_state.dart';
import 'package:ideo/ui/cubit/idea_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<IdeaCubit>().fetchIdea();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: BlocBuilder<IdeaCubit, IdeaState>(
        builder: (context, state) {
          if (state is LoadingIdeaState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LoadedIdeaState) {
            return state.newIdea.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(11),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text(state.newIdea[index].id.toString()),
                            radius: 18,
                          ),
                          title: Text(state.newIdea[index].title),
                          subtitle: Text(state.newIdea[index].remark),
                        );
                      },
                      itemCount: state.newIdea.length,
                    ),
                  )
                : const Center(child: Text('No ideas yet!'));
          }
          if (state is FailureIdeaState) {
            return Center(child: Text(state.errorMsg));
          }
          return const Center(child: Text('Add your first idea!'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddIdeaPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

