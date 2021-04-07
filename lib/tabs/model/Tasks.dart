import 'package:mostadam_flutter/core/base/BaseModel.dart';

class Tasks extends BaseModel<Tasks> {
  String message;
  bool success;
  Value value;
  int statusCode;
  String errorCode;
  String errors;

  Tasks(
      {this.message,
      this.success,
      this.value,
      this.statusCode,
      this.errorCode,
      this.errors});

  factory Tasks.fromJson(Map<String, dynamic> json) => Tasks(
        message: json['message'],
        success: json['success'],
        value: json['value'] != null ? new Value.fromJson(json['value']) : null,
        statusCode: json['statusCode'],
        errorCode: json['errorCode'],
        errors: json['errors'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.value != null) {
      data['value'] = this.value.toJson();
    }
    data['statusCode'] = this.statusCode;
    data['errorCode'] = this.errorCode;
    data['errors'] = this.errors;
    return data;
  }

  @override
  Tasks fromJson(Map<String, dynamic> json) {
    return Tasks.fromJson(json);
  }
}

class Value {
  List<Items> items;
  int pageNumber;
  int pageSize;
  int totalItemCount;

  Value({this.items, this.pageNumber, this.pageSize, this.totalItemCount});

  Value.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    totalItemCount = json['totalItemCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    data['totalItemCount'] = this.totalItemCount;
    return data;
  }
}

class Items {
  var id;
  var number;
  var processInstanceId;
  var requestTypeName;
  var requestStatusName;
  var requestStatusId;
  var createdBy;
  var createdOn;
  var updatedOn;
  var updatedBy;
  var processId;
  var typeId;
  var typeAliasName;
  OwnerDetails ownerDetails;
  var requestDate;
  var originatorName;
  var serialNumber;
  var activityName;
  var userName;
  var allocatedUser;
  var userFullName;
  var isDelegated;
  var delegatedFrom;
  var delegatedFromFullName;
  var activityId;
  var taskStateId;
  var numberCode;
  List<UserActions> userActions;
  ProjectDeatilsDTO projectDeatilsDTO;
  var lastUpdateDate;
  bool hasInspectionReport;
  var reportLastUpdateDate;

  Items(
      {this.id,
      this.number,
      this.processInstanceId,
      this.requestTypeName,
      this.requestStatusName,
      this.requestStatusId,
      this.createdBy,
      this.createdOn,
      this.updatedOn,
      this.updatedBy,
      this.processId,
      this.typeId,
      this.typeAliasName,
      this.ownerDetails,
      this.requestDate,
      this.originatorName,
      this.serialNumber,
      this.activityName,
      this.userName,
      this.allocatedUser,
      this.userFullName,
      this.isDelegated,
      this.delegatedFrom,
      this.delegatedFromFullName,
      this.activityId,
      this.taskStateId,
      this.numberCode,
      this.userActions,
      this.projectDeatilsDTO,
      this.lastUpdateDate,
      this.hasInspectionReport,
      this.reportLastUpdateDate});


  getCityName(){
    if(projectDeatilsDTO.rbProjectDTO != null)
      return projectDeatilsDTO.rbProjectDTO.cityName;
    else if(projectDeatilsDTO.individualProjectDTO != null)
      return projectDeatilsDTO.individualProjectDTO.cityName;
    else if(projectDeatilsDTO.developerProjectDTO != null)
      return projectDeatilsDTO.developerProjectDTO.cityName;
    else
      return "";
  }

  getQuarterName(){
    if(projectDeatilsDTO.rbProjectDTO != null)
      return projectDeatilsDTO.rbProjectDTO.quarterName;
    else if(projectDeatilsDTO.individualProjectDTO != null)
      return projectDeatilsDTO.individualProjectDTO.quarterName;
    else if(projectDeatilsDTO.developerProjectDTO != null)
      return projectDeatilsDTO.developerProjectDTO.quarterName;
    else
      return "";
  }

  getCost(){
    if(projectDeatilsDTO.rbProjectDTO != null)
      return projectDeatilsDTO.rbProjectDTO.estimatedCost;
    else if(projectDeatilsDTO.individualProjectDTO != null)
      return projectDeatilsDTO.individualProjectDTO.estimatedCost;
    else if(projectDeatilsDTO.developerProjectDTO != null)
      return projectDeatilsDTO.developerProjectDTO.projectModelDTO.last.estimatedCost;
    else
      return "";
  }

