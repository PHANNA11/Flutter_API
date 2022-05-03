import 'package:flutter/material.dart';
import 'package:flutter_api/models/post_model.dart';
import 'package:flutter_api/services/remotservice.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('API APP'),
          centerTitle: true,
        ),
        body: posts!.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: posts?.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(3),
                    height: 200,
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Center(
                            child: Text(posts![index].userId.toString()),
                          ),
                        ),
                        title: Text(
                          posts![index].title,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontStyle: FontStyle.italic),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(posts![index].body),
                      ),
                    ),
                  );
                },
              ));
  }
}
