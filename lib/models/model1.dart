class concert{

  static List<Elements> elements = [ Elements(
    id: 1,
    name: "Tommorrow Land",
    description: "student",
    image: "https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29uY2VydHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
  )];
}

class Elements{
  final int id;
  final String name;
  final  String description;
  final String image;

  Elements({required this.id, required this.name, required this.description, required this.image,} );
  factory Elements.fromMap(Map<String,dynamic>map){
    return Elements(
      id: map["id"],
      name: map["name"],
      description: map["description"],
      image: map["image"],

    );
  }
  toMap() => {
    id : "id",
    name : "name",
    description : "description",
    image : "image",

  };
}