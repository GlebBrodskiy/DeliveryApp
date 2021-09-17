import 'package:delivery/screens/Chat.dart';
import 'package:delivery/screens/Main.dart';
import 'package:test/test.dart';

void main() {

    group('Tests', () {
      test('Simple variable', () {
        final main = Chat();
        expect(main.testing, 2);
      });
      test('Expected 3', () {
        expect(foodMenuTitle.length, 3);
      });
    });

}
