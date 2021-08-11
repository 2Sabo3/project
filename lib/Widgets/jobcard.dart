import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String jobname;
  final String detail;
  final String companyname;
  final String salary;

  JobCard({
    @required this.salary,
    @required this.jobname,
    @required this.companyname,
    @required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 7,
                  left: 10,
                  right: 28,
                ),
                child: Text(
                  jobname,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    backgroundColor: Colors.black26,
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(companyname),
                Container(
                  padding: EdgeInsets.only(
                    bottom: 15,
                    left: 15,
                  ),
                  child: Text(
                    salary,
                    style: TextStyle(
                      fontSize: 25,
                      backgroundColor: Colors.black26,
                    ),
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 25,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    bottom: 10,
                    left: 5,
                  ),
                  child: Text(
                    detail,
                    style: TextStyle(
                      fontSize: 25,
                      backgroundColor: Colors.black26,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                    right: 4,
                  ),
                  child: Icon(
                    Icons.timelapse,
                    color: Colors.yellow,
                    size: 29,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
