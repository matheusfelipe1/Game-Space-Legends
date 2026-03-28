class OrientationModel {
  final double vertical;
  final double verticalCached;
  final double horizontal;
  final double horizontalCached;

  OrientationModel({
    this.horizontal = 0.0,
    this.vertical = 0.0,
    this.horizontalCached = 0.0,
    this.verticalCached = 0.0,
  });

  double get inclinacao => horizontal;
  double get eixoX => inclinacao >= -0.2 && inclinacao <= 0.2
      ? 1.0
      : inclinacao > 0.2
      ? 200.0
      : -200.0;
  double get eixoY => vertical >= 0.1 ? 60 : -60;

  OrientationModel copyWith({
    double? vertical,
    double? verticalCached,
    double? horizontal,
    double? horizontalCached,
  }) {
    return OrientationModel(
      vertical: vertical ?? this.vertical,
      verticalCached: verticalCached ?? this.verticalCached,
      horizontal: horizontal ?? this.horizontal,
      horizontalCached: horizontalCached ?? this.horizontalCached,
    );
  }
}
