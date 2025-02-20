import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatClass extends Equatable {
  const ChatClass({
    required this.contents,
    required this.generationConfig,
  });

  final List<Content>? contents;
  final GenerationConfig? generationConfig;

  factory ChatClass.fromJson(Map<String, dynamic> json) =>
      _$ChatClassFromJson(json);

  Map<String, dynamic> toJson() => _$ChatClassToJson(this);

  @override
  List<Object?> get props => [
        contents,
        generationConfig,
      ];
}

@JsonSerializable()
class Content extends Equatable {
  const Content({
    required this.role,
    required this.parts,
  });

  final String role;
  final List<Part>? parts;

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Map<String, dynamic> toJson() => _$ContentToJson(this);

  @override
  List<Object?> get props => [
        role,
        parts,
      ];
}

@JsonSerializable()
class Part extends Equatable {
  const Part({
    this.inlineData,
    required this.text,
  });

  @JsonKey(name: 'inline_data')
  final InlineData? inlineData;
  final String text;

  factory Part.fromJson(Map<String, dynamic> json) => _$PartFromJson(json);

  Map<String, dynamic> toJson() => _$PartToJson(this);

  @override
  List<Object?> get props => [
        inlineData,
        text,
      ];
}

@JsonSerializable()
class InlineData extends Equatable {
  const InlineData({
    required this.mimeType,
    required this.data,
  });

  @JsonKey(name: 'mime_type')
  final String mimeType;
  final String data;

  factory InlineData.fromJson(Map<String, dynamic> json) =>
      _$InlineDataFromJson(json);

  Map<String, dynamic> toJson() => _$InlineDataToJson(this);

  @override
  List<Object?> get props => [
        mimeType,
        data,
      ];
}

@JsonSerializable()
class GenerationConfig extends Equatable {
  const GenerationConfig({
    required this.temperature,
    required this.topK,
    required this.topP,
    required this.maxOutputTokens,
    required this.responseMimeType,
  });

  final int temperature;
  final int topK;
  final double topP;
  final int maxOutputTokens;
  final String responseMimeType;

  factory GenerationConfig.fromJson(Map<String, dynamic> json) =>
      _$GenerationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationConfigToJson(this);

  @override
  List<Object?> get props => [
        temperature,
        topK,
        topP,
        maxOutputTokens,
        responseMimeType,
      ];
}