 double getLang(){
    if(projectDeatilsDTO.rbProjectDTO != null)
      return double.parse("${projectDeatilsDTO.rbProjectDTO.propertyLongitude}");
    else if(projectDeatilsDTO.individualProjectDTO != null)
      return double.parse("${projectDeatilsDTO.individualProjectDTO.propertyLongitude}");
    else if(projectDeatilsDTO.developerProjectDTO != null)
      return double.parse("${projectDeatilsDTO.developerProjectDTO.propertyLongitude}");
    else
      return 0.0;
  }

  double getLat(){
    if(projectDeatilsDTO.rbProjectDTO != null)
      return double.parse("${projectDeatilsDTO.rbProjectDTO.propertyLatitude}");
    else if(projectDeatilsDTO.individualProjectDTO != null)
      return double.parse("${projectDeatilsDTO.individualProjectDTO.propertyLatitude}");
    else if(projectDeatilsDTO.developerProjectDTO != null)
      return double.parse("${projectDeatilsDTO.developerProjectDTO.propertyLatitude}");
    else
      return 0.0;
  }

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    number = json['number'];
    processInstanceId = json['processInstanceId'];
    requestTypeName = json['requestTypeName'];
    requestStatusName = json['requestStatusName'];
    requestStatusId = json['requestStatusId'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
    updatedBy = json['updatedBy'];
    processId = json['processId'];
    typeId = json['typeId'];
    typeAliasName = json['typeAliasName'];
    ownerDetails = json['ownerDetails'] != null
        ? new OwnerDetails.fromJson(json['ownerDetails'])
        : null;
    requestDate = json['requestDate'];
    originatorName = json['originatorName'];
    serialNumber = json['serialNumber'];
    activityName = json['activityName'];
    userName = json['userName'];
    allocatedUser = json['allocatedUser'];
    userFullName = json['userFullName'];
    isDelegated = json['isDelegated'];
    delegatedFrom = json['delegatedFrom'];
    delegatedFromFullName = json['delegatedFromFullName'];
    activityId = json['activityId'];
    taskStateId = json['taskStateId'];
    numberCode = json['numberCode'];
    if (json['userActions'] != null) {
      userActions = new List<UserActions>();
      json['userActions'].forEach((v) {
        userActions.add(new UserActions.fromJson(v));
      });
    }
    projectDeatilsDTO = json['projectDeatilsDTO'] != null
        ? new ProjectDeatilsDTO.fromJson(json['projectDeatilsDTO'])
        : null;
    lastUpdateDate = json['lastUpdateDate'];
    hasInspectionReport = json['hasInspectionReport'];
    reportLastUpdateDate = json['reportLastUpdateDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['number'] = this.number;
    data['processInstanceId'] = this.processInstanceId;
    data['requestTypeName'] = this.requestTypeName;
    data['requestStatusName'] = this.requestStatusName;
    data['requestStatusId'] = this.requestStatusId;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['updatedOn'] = this.updatedOn;
    data['updatedBy'] = this.updatedBy;
    data['processId'] = this.processId;
    data['typeId'] = this.typeId;
    data['typeAliasName'] = this.typeAliasName;
    if (this.ownerDetails != null) {
      data['ownerDetails'] = this.ownerDetails.toJson();
    }
    data['requestDate'] = this.requestDate;
    data['originatorName'] = this.originatorName;
    data['serialNumber'] = this.serialNumber;
    data['activityName'] = this.activityName;
    data['userName'] = this.userName;
    data['allocatedUser'] = this.allocatedUser;
    data['userFullName'] = this.userFullName;
    data['isDelegated'] = this.isDelegated;
    data['delegatedFrom'] = this.delegatedFrom;
    data['delegatedFromFullName'] = this.delegatedFromFullName;
    data['activityId'] = this.activityId;
    data['taskStateId'] = this.taskStateId;
    data['numberCode'] = this.numberCode;
    if (this.userActions != null) {
      data['userActions'] = this.userActions.map((v) => v.toJson()).toList();
    }
    if (this.projectDeatilsDTO != null) {
      data['projectDeatilsDTO'] = this.projectDeatilsDTO.toJson();
    }
    data['lastUpdateDate'] = this.lastUpdateDate;
    data['hasInspectionReport'] = this.hasInspectionReport;
    data['reportLastUpdateDate'] = this.reportLastUpdateDate;
    return data;
  }
}

class OwnerDetails {
  var email;
  var phoneNumber;
  var fullName;

  OwnerDetails({this.email, this.phoneNumber, this.fullName});

  OwnerDetails.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['fullName'] = this.fullName;
    return data;
  }
}

class UserActions {
  var id;
  var actionName;
  var name;
  var isCommentsRequired;
  var isCommentsVisible;

  UserActions(
      {this.id,
      this.actionName,
      this.name,
      this.isCommentsRequired,
      this.isCommentsVisible});

