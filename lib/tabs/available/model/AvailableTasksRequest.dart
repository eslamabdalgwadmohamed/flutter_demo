class AvailableTasksRequest {
  int pageNumber = 1;
  int pagesize = 20;
  List<int> requestStatusLst;
  List<int> requestTypeLst;
  int sortTypeId = 2;

  AvailableTasksRequest(
      {this.pageNumber,
        this.pagesize,
        this.requestStatusLst,
        this.requestTypeLst,
        this.sortTypeId});

  AvailableTasksRequest.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageNumber'];
    pagesize = json['pagesize'];
    requestStatusLst = json['RequestStatusLst'].cast<int>();
    requestTypeLst = json['RequestTypeLst'].cast<int>();
    sortTypeId = json['SortTypeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageNumber'] = this.pageNumber;
    data['pagesize'] = this.pagesize;
    data['RequestStatusLst'] = this.requestStatusLst;
    data['RequestTypeLst'] = this.requestTypeLst;
    data['SortTypeId'] = this.sortTypeId;
    return data;
  }
}