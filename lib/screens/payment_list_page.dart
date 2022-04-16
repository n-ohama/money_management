import 'package:flutter/material.dart';
import 'package:money_manage/components/payment_list_page/nested_container.dart';
import 'package:money_manage/constants.dart';

class PaymentListPage extends StatefulWidget {
  @override
  _PaymentListPageState createState() => _PaymentListPageState();
}

class _PaymentListPageState extends State<PaymentListPage>
    with TickerProviderStateMixin {
  late TabController _nestedTabController;

  @override
  void initState() {
    super.initState();
    final _thisMonth = DateTime.now().month;
    _nestedTabController = TabController(
      length: monthNumbers.length,
      vsync: this,
      initialIndex: _thisMonth - 1,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _nestedTabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar(
          controller: _nestedTabController,
          indicatorColor: kPurpleSwatch,
          labelColor: kPurpleSwatch,
          unselectedLabelColor: Colors.black54,
          isScrollable: true,
          tabs: monthNumbers.map((e) => Tab(text: "$e月")).toList(),
        ),
        NestedContainer(controller: _nestedTabController),
      ],
    );
  }
}
