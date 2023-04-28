import 'package:flutter/material.dart';



// Create a large colored text card
class BigCard extends StatelessWidget {
  const BigCard({
    Key? key,
    required this.words,        // Required variables are words, card color, and text color
    required this.card_color,
    required this.text_color,
  }) : super(key: key);

  final String words;
  final Color card_color;
  final Color text_color;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: text_color,
    );

    return Card(
      color: card_color,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: AnimatedSize(
          duration: Duration(milliseconds: 200),
          // Make sure that the compound word wraps correctly when the window
          // is too narrow.
          child: MergeSemantics(
            child: Wrap(
              children: [
                Text(
                  words,
                  textAlign: TextAlign.center,
                  style: style.copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// Create a large underlined textbox
class Subheader extends StatelessWidget {
  const Subheader({
    Key? key,
    required this.words, // Required variables are words
  }) : super(key: key);

  final String words;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(5),
      child: AnimatedSize(
        duration: Duration(milliseconds: 200),
        // Make sure that the compound word wraps correctly when the window
        // is too narrow.
        child: MergeSemantics(
          child: Wrap(
            children: [
              Text(
                words,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 28,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                  
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Create a variable textsize textbox
class Textbox extends StatelessWidget {
  const Textbox({
    Key? key,
    required this.words,      // Required variables are words and text size
    required this.text_size,
  }) : super(key: key);

  final String words;
  final double text_size;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(5),
      child: AnimatedSize(
        duration: Duration(milliseconds: 200),
        // Make sure that the compound word wraps correctly when the window
        // is too narrow.
        child: MergeSemantics(
          child: Wrap(
            children: [
              Text(
                words,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: text_size,
                  color: Colors.black,
                  
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Create a set of textboxes with variable text size, used for displaying Active Cases Lists
class ListCase_Text extends StatelessWidget {
  const ListCase_Text({
    Key? key,
    required this.victim_nametag,
    required this.case_datetag,
    required this.victim_agetag,
    required this.case_locationtag,
  }) : super(key: key);

  final String victim_nametag;
  final String case_datetag;
  final String victim_agetag;
  final String case_locationtag;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(5),
      child: AnimatedSize(
        duration: Duration(milliseconds: 200),
        // Make sure that the compound word wraps correctly when the window
        // is too narrow.
        child: MergeSemantics(
          child: Wrap(
            children: [
              Column(
                children: [
                  Textbox(words: victim_nametag, text_size: 18),
                  Textbox(words: case_locationtag, text_size: 14),
                  Textbox(words: case_datetag, text_size: 14),
                  Textbox(words: victim_agetag, text_size: 14),
      
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Create a set of textboxes with variable text size, used for displaying Case Updates Lists
class UpdateCase_Text extends StatelessWidget {
  const UpdateCase_Text({
    Key? key,
    required this.victim_nametag,
    required this.update_datetag,
    required this.update_messagetag,
  }) : super(key: key);

  final String victim_nametag;
  final String update_datetag;
  final String update_messagetag;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(5),
      child: AnimatedSize(
        duration: Duration(milliseconds: 200),
        // Make sure that the compound word wraps correctly when the window
        // is too narrow.
        child: MergeSemantics(
          child: Wrap(
            children: [
              Column(
                children: [
                  Textbox(words: victim_nametag, text_size: 18),
                  Textbox(words: update_datetag, text_size: 14),
                  Textbox(words: update_messagetag, text_size: 14),
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}