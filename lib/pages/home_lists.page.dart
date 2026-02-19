import 'package:flutter/material.dart';
import 'package:shopping_lists/models/main_list.model.dart';
import 'package:shopping_lists/pages/add_list.page.dart';
import 'package:shopping_lists/widgets/empty_state_list.widget.dart';
import 'package:shopping_lists/widgets/list_card.widget.dart';

class HomeListsPage extends StatefulWidget {
  const HomeListsPage({super.key});

  @override
  State<HomeListsPage> createState() => _HomeListsPageState();
}

class _HomeListsPageState extends State<HomeListsPage> {
  final List<MainList> mainLists = [
    // MainList(nameList: "Mercados"),
    // MainList(nameList: "Academia"),
    // MainList(nameList: "Festa"),
  ];

  void addList() async {
    final newList = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => AddListPage()));

    if (newList != null) {
      setState(() {
        mainLists.add(newList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Minhas Listas"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.diamond, color: Colors.amber, size: 30),
          ),
        ],
      ),
      body: mainLists.isEmpty
          ? const EmptyStateList()
          : ListCardWidget(mainLists: mainLists),

      floatingActionButton: FloatingActionButton(
        onPressed: addList,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}
