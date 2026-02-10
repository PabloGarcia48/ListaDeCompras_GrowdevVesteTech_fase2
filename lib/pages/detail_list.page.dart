import 'package:flutter/material.dart';
import 'package:shopping_lists/models/item_list.model.dart';
import 'package:shopping_lists/widgets/add_item.widget.dart';
import 'package:shopping_lists/widgets/item_card.widget.dart';

class DetailListPage extends StatefulWidget {
  const DetailListPage({super.key});

  @override
  State<DetailListPage> createState() => _DetailListPageState();
}

class _DetailListPageState extends State<DetailListPage> {
  final List<ItemList> itensList = [
    ItemList(itemName: "Maçã", itemValue: 2),
    ItemList(itemName: "Banana", itemValue: 3.75),
    ItemList(itemName: "Laranja", itemValue: 2.5),
    // ItemList(itemName: "Laranja", itemValue: 2.5),
    // ItemList(itemName: "Laranja", itemValue: 2.5),
    // ItemList(itemName: "Laranja", itemValue: 2.5),
    // ItemList(itemName: "Laranja", itemValue: 2.5),
    // ItemList(itemName: "Laranja", itemValue: 2.5),
    // ItemList(itemName: "Laranja", itemValue: 2.5),
    // ItemList(itemName: "Laranja", itemValue: 2.5),
    // ItemList(itemName: "Laranja", itemValue: 2.5),
    // ItemList(itemName: "Laranja", itemValue: 2.5),
    // ItemList(itemName: "Laranja", itemValue: 2.5),
    // ItemList(itemName: "Laranja", itemValue: 2.5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              "Atualizar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Mercado",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const Divider(thickness: 1, height: 0),

            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: itensList.length,
                itemBuilder: (context, index) {
                  return ItemCardWidget(item: itensList[index]);
                },
              ),
            ),

            // Somatórios
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 36),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Não marcados"),
                      Text(
                        "R\$1.99",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(width: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Marcados"),
                      Text(
                        "R\$8.50",
                        style: TextStyle(color: Colors.green, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            builder: (ctx) {
              return const AddItem();
            },
          );
        },
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 3,
        shape: StadiumBorder(),
        label: const Text("Adicionar", style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
