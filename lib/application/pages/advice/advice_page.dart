import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvvm/application/core/services/theme_services.dart';
import 'package:flutter_mvvm/application/core/widgets/custom_button.dart';
import 'package:flutter_mvvm/application/core/widgets/error_message.dart';
import 'package:flutter_mvvm/application/pages/advice/bloc/adviser_bloc.dart';
import 'package:flutter_mvvm/application/pages/advice/widgets/advice_field.dart';
import 'package:provider/provider.dart';

class AdvicerPageWrapperProvider extends StatelessWidget {
  const AdvicerPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdvicerBloc(),
      child: const AdvicerPage(),
    );
  }
}

class AdvicerPage extends StatelessWidget {
  const AdvicerPage({super.key});

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
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(
                child: Center(
                    child: BlocBuilder<AdvicerBloc, AdvicerState>(
                      builder: (context, state) {
                        if (state is AdviserInitial) {
                          return Text(
                            "Your advice is waiting for you!",
                            style: themeData.textTheme.headline1,
                          );
                        } else if (state is AdviserLoadingState) {
                          return CircularProgressIndicator(
                            color: themeData.colorScheme.secondary,
                          );
                        } else if (state is AdviserErrorState) {
                          return const ErrorMessage(
                              errorString: "Oops! Something went wrong!");
                        } else if (state is AdviserOnAdviceState) {
                          return AdviceField(
                            advice: state.advice,
                          );
                        } else if (state is AdviserErrorState) {
                          return ErrorMessage(
                              errorString: state.errorMessage
                          );
                        }
                        return const ErrorMessage(
                            errorString: "Oops! Something went wrong!");
                      },
                    )
                )
            ),

            const SizedBox(
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
