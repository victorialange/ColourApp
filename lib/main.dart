import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<FavColor> favColors = [
    FavColor(
      name: 'Brazilwood',
      description:
          'Caesalpinia echinata or Brazilwood is a tree native to Brazil – of course – and prized for the deep brownish red colour of its trunk. Brazilwood is typically used to dye leather, textile, musical instruments and high-quality furniture.',
      image:
          'https://images.saymedia-content.com/.image/t_share/MTc2MjY0Mjc2NDQzNzM1MjMw/brazilwood.jpg',
      todos: [
        'Pair with other warm hues',
        'Use it for dying textiles',
        'Pair with white or pink'
      ],
    ),
    FavColor(
      name: 'Quercitron',
      description:
          'Quercitron is a yellow pigment that comes from bark of the Quercus velutina (black oak), a tree that grows in the Eastern and Midwestern parts of North America.',
      image:
          'https://cameo.mfa.org/images/thumb/e/e4/Quercitron_powder_1.jpg/180px-Quercitron_powder_1.jpg',
      todos: [
        'Pair with warm colours or green',
        'Use it for fall season',
        'Use it for dying'
      ],
    ),
    FavColor(
      name: 'Lapis Lazuli',
      description:
          'Lapis Lazuli is a blue mineral so rare that in the Middle Ages and the Renaissance it was actually more valuable than gold. Today it is still a much sought-after stone prized for its intense blue hue. The most beautiful Lapis Lazuli stones are sourced in Afghanistan.',
      image:
          'https://images.squarespace-cdn.com/content/v1/556c65dfe4b0923c3c72ad5b/1579711167831-WB3QMA09TLRBMU8D73PM/ke17ZwdGBToddI8pDm48kPJuqFQhQZyQSAWQsCaN3Y5Zw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpwZ6heInGYWc06MBbdDm7sJMpk3BhbsrGsSHNCYpC5BzRVVcixIXqkNgzNpY_eHSKs/2d5debe655ae57598f2bc4d1e80f019e.jpg?format=1500w',
      todos: [
        'Pair with green or gold colours',
        'Use it to feel royal',
        'Treat it like gold'
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favourite Colours',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Favourite Colours'),
        ),
        body: ListView.builder(
          itemCount: favColors.length,
          itemBuilder: (BuildContext context, int index) {
            return FavColorCard(favColor: favColors[index]);
          },
        ),
      ),
    );
  }
}

class FavColor {
  final String name;
  final String description;
  final String image;
  final List<String> todos;

  FavColor(
      {required this.name,
      required this.description,
      required this.image,
      required this.todos});
}

class FavColorCard extends StatefulWidget {
  final FavColor favColor;

  FavColorCard({required this.favColor});

  @override
  _FavColorCardState createState() => _FavColorCardState();
}

class _FavColorCardState extends State<FavColorCard> {
  bool _showTodos = false;

  void _toggleTodos() {
    setState(() {
      _showTodos = !_showTodos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TodoDescriptionPage(
                favColor: widget.favColor,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              widget.favColor.image,
              fit: BoxFit.cover,
              height: 200.0,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.favColor.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.favColor.description,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: _toggleTodos,
                        child: Text(
                          _showTodos ? 'Hide Todos' : 'Show Todos',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                  if (_showTodos)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.favColor.todos
                          .map(
                            (todo) => Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 4.0,
                                horizontal: 24.0,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                  SizedBox(width: 8.0),
                                  Expanded(
                                    child: Text(
                                      todo,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoDescriptionPage extends StatelessWidget {
  final FavColor favColor;

  TodoDescriptionPage({required this.favColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(favColor.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              favColor.image,
              fit: BoxFit.cover,
              height: 200.0,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Things to Do',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: favColor.todos
                        .map(
                          (todo) => Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 24.0,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 8.0),
                                Expanded(
                                  child: Text(
                                    todo,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
