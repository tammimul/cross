class cat {
  static List<Items> items = [Items(
      id: 1,
      name: "tammim",
      description: "student",
      image: "https://www.lifewire.com/thmb/l7qM6RfTXYLUUfryFavWEkcT1XY=/3940x2529/filters:no_upscale():max_bytes(150000):strip_icc()/surf-internet-url-henrik5000-e-getty-images-56fa7f855f9b5829867282a9.jpg",
      url: "https://www.w3schools.com/tags/tag_ins.asp"
  )];
}
class Items {
  final int id;
  final String name;
  final String description;
  final String image;
  final String url;

  Items({required this.id, required this.name, required this.description, required this.image,required this.url});

  factory Items.fromMap(Map<dynamic,dynamic>map){
    return Items(
        id: map["id"],
        name: map["name"],
        description: map["description"],
        image: map["image"],
        url : map["url"]
    );
  }
  toMap() => {
    id : "id",
    name : "name",
    description : "description",
    image : "image",
    url : url
  };

}

