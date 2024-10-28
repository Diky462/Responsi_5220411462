import 'package:flutter/material.dart';
import 'package:responsi/screen/halaman_akun.dart';
import 'package:responsi/screen/login.dart';
import 'package:responsi/screen/notifikasi.dart';
import 'package:responsi/screen/setting.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountPage()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  final List<Map<String, String>> cameraDescriptions = [
    {
      'title': 'Kamera DSLR',
      'description': 'Kamera ini cocok untuk fotografi profesional dengan lensa yang dapat diganti.',
      'imageUrl': 'https://cdn.discordapp.com/attachments/1244656842353934430/1297580674726756372/image1.jpg?ex=672054ec&is=671f036c&hm=35b8be2d3880634d00b2ce95784a643b16001f0f871008085868eb5269061337&', 
    },
    {
      'title': 'Kamera Mirrorless',
      'description': 'Kamera lebih ringan dan kompak, dengan kualitas gambar setara DSLR.',
      'imageUrl': 'https://media.discordapp.net/attachments/1244656842353934430/1300445298216276058/image2.jpg?ex=6720dd90&is=671f8c10&hm=ae6b822e7e9c86b87f0ce6a439bdcc3384abb9276240e5cd42ae2b49b5fcdd73&=&format=webp', 
    },
    {
      'title': 'Kamera Digital',
      'description': 'Kamera digital mudah digunakan untuk pemula.',
      'imageUrl': 'https://media.discordapp.net/attachments/1244656842353934430/1300445297918607430/download.jpg?ex=6720dd90&is=671f8c10&hm=cca567773b570df06705cbf62ea99f38ea5fd5e012d37714d23560548077d5c1&=&format=webp', 
    },
  ];

  final List<String> gridImages = [
    'https://media.discordapp.net/attachments/1244656842353934430/1300445297918607430/download.jpg?ex=6720dd90&is=671f8c10&hm=cca567773b570df06705cbf62ea99f38ea5fd5e012d37714d23560548077d5c1&=&format=webp',
    'https://media.discordapp.net/attachments/1244656842353934430/1300445298216276058/image2.jpg?ex=6720dd90&is=671f8c10&hm=ae6b822e7e9c86b87f0ce6a439bdcc3384abb9276240e5cd42ae2b49b5fcdd73&=&format=webp',
    'https://cdn.discordapp.com/attachments/1244656842353934430/1297580674726756372/image1.jpg?ex=672054ec&is=671f036c&hm=35b8be2d3880634d00b2ce95784a643b16001f0f871008085868eb5269061337&',
    'https://example.com/image4.jpg',
    'https://example.com/image5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, const Color.fromARGB(255, 0, 122, 204)],
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color.fromARGB(255, 90, 90, 90),
                    child: Icon(Icons.person, size: 30),
                  ),
                  SizedBox(width: 10),
                  Text('Diky Listianto', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Grid',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Container(
              height: 150,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1,
                ),
                itemCount: gridImages.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0), 
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0), 
                        image: DecorationImage(
                          image: NetworkImage(gridImages[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                      width: 150,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'List',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cameraDescriptions.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0), 
                    ),
                    child: ListTile(
                      leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: ClipOval(
                          child: Image.network(
                            cameraDescriptions[index]['imageUrl']!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.broken_image, size: 50);
                            },
                          ),
                        ),
                      ),
                      title: Text(cameraDescriptions[index]['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(cameraDescriptions[index]['description']!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}
