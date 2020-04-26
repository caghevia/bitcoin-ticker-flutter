import 'package:bitcoin_ticker/Services/networking.dart';

const List<String> currenciesList = [
  'USD',
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = 'ZGJjMGJkZTEwZTAwNDA5N2EzMDdjZTY3MzkyOWMxOTk';
const bitcoinAPIURL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/';
const header = {'x-ba-key': apiKey};

class CoinData {
  Future<dynamic> getCurrentExchangeRate(
      String crypto, String currencie) async {
    var url = '$bitcoinAPIURL$crypto$currencie';

    NetworkHelpe networkHelpe = NetworkHelpe(url, header);
    var weatherData = await networkHelpe.getData();
    return weatherData;
  }
}
