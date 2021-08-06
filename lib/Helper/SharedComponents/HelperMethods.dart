import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modeuls/web_view/web_view_screen.dart';

Widget ArticalItem(artical, context,) => InkWell(
    onTap: (){
           NavigateTo(context,WebViewScreen(artical['url']));
    },
  child:   Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('${artical['urlToImage']}'),
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        artical['title'],
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      artical['publishedAt'],
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
);

Widget MyDivder() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[200],
      ),
    );

Widget conditionBuilder(list, context,{isSearch=false}) =>
    ConditionalBuilder(
          condition: list.length > 0,
          builder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => ArticalItem(list[index], context),
              separatorBuilder: (context, index) => MyDivder(),
              itemCount: list.length),
          fallback: (context) => isSearch ? Container():Center(child: CircularProgressIndicator()),
        );

Widget defaultTextFormField({
  @required TextEditingController controller,
  IconData prefixIcon,
  @required TextInputType type,
  @required String label,
  String hint,
  @required String validate_message,
  Function onChange,
  Function onTap,
  bool isClickable = true,
}) =>
    TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        labelText: label,
        border: OutlineInputBorder(),
        hintText: hint,
      ),
      controller: controller,
      onChanged: onChange,
      enabled: isClickable,
      onTap: onTap,
      validator: (String value) {
        if (value.isEmpty) {
          return validate_message;
        }
        return null;
      },
      keyboardType: type,
      style: TextStyle(
        fontSize: 20,
      ),
    );

void NavigateTo(context,widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
