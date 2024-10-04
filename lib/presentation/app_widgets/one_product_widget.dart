import 'package:flutter/material.dart';

import '../app_theme/app_theme_data.dart';

class OneProductWidget extends StatelessWidget {
  const OneProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color:AppThemeData.borderColor,
          width: 2
        )
      ),
      height: MediaQuery.of(context).size.height*0.3,
      width:  MediaQuery.of(context).size.width*0.5,
      margin:EdgeInsets.all(8.0),

      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),

                      child: Image.asset('assets/images/product.jpg',
                          fit: BoxFit.fill,
                      height:  MediaQuery.of(context).size.height*0.16,
                      )),
                  IconButton(onPressed: (){},
                      icon: Image.asset("assets/images/not_favorite.png",
                        height: 60,
                        width: 60,
                        fit:BoxFit.fill,)
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 10,top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text("data",style:AppThemeData.lightTheme.textTheme.bodyMedium),
                    Text("data",style:AppThemeData.lightTheme.textTheme.bodyMedium),
                    SizedBox(height: MediaQuery.of(context).size.height*0.01),
                    Text("data",style:AppThemeData.lightTheme.textTheme.bodyMedium),
                    Row(
                      children: [
                        Text("Review",style:AppThemeData.lightTheme.textTheme.bodySmall),
                        SizedBox(width: MediaQuery.of(context).size.width*0.02),
                        Text("(4.2))",style:AppThemeData.lightTheme.textTheme.bodySmall),
                        SizedBox(width: MediaQuery.of(context).size.width*0.02),
                        Icon(Icons.star,color: AppThemeData.iconStar,)
                      ],
                    )
                  ],
                ),
              ),
            
            ],
          ),

          IconButton(onPressed: (){},
              icon:Icon(Icons.add_circle,color: AppThemeData.iconAdd,size: 40,)

          ),
        ],
      ),
    );
  }
}
