/// Этот репозиторий содержит только лабораторную работу 3.
enum LabStage { lab3 }

extension LabStageFeatures on LabStage {
  bool get usesApiList => false;
  bool get usesApiDetails => false;
  bool get hasDetails => true;
}
