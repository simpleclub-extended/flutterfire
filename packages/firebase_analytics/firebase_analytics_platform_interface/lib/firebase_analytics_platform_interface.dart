// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel_firebase_analytics.dart';

/// The interface that implementations of `firebase_analytics` must extend.
///
/// Platform implementations should extend this class rather than implement it
/// as `firebase_analytics` does not consider newly added methods to be breaking
/// changes. Extending this class (using `extends`) ensures that the subclass
/// will get the default implementation, while platform implementations that
/// `implements` this interface will be broken by newly added
/// [FirebaseAnalyticsPlatform] methods.
abstract class FirebaseAnalyticsPlatform extends PlatformInterface {
  FirebaseAnalyticsPlatform() : super(token: _token);

  static const Object _token = Object();

  static FirebaseAnalyticsPlatform? _instance;

  /// The current default [FirebaseAnalyticsPlatform] instance.
  ///
  /// It will always default to [MethodChannelFirebaseAnalytics]
  /// if no other implementation was provided.
  static FirebaseAnalyticsPlatform get instance {
    return _instance ??= MethodChannelFirebaseAnalytics();
  }

  /// Sets the [FirebaseAnalyticsPlatform.instance]
  static set instance(FirebaseAnalyticsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Logs the given event [name] with the given [parameters].
  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) {
    throw UnimplementedError('logEvent() is not implemented on this platform');
  }

  /// Sets whether analytics collection is enabled for this app.
  Future<void> setAnalyticsCollectionEnabled(bool enabled) {
    throw UnimplementedError(
        'setAnalyticsCollectionEnabled() is not implemented on this platform');
  }

  /// Sets the user id.
  Future<void> setUserId(String id) {
    throw UnimplementedError('setUserId() is not implemented on this platform');
  }

  /// Sets the current screen name, which specifies the current visual context
  /// in your app.
  Future<void> setCurrentScreen({
    required String screenName,
    String? screenClassOverride,
  }) {
    throw UnimplementedError(
        'setCurrentScreen() is not implemented on this platform');
  }

  /// Sets a user property to the given value.
  Future<void> setUserProperty({
    required String name,
    required String value,
  }) {
    throw UnimplementedError(
        'setUserProperty() is not implemented on this platform');
  }

  /// Clears all analytics data for this app from the device and resets the app
  /// instance id.
  Future<void> resetAnalyticsData() {
    throw UnimplementedError(
        'resetAnalyticsData() is not implemented on this platform');
  }

  /// Sets the duration of inactivity that terminates the current session.
  Future<void> setSessionTimeoutDuration(int milliseconds) {
    throw UnimplementedError(
        'setSessionTimeoutDuration() is not implemented on this platform');
  }
}
