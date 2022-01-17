import 'package:flutter_test/flutter_test.dart';
import 'package:meeting_scheduler/home/account_menu.dart';
import 'package:meeting_scheduler/home/home_screen.dart';
import 'package:meeting_scheduler/home/main_calendar.dart';

void main() {
  group('In the Home feature', () {
    testWidgets('the HomeScreen lays out a Calendar & AccountMenu',
        (WidgetTester tester) async {
      await tester.pumpWidget(const HomeScreen());

      expect(find.byType(MainCalendar), findsOneWidget);
      expect(find.byType(AccountMenu), findsOneWidget);
    }); // We are following TDD, the code to make the test pass will be implemented next
  });
}
