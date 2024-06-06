import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
              brightness: themeChange.preference == ThemeTypes.dark
                      ? Brightness.dark
                      : Brightness.light,
              seedColor: themeChange.preference == ThemeTypes.dark
                      ? Colors.green.shade900
                      : Color.fromARGB(
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

const minWidth = 500.0;
const maxWidth = 900.0;

BoxConstraints boxConstraints = const BoxConstraints(
  minWidth: minWidth,
  maxWidth: maxWidth,
);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _language = 'PT-br';

  @override
  void initState() {
    super.initState();
    
    
  }

  int max = 1000;
  int min = 600;

  double widthProportion(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width <= min) {
      return 0;
    } else if (width >= max) {
      return 1;
    } else {
      return (width - min) / (max - min);
    }
  }

  final Uri _urlMailTo = Uri.parse('mailto: ericodigos@gmail.com');
  final Uri _urlGithub = Uri.parse('https://github.com/ericodex');
  final Uri _urlLinkedin = Uri.parse('https://www.linkedin.com/in/ericodigos/');

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: width < 400
          ? Center(
              child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Tela muito\npequena para\nexibir o conteúdo',
                    style: Theme.of(context).textTheme.displayMedium,
                  )),
            )
          : SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding:
                      EdgeInsets.all(8.0 + (widthProportion(context) * 10)),
                  child: Column(
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: boxConstraints,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                                height: 20 + (widthProportion(context) * 10)),
                            SizedBox(
                              height: 25,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  children: [
                                    Text(_language,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge),
                                    const SizedBox(width: 4),
                                    Tooltip(
                                      message: _language == 'PT-br'
                                          ? 'Mudar idioma para inglês'
                                          : 'Change language to portuguese',
                                      child: Switch(
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        value:
                                            _language == 'PT-br' ? true : false,
                                        onChanged: (value) {
                                          if (value) {
                                            setState(() {
                                              _language = 'PT-br';
                                            });
                                          } else {
                                            setState(() {
                                              _language = 'EN-us';
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const ThemePreferenceIconButton(),
                          ],
                        ),
                      ),
                      ConstrainedBox(
                        constraints: boxConstraints,
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
                            child: Column(
                              children: [
                                if (width < 700)
                                  const Padding(
                                    padding: EdgeInsets.all(13.0),
                                    child: PictureProfileCircleAvatar(),
                                  ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              'Eric Oliveira Lima',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium!
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
                                              'Especialista em desenvolvimento de sistemas multiplataforma, '
                                              'responsivos, adaptativos utilizando as convenções do Material Design. '
                                              ' Arquitetura com microsserviços híbridos e CI/CD, '
                                              'clean code, testes unitários e integrados e monitoramento.',	
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium),
                                        ],
                                      ),
                                    ),
                                    if (width > 700)
                                      const Flexible(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  25, 8, 25, 8),
                                              child:
                                                  PictureProfileCircleAvatar(),
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
                      SizedBox(height: 8 * (widthProportion(context))),
                      ConstrainedBox(
                        constraints: boxConstraints,
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  tooltip: 'Enviar email\nericodigos@gmail.com',
                                  onPressed: () async {
                                    if (!await launchUrl(_urlMailTo)) {
                                      throw Exception(
                                          'Could not launch $_urlMailTo');
                                    }
                                  },
                                  icon: const Icon(Icons.email)),
                              IconButton(
                                  tooltip: 'GitHub',
                                  onPressed: () async {
                                    // open github profile in browser https://github.com/ericodex
                                    if (!await launchUrl(_urlGithub)) {
                                      throw Exception(
                                          'Could not launch $_urlGithub');
                                    }
                                  },
                                  icon: const Icon(Bootstrap.github)),
                              IconButton(
                                  tooltip: 'LinkedIn',
                                  onPressed: () async {
                                    if (!await launchUrl(_urlLinkedin)) {
                                      throw Exception(
                                          'Could not launch $_urlGithub');
                                    }
                                  },
                                  icon: const Icon(Bootstrap.linkedin)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class ThemePreferenceIconButton extends StatefulWidget {
  const ThemePreferenceIconButton({
    super.key,
  });

  @override
  State<ThemePreferenceIconButton> createState() =>
      _ThemePreferenceIconButtonState();
}

class _ThemePreferenceIconButtonState extends State<ThemePreferenceIconButton> {
  //get system theme preference

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    return IconButton(
      tooltip:'Alterar tema',
      icon: Icon(themeChange.preference == ThemeTypes.light
              ? Icons.brightness_2 
              : Icons.brightness_7),
      onPressed: () {
        if (themeChange.preference == ThemeTypes.light) {
          themeChange.preference = ThemeTypes.dark;
        } else if (themeChange.preference == ThemeTypes.dark) {
          themeChange.preference = ThemeTypes.light;
        }
      },
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
      radius: 50 + (_MyHomePageState().widthProportion(context) * 50),
      backgroundImage: AssetImage('assets/images/foto_eric.jpg'),
    );
  }
}

class ThemeTypes {
  static const String dark = 'dark';
  static const String light = 'light';
  static const String system = 'system';

  static const List<String> themesList = [dark, light, system];
}
