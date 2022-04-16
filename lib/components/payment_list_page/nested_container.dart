import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manage/components/payment_list_page/list_card.dart';
import 'package:money_manage/constants.dart';
import 'package:money_manage/providers/payment_notifier_provider.dart';
import 'package:money_manage/types/payment_type.dart';

class NestedContainer extends ConsumerWidget {
  const NestedContainer({Key? key, required this.controller}) : super(key: key);
  final TabController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime _date = DateTime(2021);
    final _paymentList = ref.watch(paymentNotifierProvider);

    final _hasDatePaymentList = _paymentList.map(
      (e) {
        final _isSame = e.createdAt.year == _date.year &&
            e.createdAt.month == _date.month &&
            e.createdAt.day == _date.day;

        if (!_isSame) {
          _date = e.createdAt;
          return PaymentType(
            id: e.id,
            title: e.title,
            bill: e.bill,
            createdAt: e.createdAt,
            isFirst: true,
          );
        }
        return e;
      },
    ).toList();

    return Expanded(
      child: TabBarView(
        controller: controller,
        children: monthNumbers.map((e) {
          final _everyList = _hasDatePaymentList.where(
            (item) => item.createdAt.month == e,
          );
          return ListView(
            children: [
              for (final payment in _everyList)
                ListCard(
                  title: payment.title,
                  bill: payment.bill,
                  createdAt: payment.createdAt,
                  isFirst: payment.isFirst,
                )
            ],
          );
        }).toList(),
      ),
    );
  }
}
