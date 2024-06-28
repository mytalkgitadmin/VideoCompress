typedef UpdateProgressCallback = Function(double progress);

class ObservableBuilder<T> {
  bool notSubscribed = true;
  Subscription? _subscription;

  void next(double value) {
    _subscription?.updateProgressCallback?.call(value);
  }

  Subscription subscribe(UpdateProgressCallback? updateProgressCallback) {
    notSubscribed = false;
    return _subscription = Subscription(updateProgressCallback: updateProgressCallback);
  }
}

class Subscription {
  final UpdateProgressCallback? updateProgressCallback;
  const Subscription({this.updateProgressCallback});
}
