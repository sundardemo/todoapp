class Task {
  String? id;
  String title;
  String description;
  bool? isCompleted;

  Task({
    this.id,
    required this.title,
    required this.description,
    this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  @override
  String toString() {
    return 'Task{ title: $title, description: $description}';
  }
}
