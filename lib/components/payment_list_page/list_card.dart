import 'package:flutter/material.dart';
import 'package:money_manage/components/payment_list_page/date_chip.dart';
import 'package:intl/intl.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    Key? key,
    required this.title,
    required this.bill,
    required this.createdAt,
    this.isFirst,
  }) : super(key: key);
  final String title;
  final int bill;
  final DateTime createdAt;
  final bool? isFirst;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isFirst != null && isFirst!
            ? DateChip(createdAt: createdAt)
            : const SizedBox(),
        Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              debugPrint('Card tapped.');
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat('hh:mm').format(createdAt),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '$bill円',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
