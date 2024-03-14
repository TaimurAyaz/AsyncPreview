![Icon](https://github.com/TaimurAyaz/AsyncPreview/assets/7026217/1496833c-2c83-460e-a026-e5a0469db4bb)

## AsyncPreview
Preview views with asynchronous dependencies, on Xcode canvas.

### Usage

```
#Preview {
    AsyncModel { model in
        SomeView().environment(model)
    } model: {
        try await SomeAsynchronousModel()
    }
}
```

### Installation

#### Swift Package Manager
- On XCode, select `File` > `Add Package Dependencies...`
- Search for `https://github.com/TaimurAyaz/AsyncPreview.git`
- Add package