  UserActions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    actionName = json['actionName'];
    name = json['name'];
    isCommentsRequired = json['isCommentsRequired'];
    isCommentsVisible = json['isCommentsVisible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['actionName'] = this.actionName;
    data['name'] = this.name;
    data['isCommentsRequired'] = this.isCommentsRequired;
    data['isCommentsVisible'] = this.isCommentsVisible;
    return data;
  }
}

class ProjectDeatilsDTO {
  RbProjectDTO rbProjectDTO;
  DeveloperProjectDTO developerProjectDTO;
  IndividualProjectDTO individualProjectDTO;

  ProjectDeatilsDTO(
      {this.rbProjectDTO, this.developerProjectDTO, this.individualProjectDTO});

  ProjectDeatilsDTO.fromJson(Map<String, dynamic> json) {
    rbProjectDTO = json['rbProjectDTO'] != null
        ? new RbProjectDTO.fromJson(json['rbProjectDTO'])
        : null;
    developerProjectDTO = json['developerProjectDTO'] != null
        ? new DeveloperProjectDTO.fromJson(json['developerProjectDTO'])
        : null;
    individualProjectDTO = json['individualProjectDTO'] != null
        ? new IndividualProjectDTO.fromJson(json['individualProjectDTO'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rbProjectDTO != null) {
      data['rbProjectDTO'] = this.rbProjectDTO.toJson();
    }
    if (this.developerProjectDTO != null) {
      data['developerProjectDTO'] = this.developerProjectDTO.toJson();
    }
    if (this.individualProjectDTO != null) {
      data['individualProjectDTO'] = this.individualProjectDTO.toJson();
    }
    return data;
  }
}

class RbProjectDTO {
  var stampingAttachmentFile;
  var licenseAttachmentFile;
  var buildingCompleteCertificateFile;
  var senderType;
  var licenseAttachmentId;
  var stampingAttachmentId;
  var buildingCompleteCertificateId;
  var inspectionItemId;
  var strAreaTypeId;
  var location;
  var number;
  var serialNumber;
  var ownerComments;
  var isAgreed;
  var projectName;
  var propertyTypeId;
  var area;
  var areaTypeId;
  var inspectionTypeId;
  var cityId;
  var cityName;
  var numberOfUnit;
  var quarterName;
  var streetName;
  var postalCode;
  var postalCodeSuffix;
  var propertyFullAddress;
  var propertyLatitude;
  var propertyLongitude;
  var apartmentNo;
  var isActive;
  var propertyNumber;
  var estimatedCost;
  var licenseNumber;
  var stampingNumber;
  var createdOn;
  var createdBy;
  List<ProjectInspectionDatesDTO> projectInspectionDatesDTO;
  List<RbProjectAttachments> rbProjectAttachments;

  RbProjectDTO(
      {this.stampingAttachmentFile,
      this.licenseAttachmentFile,
      this.buildingCompleteCertificateFile,
      this.senderType,
      this.licenseAttachmentId,
      this.stampingAttachmentId,
      this.buildingCompleteCertificateId,
      this.inspectionItemId,
      this.strAreaTypeId,
      this.location,
      this.number,
      this.serialNumber,
      this.ownerComments,
      this.isAgreed,
      this.projectName,
      this.propertyTypeId,
      this.area,
      this.areaTypeId,
      this.inspectionTypeId,
      this.cityId,
      this.cityName,
      this.numberOfUnit,
      this.quarterName,
      this.streetName,
      this.postalCode,
      this.postalCodeSuffix,
      this.propertyFullAddress,
      this.propertyLatitude,
      this.propertyLongitude,
      this.apartmentNo,
      this.isActive,
      this.propertyNumber,
      this.estimatedCost,
      this.licenseNumber,
      this.stampingNumber,
      this.createdOn,
      this.createdBy,
      this.projectInspectionDatesDTO,
      this.rbProjectAttachments});

