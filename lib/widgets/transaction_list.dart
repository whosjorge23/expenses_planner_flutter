import 'package:flutter/material.dart';
import './transaction_item.dart';
import '/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String) deleteTransaction;

  const TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transactions added yet",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: ((context, index) => TransactionItem(
                  transaction: transactions[index],
                  deleteTransaction: deleteTransaction)),
              itemCount: transactions.length,
            ),
    );
  }
}


// Card(
//                     child: Row(
//                       children: [
//                         Container(
//                           margin: EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 15),
//                           padding: EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             border: Border.all(
//                                 color: Theme.of(context).primaryColorDark,
//                                 width: 2),
//                           ),
//                           child: Text(
//                             "\$${transactions[index].amount.toStringAsFixed(2)}",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20,
//                                 color: Theme.of(context).primaryColorDark),
//                           ),
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               transactions[index].title,
//                               style: Theme.of(context).textTheme.headline6,
//                             ),
//                             Text(
//                               DateFormat().format(transactions[index].date),
//                               style: TextStyle(color: Colors.grey),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ))