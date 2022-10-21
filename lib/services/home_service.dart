import 'package:basalt_stock_app/model/home.dart';
import 'package:basalt_stock_app/services/base/base_service.dart';

import '../model/stock_market.dart';
import '../utils/constants.dart';

class HomeService extends BaseService {
  Future<StockMarket> getStockTickersService(
      String text, String startDate, String endDate) async {
    var response = await getAsync(stockMarketTickersAdress);
    //Map the response with Dart Model
    return StockMarket.fromJson(response);
  }

  Future<StockMarket> getStockMarket(String symbols) async {
    var response = await getAsync("$stockMarketEODAdress$symbols");
    return StockMarket.fromJson(response);
  }

  Future<StockMarket> getSearchStockMarket(String symbol) async {
    var response = await getAsync(
        'http://api.marketstack.com/v1/eod?access_key=$accessKey&symbols=$symbol');
    return StockMarket.fromJson(response);
  }
}
