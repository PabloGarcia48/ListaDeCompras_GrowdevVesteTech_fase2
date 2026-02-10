import 'package:flutter/material.dart';
import 'package:shopping_lists/models/item_list.model.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final nameItemController = TextEditingController();
  final valueItemController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void addItem() {
    if (!formKey.currentState!.validate()) return;

    final value = double.tryParse(
      valueItemController.text.replaceAll(',', '.'),
    );

    if (value == null) {
      print("Valor do produto deve ser número");
      return;
    }

    final item = ItemList(itemName: nameItemController.text, itemValue: value);

    Navigator.of(context).pop(item);
    print("Entrou na funçao - ${nameItemController.text} ${value}");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Adicionar Item",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            const Divider(thickness: 2, height: 0),
            const SizedBox(height: 15),
            TextFormField(
              controller: nameItemController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Nome do item",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Campo Obrigatório";
                }
                return null;
              },
            ),
            TextFormField(
              controller: valueItemController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "R\$ 0,00",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Campo Obrigatório";
                }

                final parsed = double.tryParse(value.replaceAll(',', '.'));
                if (parsed == null) {
                  return 'Valor inválido';
                }

                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: addItem,
                    child: Text(
                      "Adicionar",
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
