import 'package:flutter/material.dart';

class ExchangePanelInfo extends StatefulWidget {
  ExchangePanelInfo({this.crypto, this.exchange, this.celectedCurrency});
  final double exchange;
  final String celectedCurrency;
  final String crypto;
  @override
  _ExchangePanelInfoState createState() => _ExchangePanelInfoState();
}

class _ExchangePanelInfoState extends State<ExchangePanelInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 ${widget.crypto} = ${widget.exchange} ${widget.celectedCurrency}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
