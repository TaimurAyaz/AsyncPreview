# AsyncPreview

Preview views with asynchronous dependencies, on Xcode canvas.

## Usage

```
#Preview {
    AsyncModel { model in
        SomeView().environment(model)
    } model: {
        try await SomeAsynchronousModel()
    }
}
```

## Installation

### Swift Package Manager
- On XCode, select `File` > `Add Package Dependencies...`
- Search for `https://github.com/TaimurAyaz/AsyncPreview.git`
- Add package
