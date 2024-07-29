import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:dars_66_home/ui/screens/home_screen.dart';
import 'package:dars_66_home/bloc/stone_bloc.dart';

void main() {
  testWidgets("4 ta Container ichida NetworkImage borligini tekshirish", (widgetTester) async {
    await widgetTester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<StoneBloc>(create: (_) => StoneBloc()),
        ],
        child: const MaterialApp(home: HomeScreen(),),
      ),
    );
    expect(find.byType(FilledButton), findsOne);
    await widgetTester.tap(find.byType(FilledButton));
    expect(find.byType(Container), 7);
  });
}