  RbProjectDTO.fromJson(Map<String, dynamic> json) {
    stampingAttachmentFile = json['stampingAttachmentFile'];
    licenseAttachmentFile = json['licenseAttachmentFile'];
    buildingCompleteCertificateFile = json['buildingCompleteCertificateFile'];
    senderType = json['senderType'];
    licenseAttachmentId = json['licenseAttachmentId'];
    stampingAttachmentId = json['stampingAttachmentId'];
    buildingCompleteCertificateId = json['buildingCompleteCertificateId'];
    inspectionItemId = json['inspectionItemId'];
    strAreaTypeId = json['strAreaTypeId'];
    location = json['location'];
    number = json['number'];
    serialNumber = json['serialNumber'];
    ownerComments = json['ownerComments'];
    isAgreed = json['isAgreed'];
    projectName = json['projectName'];
    propertyTypeId = json['propertyTypeId'];
    area = json['area'];
    areaTypeId = json['areaTypeId'];
    inspectionTypeId = json['inspectionTypeId'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    numberOfUnit = json['numberOfUnit'];
    quarterName = json['quarterName'];
    streetName = json['streetName'];
    postalCode = json['postalCode'];
    postalCodeSuffix = json['postalCodeSuffix'];
    propertyFullAddress = json['propertyFullAddress'];
    propertyLatitude = json['propertyLatitude'];
    propertyLongitude = json['propertyLongitude'];
    apartmentNo = json['apartmentNo'];
    isActive = json['isActive'];
    propertyNumber = json['propertyNumber'];
    estimatedCost = json['estimatedCost'];
    licenseNumber = json['licenseNumber'];
    stampingNumber = json['stampingNumber'];
    createdOn = json['createdOn'];
    createdBy = json['createdBy'];
    if (json['projectInspectionDatesDTO'] != null) {
      projectInspectionDatesDTO = new List<ProjectInspectionDatesDTO>();
      json['projectInspectionDatesDTO'].forEach((v) {
        projectInspectionDatesDTO
            .add(new ProjectInspectionDatesDTO.fromJson(v));
      });
    }
    if (json['rbProjectAttachments'] != null) {
      rbProjectAttachments = new List<RbProjectAttachments>();
      json['rbProjectAttachments'].forEach((v) {
        rbProjectAttachments.add(new RbProjectAttachments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stampingAttachmentFile'] = this.stampingAttachmentFile;
    data['licenseAttachmentFile'] = this.licenseAttachmentFile;
    data['buildingCompleteCertificateFile'] =
        this.buildingCompleteCertificateFile;
    data['senderType'] = this.senderType;
    data['licenseAttachmentId'] = this.licenseAttachmentId;
    data['stampingAttachmentId'] = this.stampingAttachmentId;
    data['buildingCompleteCertificateId'] = this.buildingCompleteCertificateId;
    data['inspectionItemId'] = this.inspectionItemId;
    data['strAreaTypeId'] = this.strAreaTypeId;
    data['location'] = this.location;
    data['number'] = this.number;
    data['serialNumber'] = this.serialNumber;
    data['ownerComments'] = this.ownerComments;
    data['isAgreed'] = this.isAgreed;
    data['projectName'] = this.projectName;
    data['propertyTypeId'] = this.propertyTypeId;
    data['area'] = this.area;
    data['areaTypeId'] = this.areaTypeId;
    data['inspectionTypeId'] = this.inspectionTypeId;
    data['cityId'] = this.cityId;
    data['cityName'] = this.cityName;
    data['numberOfUnit'] = this.numberOfUnit;
    data['quarterName'] = this.quarterName;
    data['streetName'] = this.streetName;
    data['postalCode'] = this.postalCode;
    data['postalCodeSuffix'] = this.postalCodeSuffix;
    data['propertyFullAddress'] = this.propertyFullAddress;
    data['propertyLatitude'] = this.propertyLatitude;
    data['propertyLongitude'] = this.propertyLongitude;
    data['apartmentNo'] = this.apartmentNo;
    data['isActive'] = this.isActive;
    data['propertyNumber'] = this.propertyNumber;
    data['estimatedCost'] = this.estimatedCost;
    data['licenseNumber'] = this.licenseNumber;
    data['stampingNumber'] = this.stampingNumber;
    data['createdOn'] = this.createdOn;
    data['createdBy'] = this.createdBy;
    if (this.projectInspectionDatesDTO != null) {
      data['projectInspectionDatesDTO'] =
          this.projectInspectionDatesDTO.map((v) => v.toJson()).toList();
    }
    if (this.rbProjectAttachments != null) {
      data['rbProjectAttachments'] =
          this.rbProjectAttachments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectInspectionDatesDTO {
  var id;
  var requestProjectInspectionId;
  var inspectionDate;
  var timePeriodId;
  var isActive;
  var createdBy;
  var createdOn;
  var updatedBy;
  var updatedOn;

  ProjectInspectionDatesDTO(
      {this.id,
      this.requestProjectInspectionId,
      this.inspectionDate,
      this.timePeriodId,
      this.isActive,
      this.createdBy,
      this.createdOn,
      this.updatedBy,
      this.updatedOn});

  ProjectInspectionDatesDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    requestProjectInspectionId = json['requestProjectInspectionId'];
    inspectionDate = json['inspectionDate'];
    timePeriodId = json['timePeriodId'];
    isActive = json['isActive'];
    createdBy = json['createdBy'];
    createdOn = json['createdOn'];
    updatedBy = json['updatedBy'];
    updatedOn = json['updatedOn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['requestProjectInspectionId'] = this.requestProjectInspectionId;
    data['inspectionDate'] = this.inspectionDate;
    data['timePeriodId'] = this.timePeriodId;
    data['isActive'] = this.isActive;
    data['createdBy'] = this.createdBy;
    data['createdOn'] = this.createdOn;
    data['updatedBy'] = this.updatedBy;
    data['updatedOn'] = this.updatedOn;
    return data;
  }
}

class RbProjectAttachments {
  var id;
  var rbProjectId;
  var attachmentTypeId;
  var attachmentId;
  var createdOn;
  var createdBy;
  var updatedOn;
  var updatedBy;

  RbProjectAttachments(
      {this.id,
      this.rbProjectId,
      this.attachmentTypeId,
      this.attachmentId,
      this.createdOn,
      this.createdBy,
      this.updatedOn,
      this.updatedBy});

  RbProjectAttachments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rbProjectId = json['rbProjectId'];
    attachmentTypeId = json['attachmentTypeId'];
    attachmentId = json['attachmentId'];
    createdOn = json['createdOn'];
    createdBy = json['createdBy'];
    updatedOn = json['updatedOn'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rbProjectId'] = this.rbProjectId;
    data['attachmentTypeId'] = this.attachmentTypeId;
    data['attachmentId'] = this.attachmentId;
    data['createdOn'] = this.createdOn;
    data['createdBy'] = this.createdBy;
    data['updatedOn'] = this.updatedOn;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class DeveloperProjectDTO {
  var name;
  var nameEn;
  var number;
  var contractorName;
  var consultingOfficeName;
  var consultingOfficeLicenseNumber;
  var cityId;
  var cityName;
  var quarterName;
  var streetName;
  var postalCode;
  var postalCodeSuffix;
  var propertyFullAddress;
  var propertyNumber;
  var propertyLatitude;
  var propertyLongitude;
  var propertyDeveloperUserId;
  var propertyDeveloperDelegateUserId;
  var checkTypeId;
  var isActive;
  var serialNumber;
  var createdOn;
  var createdBy;
  var updatedOn;
  var updatedBy;
  List<ProjectModelDTO> projectModelDTO;

  DeveloperProjectDTO(
      {this.name,
      this.nameEn,
      this.number,
      this.contractorName,
      this.consultingOfficeName,
      this.consultingOfficeLicenseNumber,
      this.cityId,
      this.cityName,
      this.quarterName,
      this.streetName,
      this.postalCode,
      this.postalCodeSuffix,
      this.propertyFullAddress,
      this.propertyNumber,
      this.propertyLatitude,
      this.propertyLongitude,
      this.propertyDeveloperUserId,
      this.propertyDeveloperDelegateUserId,
      this.checkTypeId,
      this.isActive,
      this.serialNumber,
      this.createdOn,
      this.createdBy,
      this.updatedOn,
      this.updatedBy,
      this.projectModelDTO});

  DeveloperProjectDTO.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nameEn = json['nameEn'];
    number = json['number'];
    contractorName = json['contractorName'];
    consultingOfficeName = json['consultingOfficeName'];
    consultingOfficeLicenseNumber = json['consultingOfficeLicenseNumber'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    quarterName = json['quarterName'];
    streetName = json['streetName'];
    postalCode = json['postalCode'];
    postalCodeSuffix = json['postalCodeSuffix'];
    propertyFullAddress = json['propertyFullAddress'];
    propertyNumber = json['propertyNumber'];
    propertyLatitude = json['propertyLatitude'];
    propertyLongitude = json['propertyLongitude'];
    propertyDeveloperUserId = json['propertyDeveloperUserId'];
    propertyDeveloperDelegateUserId = json['propertyDeveloperDelegateUserId'];
    checkTypeId = json['checkTypeId'];
    isActive = json['isActive'];
    serialNumber = json['serialNumber'];
    createdOn = json['createdOn'];
    createdBy = json['createdBy'];
    updatedOn = json['updatedOn'];
    updatedBy = json['updatedBy'];
    if (json['projectModelDTO'] != null) {
      projectModelDTO = new List<ProjectModelDTO>();
      json['projectModelDTO'].forEach((v) {
        projectModelDTO.add(new ProjectModelDTO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['nameEn'] = this.nameEn;
    data['number'] = this.number;
    data['contractorName'] = this.contractorName;
    data['consultingOfficeName'] = this.consultingOfficeName;
    data['consultingOfficeLicenseNumber'] = this.consultingOfficeLicenseNumber;
    data['cityId'] = this.cityId;
    data['cityName'] = this.cityName;
    data['quarterName'] = this.quarterName;
    data['streetName'] = this.streetName;
    data['postalCode'] = this.postalCode;
    data['postalCodeSuffix'] = this.postalCodeSuffix;
    data['propertyFullAddress'] = this.propertyFullAddress;
    data['propertyNumber'] = this.propertyNumber;
    data['propertyLatitude'] = this.propertyLatitude;
    data['propertyLongitude'] = this.propertyLongitude;
    data['propertyDeveloperUserId'] = this.propertyDeveloperUserId;
    data['propertyDeveloperDelegateUserId'] =
        this.propertyDeveloperDelegateUserId;
    data['checkTypeId'] = this.checkTypeId;
    data['isActive'] = this.isActive;
    data['serialNumber'] = this.serialNumber;
    data['createdOn'] = this.createdOn;
    data['createdBy'] = this.createdBy;
    data['updatedOn'] = this.updatedOn;
    data['updatedBy'] = this.updatedBy;
    if (this.projectModelDTO != null) {
      data['projectModelDTO'] =
          this.projectModelDTO.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectModelDTO {
  var id;
  var projectId;
  var modelName;
  var numberOfUnits;
  var totalSurfaceArea;
  var estimatedCost;
  var details;
  var buildingSurfaceArea;
  var modelLicenseNumber;
  var stampingNumber;
  var constructionTechnologyId;
  var numberOfFloor;
  var modelTypeName;
  var stampingAttachmentId;
  var modelLicenseAttachmentId;
  var modelUnitDetailsAttachmentId;
  var isAgreed;
  var isActive;
  var createdOn;
  var createdBy;
  var updatedOn;
  var updatedBy;
  List<ProjectModelAttachmentDTO> projectModelAttachmentDTO;
  List<ModelUnitDetailsDTO> modelUnitDetailsDTO;

  ProjectModelDTO(
      {this.id,
      this.projectId,
      this.modelName,
      this.numberOfUnits,
      this.totalSurfaceArea,
      this.estimatedCost,
      this.details,
      this.buildingSurfaceArea,
      this.modelLicenseNumber,
      this.stampingNumber,
      this.constructionTechnologyId,
      this.numberOfFloor,
      this.modelTypeName,
      this.stampingAttachmentId,
      this.modelLicenseAttachmentId,
      this.modelUnitDetailsAttachmentId,
      this.isAgreed,
      this.isActive,
      this.createdOn,
      this.createdBy,
      this.updatedOn,
      this.updatedBy,
      this.projectModelAttachmentDTO,
      this.modelUnitDetailsDTO});

  ProjectModelDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['projectId'];
    modelName = json['modelName'];
    numberOfUnits = json['numberOfUnits'];
    totalSurfaceArea = json['totalSurfaceArea'];
    estimatedCost = json['estimatedCost'] ?? 0.0;
    details = json['details'];
    buildingSurfaceArea = json['buildingSurfaceArea']??0.0;
    modelLicenseNumber = json['modelLicenseNumber'];
    stampingNumber = json['stampingNumber'];
    constructionTechnologyId = json['constructionTechnologyId'];
    numberOfFloor = json['numberOfFloor'];
    modelTypeName = json['modelTypeName'];
    stampingAttachmentId = json['stampingAttachmentId'];
    modelLicenseAttachmentId = json['modelLicenseAttachmentId'];
    modelUnitDetailsAttachmentId = json['modelUnitDetailsAttachmentId'];
    isAgreed = json['isAgreed'];
    isActive = json['isActive'];
    createdOn = json['createdOn'];
    createdBy = json['createdBy'];
    updatedOn = json['updatedOn'];
    updatedBy = json['updatedBy'];
    if (json['projectModelAttachmentDTO'] != null) {
      projectModelAttachmentDTO = new List<ProjectModelAttachmentDTO>();
      json['projectModelAttachmentDTO'].forEach((v) {
        projectModelAttachmentDTO
            .add(new ProjectModelAttachmentDTO.fromJson(v));
      });
    }
    if (json['modelUnitDetailsDTO'] != null) {
      modelUnitDetailsDTO = new List<ModelUnitDetailsDTO>();
      json['modelUnitDetailsDTO'].forEach((v) {
        modelUnitDetailsDTO.add(new ModelUnitDetailsDTO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['projectId'] = this.projectId;
    data['modelName'] = this.modelName;
    data['numberOfUnits'] = this.numberOfUnits;
    data['totalSurfaceArea'] = this.totalSurfaceArea;
    data['estimatedCost'] = this.estimatedCost;
    data['details'] = this.details;
    data['buildingSurfaceArea'] = this.buildingSurfaceArea;
    data['modelLicenseNumber'] = this.modelLicenseNumber;
    data['stampingNumber'] = this.stampingNumber;
    data['constructionTechnologyId'] = this.constructionTechnologyId;
    data['numberOfFloor'] = this.numberOfFloor;
    data['modelTypeName'] = this.modelTypeName;
    data['stampingAttachmentId'] = this.stampingAttachmentId;
    data['modelLicenseAttachmentId'] = this.modelLicenseAttachmentId;
    data['modelUnitDetailsAttachmentId'] = this.modelUnitDetailsAttachmentId;
    data['isAgreed'] = this.isAgreed;
    data['isActive'] = this.isActive;
    data['createdOn'] = this.createdOn;
    data['createdBy'] = this.createdBy;
    data['updatedOn'] = this.updatedOn;
    data['updatedBy'] = this.updatedBy;
    if (this.projectModelAttachmentDTO != null) {
      data['projectModelAttachmentDTO'] =
          this.projectModelAttachmentDTO.map((v) => v.toJson()).toList();
    }
    if (this.modelUnitDetailsDTO != null) {
      data['modelUnitDetailsDTO'] =
          this.modelUnitDetailsDTO.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectModelAttachmentDTO {
  var id;
  var projectModelId;
  var attachemntId;
  var createdOn;
  var createdBy;
  var title;

  ProjectModelAttachmentDTO(
      {this.id,
      this.projectModelId,
      this.attachemntId,
      this.createdOn,
      this.createdBy,
      this.title});

  ProjectModelAttachmentDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectModelId = json['projectModelId'];
    attachemntId = json['attachemntId'];
    createdOn = json['createdOn'];
    createdBy = json['createdBy'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['projectModelId'] = this.projectModelId;
    data['attachemntId'] = this.attachemntId;
    data['createdOn'] = this.createdOn;
    data['createdBy'] = this.createdBy;
    data['title'] = this.title;
    return data;
  }
}

class ModelUnitDetailsDTO {
  var id;
  var projectId;
  var projectModelId;
  var unitSerialNumber;
  var unitNumber;
  var createdOn;
  var createdBy;
  var updatedOn;
  var updatedBy;

  ModelUnitDetailsDTO(
      {this.id,
      this.projectId,
      this.projectModelId,
      this.unitSerialNumber,
      this.unitNumber,
      this.createdOn,
      this.createdBy,
      this.updatedOn,
      this.updatedBy});

  ModelUnitDetailsDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['projectId'];
    projectModelId = json['projectModelId'];
    unitSerialNumber = json['unitSerialNumber'];
    unitNumber = json['unitNumber'];
    createdOn = json['createdOn'];
    createdBy = json['createdBy'];
    updatedOn = json['updatedOn'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['projectId'] = this.projectId;
    data['projectModelId'] = this.projectModelId;
    data['unitSerialNumber'] = this.unitSerialNumber;
    data['unitNumber'] = this.unitNumber;
    data['createdOn'] = this.createdOn;
    data['createdBy'] = this.createdBy;
    data['updatedOn'] = this.updatedOn;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class IndividualProjectDTO {
  var createdOn;
  var createdBy;
  var stampingNumber;
  var constructionTechnologyId;
  var numberOfFloor;
  var stampingAttachmentId;
  var totalSurfaceArea;
  var licenseAttachmentId;
  var propertyTypeId;
  var estimatedCost;
  var licenseNumber;
  var serialNumber;
  var location;
  var cityId;
  var cityName;
  var propertyLatitude;
  var propertyLongitude;
  var quarterName;
  var streetName;
  var postalCode;
  var postalCodeSuffix;
  var propertyFullAddress;
  var isActive;
  var propertyNumber;
  IndividualProjectDetailDTO individualProjectDetailDTO;

  IndividualProjectDTO(
      {this.createdOn,
      this.createdBy,
      this.stampingNumber,
      this.constructionTechnologyId,
      this.numberOfFloor,
      this.stampingAttachmentId,
      this.totalSurfaceArea,
      this.licenseAttachmentId,
      this.propertyTypeId,
      this.estimatedCost,
      this.licenseNumber,
      this.serialNumber,
      this.location,
      this.cityId,
      this.cityName,
      this.propertyLatitude,
      this.propertyLongitude,
      this.quarterName,
      this.streetName,
      this.postalCode,
      this.postalCodeSuffix,
      this.propertyFullAddress,
      this.isActive,
      this.propertyNumber,
      this.individualProjectDetailDTO});

  IndividualProjectDTO.fromJson(Map<String, dynamic> json) {
    createdOn = json['createdOn'];
    createdBy = json['createdBy'];
    stampingNumber = json['stampingNumber'];
    constructionTechnologyId = json['constructionTechnologyId'];
    numberOfFloor = json['numberOfFloor'];
    stampingAttachmentId = json['stampingAttachmentId'];
    totalSurfaceArea = json['totalSurfaceArea'];
    licenseAttachmentId = json['licenseAttachmentId'];
    propertyTypeId = json['propertyTypeId'];
    estimatedCost = json['estimatedCost'];
    licenseNumber = json['licenseNumber'];
    serialNumber = json['serialNumber'];
    location = json['location'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    propertyLatitude = json['propertyLatitude'];
    propertyLongitude = json['propertyLongitude'];
    quarterName = json['quarterName'];
    streetName = json['streetName'];
    postalCode = json['postalCode'];
    postalCodeSuffix = json['postalCodeSuffix'];
    propertyFullAddress = json['propertyFullAddress'];
    isActive = json['isActive'];
    propertyNumber = json['propertyNumber'];
    individualProjectDetailDTO = json['individualProjectDetailDTO'] != null
        ? new IndividualProjectDetailDTO.fromJson(
            json['individualProjectDetailDTO'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdOn'] = this.createdOn;
    data['createdBy'] = this.createdBy;
    data['stampingNumber'] = this.stampingNumber;
    data['constructionTechnologyId'] = this.constructionTechnologyId;
    data['numberOfFloor'] = this.numberOfFloor;
    data['stampingAttachmentId'] = this.stampingAttachmentId;
    data['totalSurfaceArea'] = this.totalSurfaceArea;
    data['licenseAttachmentId'] = this.licenseAttachmentId;
    data['propertyTypeId'] = this.propertyTypeId;
    data['estimatedCost'] = this.estimatedCost;
    data['licenseNumber'] = this.licenseNumber;
    data['serialNumber'] = this.serialNumber;
    data['location'] = this.location;
    data['cityId'] = this.cityId;
    data['cityName'] = this.cityName;
    data['propertyLatitude'] = this.propertyLatitude;
    data['propertyLongitude'] = this.propertyLongitude;
    data['quarterName'] = this.quarterName;
    data['streetName'] = this.streetName;
    data['postalCode'] = this.postalCode;
    data['postalCodeSuffix'] = this.postalCodeSuffix;
    data['propertyFullAddress'] = this.propertyFullAddress;
    data['isActive'] = this.isActive;
    data['propertyNumber'] = this.propertyNumber;
    if (this.individualProjectDetailDTO != null) {
      data['individualProjectDetailDTO'] =
          this.individualProjectDetailDTO.toJson();
    }
    return data;
  }
}

class IndividualProjectDetailDTO {
  var id;
  var structuralChartAttachmentId;
  var mechanicalChartAttachmentId;
  var electricalChartAttachmentId;
  var architecturalChartAttachmentId;
  var soilReportAttachmentId;
  var surveyReportAttachmentId;
  var isAgreed;

  IndividualProjectDetailDTO(
      {this.id,
      this.structuralChartAttachmentId,
      this.mechanicalChartAttachmentId,
      this.electricalChartAttachmentId,
      this.architecturalChartAttachmentId,
      this.soilReportAttachmentId,
      this.surveyReportAttachmentId,
      this.isAgreed});

  IndividualProjectDetailDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    structuralChartAttachmentId = json['structuralChartAttachmentId'];
    mechanicalChartAttachmentId = json['mechanicalChartAttachmentId'];
    electricalChartAttachmentId = json['electricalChartAttachmentId'];
    architecturalChartAttachmentId = json['architecturalChartAttachmentId'];
    soilReportAttachmentId = json['soilReportAttachmentId'];
    surveyReportAttachmentId = json['surveyReportAttachmentId'];
    isAgreed = json['isAgreed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['structuralChartAttachmentId'] = this.structuralChartAttachmentId;
    data['mechanicalChartAttachmentId'] = this.mechanicalChartAttachmentId;
    data['electricalChartAttachmentId'] = this.electricalChartAttachmentId;
    data['architecturalChartAttachmentId'] =
        this.architecturalChartAttachmentId;
    data['soilReportAttachmentId'] = this.soilReportAttachmentId;
    data['surveyReportAttachmentId'] = this.surveyReportAttachmentId;
    data['isAgreed'] = this.isAgreed;
    return data;
  }
}
