import 'package:shopping_lists/models/item_list.model.dart';

class MainList {
  String nameList;
  List<ItemList> itens;
  int totalItensList;
  int subTotalItensList;
  double progressBarNumber;

  MainList({
    required this.nameList,
    this.totalItensList = 0,
    this.subTotalItensList = 0,
  }) : progressBarNumber = totalItensList == 0
           ? 1
           : subTotalItensList / totalItensList,
       itens = [];
}
