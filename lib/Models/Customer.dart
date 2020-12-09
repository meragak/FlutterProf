class Customer {
  String id;
  String name;
  String subscribedToChannel;
  String subscribeDate;
  Customer({this.id, this.name, this.subscribedToChannel, this.subscribeDate});
  factory Customer.fromJson(Map<dynamic, dynamic> json) {
    return Customer(
        id: json['id'] as String,
        name: json['name'] as String,
        subscribedToChannel: json['subscribedToChannel'] as String,
        subscribeDate: json['subscribeDate'].toString() as String);
  }
}
