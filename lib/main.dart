import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

//this is aprovider that returns  a simple value
final provider01 = Provider<String>((ref) {
  return 'inicio';
});

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter starting point',
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: const HomePage2(),
    );
  }
}

/*
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context, ref, child) {
            final p = ref.watch(provider01);
            return Text(p);
          },
        ),
      ),
    );
  }
}
*/

class HomePage2 extends ConsumerStatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends ConsumerState<HomePage2> {
  @override
  void initState() {
    super.initState();
    final p = ref.read(
        provider01); //<-we use re.read because we are outside the build method
    print('this is the state on cath on');
    print('initState lifecicle: $p');
  }

  @override
  Widget build(BuildContext context) {
    final p2 = ref.watch(provider01);
    return Scaffold(
      appBar: AppBar(
        title: Text(p2),
      ),
    );
  }
}
