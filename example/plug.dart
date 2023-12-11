import 'package:plug/plug.dart';

main() {
  AsyncClass task = AsyncClass();
  task.onAsyncTaskIsCompleted.then(() => print('async task is completed!'));
  task.onAsyncValueTaked.take((value) => print('async value taked: $value'));

  task.asyncTask();
  task.asyncValue();
}

class AsyncClass {
  Plug onAsyncTaskIsCompleted = Plug();
  Plug<int> onAsyncValueTaked = Plug<int>();

  asyncTask() async {
    await Future.delayed(const Duration(seconds: 10));
    onAsyncTaskIsCompleted();
  }

  asyncValue() async {
    await Future.delayed(const Duration(seconds: 10));
    onAsyncValueTaked.send(10);
  }
}
