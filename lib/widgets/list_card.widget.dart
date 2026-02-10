import 'package:flutter/material.dart';
import 'package:shopping_lists/models/main_list.model.dart';
import 'package:shopping_lists/pages/detail_list.page.dart';

class ListCardWidget extends StatelessWidget {

  final List<MainList> mainLists;

  const ListCardWidget({
    super.key,
    required this.mainLists
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mainLists.length,
      itemBuilder: (context, index) {
        final list = mainLists[index];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const DetailListPage()),
              );
            },
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(list.nameList),
                      trailing: Text(
                        "${list.subTotalItensList}/${list.totalItensList}",
                        style: TextStyle(fontSize: 18, color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: LinearProgressIndicator(
                        value: list.progressBarNumber,
                        minHeight: 6,
                        color: Colors.green,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
