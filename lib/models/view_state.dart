sealed class ViewState<T> {
  const ViewState();
}

final class Idle<T> extends ViewState<T> {
  const Idle();
}

final class Loading<T> extends ViewState<T> {
  const Loading();
}

final class Failed<T> extends ViewState<T> {
  const Failed({this.error, this.stackTrace});

  final Object? error;
  final StackTrace? stackTrace;
}

final class Success<T> extends ViewState<T> {
  const Success({required this.data});

  final T data;
}
