![GitHub Cards Preview](https://github.com/romagornostay/TrackDowloadProgress.swiftpm/blob/main/coverDowload.png)

#### Simple one-page application that demonstrates works URLSessionDownloadDelegate and how you can get data about file download, a picture for example. 

## [URLSessionDownloadDelegate](https://developer.apple.com/documentation/foundation/URLSessionDownloadDelegate) 

```swift
func urlSession(URLSession, downloadTask: URLSessionDownloadTask, didWriteData: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64)
```
Periodically informs the delegate about the download’s progress

```swift
// Downloaded in KB
let written = totalBytesWritten.formatToString()
        
// Total size in KB
let expected = totalBytesExpectedToWrite.formatToString()
        
// Total progress
let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
```
where *func formatToString()* extension fot *Int64*

```swift
extension Int64 {
    func formatToString() -> String {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = [.useKB, .useMB]
        return formatter.string(fromByteCount: self)
    }
}
```

