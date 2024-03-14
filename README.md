![Icon](https://github.com/TaimurAyaz/AsyncPreview/assets/7026217/3e5bf21b-d81a-4e04-a35f-1c26639bd5fc)

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
