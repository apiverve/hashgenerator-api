/// Response models for the Hash Generator API.

/// API Response wrapper.
class HashgeneratorResponse {
  final String status;
  final dynamic error;
  final HashgeneratorData? data;

  HashgeneratorResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory HashgeneratorResponse.fromJson(Map<String, dynamic> json) => HashgeneratorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? HashgeneratorData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the Hash Generator API.

class HashgeneratorData {
  String? inputText;
  int? inputLength;
  List<String>? algorithmsUsed;
  HashgeneratorDataHashes? hashes;
  List<HashgeneratorDataHashDetailsItem>? hashDetails;
  List<String>? availableAlgorithms;

  HashgeneratorData({
    this.inputText,
    this.inputLength,
    this.algorithmsUsed,
    this.hashes,
    this.hashDetails,
    this.availableAlgorithms,
  });

  factory HashgeneratorData.fromJson(Map<String, dynamic> json) => HashgeneratorData(
      inputText: json['input_text'],
      inputLength: json['input_length'],
      algorithmsUsed: (json['algorithms_used'] as List?)?.cast<String>(),
      hashes: json['hashes'] != null ? HashgeneratorDataHashes.fromJson(json['hashes']) : null,
      hashDetails: (json['hash_details'] as List?)?.map((e) => HashgeneratorDataHashDetailsItem.fromJson(e)).toList(),
      availableAlgorithms: (json['available_algorithms'] as List?)?.cast<String>(),
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
  int? length;
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
