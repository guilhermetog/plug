import 'package:plug/plug.dart';
import 'package:test/test.dart';

void main() {
  test('Plug isConnected should be false by default', () {
    final plug = Plug();
    expect(plug.isConnected, false);
  });

  test('Plug then method should set callback and isConnected to true', () {
    final plug = Plug();
    plug.then(() async {});
    expect(plug.isConnected, true);
  });

  test('Plug take method should set callback and isConnected to true', () {
    final plug = Plug<int>();
    plug.take((int arg) async {});
    expect(plug.isConnected, true);
  });

  test('Plug call method should invoke callback', () async {
    bool called = false;
    final plug = Plug();
    plug.then(() async {
      called = true;
    });
    await plug.call();
    expect(called, true);
  });

  test('Plug send method should invoke callback with argument', () async {
    int value = 0;
    final plug = Plug<int>();
    plug.take((int arg) async {
      value = arg;
    });
    await plug.send(42);
    expect(value, 42);
  });

  test('Plug must be connected to the last callback', () async {
    int value = 0;
    int value2 = 0;

    final plug = Plug<int>();
    plug.take((int arg) async {
      value = arg;
    });

    plug.take((int arg) async {
      value2 = arg;
    });
    await plug.send(42);
    expect(value, 0);
    expect(value2, 42);
  });
}
