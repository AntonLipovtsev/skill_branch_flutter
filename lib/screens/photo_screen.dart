import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreenImage extends StatefulWidget {
  FullScreenImage(
      {String altDescription, String userName, String name, Key key})
      : super(key: key) {
    this.altDescription = altDescription;
    this.userName = userName;
    this.name = name;
  }

  String altDescription;
  String userName;
  String name;

  @override
  State<StatefulWidget> createState() {
    return _FullScreenImageState();
  }
}

class _FullScreenImageState extends State<FullScreenImage> {

  String altDescription;
  String userName;
  String name;

  @override
  void initState() {
    super.initState();

    altDescription = widget.altDescription;
    userName = widget.userName;
    name = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          AppBar(
            elevation: 0,
            backgroundColor: AppColors.white,
            centerTitle: true,
            title: Text(
              'Photo',
              style: AppStyles.h1Black,
            ),
            leading: IconButton(
                icon: Icon(
                  CupertinoIcons.back,
                  color: AppColors.manatee,
                ),
                onPressed: () {}),
          ),
          Photo(
              photoLink: 'https://skill-branch.ru/img/speakers/Adechenko.jpg'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  altDescription == null ? 'Description' : altDescription,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.h3,
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                  child: Row(
                    children: <Widget>[
                      UserAvatar(
                          'https://skill-branch.ru/img/speakers/Adechenko.jpg'),
                      SizedBox(
                        width: 6,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          NameWidget(name),
                          NickNameWidget(userName),
                        ],
                      )
                    ],
                  ),
                ),

                Row(
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: LikeButton(10, true),
                      ),
                      flex: 1,
                    ),

                    SizedBox(width: 5,),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: 105,
                          height: 36,
                          decoration: BoxDecoration(color: AppColors.dodgerBlue,
                              borderRadius: BorderRadius.circular(7)),
                          child: Text('Save', style: AppStyles.h4.copyWith(
                              color: AppColors.white),),
                        ),
                      ),
                      flex: 1,
                    ),

                    SizedBox(width: 5,),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: 105,
                          height: 36,
                          decoration: BoxDecoration(color: AppColors.dodgerBlue,
                              borderRadius: BorderRadius.circular(7)),
                          child: Text('Visit', style: AppStyles.h4.copyWith(
                              color: AppColors.white),),
                        ),
                      ),
                      flex: 1,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class NameWidget extends StatelessWidget {

  NameWidget(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name == null ? 'Name' : name,
      style: AppStyles.h1Black,
    );
  }
}

class NickNameWidget extends StatelessWidget {

  NickNameWidget(this.userName);

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Text(
      userName == null ? 'UserName' : "@$userName",
      style: AppStyles.h5Black.copyWith(color: AppColors.manatee),
    );
  }
}