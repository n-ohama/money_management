import 'package:flutter/material.dart';

@immutable
class PaymentType {
  final String id;
  final String title;
  final int bill;
  final DateTime createdAt;
  final bool isFirst;

  const PaymentType({
    required this.id,
    required this.title,
    required this.bill,
    required this.createdAt,
    this.isFirst = false,
  });
}
