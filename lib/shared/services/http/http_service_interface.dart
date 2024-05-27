abstract interface class HttpServiceInterface<T> {
  Future<T> get({required String url});
}