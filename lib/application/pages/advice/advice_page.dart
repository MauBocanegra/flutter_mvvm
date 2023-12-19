import 'package:flutter/material.dart';
import 'package:flutter_mvvm/application/core/services/theme_services.dart';
import 'package:flutter_mvvm/application/core/widgets/custom_button.dart';
import 'package:flutter_mvvm/application/core/widgets/error_message.dart';
import 'package:provider/provider.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Adviser',
          style: themeData.textTheme.headline1,
        ),
        centerTitle: true,
        actions: [
          Switch(
              value: Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeService>(context, listen: false).toggleTheme();
              }
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(child: Center(
              child: ErrorMessage(errorString: "Oops! Something went wrong!")
              //AdviceField(advice: "Example advice!",)
              /*CircularProgressIndicator(
                color: themeData.colorScheme.secondary,
              )
              */
              /*Text(
                "Your advice is waiting for you!",
                style: themeData.textTheme.headline1,
              ),*/
            )),
            SizedBox(
              height: 200,
              child: Center(
                child: CustomButton(),
              ),
            )
          ],
        ),
      ),
    );
  }
}