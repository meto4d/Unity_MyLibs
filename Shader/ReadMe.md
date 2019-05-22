# Unity Shader
----

### Overview
某プロジェクトで使うUnity向けのShaderLab関係がまとまっています。

基本的に習作の読みにくいコードだったり、テンプレや拡張性を残したまま放置しています。

# [Macedonia](./Macedonia/)
通称マケドニア国旗のUnity用Shader  
赤とか黄色とかが回転する例のあれ  
詳細は[Macedonia](./Macedonia/)を見てください

# [color.cginc](./color.cginc)
個人的に使っていたUnity用ShaderLabのヘッダ  
主にRGB←→HSV変換で使っています  
Gitにあげるに従ってHSVだけじゃなくHSL変換も入れたけどちゃんと動くかどうかは一切チェックしてない<s>9割暗算で実装したし多分動かん</s>  
RGB→HSV変換ではlerp使ったりして<s>多分</s>最適化しているが、
HSV→RGB変換ではswitch文使ってるのであまりこだわってない。

## Author

[meto4d](https://github.com/meto4d)
