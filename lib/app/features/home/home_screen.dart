import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/content.dart';
import '../../../di/di.dart';
import '../../widgets/widgets.dart';

class StaticHomeScreen extends StatelessWidget {
  const StaticHomeScreen({required this.canOpen, super.key});
  final bool canOpen;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: _appBar(context),
    body: RecipeList(
      content: getIt<List<Content>>(),
      local: true,
      canOpen: canOpen,
    ),
  );
}

AppBar _appBar(BuildContext context, {VoidCallback? refresh}) => AppBar(
  title: const Text('Книга рецептов'),
  actions: [
    if (refresh != null)
      IconButton(
        tooltip: 'Обновить',
        onPressed: refresh,
        icon: const Icon(Icons.refresh),
      ),
    IconButton(
      tooltip: 'Журнал событий',
      onPressed: () => context.push('/logs'),
      icon: const Icon(Icons.receipt_long_outlined),
    ),
  ],
);

class RecipeList extends StatelessWidget {
  const RecipeList({
    required this.content,
    required this.local,
    required this.canOpen,
    super.key,
  });
  final List<Content> content;
  final bool local;
  final bool canOpen;

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.topCenter,
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 820),
      child: content.isEmpty
          ? const Center(child: Text('Рецептов пока нет'))
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 26, 20, 28),
              itemCount: content.length + 1,
              separatorBuilder: (_, index) =>
                  SizedBox(height: index == 0 ? 24 : 14),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Что приготовим?',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 9),
                      Text(
                        '${content.length} рецептов на каждый день',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  );
                }
                final item = content[index - 1];
                return ContentCard(
                  content: item,
                  local: local,
                  onTap: canOpen
                      ? () => context.push('/content/${item.id}')
                      : null,
                );
              },
            ),
    ),
  );
}
