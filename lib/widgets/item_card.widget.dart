import 'package:flutter/material.dart';
import 'package:shopping_lists/models/item_list.model.dart';

class ItemCardWidget extends StatefulWidget {
  final ItemList item;

  const ItemCardWidget({super.key, required this.item});

  @override
  State<ItemCardWidget> createState() => _ItemCardWidgetState();
}

class _ItemCardWidgetState extends State<ItemCardWidget> {
  bool checked = false;
  List<ItemList> itensList = [];

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 10,
      leading: Transform.scale(
        scale: 1.5,
        child: Checkbox(
          value: checked,
          shape: const CircleBorder(),
          activeColor: Colors.green,
          side: BorderSide(color: Colors.blue, width: 1),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onChanged: (value) {
            setState(() {
              checked = !checked;
            });
          },
        ),
      ),
      title: Text(widget.item.itemName),
      trailing: Text(
        "R\$ ${widget.item.itemValue}",
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
