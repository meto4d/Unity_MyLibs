Vector3 Cpp for Unity
====

Overview

某プロジェクトで使うために1時間ぐらいで作ったCppで使えるUnityのVector3と互換性のあるクラス．

検索しても，ヘッダとかを見つけることができなかったため，自力実装しました．

先駆者はいるはずです．

UnityのVector3をDLLを介して相互的にデータをやり取りする時に，直接このクラスで作られたポインタに放り込めばそのまま使えます．

UnityのVector3にて使うクラス関数や静的変数をCpp上からでも簡単に使えるようにしています．

すべてのクラス関数や静的変数は宣言できていないかと思います．

これ自体は大それたことはしてません．


## その他

とりあえず，でgitにあげました．

いつか，綺麗にまとめてサンプルコードとかもつけようと思います．

## 簡単な使い方

 Unityで使うDLLのCppに，このvector3f_for_unity.cppとvector3f_for_unity.hを追加して，vector3f_for_unityを適宜includeすれば使えます．
 Unityから使うためには，そのまま変数を関数の引数にするか，C#上でGCHandleでボックス化すれば配列そのままIntPtrで送れます．

 詳しい使い方は後日…

## Description

## Demo

## VS. 

## Requirement

## Usage

## Install

## Contribution

## Licence

## [MIT](https://github.com/meto4d/)

## Author

[meto4d](https://github.com/meto4d)
