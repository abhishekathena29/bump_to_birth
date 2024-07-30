import 'package:bump_to_birth/core/colors.dart';
import 'package:bump_to_birth/core/navigation.dart';
import 'package:bump_to_birth/feature/forum/model/forumpost.dart';
import 'package:bump_to_birth/feature/forum/pages/add_forum_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForumPage extends StatelessWidget {
  const ForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(1.sw, 0.1.sh),
        child: Container(
          color: const Color(0xffF9ADB7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      moveBack(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.white,
                    iconSize: 35,
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    'Forum',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          moveTo(context, AddForumPage());
        },
        child: const Icon(Icons.add),
      ),
      body: Expanded(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('forum').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var forumlist = snapshot.data!.docs
                    .map((forum) => ForumPost.fromMap(forum.data()))
                    .toList();
                return ListView.separated(
                  itemCount: forumlist.length,
                  itemBuilder: (context, index) {
                    return ForumQuestionWidget(
                      post: forumlist[index],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 15.h),
                );
              }
              return CircularProgressIndicator();
            }),
      ),
    );
  }
}

class ForumQuestionWidget extends StatelessWidget {
  const ForumQuestionWidget({
    super.key,
    required this.post,
  });
  final ForumPost post;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(1, 1),
            blurRadius: 3,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(),
              SizedBox(width: 10),
              Text('John Doe'),
            ],
          ),
          Text(
            post.query,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "25-07-2024",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black45,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: const Card(
                color: kPrimaryColor,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Response',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
