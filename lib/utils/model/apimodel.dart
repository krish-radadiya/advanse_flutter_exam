class Apimodel {
  String description;
  String title;
  String content;
  String urlToImage;
  String url;
  String publishedAt;

  Apimodel({
    required this.description,
    required this.title,
    required this.content,
    required this.urlToImage,
    required this.url,
    required this.publishedAt,
  });

  factory Apimodel.fromjson(
    Map<String, dynamic> Data,
  ) =>
      Apimodel(
        description: Data['description'],
        title: Data['title'],
        content: Data['content'],
        urlToImage: Data['urlToImage'],
        url: Data['url'],
        publishedAt: Data['publishedAt'],
      );
}
