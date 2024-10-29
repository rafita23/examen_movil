import 'package:flutter/material.dart';

void main() {
  runApp(VictorRafaelApp()); 
}

class VictorRafaelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rafael Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: NinaChambillaHomePage(), 
    );
  }
}

class NinaChambillaHomePage extends StatelessWidget {





  final List<String> _images = [
    'https://img.europapress.es/fotoweb/fotonoticia_20121016100018_690.jpg',
    'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/96/cc/68/isla-del-sol.jpg?w=1200&h=-1&s=1',
    'https://ichef.bbci.co.uk/ace/ws/640/cpsprodpb/e166/live/e6c11e20-d1ac-11ee-aa1b-d5d615d1e0c8.jpg.webp',
    'https://www.celag.org/wp-content/uploads/2019/04/bolivia-en-la-geopolitica-mundial.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3G_7VhWeVUhzQN_SRyHM2Ef3iSTK0fyeZkw&s',
    'https://brandemia.org/contenido/subidas/2021/01/portada-bolivia-estado-imagenes-brandemia-blog-1000x670.jpg',
  ];

  




  void _showFullImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); 
            },
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Galería de Imágenes - Nina Chambilla'),
      ),
      body: Center(
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: _images.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _showFullImage(context, _images[index]); 
                
              },
              child: Image.network(
                _images[index],
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
