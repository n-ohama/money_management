import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manage/types/payment_type.dart';

class PaymentNotifier extends StateNotifier<List<PaymentType>> {
  PaymentNotifier()
      : super(
          [
            PaymentType(
              id: '3',
              title: '夜ごはんああああああいいいいい',
              bill: 1000121,
              createdAt: DateTime(2022, 4, 16, 9),
            ),
            PaymentType(
              id: '2',
              title: 'Wifiの料金',
              bill: 5000,
              createdAt: DateTime(2022, 4, 15, 9),
            ),
            PaymentType(
              id: '1',
              title: 'ラーメン',
              bill: 1000,
              createdAt: DateTime(2022, 4, 15),
            ),
            PaymentType(
              id: '2',
              title: 'たばこ',
              bill: 600,
              createdAt: DateTime(2022, 3, 15, 17, 45),
            ),
            PaymentType(
              id: '1',
              title: 'ラーメン',
              bill: 1000,
              createdAt: DateTime(2022, 3, 14, 12),
            ),
            PaymentType(
              id: '1',
              title: '昼ごはん',
              bill: 400,
              createdAt: DateTime(2022, 2, 14, 12),
            ),
          ],
        );

  void add(PaymentType payment) {
    state = [payment, ...state];
  }

  void remove(String paymentId) {
    state = [
      for (final payment in state)
        if (payment.id != paymentId) payment
    ];
  }
}

final paymentNotifierProvider =
    StateNotifierProvider<PaymentNotifier, List<PaymentType>>(
        (ref) => PaymentNotifier());
