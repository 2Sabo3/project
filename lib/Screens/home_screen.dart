import 'package:flutter/material.dart';
import 'package:project/Provider/Category/categorycall.dart';
import 'package:project/Provider/Category/categorymodel.dart';
import 'package:project/Widgets/jobitem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Category> _categorylist;

  var isInit = true;

  @override
  void initState() {
    _categorylist = FetchingCategory.fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Inter Hiring'),
      ),
      body: FutureBuilder<Category>(
        future: _categorylist,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              padding: const EdgeInsets.all(25),
              itemCount: snapshot.data.jobCount,
              itemBuilder: (ctx, i) {
                return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return JobsScreen();
                      }));
                    },
                    child: Text(snapshot.data.jobs[i].name));
              },
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 90,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            );
          }
          return null;
        },
      ),
    );
  }
}
