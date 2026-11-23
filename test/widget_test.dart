import 'package:flutter_test/flutter_test.dart';
import 'package:aula04_layout_widgets/main.dart';

void main() {
  testWidgets('Renderiza painel de layouts', (WidgetTester tester) async {
    await tester.pumpWidget(const Aula04LayoutApp());
    expect(find.text('Painel de Layouts - Aula 04'), findsOneWidget);
  });
}
