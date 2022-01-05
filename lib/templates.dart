import 'package:check_it/model/template.dart';
import 'package:check_it/model/this_or_that.dart';
import 'package:check_it/screens/templates/template_1.dart';
import 'package:check_it/screens/templates/template_2.dart';

List<Template> templates = [
  Template1(
    preview: 'images/template1.png',
    title: "Which do you prefer?",
    thisOrThatvalues: [
      ThisOrThat(
        thisText: "Whatsapp",
        thatText: "Telegram",
      ),
      ThisOrThat(
        thisText: "Tiktok",
        thatText: "Instagram Reels",
      ),
      ThisOrThat(
        thisText: "PES",
        thatText: "FIFA",
      ),
      ThisOrThat(
        thisText: "Netflix",
        thatText: "HBO",
      ),
      ThisOrThat(
        thisText: "Spotify",
        thatText: "Apple Music",
      ),
      ThisOrThat(
        thisText: "Marvel Characters",
        thatText: "Disney Characters",
      ),
      ThisOrThat(
        thisText: "Indoor Games",
        thatText: "Outdoor Games",
      ),
    ],
  ),
  const Template2(
    title: "Tech Journey Checklist",
    preview: "images/template2.png",
    availableOptions: [
      "Used StackOverflow",
      "Used Github",
      "Opened Figma",
      "Installed Xampp",
      "Called a mentor for a bug",
      "Used Slack",
      "Attended an interview",
      "'Para' for an inteviewer",
      "Got selected for a job",
      "Attended devfest",
      "Joined a Twitter space on Tech",
      "Fought with your designer/developer"
    ],
  )
];
