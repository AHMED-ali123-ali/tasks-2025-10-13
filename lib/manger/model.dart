class Data {
 final int? id;
 final String title;
 final String data;
 final String time;
 final String status;


  Data({
    this.id,
    required this.title,
    required this.data,
    required this.time,
    this.status = 'new',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'data': data,
      'time': time,
      'status': status,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id'] ?? '',
      title: map['title']?? '',
      data: map['data'] ??'',
      time: map['time']?? '',
      status: map['status']?? '',
    );
  }
}