import 'package:flutter/material.dart';
import 'package:shopping_lists/models/item_list.model.dart';
import 'package:shopping_lists/models/main_list.model.dart';
import 'package:shopping_lists/widgets/add_item.widget.dart';
import 'package:shopping_lists/widgets/item_card.widget.dart';

class DetailListPage extends StatefulWidget {
  final MainList mainList;

  const DetailListPage({super.key, required this.mainList});

  @override
  State<DetailListPage> createState() => _DetailListPageState();
}

class _DetailListPageState extends State<DetailListPage> {
  void addItem() async {
    final ItemList? newItem = await showModalBottomSheet<ItemList>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      builder: (ctx) {
        return const AddItem();
      },
    );

    if (newItem != null) {
      setState(() {
        widget.mainList.addItem(newItem);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          TextButton(
            key: Key("updateListBtn"),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text(
              "Atualizar",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
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
                widget.mainList.nameList,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const Divider(thickness: 1, height: 0),

            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.mainList.itens.length,
                itemBuilder: (context, index) {
                  final item = widget.mainList.itens[index];

                  return ItemCardWidget(
                    item: item,
                    onChanged: () {
                      setState(() {
                        item.toggleChecked();
                      });
                    },
                    onDelete: () {
                      setState(() {
                        widget.mainList.removeItem(item);
                      });
                    },
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 36),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Não marcados"),
                      Text(
                        "R\$${widget.mainList.totalValueUnchecked.toStringAsFixed(2)}",
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
                        "R\$${widget.mainList.totalValueChecked.toStringAsFixed(2)}",
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
        key: Key("addNewItemBtn"),
        onPressed: addItem,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 3,
        shape: StadiumBorder(),
        label: const Text("Adicionar", style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
