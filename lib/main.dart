import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//differento form provider, sateprovider is great for storing
//simple state objects thas CAN change

final mystateprovider = StateProvider<int>(
  (ref) {
    return 0;
  },
);

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter starting point',
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final q = ref.watch(mystateprovider);
    //<- this is ref.wathc because is on the build lifecycle of the widget
    return Scaffold(
      appBar: AppBar(
        title: const Text('home page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ref.read(mystateprovider.notifier).state++;
            //<- this ref.read because it is NOT on the life cycle og build
            // this only works when smth is pressed
          },
          child: Text('value: $q'),
        ),
      ),
    );
  }
}
