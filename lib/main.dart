import 'package:flutter/material.dart';
import 'package:money_manage/components/main/main_navigation_bar.dart';
import 'package:money_manage/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manage/providers/state_providers.dart';
import 'package:money_manage/screens/input_payment_page.dart';
import 'package:money_manage/screens/payment_list_page.dart';
// import 'package:money_manage/screens/input_payment_page.dart';

void main() => runApp(
      ProviderScope(child: MyApp()),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nested Tab Bar Demo',
      theme: ThemeData(
        primarySwatch: kPurpleSwatch,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  final List<Widget> _widgetOptions = <Widget>[
    const InputPaymentPage(),
    PaymentListPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _selectedIndex = ref.watch(indexStateProvider);
    final _notifier = ref.watch(indexStateProvider.notifier);

    void _onItemTapped(int value) {
      _notifier.update((state) => value);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Nested Tab Bar Demo Page')),
      bottomNavigationBar: MainNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

// void main() => runApp(
//       ProviderScope(child: MyApp()),
//     );

// class MyApp extends ConsumerWidget {
//   static const List<Widget> _widgetOptions = <Widget>[
//     InputPaymentPage(),
//     PaymentListPage(),
//     Text('Index 2: School'),
//   ];

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final _selectedIndex = ref.watch(indexStateProvider);
//     final _notifier = ref.watch(indexStateProvider.notifier);

//     void _onItemTapped(int value) {
//       _notifier.update((state) => value);
//     }

//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('支払い管理アプリ'),
//           backgroundColor: const Color(0xff5808e5),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(24),
//           child: _widgetOptions.elementAt(_selectedIndex),
//         ),
//         bottomNavigationBar: MainNavigationBar(
//           currentIndex: _selectedIndex,
//           onTap: _onItemTapped,
//         ),
//       ),
//     );
//   }
// }
