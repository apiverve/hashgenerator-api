/// Response models for the Hash Generator API.

/// API Response wrapper.
class HashgeneratorResponse {
  final String status;
  final dynamic error;
  final HashgeneratorData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  HashgeneratorResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory HashgeneratorResponse.fromJson(Map<String, dynamic> json) => HashgeneratorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? HashgeneratorData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Hash Generator API.

class HashgeneratorData {
  String? inputText;
  num? inputLength;
  List<String>? algorithmsUsed;
  HashgeneratorDataHashes? hashes;
  List<HashgeneratorDataHashDetailsItem>? hashDetails;

  HashgeneratorData({
    this.inputText,
    this.inputLength,
    this.algorithmsUsed,
    this.hashes,
    this.hashDetails,
  });

  factory HashgeneratorData.fromJson(Map<String, dynamic> json) => HashgeneratorData(
      inputText: json['input_text'],
      inputLength: json['input_length'],
      algorithmsUsed: (json['algorithms_used'] as List?)?.cast<String>(),
      hashes: json['hashes'] != null ? HashgeneratorDataHashes.fromJson(json['hashes']) : null,
      hashDetails: (json['hash_details'] as List?)?.map((e) => HashgeneratorDataHashDetailsItem.fromJson(e)).toList(),
    );
}

class HashgeneratorDataHashes {
  String? sha256;
  String? md5;

  HashgeneratorDataHashes({
    this.sha256,
    this.md5,
  });

  factory HashgeneratorDataHashes.fromJson(Map<String, dynamic> json) => HashgeneratorDataHashes(
      sha256: json['sha256'],
      md5: json['md5'],
    );
}

class HashgeneratorDataHashDetailsItem {
  String? algorithm;
  String? hash;
  num? length;
  String? uppercase;

  HashgeneratorDataHashDetailsItem({
    this.algorithm,
    this.hash,
    this.length,
    this.uppercase,
  });

  factory HashgeneratorDataHashDetailsItem.fromJson(Map<String, dynamic> json) => HashgeneratorDataHashDetailsItem(
      algorithm: json['algorithm'],
      hash: json['hash'],
      length: json['length'],
      uppercase: json['uppercase'],
    );
}

class HashgeneratorRequest {
  String text;
  String? algorithms;

  HashgeneratorRequest({
    required this.text,
    this.algorithms,
  });

  Map<String, dynamic> toJson() => {
      'text': text,
      if (algorithms != null) 'algorithms': algorithms,
    };
}
