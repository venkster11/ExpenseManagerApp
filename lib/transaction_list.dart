import 'package:expensemanager/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransacctionList extends StatelessWidget {

  final List<Transaction> transactions;

  TransacctionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty ? Column(children: <Widget>[
        Text('No transaction added yet'),
        SizedBox(height: 10,
        ),
        Container(
          height: 200,
            child: Image.asset(
              'assests/images/waiting.png',
              fit: BoxFit.cover,
            )
        )
      ],): ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColorDark,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\u{20B9}' + transactions[index].amount.toStringAsFixed(2),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColorDark
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                        DateFormat.yMMMd().format(transactions[index].date)
                    ),
                  ],
                ),
              ],
            ),
          );
        },
          itemCount: transactions.length,
      ),
    );
  }
}
