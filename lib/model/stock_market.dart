class StockMarket {
  Pagination? pagination;
  List<Data>? data;

  StockMarket({this.pagination, this.data});

  StockMarket.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pagination {
  int? limit;
  int? offset;
  int? count;
  int? total;

  Pagination({this.limit, this.offset, this.count, this.total});

  Pagination.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    offset = json['offset'];
    count = json['count'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    data['count'] = this.count;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  String? name;
  String? symbol;
  bool? hasIntraday;
  bool? hasEod;
  Null? country;
  StockExchange? stockExchange;
  double? open;
  double? high;
  double? low;
  double? close;
  double? volume;
  double? adjHigh;
  double? adjLow;
  double? adjClose;
  double? adjOpen;
  double? adjVolume;
  double? splitFactor;
  double? dividend;
  String? exchange;
  String? date;

  Data(
      {this.name,
      this.symbol,
      this.hasIntraday,
      this.hasEod,
      this.country,
      this.stockExchange,
      this.open,
      this.high,
      this.low,
      this.close,
      this.volume,
      this.adjHigh,
      this.adjLow,
      this.adjClose,
      this.adjOpen,
      this.adjVolume,
      this.splitFactor,
      this.dividend,
      this.exchange,
      this.date});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
    hasIntraday = json['has_intraday'];
    hasEod = json['has_eod'];
    country = json['country'];
    open = json['open'];
    high = json['high'];
    low = json['low'];
    close = json['close'];
    volume = json['volume'];
    adjHigh = json['adj_high'];
    adjLow = json['adj_low'];
    adjClose = json['adj_close'];
    adjOpen = json['adj_open'];
    adjVolume = json['adj_volume'];
    splitFactor = json['split_factor'];
    dividend = json['dividend'];
    symbol = json['symbol'];
    exchange = json['exchange'];
    date = json['date'];
    stockExchange = json['stock_exchange'] != null
        ? new StockExchange.fromJson(json['stock_exchange'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['has_intraday'] = this.hasIntraday;
    data['has_eod'] = this.hasEod;
    data['country'] = this.country;
    data['open'] = this.open;
    data['high'] = this.high;
    data['low'] = this.low;
    data['close'] = this.close;
    data['volume'] = this.volume;
    data['adj_high'] = this.adjHigh;
    data['adj_low'] = this.adjLow;
    data['adj_close'] = this.adjClose;
    data['adj_open'] = this.adjOpen;
    data['adj_volume'] = this.adjVolume;
    data['split_factor'] = this.splitFactor;
    data['dividend'] = this.dividend;
    data['symbol'] = this.symbol;
    data['exchange'] = this.exchange;
    data['date'] = this.date;
    if (this.stockExchange != null) {
      data['stock_exchange'] = this.stockExchange!.toJson();
    }
    return data;
  }
}

class StockExchange {
  String? name;
  String? acronym;
  String? mic;
  String? country;
  String? countryCode;
  String? city;
  String? website;

  StockExchange(
      {this.name,
      this.acronym,
      this.mic,
      this.country,
      this.countryCode,
      this.city,
      this.website});

  StockExchange.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    acronym = json['acronym'];
    mic = json['mic'];
    country = json['country'];
    countryCode = json['country_code'];
    city = json['city'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['acronym'] = this.acronym;
    data['mic'] = this.mic;
    data['country'] = this.country;
    data['country_code'] = this.countryCode;
    data['city'] = this.city;
    data['website'] = this.website;
    return data;
  }
}
