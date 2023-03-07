import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.7,
        child: transactions.isEmpty
            ? LayoutBuilder(builder: (ctx, constraints) {
                return Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Nenhuma transação cadastrada!',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ))
                ]);
              })
            : ListView(
                children: transactions.map((tr) {
                  return TransactionItem(
                      key: ValueKey(tr.id), tr: tr, onRemove: onRemove);
                }).toList(),
              )
        // ListView.builder(
        //     itemCount: transactions.length,
        //     itemBuilder: (context, index) {
        //       final tr = transactions[index];
        //       return TransactionItem(tr: tr, onRemove: onRemove);
        //     },
        //   ),
        );
  }
}
