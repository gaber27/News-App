import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../../moduls/news_app/web_view/view_screen.dart';
Widget defaultButton({
  double ? width = double.infinity ,
   Color ? background = Colors.blue,
    bool isUpperCase = true,
  double radius = 0.0,
  required void Function()? function ,
  required String  text ,
 })=>Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: background,
  ),
  width: width,

  // height: 40.0,
  child:
  MaterialButton(
    onPressed: function,
    child:
    Text(
       isUpperCase? text.toUpperCase():text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);
  Widget defaultFormFiled({
    bool isClicable = true,
   void Function() ?onTap,
  required TextEditingController controller,
  required TextInputType type ,
  required String? Function(String?)? Validate,
    required String? label,
    required IconData ? Prefix,
     IconData ?suffix ,
  String? Function(String?) ?onSubmitted,
   String? Function(String?)?onChange,
   bool iSPassword =  false,
     void Function () ?suffixPressed,
})=>  TextFormField(
    enabled:isClicable ,
    onTap: onTap,
    controller: controller,
    keyboardType: type ,
    obscureText: iSPassword,
    onFieldSubmitted: onSubmitted,
    onChanged: onChange,
    validator: Validate,
    decoration: InputDecoration(
      labelText:label,
      suffixIcon: suffix!= null? IconButton(
        onPressed: suffixPressed,
        icon: Icon(
            suffix
        ),
      ) : null,
      prefixIcon:
      Icon(
          Prefix,
      ),
      border: OutlineInputBorder(),
    ),
  );
  Widget bulidTaskItem(Map model, context)=>
      Dismissible(
        key: Key(model['id'].toString()),
        child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
        children: [
          CircleAvatar(
            radius: 40.0,
            child: Text(
                '${model['time']}'
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
            '${model['title']}',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                    '${model['date']}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),

                ),
              ],
            ),

          ),
        ],
    ),
  ),
      );
  Widget tasksBulider({
  required List<Map> tasks,
})=> ConditionalBuilder(
    condition:tasks.length>0 ,
    builder:(context)=>ListView.separated(itemBuilder:(context,index) => bulidTaskItem(tasks[index], context),
      separatorBuilder:(context,index)=>
      myDivider() ,
      itemCount:tasks.length,
    ),
    fallback:(context)=>Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu,
            size: 100,
            color: Colors.grey,
          ),
          Text(
            'No Tasks Yet, Please Add Some Tasks',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey
            ),

          ),
        ],
      ),
    ) ,
  );
  Widget buildArticalItem(article,context)=> InkWell(
    onTap: (){
      navigateto(context, webViewScreen(article['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
      decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image:
                DecorationImage(

                  image: NetworkImage(
                    '${article['urlToImage']}'
                  ) ,

                  fit: BoxFit.cover,
                )
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              height: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${article['title']}',
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );

  Widget myDivider()=>  Container(
    width: double.infinity,
    color: Colors.grey[300],
    height: 1.0,
  ) ;

  Widget articalBulider(list,context,{isSearch=false}) => ConditionalBuilder(
condition: list.length>0,
builder: (context)=> ListView.separated(
physics: BouncingScrollPhysics( ),
itemBuilder: (context,index)=>buildArticalItem(list[index],context),
separatorBuilder: (context,index)=>  myDivider() ,
itemCount:list.length,),
fallback: (context) => isSearch? Container(): Center(child: CircularProgressIndicator())
);

  void navigateto(context,Widget)=> Navigator.push(
context,
MaterialPageRoute(
builder: (context)=>
Widget,
),
);

  void navigateAndFinish(context,Widget)=>
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(
        builder: (context)=>
        Widget,
      ),
              (Route<dynamic>route) => false
      );
  Widget defaultTextButton({
    required  void Function()? function,
  required String text})
  => TextButton(onPressed: function, child: Text(text.toUpperCase()),);
