// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatClass _$ChatClassFromJson(Map<String, dynamic> json) => ChatClass(
      contents: (json['contents'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
      generationConfig: json['generationConfig'] == null
          ? null
          : GenerationConfig.fromJson(
              json['generationConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatClassToJson(ChatClass instance) => <String, dynamic>{
      'contents': instance.contents,
      'generationConfig': instance.generationConfig,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      role: json['role'] as String,
      parts: (json['parts'] as List<dynamic>?)
          ?.map((e) => Part.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'role': instance.role,
      'parts': instance.parts,
    };

Part _$PartFromJson(Map<String, dynamic> json) => Part(
      inlineData: json['inline_data'] == null
          ? null
          : InlineData.fromJson(json['inline_data'] as Map<String, dynamic>),
      text: json['text'] as String,
    );

Map<String, dynamic> _$PartToJson(Part instance) => <String, dynamic>{
      'inline_data': instance.inlineData,
      'text': instance.text,
    };

InlineData _$InlineDataFromJson(Map<String, dynamic> json) => InlineData(
      mimeType: json['mime_type'] as String,
      data: json['data'] as String,
    );

Map<String, dynamic> _$InlineDataToJson(InlineData instance) =>
    <String, dynamic>{
      'mime_type': instance.mimeType,
      'data': instance.data,
    };

GenerationConfig _$GenerationConfigFromJson(Map<String, dynamic> json) =>
    GenerationConfig(
      temperature: (json['temperature'] as num).toInt(),
      topK: (json['topK'] as num).toInt(),
      topP: (json['topP'] as num).toDouble(),
      maxOutputTokens: (json['maxOutputTokens'] as num).toInt(),
      responseMimeType: json['responseMimeType'] as String,
    );

Map<String, dynamic> _$GenerationConfigToJson(GenerationConfig instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'topK': instance.topK,
      'topP': instance.topP,
      'maxOutputTokens': instance.maxOutputTokens,
      'responseMimeType': instance.responseMimeType,
    };
