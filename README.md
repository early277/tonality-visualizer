## 🌍 English Version

### 🎵 Overview

**Tonality Visualizer** is a polar pitch visualizer that maps musical notes onto a rotating circular plane.
It reacts to **MIDI input** or **MIDI files**, allowing you to *see* harmony and pitch motion intuitively.

- **MIDI Input** — visualize notes in real time from any CoreMIDI device.
- **MIDI File Playback** — load `.mid` files and watch the tonal motion.
- **Trainer Mode** — practice chord-by-chord; advance when you play all target notes.
- **Live Sound Option** — toggle on/off the built-in WebAudio synth for live MIDI playback.
- **Physics-Based Disk** — the disk rotates according to tonal balance.
- **Customizable UI** — toggle visibility, anchor (water/disk), bilingual JP/EN, opacity, etc.
- **Damping & Max Rotation Speed** — both adjustable on a **logarithmic scale** for precise control.

### 🚀 Getting Started

The repository contains the SwiftUI source and bundled web assets used by the iOS app.
To build the app on macOS:

1. Create a new **iOS App (SwiftUI)** project in Xcode 15 or later named `Tonality Visualizer`.
2. Replace the generated Swift files with the ones from the `Tonality Visualizer/` directory and add `index.html` plus `sample.mid` to the app bundle (make sure they are included in the target).
3. Build and run on an iOS 15+ device or simulator. The bundled HTML is loaded locally, so no network access is required.

For quick experimentation in a desktop browser, open `Tonality Visualizer/index.html` directly. (CoreMIDI features require the native iOS bridge and will be stubbed when running in a browser.)

### 💡 How to Use

1. Launch the app on your iPhone or iPad.
2. Connect a MIDI keyboard or select a `.mid` file.
3. Choose playback mode:
   - **Play** — automatic playback of the MIDI file.
   - **Trainer** — follow the displayed chord; proceed when you hit all notes.
4. Toggle **Live Sound** to enable or mute built-in synth playback.
5. Hide or show UI via the button.

### ⚙️ Technology

- iOS (SwiftUI + WKWebView)
- HTML5 + JavaScript (WebAudio / WebMIDI APIs)
- CoreMIDI bridge for hardware input
- Works fully offline — no data sent or stored

### 📁 Repository Structure

```
Tonality Visualizer/
├── *.swift     # SwiftUI entry points and WebView bridge
├── index.html  # Polar pitch visualizer implemented in HTML/JS
└── sample.mid  # Example MIDI file loaded on first launch
```

### 📜 License

- Licensed under the **MIT License**.
- You are free to use, modify, and distribute this software.
- See [`LICENSE`](./LICENSE) for details.
- Uses Apple system frameworks (WebKit, CoreMIDI, UniformTypeIdentifiers).

---

## 🇯🇵 日本語版

### 🎵 概要

**Tonality Visualizer** は、音の高さ（ピッチ）を円形の世界にマッピングし、
**MIDI入力**や**MIDIファイル**に反応して動く音楽ビジュアライザーです。
音楽理論を知らなくても、音の動きや和音の関係を「見る」ことができます。

- **MIDI入力対応**：MIDIキーボードや外部デバイスの演奏をリアルタイムに可視化
- **MIDIファイル対応**：ファイルを再生して音の流れを表示
- **トレーナーモード**：和音ごとに順に練習できる「モグラたたき」式トレーニング
- **ライブ音声ON/OFF**：MIDI入力をアプリ内シンセで鳴らすか選択可能
- **物理ベースの回転円盤**：音の配置バランスでディスクが回転
- **UI調整**：UI表示/非表示、日本語・英語切替、水面固定／ディスク固定など
- **ダンピング／最大速度**：どちらも**対数目盛**で設定（微調整が容易）

### 🚀 始め方

本リポジトリには iOS アプリで使用している SwiftUI コードと Web アセットが含まれています。
iOS アプリとしてビルドする手順は以下のとおりです。

1. Xcode 15 以降で **iOS App (SwiftUI)** プロジェクトを作成し、プロジェクト名を `Tonality Visualizer` にします。
2. 生成された Swift ファイルを `Tonality Visualizer/` フォルダ内のファイルに置き換え、`index.html` と `sample.mid` をターゲットに追加します。
3. iOS 15 以上の実機またはシミュレータでビルド・実行します。HTML はローカルに読み込まれるためネット接続は不要です。

ブラウザで挙動を確認したい場合は、`Tonality Visualizer/index.html` を直接開いてください（この場合 CoreMIDI 連携はスタブ化されます）。

### 💡 使い方

1. アプリを起動します。
2. MIDIキーボードを接続、または「MIDIファイルを選択」します。
3. 再生モードを選びます：
   - **再生**：ファイルの音を自動再生
   - **トレーナー**：表示された和音を押して次へ進む練習モード
4. **ライブ音声ON** を有効にすると、MIDI入力音をアプリ内で鳴らせます。
5. UIは右上の「UI隠す／表示」で切り替え可能。

### ⚙️ 技術構成

- iOS (SwiftUI + WKWebView)
- HTML5 / JavaScript / WebAudio / WebMIDI API（スタブ対応）
- CoreMIDI（ハードMIDI入力ブリッジ）
- 完全ローカル動作（ネット通信不要）

### 📁 フォルダ構成

```
Tonality Visualizer/
├── *.swift     # SwiftUI エントリポイントと WebView ブリッジ
├── index.html  # HTML/JS で実装した円環ピッチ・ビジュアライザー
└── sample.mid  # 初回起動時に読み込まれるサンプル MIDI ファイル
```

### 📜 ライセンス

- 本プロジェクトは **MIT License** で公開されています。
- ソースコードの一部または全体を自由に利用・改変できます。
- 詳細は [`LICENSE`](./LICENSE) を参照してください。
- Apple のシステムフレームワーク（WebKit, CoreMIDI, UniformTypeIdentifiers）を使用しています。

---
