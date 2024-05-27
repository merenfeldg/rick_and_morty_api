import 'package:http/http.dart' as http;
import 'package:rick_and_morty_api/shared/services/http/http_service_interface.dart';

class HttpClientImpl implements HttpServiceInterface<http.Response> {

  final http.Client _client;

  HttpClientImpl(this._client);

  @override
  Future<http.Response> get({required String url}) {
    return _client.get(Uri.parse(url));
  }
}