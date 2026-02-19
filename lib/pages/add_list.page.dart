import 'package:flutter/material.dart';
import 'package:shopping_lists/models/main_list.model.dart';

class AddListPage extends StatefulWidget {
  const AddListPage({super.key});

  @override
  State<AddListPage> createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  final listNameController = TextEditingController();

  void addList() {
    final list = MainList(nameList: listNameController.text);
    Navigator.of(context).pop(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: TextFormField(
                  key: Key("listNameInput"),
                  controller: listNameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    hintText: "Nome da Lista",
                    hintStyle: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      key: Key("backToListsBtn"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder(),
                        side: BorderSide(color: Colors.white),
                      ),
                      child: const Text(
                        "Voltar",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      key: Key("createListBtn"),
                      onPressed: addList,
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue,
                        shape: const StadiumBorder(),
                        side: BorderSide(color: Colors.white),
                      ),
                      child: const Text(
                        "Criar",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 56),
          ],
        ),
      ),
    );
  }
}
