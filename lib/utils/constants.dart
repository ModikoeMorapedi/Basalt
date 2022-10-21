const String baseAdress = 'http://api.marketstack.com/v1/';
const String accessKey = "434191261af06ff2d78ed70cb5f1b132";

const String stockMarketTickersAdress =
    '${baseAdress}tickers?access_key=$accessKey&limit=10';

const String stockMarketEODAdress =
    '${baseAdress}eod?access_key=$accessKey&limit=10&symbols=';
// Success
const SUCCESS = 200;

// Errors
const USER_INVALID_RESPONSE = 100;
const NO_INTERNET = 101;
const INVALID_FORMAT = 102;
const UNKNOWN_ERROR = 103;
