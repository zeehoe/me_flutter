import 'package:flutter/material.dart';
import './../skill.dart';
import './../skill_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  final spinkit = SpinKitWanderingCubes(
    color: Colors.blue[800],
    size: 50.0,
  );
  bool isLoading = false;

  List<Skill> skills = [
    Skill(title: 'Kotlin', experienceYear: 3),
    Skill(title: 'Flutter', experienceYear: 1),
    Skill(title: 'React.js', experienceYear: 2),
    Skill(title: 'Web dev', experienceYear: 4),
    Skill(title: 'Mobile Game Dev', experienceYear: 4),
    Skill(title: 'Java', experienceYear: 2),
    Skill(title: 'Node.js', experienceYear: 2),
    Skill(title: 'Python', experienceYear: 1),
  ];

  // Widget skillTemplate(Skill skill) {
  //   return Text("hello world");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.blue[600],
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/me.png'),
                          radius: 60.0,
                        ),
                      ),
                      Divider(height: 60.0, color: Colors.grey[400]),
                      Text(
                        'NAME',
                        style: TextStyle(
                            color: Colors.grey[800], letterSpacing: 2.0),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Frankey Wong',
                        style: TextStyle(
                            color: Colors.orangeAccent[200],
                            letterSpacing: 2.0,
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        'Programming Experience',
                        style: TextStyle(
                            color: Colors.grey[800], letterSpacing: 2.0),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '5 years +',
                        style: TextStyle(
                            color: Colors.orangeAccent[200],
                            letterSpacing: 2.0,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      GestureDetector(
                        onTap: () => _launchUrl('mailto:zeehoe95@gmail.com'),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.email, color: Colors.blue[800]),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'zeehoe95@gmail.com',
                              style: TextStyle(
                                color: Colors.blue[800],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () => _launchUrl('https://fatowl.top/'),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.link, color: Colors.blue[800]),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'https://fatowl.top/',
                              style: TextStyle(
                                color: Colors.blue[800],
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(height: 60.0, color: Colors.grey[400]),
                      GridView.count(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(10.0),
                          primary: false,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          crossAxisCount: 2,
                          childAspectRatio: 1.5,
                          children: skills.map((skill) {
                            return SkillCard(skill: skill);
                          }).toList()),
                      Center(
                        child: ElevatedButton.icon(
                            onPressed: () =>
                                {Navigator.pushNamed(context, '/quote')},
                            icon: Icon(Icons.power),
                            label: Text('Get Inspired!')),
                      )
                    ],
                  )),
            ),
            isLoading ? spinkit : SizedBox.shrink()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Thank you for liking me!"),
              duration: Duration(seconds: 2), // Adjust the duration as desired
            ),
          );
        },
        child: Icon(Icons.thumb_up),
        backgroundColor: Colors.blue[800],
      ),
    );
  }

  Future<void> _launchUrl(link) async {
    setState(() {
      isLoading = true;
    });
    launchUrl(Uri.parse(link))
        .then((value) => {})
        .catchError((error) => {throw Exception('Could not launch $link')})
        .whenComplete(() => {
              setState(() {
                isLoading = false;
              })
            });
  }
}
