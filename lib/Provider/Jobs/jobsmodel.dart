// To parse this JSON data, do
//
//     final job = jobFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Job jobFromJson(String str) => Job.fromJson(json.decode(str));

String jobToJson(Job data) => json.encode(data.toJson());

class Job {
  Job({
    @required this.jobCount,
    @required this.jobs,
  });

  final int jobCount;
  final List<JobElement> jobs;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        jobCount: json["job-count"] == null ? null : json["job-count"],
        jobs: json["jobs"] == null
            ? null
            : List<JobElement>.from(
                json["jobs"].map((x) => JobElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "job-count": jobCount == null ? null : jobCount,
        "jobs": jobs == null
            ? null
            : List<dynamic>.from(jobs.map((x) => x.toJson())),
      };
}

class JobElement {
  JobElement({
    @required this.id,
    @required this.url,
    @required this.title,
    @required this.companyName,
    @required this.category,
    @required this.tags,
    @required this.jobType,
    @required this.publicationDate,
    @required this.candidateRequiredLocation,
    @required this.salary,
    @required this.description,
    @required this.companyLogoUrl,
  });

  final int id;
  final String url;
  final String title;
  final String companyName;
  final Category category;
  final List<dynamic> tags;
  final JobType jobType;
  final DateTime publicationDate;
  final String candidateRequiredLocation;
  final String salary;
  final String description;
  final String companyLogoUrl;

  factory JobElement.fromJson(Map<String, dynamic> json) => JobElement(
        id: json["id"] == null ? null : json["id"],
        url: json["url"] == null ? null : json["url"],
        title: json["title"] == null ? null : json["title"],
        companyName: json["company_name"] == null ? null : json["company_name"],
        category: json["category"] == null
            ? null
            : categoryValues.map[json["category"]],
        tags: json["tags"] == null
            ? null
            : List<dynamic>.from(json["tags"].map((x) => x)),
        jobType: json["job_type"] == null
            ? null
            : jobTypeValues.map[json["job_type"]],
        publicationDate: json["publication_date"] == null
            ? null
            : DateTime.parse(json["publication_date"]),
        candidateRequiredLocation: json["candidate_required_location"] == null
            ? null
            : json["candidate_required_location"],
        salary: json["salary"] == null ? null : json["salary"],
        description: json["description"] == null ? null : json["description"],
        companyLogoUrl:
            json["company_logo_url"] == null ? null : json["company_logo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "url": url == null ? null : url,
        "title": title == null ? null : title,
        "company_name": companyName == null ? null : companyName,
        "category": category == null ? null : categoryValues.reverse[category],
        "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x)),
        "job_type": jobType == null ? null : jobTypeValues.reverse[jobType],
        "publication_date":
            publicationDate == null ? null : publicationDate.toIso8601String(),
        "candidate_required_location": candidateRequiredLocation == null
            ? null
            : candidateRequiredLocation,
        "salary": salary == null ? null : salary,
        "description": description == null ? null : description,
        "company_logo_url": companyLogoUrl == null ? null : companyLogoUrl,
      };
}

enum Category { SOFTWARE_DEVELOPMENT }

final categoryValues =
    EnumValues({"Software Development": Category.SOFTWARE_DEVELOPMENT});

enum JobType { CONTRACT, FULL_TIME, EMPTY, FREELANCE }

final jobTypeValues = EnumValues({
  "contract": JobType.CONTRACT,
  "": JobType.EMPTY,
  "freelance": JobType.FREELANCE,
  "full_time": JobType.FULL_TIME
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
