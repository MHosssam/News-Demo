import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:thenews/utitites/api_utilites.dart';
import 'package:thenews/models/post.dart';

class PostsApi{
  Future <List <Post>> fetchNew( String id ) async {
    List<Post> posts =List<Post>();
    String postsUrl = base_api + categories_api +id ;
    var response = await http.get(postsUrl);
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];
      for(var item in data){
        Post post = Post(
            id: item["id"].toString(),
            title: item["title"].toString(),
            content: item["content"].toString(),
            dateWritten: item["date_written"].toString(),
            featuredImage: item["featured_image"].toString(),
            votesUp: item["votes_up"],
            votesDown: item["votes_down"],
            votersUp: (item["voters_up"] == null) ? List<int>() : jsonDecode( item["voters_up"] ),
            votersDown: (item["voters_down"] == null) ? List<int>() : jsonDecode( item["voters_down"] ),
            userId: item["user_id"],
            categoryId: item["category_id"]
        );
        posts.add(post);
      }
    }
    return posts ;
  }
}
