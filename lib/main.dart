import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Weather",
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            color: Colors.black54,
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
              color: Colors.black54,
            ),
          ],
          // systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _headerImage(),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _weatherDescription(),
              const Divider(),
              _temperature(),
              const Divider(),
              _temperatureForecast(),
              const Divider(),
              _footerRatings(),
            ],
          ),
        ))
      ],
    ),
  );
}

Image _headerImage() {
  return const Image(
    image: NetworkImage(
        'https://ognikubani.ru/wp-content/uploads/2020/04/nkKPw8BolaHdTDJrfKWK_26_a54efa68011f16f4b481b5e44c518843_avatar_full.jpg'),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const <Widget>[
      Text(
        'папа иди спать',
        style: TextStyle(
            fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      Divider(),
      Text(
        'Ну вот - погода хорошая, но весна бывает и обманчивой. Одевайтесь, чтобы ветер вас не простудил.',
        style: TextStyle(
            fontSize: 16, color: Colors.black54, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ),
        ],
      ),
      const SizedBox(width: 16.0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                'Сегодня - Май 22',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          Row(
            children: const [
              Text(
                'Московская область, Москва',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(
    spacing: 10.0,
    children: List.generate(8, (int index) {
      return Chip(
        label: Text(
          '${index + 20}°',
          style: const TextStyle(fontSize: 15.0),
        ),
        avatar: const Icon(
          Icons.cloud,
          color: Colors.blueAccent,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        side: const BorderSide(color: Colors.grey),
        backgroundColor: Colors.grey.shade100,
      );
    }),
  );
}

Row _footerRatings() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: const <Widget>[
      Icon(
        Icons.star,
        size: 15.0,
        color: Colors.yellow,
      ),
      Icon(
        Icons.star,
        size: 15.0,
        color: Colors.yellow,
      ),
      Icon(
        Icons.star,
        size: 15.0,
        color: Colors.yellow,
      ),
      Icon(
        Icons.star_border,
        size: 15.0,
        color: Colors.yellow,
      ),
      Icon(
        Icons.star_border,
        size: 15.0,
        color: Colors.yellow,
      ),
    ],
  );
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      const Text(
        'Info with openweathermap.org',
        style: TextStyle(fontSize: 15.0),
      ),
      stars,
    ],
  );
}
