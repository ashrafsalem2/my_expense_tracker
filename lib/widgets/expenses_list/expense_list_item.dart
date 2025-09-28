import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/utils/enums/category_icons.dart';
import 'package:flutter/material.dart';

class ExpenseListItem extends StatelessWidget {
  const ExpenseListItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 8),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                Spacer(),
                Row(
                  children: [
                    CategoryIcons.catIcon[expense.category],
                    SizedBox(width: 16),
                    Text(expense.formatTheDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
