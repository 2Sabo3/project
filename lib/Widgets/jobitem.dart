import 'package:flutter/material.dart';

import 'package:project/Provider/Jobs/jobscall.dart';
import 'package:project/Provider/Jobs/jobsmodel.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({Key key}) : super(key: key);

  @override
  _JobsScreenState createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  Future<JobElement> _joblist;

  var isInit = true;

  @override
  void initState() {
    _joblist = FetchingJobs.fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: FutureBuilder(
          future: _joblist,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(itemBuilder: (context, i) {
                return Container(child: Text(snapshot.data.toString()));
              });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
