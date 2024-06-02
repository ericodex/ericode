import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'providers.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeProvider themeChangeProvider = ThemeProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(builder: (context, value, child) {
        final themeChange = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Ericode',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              brightness:
                  themeChange.darkMode ? Brightness.dark : Brightness.light,
              seedColor: Color.fromARGB(
                  255, 0, (255 * 0.25).toInt(), (255 * 0.26).toInt()),
            ),
            useMaterial3: true,
          ),
          home: const MyHomePage(),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: width < 400
          ? Center(
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Tela muito pequena\npara exibir o conteúdo',
                  style: Theme.of(context).textTheme.displayMedium,
                )),
          )
          : SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 40),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 500.0,
                  maxWidth: 900.0,
                ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
                    child: Column(
                      children: [
                        if (width < 700)
                          Padding(
                            padding: EdgeInsets.all(13.0),
                            child: PictureProfileCircleAvatar(),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Eric Oliveira Lima',
                                      style:
                                          Theme.of(context).textTheme.displayMedium!
                                              .merge(TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          )),
                                    ),
                                  ),
                                  Text(
                                    'Engenheiro de Software',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .merge(TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary)),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                      'Especialista em desenvolvimento de sistemas multiplataforma '
                                      'utilizando o Dart/Flutter. ',
                                      style:
                                          Theme.of(context).textTheme.bodyMedium),
                                ],
                              ),
                            ),
                            if (width > 700)
                              const Flexible(
                              flex: 1,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(25, 8, 25, 8),
                                    child: PictureProfileCircleAvatar(),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.brightness_4),
                onPressed: () {
                  final themeChange =
                      Provider.of<ThemeProvider>(context, listen: false);
                  themeChange.darkMode = !themeChange.darkMode;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PictureProfileCircleAvatar extends StatelessWidget {
  const PictureProfileCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage:
          AssetImage('assets/images/foto_eric.jpg'),
    );
  }
}
