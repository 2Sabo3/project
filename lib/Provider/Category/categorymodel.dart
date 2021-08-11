// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    @required this.jobCount,
    @required this.jobs,
  });

  final int jobCount;
  final List<Job> jobs;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        jobCount: json["job-count"] == null ? null : json["job-count"],
        jobs: json["jobs"] == null
            ? null
            : List<Job>.from(json["jobs"].map((x) => Job.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "job-count": jobCount == null ? null : jobCount,
        "jobs": jobs == null
            ? null
            : List<dynamic>.from(jobs.map((x) => x.toJson())),
      };
}

class Job {
  Job({
    @required this.id,
    @required this.name,
    @required this.slug,
  });

  final int id;
  final String name;
  final String slug;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
      };
}
