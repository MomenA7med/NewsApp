import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_eg/modules/webview/webview_screen.dart';

Widget buildArticleItem(Map<String,dynamic> article,context) => InkWell(
  onTap: (){
    navigateTo(context, WebviewScreen(article['url']));
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
      Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: (article['urlToImage']) != null ? NetworkImage(article['urlToImage']) : AssetImage('assets/images/not-found.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(width: 20,),
      Expanded(
        child: Container(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  article['title'],
                  style: Theme.of(context).textTheme.bodyText1,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(article['publishedAt'],style: TextStyle(
                color: Colors.grey,
              ),),
            ],),
        ),
      ),
    ],),
  ),
);

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onTab,
  bool isPassword = false,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  bool isClickable = true,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  validator: validate,
  onTap: onTab,
  enabled: isClickable,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon: suffix != null ? Icon(suffix) : null,
    border: OutlineInputBorder(),
  ),
);

void navigateTo (context,widget) => Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => widget,
    )
);

