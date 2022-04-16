import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manage/components/input_payment_page/filled_text_field.dart';
import 'package:money_manage/providers/state_providers.dart';
import 'package:money_manage/providers/payment_notifier_provider.dart';
import 'package:money_manage/types/payment_type.dart';
import 'package:uuid/uuid.dart';

class InputPaymentPage extends StatefulWidget {
  const InputPaymentPage({Key? key}) : super(key: key);

  @override
  State<InputPaymentPage> createState() => _InputPaymentPageState();
}

class _InputPaymentPageState extends State<InputPaymentPage> {
  late TextEditingController _labelController;
  late TextEditingController _billController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _labelController = TextEditingController();
    _billController = TextEditingController();
  }

  @override
  void dispose() {
    _labelController.dispose();
    _billController.dispose();
    super.dispose();
  }

  PaymentType _savePayment(List<PaymentType> paymentProvider) {
    var uuid = const Uuid();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final _isFirst = paymentProvider.every((e) => today.isAfter(e.createdAt));
    return PaymentType(
      id: uuid.v4(),
      title: _labelController.text,
      bill: int.parse(_billController.text),
      createdAt: now,
      isFirst: _isFirst,
    );
  }

  Future<void> _openDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('保存しました'),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () => Navigator.pop(ctx),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 16),
          FilledTextField(
            controller: _labelController,
            labelText: 'ラベル',
            maxLength: 15,
          ),
          const SizedBox(height: 24),
          FilledTextField(
            controller: _billController,
            labelText: '料金',
            maxLength: 10,
            isNumber: true,
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: Consumer(builder: (_, ref, __) {
                  final _indexNotifier = ref.watch(indexStateProvider.notifier);
                  final _paymentProvider = ref.watch(paymentNotifierProvider);
                  final _paymentNotifer =
                      ref.watch(paymentNotifierProvider.notifier);
                  return ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final payment = _savePayment(_paymentProvider);
                        _paymentNotifer.add(payment);
                        await _openDialog(context);
                        _indexNotifier.update((state) => 1);
                      }
                    },
                    child: const Text('保存'),
                  );
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
