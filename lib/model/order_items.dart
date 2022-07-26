import 'dart:convert';


class OrderItems {
  OrderItems({
    required this.orderItems,
  });

  List<OrderItem> orderItems;

  factory OrderItems.fromJson(String str) => OrderItems.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderItems.fromMap(Map<String, dynamic> json) => OrderItems(
    orderItems: List<OrderItem>.from(json["order_items"].map((x) => OrderItem.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "order_items": orderItems == null ? null : List<dynamic>.from(orderItems.map((x) => x.toJson())),
  };
}

class OrderItem {
  OrderItem({
    required this.id,
    required this.orderId,
    required this.productOptionsId,
    required this.count,
    required this.weightId,
    required this.sizeId,
    required this.colorId,
    required this.productId,
    required this.additionalPrice,
    required this.stouck,
    required this.title,
    required this.price,
    required this.image,
    required this.size,
    required this.weight,
    required this.color,
    required this.degree,
  });

  int id;
  int orderId;
  int productOptionsId;
  int count;
  int weightId;
  int sizeId;
  int colorId;
  int productId;
  int additionalPrice;
  int stouck;
  String title;
  int price;
  String image;
  String size;
  String weight;
  String color;
  String degree;

  factory OrderItem.fromJson(String str) => OrderItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderItem.fromMap(Map<String, dynamic> json) => OrderItem(
    id: json["id"] == null ? -1 : json["id"],
    orderId: json["order_id"] == null ? -1 : json["order_id"],
    productOptionsId: json["product_options_id"] == null ? -1 : json["product_options_id"],
    count: json["count"] == null ? -1 : json["count"],
    weightId: json["weight_id"] == null ? -1 : json["weight_id"],
    sizeId: json["size_id"] == null ? -1 : json["size_id"],
    colorId: json["color_id"] == null ? -1 : json["color_id"],
    productId: json["product_id"] == null ? -1 : json["product_id"],
    additionalPrice: json["additional_price"] == null ? -1 : json["additional_price"],
    stouck: json["stouck"] == null ? -1 : json["stouck"],
    title: json["title"] == null ? "" : json["title"],
    price: json["price"] == null ? -1 : json["price"],
    image: json["image"] == null ? "" : json["image"],
    size: json["size"] == null ? "" : json["size"],
    weight: json["weight"] == null ? "" : json["weight"],
    color: json["color"] == null ? "" : json["color"],
    degree: json["degree"] == null ? "" : json["degree"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "order_id": orderId == null ? null : orderId,
    "product_options_id": productOptionsId == null ? null : productOptionsId,
    "count": count == null ? null : count,
    "weight_id": weightId == null ? null : weightId,
    "size_id": sizeId == null ? null : sizeId,
    "color_id": colorId == null ? null : colorId,
    "product_id": productId == null ? null : productId,
    "additional_price": additionalPrice == null ? null : additionalPrice,
    "stouck": stouck == null ? null : stouck,
    "title": title == null ? null : title,
    "price": price == null ? null : price,
    "image": image == null ? null : image,
    "size": size == null ? null : size,
    "weight": weight == null ? null : weight,
    "color": color == null ? null : color,
    "degree": degree == null ? null : degree,
  };
}
