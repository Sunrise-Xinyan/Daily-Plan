class ExerciseRecord {
  final String id;
  final String date;
  final String exerciseType;
  final int duration;
  final String? notes;

  ExerciseRecord({
    required this.id,
    required this.date,
    required this.exerciseType,
    required this.duration,
    this.notes,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'exercise_type': exerciseType,
      'duration': duration,
      'notes': notes,
    };
  }

  factory ExerciseRecord.fromJson(Map<String, dynamic> json) {
    return ExerciseRecord(
      id: json['id'] ?? '',
      date: json['date'] ?? '',
      exerciseType: json['exercise_type'] ?? '',
      duration: json['duration'] ?? 0,
      notes: json['notes'],
    );
  }
}

class StudyRecord {
  final String id;
  final String date;
  final String subject;
  final int duration;
  final String? content;
  final int progress;
  final String? notes;

  StudyRecord({
    required this.id,
    required this.date,
    required this.subject,
    required this.duration,
    this.content,
    required this.progress,
    this.notes,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'subject': subject,
      'duration': duration,
      'content': content,
      'progress': progress,
      'notes': notes,
    };
  }

  factory StudyRecord.fromJson(Map<String, dynamic> json) {
    return StudyRecord(
      id: json['id'] ?? '',
      date: json['date'] ?? '',
      subject: json['subject'] ?? '',
      duration: json['duration'] ?? 0,
      content: json['content'],
      progress: json['progress'] ?? 0,
      notes: json['notes'],
    );
  }
}

class Statistics {
  final int totalExerciseDuration;
  final int totalStudyDuration;
  final int exerciseCount;
  final int studyCount;

  Statistics({
    required this.totalExerciseDuration,
    required this.totalStudyDuration,
    required this.exerciseCount,
    required this.studyCount,
  });
}
