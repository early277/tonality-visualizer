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

---

### 💡 How to Use

1. Launch the app on your iPhone or iPad.  
2. Connect a MIDI keyboard or select a `.mid` file.  
3. Choose playback mode:  
   - **Play** — automatic playback of the MIDI file.  
   - **Trainer** — follow the displayed chord; proceed when you hit all notes.  
4. Toggle **Live Sound** to enable or mute built-in synth playback.  
5. Hide or show UI via the button.  

---

### ⚙️ Technology

- iOS (SwiftUI + WKWebView)  
- HTML5 + JavaScript (WebAudio / WebMIDI APIs)  
- CoreMIDI bridge for hardware input  
- Works fully offline — no data sent or stored  

---

### 📜 License

- Licensed under the **MIT License**.  
- You are free to use, modify, and distribute this software.  
- See [`LICENSE`](./LICENSE) for details.  
- Uses Apple system frameworks (WebKit, CoreMIDI, UniformTypeIdentifiers).


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

---

### 📱 特徴

| 機能 | 説明 |
|------|------|
| **MIDI入力** | CoreMIDIデバイスの信号をリアルタイムに表示 |
| **MIDIファイル再生** | .mid / .midi ファイル対応（Format 0/1） |
| **トレーナー** | 各和音を正確に押すと次のステップに進行 |
| **ライブ音声ON/OFF** | 入力音をアプリ内PolySynthで再生 |
| **最大回転速度** | 0.01〜100 rad/s（対数スライダー） |
| **ダンピング** | 1.000〜99.999 %/s（対数スライダー） |
| **トルク無効領域** | 除外側のみ+0.1°拡張 |
| **UIスケーリング** | iPhone/iPadで最適化（viewport対応） |

---

### 💡 使い方

1. アプリを起動します。  
2. MIDIキーボードを接続、または「MIDIファイルを選択」します。  
3. 再生モードを選びます：  
   - **再生**：ファイルの音を自動再生  
   - **トレーナー**：表示された和音を押して次へ進む練習モード  
4. **ライブ音声ON** を有効にすると、MIDI入力音をアプリ内で鳴らせます。  
5. UIは右上の「UI隠す／表示」で切り替え可能。  

---

### ⚙️ 技術構成

- iOS (SwiftUI + WKWebView)
- HTML5 / JavaScript / WebAudio / WebMIDI API (スタブ対応)
- CoreMIDI（ハードMIDI入力ブリッジ）
- 完全ローカル動作（ネット通信不要）

---

### 📜 ライセンス

- 本プロジェクトは **MIT License** で公開されています。  
- ソースコードの一部または全体を自由に利用・改変できます。  
- 詳細は [`LICENSE`](./LICENSE) を参照してください。  
- Appleのシステムフレームワーク（WebKit, CoreMIDI, UniformTypeIdentifiers）を使用しています。

---
