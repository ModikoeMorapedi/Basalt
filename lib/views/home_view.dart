import 'package:basalt_stock_app/utils/ui_utils/colors.dart';
import 'package:basalt_stock_app/utils/ui_utils/strings.dart';
import 'package:basalt_stock_app/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../utils/connectivity_provider.dart';
import '../utils/ui_utils/font_style.dart';
import '../viewModels/home_view_model.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  String _keyword = "";
  DateTime today = DateTime.now();
  String? startDate;
  String? endDate;

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();

    final isConnected = Provider.of<ConnectivityProvider>(context).isConnected;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading
            const Text(
              StringsUtil.basaltStocks,
              style: textStyleWhite18Bold,
            ),
            //Todays date
            Text(
              "${StringsUtil.today}: ${today.day}-${today.month}-${today.year}",
              style: textStyleGrey18Bold,
            ),
            const SizedBox(
              height: 16,
            ),

            //Search Bar
            //Used to search the name of companies available in the stock market
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: SizedBox(
                      height: 40,
                      child: searchBar(homeViewModel),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: IconButton(
                      icon: const Icon(
                        Icons.calendar_month,
                        color: ColorsUtil.greenColor,
                      ),
                      onPressed: () async {
                        DateTime date = DateTime(1900);
                        FocusScope.of(context).requestFocus(new FocusNode());
                        date = (await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                            )) ??
                            DateTime.now();
                        if (startDate == null || startDate == "") {
                          startDate = DateFormat('yyyy-MM-dd').format(date);
                          print("Start  $startDate");
                        } else {
                          endDate = DateFormat('yyyy-MM-dd').format(date);
                          print(endDate);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            //IF the user is not searching and the TextField is empty Display 10 companies. Else show 10 companies
            isConnected == true
                ? const Text(StringsUtil.searchResultsBelow,
                    style: textStyleOrange9W500)
                : Text(StringsUtil.stockMarketCompanies,
                    style: textStyleOrange9W500),

            // Body
            _keyword.isEmpty
                ? body(context, homeViewModel)
                : Expanded(
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              height: 30,
                              child: Row(
                                children: [
                                  Text(homeViewModel.searchList[index].symbol!,
                                      style: textStyleWhite14Bold),
                                  Text(
                                      homeViewModel.searchList[index].volume
                                          .toString(),
                                      style: textStyleWhite14Bold),
                                ],
                              ));
                        }))
          ],
        ),
      ),
    );
  }

  Widget searchBar(HomeViewModel homeViewModel) {
    return SizedBox(
      height: 40,
      child: TextFormFieldWidget(
        color: ColorsUtil.greenColor,
        hintColor: ColorsUtil.orangeColor,
        hintText: StringsUtil.search,
        onChanged: (String input) async {
          _keyword = input;
          await homeViewModel.getStockMarket(_keyword);
        },
      ),
    );
  }

  Widget body(BuildContext context, HomeViewModel homeViewModel) {
    return Expanded(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(homeViewModel.stockList[index].name!,
                            style: textStyleWhite14Bold),
                        Text(homeViewModel.stockList[index].symbol!.toString(),
                            style: textStyleGrey12W400),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                            homeViewModel.stockListNames[index].volume
                                .toString(),
                            style: textStyleWhite14W900),
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          padding: const EdgeInsets.only(right: 4),
                          alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                            color: ColorsUtil.redColor,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          width: 50,
                          height: 20,
                          child: Text(
                              "+ ${homeViewModel.stockListNames[index].low}"
                                  .toString(),
                              style: textStyleWhite9W500),
                        )
                      ],
                    )
                  ]),
            );
          }),
    );
  }
}
