import 'package:MovieDirect/data/MovieItem.dart';

class MoviesList {
  List<MovieItem> results;
  int page;
  int totalResults;
  Dates dates;
  int totalPages;

  MoviesList(
      {this.results,
      this.page,
      this.totalResults,
      this.dates,
      this.totalPages});

  MoviesList.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<MovieItem>();
      json['results'].forEach((v) {
        results.add(new MovieItem.fromJson(v));
      });
    }
    page = json['page'];
    totalResults = json['total_results'];
    dates = json['dates'] != null ? new Dates.fromJson(json['dates']) : null;
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['total_results'] = this.totalResults;
    if (this.dates != null) {
      data['dates'] = this.dates.toJson();
    }
    data['total_pages'] = this.totalPages;
    return data;
  }
}

class Dates {
  String maximum;
  String minimum;

  Dates({this.maximum, this.minimum});

  Dates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['maximum'] = this.maximum;
    data['minimum'] = this.minimum;
    return data;
  }
}
