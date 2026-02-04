import 'package:flutter/material.dart';
import '../models/models.dart';

class DataProvider with ChangeNotifier {
  final List<ExerciseRecord> _exerciseRecords = [];
  final List<StudyRecord> _studyRecords = [];
  
  List<ExerciseRecord> get exerciseRecords => _exerciseRecords;
  List<StudyRecord> get studyRecords => _studyRecords;
  
  Statistics get todayStats {
    final today = DateTime.now().toIso8601String().split('T')[0];
    
    final todayExercises = _exerciseRecords.where((r) => r.date == today).toList();
    final todayStudies = _studyRecords.where((r) => r.date == today).toList();
    
    return Statistics(
      totalExerciseDuration: todayExercises.fold(0, (sum, r) => sum + r.duration),
      totalStudyDuration: todayStudies.fold(0, (sum, r) => sum + r.duration),
      exerciseCount: todayExercises.length,
      studyCount: todayStudies.length,
    );
  }

  void addExerciseRecord(ExerciseRecord record) {
    _exerciseRecords.insert(0, record);
    notifyListeners();
  }

  void deleteExerciseRecord(String id) {
    _exerciseRecords.removeWhere((r) => r.id == id);
    notifyListeners();
  }

  void addStudyRecord(StudyRecord record) {
    _studyRecords.insert(0, record);
    notifyListeners();
  }

  void deleteStudyRecord(String id) {
    _studyRecords.removeWhere((r) => r.id == id);
    notifyListeners();
  }
}
