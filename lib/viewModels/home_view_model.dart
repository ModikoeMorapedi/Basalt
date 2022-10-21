import 'dart:io';
import 'dart:math';

import 'package:basalt_stock_app/model/stock_market.dart';
import 'package:flutter/foundation.dart';
import '../services/api_status.dart';
import '../services/home_service.dart';
import '../utils/service_locator.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() : super() {
    getStock("", "", "");
  }
  final homeService = locator<HomeService>();
  bool _loading = false;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  List<Data> _stockList = [];
  bool get loading => _loading;
  List<Data> get stockList => _stockList;
  static List<Data> stockListResponse = [];
  List<Data> stockListNames = [];

  List<String> symbolsList = [];
  List<Data> searchList = [];
  String? symbols;

  setErrorMessage(String errorMessage) {
    _errorMessage = errorMessage;
    notifyListeners();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setstockListModel(List<Data>? stockList) {
    _stockList = stockList!;
    notifyListeners();
  }

  //get stockMarket

  getStockMarket(String text) async {
    try {
      var response =
          await homeService.getSearchStockMarket(symbols!.toUpperCase());
      searchList = response.data!;
      searchList
          .where((element) =>
              element.name!.toLowerCase().contains(text.toLowerCase()))
          .toList();
    } catch (e) {}
  }

//GetStock method is used to call the services and filter the response
  getStock(String text, String startDate, String endDate) async {
    setLoading(true);
    int index;
    //Use try and catch to catch any exception
    try {
      //Check if the text is not Empty before calling the services

      var response =
          await homeService.getStockTickersService(text, startDate, endDate);
      //check if response is not null before filtering
      if (response != null) {
        StockMarket art = response as StockMarket;
        //Filter the response coming from the services
        stockListResponse = art.data!;
        stockListResponse.forEach((element) {
          symbolsList.add(element.symbol!);
        });
        symbols = symbolsList.join(',');
      }

      if (symbols != null && symbols != "" || response != null) {
        var response = await homeService.getStockMarket(symbols!);
        // StockMarket art = response as StockMarket;
        //Filter the response coming from the services
        stockListNames = response.data!;
        symbols = "";
      }

      setstockListModel(stockListResponse);
      setLoading(false);
    } catch (e) {
      setErrorMessage(e.toString());
    }
  }
}
