import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/feacture/home_page/presentation/provider/provider.dart';

class GridViewWidget extends ConsumerWidget {
  const GridViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 50,
          crossAxisSpacing: 24,
          mainAxisSpacing: 12,
        ),
        itemCount: ref.watch(homeProvider).locations.length,
        itemBuilder: (context, index) {
          final data = ref.watch(homeProvider).locations[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFf2f2f2),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Request ${index + 1}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lat :${data.latitude.toString()}",
                      ),
                      Text(
                        "Lng :${data.longitude.toString()}",
                      ),
                      Text(
                        "Speed : ${data.speed.toString()}",
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
