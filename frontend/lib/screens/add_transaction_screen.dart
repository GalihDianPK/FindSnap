import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({Key? key}) : super(key: key);

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  bool _isExpense = true;
  int _selectedCategory = 0;

  final List<Map<String, dynamic>> _categories = [
    {'icon': Icons.restaurant, 'name': 'Food'},
    {'icon': Icons.directions_car, 'name': 'Transport'},
    {'icon': Icons.shopping_bag, 'name': 'Shopping'},
    {'icon': Icons.home, 'name': 'Housing'},
    {'icon': Icons.movie, 'name': 'Leisure'},
    {'icon': Icons.favorite, 'name': 'Health'},
    {'icon': Icons.school, 'name': 'Education'},
    {'icon': Icons.more_horiz, 'name': 'Other'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
        title: const Text('Add Transaction'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Toggle Expense / Income
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.cardGray,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _isExpense = true),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: _isExpense ? AppTheme.white : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: _isExpense
                                      ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)]
                                      : [],
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Expense',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: _isExpense ? AppTheme.expenseRed : AppTheme.textLight,
                                        fontWeight: _isExpense ? FontWeight.bold : FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => _isExpense = false),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                decoration: BoxDecoration(
                                  color: !_isExpense ? AppTheme.white : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: !_isExpense
                                      ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)]
                                      : [],
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Income',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: !_isExpense ? AppTheme.primaryBlue : AppTheme.textLight,
                                        fontWeight: !_isExpense ? FontWeight.bold : FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Amount Input
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '\$',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(width: 16),
                        IntrinsicWidth(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 40),
                            decoration: const InputDecoration(
                              hintText: '0.00',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 24),

                    // Categories
                    Text(
                      'CATEGORY',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppTheme.textLight,
                            letterSpacing: 1.2,
                          ),
                    ),
                    const SizedBox(height: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: _categories.length,
                      itemBuilder: (context, index) {
                        final isSelected = _selectedCategory == index;
                        final category = _categories[index];
                        return GestureDetector(
                          onTap: () => setState(() => _selectedCategory = index),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: isSelected ? AppTheme.expenseRed.withOpacity(0.1) : AppTheme.cardGray,
                                  border: isSelected ? Border.all(color: AppTheme.expenseRed) : null,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Icon(
                                  category['icon'],
                                  color: isSelected ? AppTheme.expenseRed : AppTheme.textLight,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                category['name'],
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: isSelected ? AppTheme.black : AppTheme.textLight,
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 32),

                    // Date & Note
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.cardGray, width: 1.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today, color: AppTheme.primaryBlue, size: 20),
                          const SizedBox(width: 12),
                          Text('Today', style: Theme.of(context).textTheme.bodyLarge),
                          const Spacer(),
                          const Icon(Icons.chevron_right, color: AppTheme.textLight),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppTheme.cardGray, width: 1.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.notes, color: AppTheme.textLight, size: 20),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              style: Theme.of(context).textTheme.bodyLarge,
                              decoration: InputDecoration(
                                hintText: 'Add a note (optional)',
                                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppTheme.textLight),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Save Button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('Save Transaction'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
