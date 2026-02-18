class ItemList {
  String itemName;
  double itemValue;
  bool itemChecked;

  ItemList({
    required this.itemName,
    required this.itemValue,
    this.itemChecked = false,
  });

  void toggleChecked() {
    itemChecked = !itemChecked;
  }
}

