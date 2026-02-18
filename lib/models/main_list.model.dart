import 'package:shopping_lists/models/item_list.model.dart';

class MainList {
  String nameList;
  List<ItemList> itens;

  MainList({
    required this.nameList,
    List<ItemList>? itens,
  }) : itens = itens ?? [];

  int get totalItensList => itens.length;

  int get subTotalItensList =>
      itens.where((item) => item.itemChecked).length;

  double get progressBarNumber {
    if (totalItensList == 0) return 0;
    return subTotalItensList / totalItensList;
  }

  void addItem(ItemList item) {
    itens.add(item);
  }

  void toggleItem(ItemList item) {
    item.toggleChecked();
  }

  void removeItem(ItemList item) {
  itens.remove(item);
}

  double get totalValueChecked =>
      itens.where((i) => i.itemChecked).fold(0, (sum, i) => sum + i.itemValue);

  double get totalValueUnchecked =>
      itens.where((i) => !i.itemChecked).fold(0, (sum, i) => sum + i.itemValue);
}

