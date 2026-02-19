import 'package:flutter/material.dart';
import 'package:shopping_lists/models/item_list.model.dart';

class ItemCardWidget extends StatelessWidget {
  final ItemList item;
  final VoidCallback onChanged;
  final VoidCallback onDelete;

  const ItemCardWidget({
    super.key,
    required this.item,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => onDelete(),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        horizontalTitleGap: 10,
        leading: Transform.scale(
          scale: 1.5,
          child: Checkbox(
            key: Key("productCheckbox"),
            value: item.itemChecked,
            shape: const CircleBorder(),
            activeColor: Colors.green,
            side: const BorderSide(color: Colors.blue, width: 1),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onChanged: (_) => onChanged(),
          ),
        ),
        title: Text(item.itemName),
        trailing: Text(
          "R\$ ${item.itemValue.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
