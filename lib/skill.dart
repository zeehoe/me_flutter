class Skill {
  String title;
  int experienceYear;

// the { } us optional named parameters. Since title and expeirienceYear cannot be null, we add a required keyword here
  Skill({required this.title, required this.experienceYear}) {}
}
