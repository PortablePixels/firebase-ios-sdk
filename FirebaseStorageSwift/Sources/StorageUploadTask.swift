// Copyright 2022 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation

import FirebaseStorageObjC

/**
 * StorageUploadTask implements resumable uploads to a file in Firebase Storage.
 * Uploads can be returned on completion with a completion callback, and can be monitored
 * by attaching observers, or controlled by calling StorageTask#pause, StorageTask#resume,
 * or StorageTask#cancel.
 * Uploads can takeData in memory, or an URL to a file on disk.
 * Uploads are performed on a background queue, and callbacks are raised on the developer
 * specified callbackQueue in Storage, or the main queue if left unspecified.
 * Currently all uploads must be initiated and managed on the main queue.
 */
@objc(FIRStorageUploadTask) open class StorageUploadTask: StorageObservableTask,
  StorageTaskManagement {
  /**
   * Prepares a task and begins execution.
   */
  @objc open func enqueue() {
    (impl as! FIRIMPLStorageUploadTask).enqueue()
  }

  /**
   * Pauses a task currently in progress.
   */
  @objc open func pause() {
    (impl as! FIRIMPLStorageUploadTask).pause()
  }

  /**
   * Pauses a task currently in progress.
   */
  @objc open func cancel() {
    (impl as! FIRIMPLStorageUploadTask).cancel()
  }

  /**
   * Pauses a task currently in progress.
   */
  @objc open func resume() {
    (impl as! FIRIMPLStorageDownloadTask).resume()
  }

  internal init(_ impl: FIRIMPLStorageUploadTask) {
    super.init(impl: impl)
  }
}