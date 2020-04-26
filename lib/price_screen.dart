import 'package:bitcoin_ticker/commonsWidgets/exchange_panelinfo.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String celectedCurrency;

  double exchangeBTC;
  double exchangeETH;
  double exchangeLTC;

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = currenciesList.map<Text>((String value) {
      return Text(
        value,
        style: TextStyle(
          color: Colors.white,
        ),
      );
    }).toList();

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          updateUI(pickerItems[selectedIndex].data);
        });
      },
      children: pickerItems,
    );
  }

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems =
        currenciesList.map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();

    return DropdownButton<String>(
      value: celectedCurrency,
      onChanged: (String newValue) {
        setState(() {
          updateUI(newValue);
        });
      },
      items: dropdownItems,
    );
  }

  Widget getPicker() {
    return iOSPicker();
    if (Platform.isIOS)
      return iOSPicker();
    else if (Platform.isAndroid) return androidDropdown();
  }

  Future<void> getData(String currencie) async {
    for (int i = 0; i < cryptoList.length; i++) {
      var coinData =
          await CoinData().getCurrentExchangeRate(cryptoList[i], currencie);
      setState(() {
        switch (i) {
          case 0:
            exchangeBTC = coinData['last'];
            break;
          case 1:
            exchangeETH = coinData['last'];
            break;
          case 2:
            exchangeLTC = coinData['last'];
            break;
          default:
            break;
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI('USD');
  }

  Future<void> updateUI(String currencie) async {
    setState(() {
      celectedCurrency = currencie;
    });
    await getData(celectedCurrency);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ExchangePanelInfo(
            crypto: cryptoList[0],
            exchange: exchangeBTC,
            celectedCurrency: celectedCurrency,
          ),
          ExchangePanelInfo(
            crypto: cryptoList[1],
            exchange: exchangeETH,
            celectedCurrency: celectedCurrency,
          ),
          ExchangePanelInfo(
            crypto: cryptoList[2],
            exchange: exchangeLTC,
            celectedCurrency: celectedCurrency,
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}
