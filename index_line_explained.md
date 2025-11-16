# 行ごとの読み下し解説（index (41).html）

| 行 | コード | 読み下し |
|---:|---|---|
| 1 | `<!-- Copyright (c) 2025 Yusuke Yoshida — MIT License` | このファイルの著作権とMITライセンスについてのメモです |
| 2 | `-->` |  |
| 3 | `<!doctype html>` | この文書がHTML5形式で書かれていることを宣言しています |
| 4 | `<meta charset="utf-8">` | 文字コードをUTF-8にして、日本語などを正しく表示できるようにします |
| 5 | `<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">` | 画面幅に合わせて表示を調整し、スマホでも見やすくする設定です |
| 6 | `` |  |
| 7 | `<title>Polar Pitch Map — Disk physics, MIDI In + MIDI File</title>` | ブラウザのタブに表示するページタイトルを設定しています |
| 8 | `<style>` | ここからページ全体の見た目（スタイル）を指定する部分です |
| 9 | `  html,body{margin:0;height:100%;background:#111;color:#ddd;font:14px system-ui}` | ページ全体の余白や背景色、文字色、文字の大きさと書体を決めています |
| 10 | `  :root{ --ui-scale:1; }` | ルート要素に『--ui-scale』という拡大率の変数を1で用意しています |
| 11 | `  #ui{position:fixed;top:75px;left:8px;gap:12px;display:flex;flex-wrap:wrap;align-items:center;z-index:2;` | id『ui』のボックスを画面左上寄りに固定表示し、並びや重なり順を決めています |
| 12 | `       transform-origin:top left; transform:scale(var(--ui-scale));}` | 『ui』の拡大の基準を左上にし、『--ui-scale』の値で拡大率を変えます |
| 13 | `  canvas{display:block;width:100vw;height:100vh}` | canvas要素を画面いっぱいに広げ、ブロックとして表示するようにしています |
| 14 | `  label{display:flex;gap:6px;align-items:center}` | labelを横並びの箱にして、中身の間隔と縦位置をそろえています |
| 15 | `  input[type=range]{width:180px}` | スライダー入力（range）の横幅を180ピクセルに固定しています |
| 16 | `  button,select{padding:6px 10px}` | ボタンとプルダウンの内側に余白をつけて押しやすくしています |
| 17 | `  .sep{width:1px;height:22px;background:#444;margin:0 4px}` | .sep要素を細い縦線にして、UIの区切り線として使えるようにします |
| 18 | `` |  |
| 19 | `  /* UI show/hide トグル */` | UIの表示・非表示を切り替えるボタンに関する説明コメントです |
| 20 | `  #uiToggle{position:fixed;top:50px;right:8px;z-index:3;opacity:0.8}` | id『uiToggle』ボタンを画面右上付近に固定し、やや透明にしています |
| 21 | `  #uiToggle:hover{opacity:1}` | ボタンにマウスを乗せたとき、不透明にしてはっきり見せます |
| 22 | `</style>` | スタイル指定の終わりを示しています |
| 23 | `` |  |
| 24 | `<button id="uiToggle" aria-pressed="false">UI隠す</button>` | UIを隠す・表示するためのボタンを用意し、状態をaria-pressedで示します |
| 25 | `` |  |
| 26 | `<div id="ui">` | 全ての操作パネルをまとめるコンテナ『ui』を作ります |
| 27 | `  <!-- language -->` | ここから言語切り替えのUI部分であることを示すコメントです |
| 28 | `  <label id="langWrap" data-lbl="language">` | 言語のラベル用の枠で、説明用の名前をdata-lblで付けています |
| 29 | `    <select id="lang">` | 言語を選ぶためのプルダウンメニューを用意しています |
| 30 | `      <option value="en">English</option>` | プルダウンに英語（en）を選択肢として追加しています |
| 31 | `      <option value="ja" selected>日本語</option>` | 日本語（ja）を選択肢にし、初期状態で選ばれるようにしています |
| 32 | `    </select>` | 言語プルダウンの中身の定義をここで終えています |
| 33 | `  </label>` | 言語選択を包むlabelの終わりです |
| 34 | `` |  |
| 35 | `  <button id="resetSettings" type="button">初期設定に戻す</button>` | 設定をすべて初期状態に戻すためのボタンを設置しています |
| 36 | `` |  |
| 37 | `  <!-- anchor: 水面固定 or ディスク固定 -->` | ここからアンカー（基準を水面かディスクか）の設定の説明コメントです |
| 38 | `  <label id="anchorWrap" data-lbl="anchor">` | アンカー切り替え用のラベル枠で、data-lblで種類名を付けています |
| 39 | `    <select id="anchor">` | 水面固定かディスク固定かを選ぶプルダウンを用意しています |
| 40 | `      <option value="water">水面固定</option>` | アンカーを『水面固定』にする選択肢を追加しています |
| 41 | `      <option value="disk">ディスク固定</option>` | アンカーを『ディスク固定』にする選択肢を追加しています |
| 42 | `    </select>` | アンカー用プルダウンの定義をここで閉じています |
| 43 | `  </label>` | アンカー設定を包むlabelの終わりです |
| 44 | `` |  |
| 45 | `  <!-- MIDI inputs（常時） -->` | ここから常に有効なMIDI入力装置の設定についてのコメントです |
| 46 | `  <label id="devWrap" data-lbl="device">` | 使用するMIDIデバイスを選ぶラベル枠で、data-lblに名前を付けています |
| 47 | `    <select id="midiDev"></select>` | 実際のMIDIデバイス一覧を入れるプルダウンを用意しています（中身は後で追加） |
| 48 | `  </label>` | MIDIデバイス選択のlabelをここで閉じています |
| 49 | `  <label id="allWrap" data-lbl="allInputs">` | すべてのMIDI入力を対象にするかどうかのラベル枠です |
| 50 | `    <input id="midiAll" type="checkbox" checked>` | 『midiAll』チェックボックスで全入力を使うかを選び、初期状態でオンにします |
| 51 | `  </label>` | 全入力チェックのlabelをここで閉じています |
| 52 | `` |  |
| 53 | `  <!-- ライブ入力の音声再生ON/OFF -->` | ここからライブ入力の音を鳴らすかどうかの設定コメントです |
| 54 | `  <label id="liveMonWrap" data-lbl="liveSound">` | ライブ音声監視のラベル枠で、data-lblに『liveSound』と名前を付けています |
| 55 | `    <input id="liveMon" type="checkbox" checked>` | 『liveMon』チェックボックスでライブ入力の音再生ON/OFFを選びます（初期ON） |
| 56 | `  </label>` | ライブ音声のlabelをここで閉じています |
| 57 | `` |  |
| 58 | `  <!-- torque scope -->` | ここからトルク表示（torque scope）の設定であることを示すコメントです |
| 59 | `  <label id="excludeWrap" data-lbl="torqueExclude">` | トルクの除外表示方法を選ぶラベル枠で、data-lblに名前を付けています |
| 60 | `    <select id="exclude">` | トルク表示の塗りつぶし方法を選ぶプルダウンを用意しています |
| 61 | `      <option value="filled">塗りつぶし</option>` | トルク領域を塗りつぶして表示する選択肢です |
| 62 | `      <option value="unfilled" selected>非塗りつぶし</option>` | トルク領域を線だけで表示する選択肢で、初期状態になっています |
| 63 | `    </select>` | トルクの表示方法プルダウンをここで閉じています |
| 64 | `  </label>` | トルク表示設定のlabelを閉じています |
| 65 | `` |  |
| 66 | `  <!-- ω max（対数目盛：0.01〜100 rad/s） -->` | ここから最大角速度ωの設定（0.01〜100 rad/sの対数スケール）についてのコメントです |
| 67 | `  <label id="omaxWrap" data-lbl="omegaMax">` | ωの上限を変えるスライダーのラベル枠で、data-lblに名前を付けています |
| 68 | `    <input id="omegaMax" type="range" min="-2" max="2" step="0.01" value="0.301" list="omTicks">` | 『omegaMax』スライダーでω上限を対数値で調整できるようにしています |
| 69 | `    <datalist id="omTicks">` | ωスライダーの目盛り候補を定義する箱（datalist）を用意しています |
| 70 | `      <option value="-2"><option value="-1"><option value="0"><option value="1"><option value="2">` | ω上限のスライダー用に-2〜2までの目盛りを5段階で示しています |
| 71 | `    </datalist>` | ωの目盛り用datalistの定義をここで閉じています |
| 72 | `    <span id="omegaMaxVal">2.00 rad/s</span>` | 現在のω上限の値を文字『2.00 rad/s』として表示する場所です |
| 73 | `  </label>` | ω上限設定用のlabelをここで閉じています |
| 74 | `` |  |
| 75 | `  <!-- damping（比例：0〜99 %/s） -->` | ここから減衰率（0〜99 %/s）の設定についてのコメントです |
| 76 | `  <label id="dampWrap" data-lbl="damping">` | 減衰率のスライダーをまとめるラベル枠で、data-lblを設定しています |
| 77 | `    <input id="damp" type="range" min="0" max="99" step="0.001" value="99" list="dampTicks">` | 『damp』スライダーで減衰率を細かく0〜99の間で調整できるようにします |
| 78 | `    <datalist id="dampTicks">` | 減衰率スライダーの目盛り候補をまとめるdatalistです |
| 79 | `      <option value="0"><option value="25"><option value="50"><option value="75"><option value="99">` | 減衰率の目安として0,25,50,75,99の位置に目盛りを置いています |
| 80 | `    </datalist>` | 減衰率用datalistの定義をここで閉じています |
| 81 | `    <span id="dampVal">99.000%/s</span>` | 現在の減衰率を『99.000%/s』として表示する部分です |
| 82 | `  </label>` | 減衰率設定のlabelをここで閉じています |
| 83 | `` |  |
| 84 | `  <!-- snap ω when α=0 -->` | α=0のときに角速度ωを一定にするかどうかの設定コメントです |
| 85 | `  <label id="snapAlphaWrap" data-lbl="snapZeroAlpha">` | この設定用のラベル枠で、『snapZeroAlpha』という名前を持たせています |
| 86 | `    <input id="snapAlpha" type="checkbox" checked>` | 『snapAlpha』チェックでα=0のときωを「吸着」させるかどうかを切り替えます |
| 87 | `  </label>` | αスナップ設定のlabelをここで閉じています |
| 88 | `` |  |
| 89 | `  <!-- UI opacity -->` | ここからUIの透明度を変える設定に関するコメントです |
| 90 | `  <label id="uiopWrap" data-lbl="uiOpacity">` | UIの透明度スライダーをまとめるラベル枠で、data-lblを設定しています |
| 91 | `    <input id="uiop" type="range" min="10" max="100" step="1" value="85">` | 『uiop』スライダーでUIの透明度を10〜100%の間で調整します |
| 92 | `    <span id="uiopVal">85%</span>` | 現在のUI透明度を『85%』として表示する部分です |
| 93 | `  </label>` | UI透明度設定のlabelをここで閉じています |
| 94 | `` |  |
| 95 | `  <!-- disk physics -->` | ここからディスクの物理特性（disk physics）の設定コメントです |
| 96 | `  <label id="massWrap" data-lbl="diskMass">` | ディスク質量Mを調整するスライダーのラベル枠で、data-lblを付けています |
| 97 | `    <input id="mass" type="range" min="-2" max="2" step="0.001" value="-0.431">` | 『mass』スライダーで対数的にディスクの質量パラメータを変えられるようにします |
| 98 | `    <span id="massVal">M=0.37</span>` | 現在の質量パラメータを『M=0.37』として表示する部分です |
| 99 | `  </label>` | 質量設定用のlabelをここで閉じています |
| 100 | `` |  |
| 101 | `  <label id="lowCutWrap" data-lbl="lowCut">` | 低音側のカット量を設定するスライダー用ラベル枠で、data-lblを付けています |
| 102 | `    <input id="lowCut" type="range" min="0" max="6" step="1" value="0" list="lowCutTicks">` | 『lowCut』スライダーで低音のカットレベルを0〜6の段階で選べます |
| 103 | `    <datalist id="lowCutTicks">` | lowCutスライダーに使う目盛り候補をまとめるdatalistです |
| 104 | `      <option value="0"><option value="1"><option value="2"><option value="3"><option value="4"><option value="5"><option value="6">` | lowCut用に0〜6までの7段階の目盛りを用意しています |
| 105 | `    </datalist>` | lowCut目盛り用datalistの定義をここで閉じています |
| 106 | `    <span id="lowCutVal">0</span>` | 現在のlowCut値を『0』として表示する部分です |
| 107 | `  </label>` | lowCut設定のlabelをここで閉じています |
| 108 | `` |  |
| 109 | `  <label id="highCutWrap" data-lbl="highCut">` | 高音側のカット量を設定するスライダー用ラベル枠で、data-lblを付けています |
| 110 | `    <input id="highCut" type="range" min="0" max="6" step="1" value="0" list="highCutTicks">` | 『highCut』スライダーで高音のカットレベルを0〜6の段階で選べます |
| 111 | `    <datalist id="highCutTicks">` | highCutスライダーの目盛り候補をまとめるdatalistです |
| 112 | `      <option value="0"><option value="1"><option value="2"><option value="3"><option value="4"><option value="5"><option value="6">` | highCut用に0〜6までの7段階の目盛りを用意しています |
| 113 | `    </datalist>` | highCut目盛り用datalistの定義をここで閉じています |
| 114 | `    <span id="highCutVal">0</span>` | 現在のhighCut値を『0』として表示する部分です |
| 115 | `  </label>` | highCut設定のlabelをここで閉じています |
| 116 | `` |  |
| 117 | `  <!-- visuals -->` | ここから見た目（ビジュアル）の設定であることを示すコメントです |
| 118 | `  <label id="lineAWrap" data-lbl="lineAlpha">` | 線の透明度設定スライダーをまとめるラベル枠で、data-lblを付けています |
| 119 | `    <input id="lineA" type="range" min="0" max="100" step="1" value="50">` | 『lineA』スライダーで描画される線の濃さ（透明度）を0〜100で変えます |
| 120 | `    <span id="lineAVal">50%</span>` | 現在の線の透明度を『50%』として表示する部分です |
| 121 | `  </label>` |  |
| 122 | `` |  |
| 123 | `  <label id="straightLineAWrap" data-lbl="straightLineAlpha">` | 直線の透明度スライダー全体を包むラベル枠を作っています |
| 124 | `    <input id="straightLineA" type="range" min="0" max="100" step="1" value="20">` | 直線の透明度を0〜100で動かせるスライダー入力を用意しています |
| 125 | `    <span id="straightLineAVal">20%</span>` | 現在の直線の透明度を「20%」と文字で表示しています |
| 126 | `  </label>` | 直線透明度用ラベル枠の終了を示しています |
| 127 | `` |  |
| 128 | `  <label id="noteGuideAWrap" data-lbl="noteGuideAlpha">` | 音符ガイドの透明度スライダーのラベル枠を作っています |
| 129 | `    <input id="noteGuideA" type="range" min="0" max="100" step="1" value="30">` | 音符ガイドの透明度を0〜100で調整するスライダーです |
| 130 | `    <span id="noteGuideAVal">30%</span>` | 音符ガイドの透明度の現在値を「30%」と表示しています |
| 131 | `  </label>` | 音符ガイド透明度用ラベル枠の終了です |
| 132 | `` |  |
| 133 | `  <label id="noteGuideLabelAWrap" data-lbl="noteGuideLabelAlpha">` | 音符ガイドの文字ラベルの透明度用ラベル枠を作っています |
| 134 | `    <input id="noteGuideLabelA" type="range" min="0" max="100" step="1" value="30">` | 音符ガイドの文字ラベルの透明度を変えるスライダーです |
| 135 | `    <span id="noteGuideLabelAVal">30%</span>` | 文字ラベルの透明度を「30%」として表示しています |
| 136 | `  </label>` | 音符ガイド文字透明度用ラベル枠の終了です |
| 137 | `` |  |
| 138 | `  <label id="waterAWrap" data-lbl="waterAlpha">` | 水色エリアなどの透明度を変えるスライダー用ラベル枠です |
| 139 | `    <input id="waterA" type="range" min="0" max="100" step="1" value="12">` | 水のようなエリアの透明度を0〜100で調整するスライダーです |
| 140 | `    <span id="waterAVal">12%</span>` | 水エリアの現在の透明度を「12%」と表示しています |
| 141 | `  </label>` | 水エリア透明度用ラベル枠の終了です |
| 142 | `` |  |
| 143 | `  <label id="movNumAWrap" data-lbl="movNumAlpha">` | 小節番号などの透明度を変えるスライダー用ラベル枠です |
| 144 | `    <input id="movNumA" type="range" min="0" max="100" step="1" value="28">` | 小節番号などの表示の透明度を0〜100で変えるスライダーです |
| 145 | `    <span id="movNumAVal">28%</span>` | 小節番号の透明度を「28%」として表示しています |
| 146 | `  </label>` | 小節番号透明度用ラベル枠の終了です |
| 147 | `` |  |
| 148 | `  <label id="movNumSizeWrap" data-lbl="movNumSize">` | 小節番号の文字サイズを変えるスライダー用ラベル枠です |
| 149 | `    <input id="movNumSize" type="range" min="10" max="60" step="1" value="28">` | 小節番号の文字サイズを10〜60の範囲で変えるスライダーです |
| 150 | `    <span id="movNumSizeVal">28px</span>` | 小節番号の文字サイズを「28px」と表示しています |
| 151 | `  </label>` | 小節番号サイズ用ラベル枠の終了です |
| 152 | `` |  |
| 153 | `  <label id="labelSizeWrap" data-lbl="labelSize">` | ラベル全般の文字サイズを変えるスライダー用ラベル枠です |
| 154 | `    <input id="labelSize" type="range" min="8" max="36" step="1" value="12">` | ラベル文字の大きさを8〜36の範囲で調整するスライダーです |
| 155 | `    <span id="labelSizeVal">12px</span>` | ラベル文字の大きさを「12px」と表示しています |
| 156 | `  </label>` | ラベル文字サイズ用ラベル枠の終了です |
| 157 | `` |  |
| 158 | `  <label id="labelBGWrap" data-lbl="labelBG">` | ラベル背景の濃さを変えるスライダー用ラベル枠です |
| 159 | `    <input id="labelBG" type="range" min="0" max="100" step="1" value="0">` | ラベルの背景の濃さを0〜100で変えるスライダーです |
| 160 | `    <span id="labelBGVal">0%</span>` | ラベル背景の濃さを「0%」として表示しています |
| 161 | `  </label>` | ラベル背景用ラベル枠の終了です |
| 162 | `` |  |
| 163 | `  <label id="labelAlphaWrap" data-lbl="labelAlpha">` | ラベル自体の透明度を変えるスライダー用ラベル枠です |
| 164 | `    <input id="labelAlpha" type="range" min="0" max="100" step="1" value="0">` | ラベル全体の透明度を0〜100で調整するスライダーです |
| 165 | `    <span id="labelAlphaVal">0%</span>` | ラベルの透明度を「0%」として表示しています |
| 166 | `  </label>` | ラベル透明度用ラベル枠の終了です |
| 167 | `` |  |
| 168 | `  <!-- MIDI File controls（常時表示） -->` | MIDIファイルに関する操作部分であることをコメントで示しています |
| 169 | `  <span class="sep"></span>` | UIの項目同士を区切るための飾り用の区切り線です |
| 170 | `  <label id="fileWrap" data-lbl="midiFile">` | MIDIファイル選択欄全体を包むラベル枠を作っています |
| 171 | `    <input id="midiFile" type="file" accept=".mid,.midi,audio/midi,audio/x-midi">` | 拡張子.midなどのMIDIファイルを選んで読み込む入力欄です |
| 172 | `  </label>` | MIDIファイル選択用ラベル枠の終了です |
| 173 | `  <label id="fileOpWrap" data-lbl="fileOp">` | ファイルの動作モード選択（再生かトレーナー）用ラベル枠です |
| 174 | `    <select id="fileOp">` | ファイルの扱い方を選ぶためのプルダウンメニューを用意しています |
| 175 | `      <option value="play">再生</option>` | プルダウンの選択肢として「再生」モードを追加しています |
| 176 | `      <option value="train" selected>トレーナー</option>` | 「トレーナー」モードを選択肢にし、初期状態で選ばれるようにしています |
| 177 | `    </select>` | プルダウンメニューの終了です |
| 178 | `  </label>` | ファイル動作モード用ラベル枠の終了です |
| 179 | `  <span id="playBtns">` | 再生関連のボタンをまとめて囲む領域を定義しています |
| 180 | `    <button id="btnPlay">▶︎</button>` | MIDIの再生を開始する「▶︎」ボタンを表示しています |
| 181 | `    <button id="btnPause">⏸</button>` | 再生中のMIDIを一時停止する「⏸」ボタンです |
| 182 | `    <button id="btnStop">⏹</button>` | 再生を止めて頭に戻す「⏹」ボタンです |
| 183 | `  </span>` | 再生ボタン群の表示領域の終了です |
| 184 | `  <span id="trainBtns">` | トレーニング用ボタンをまとめる領域を用意しています |
| 185 | `    <button id="btnStartTrain">開始/リスタート</button>` | 練習を開始したりやり直したりするボタンです |
| 186 | `    <button id="btnPrev">◀︎</button>` | トレーニングで前のステップに戻る「◀︎」ボタンです |
| 187 | `    <button id="btnNext">▶︎</button>` | トレーニングで次のステップに進む「▶︎」ボタンです |
| 188 | `  </span>` | トレーニング用ボタン領域の終了です |
| 189 | `` |  |
| 190 | `  <span id="info">idle</span>` | システムの現在状態を「idle」などの短い文字で表示します |
| 191 | `  <span id="midiStat" style="min-width:280px">MIDI: 未初期化</span>` | MIDIの初期化状態などの情報を表示するテキスト欄です |
| 192 | `  <span id="midiLast">最後: –</span>` | 最後に処理したMIDIイベントなどを表示する欄です |
| 193 | `  <span id="fileInfo">file: –</span>` | 現在選択されているファイル名などを表示する欄です |
| 194 | `  <span id="trainerStat">step: –</span>` | トレーナーの現在ステップ番号などを表示する欄です |
| 195 | `</div>` | ここまででUI全体を包んでいた<div>の終了です |
| 196 | `` |  |
| 197 | `<canvas id="cv"></canvas>` | 音やノートを円形に描くためのキャンバス領域を用意しています |
| 198 | `` |  |
| 199 | `<script>` | ここからJavaScriptのプログラムを記述する領域を開始します |
| 200 | `/* ===== UI scaling ===== */` | UIの表示倍率調整に関するコードであることを示すコメントです |
| 201 | `// iPhoneでUIが縮みすぎないようにスケール調整する` | iPhoneでUIが小さくなりすぎないように調整する意図を書いています |
| 202 | `const isIPhone = /iPhone/i.test(navigator.userAgent);` | ブラウザ情報からiPhoneかどうかを調べて結果をisIPhoneに入れています |
| 203 | `if (isIPhone) {` | もしiPhoneならUIの倍率を変える処理を行う条件分岐を始めています |
| 204 | `  document.documentElement.style.setProperty('--ui-scale', '0.75');` | HTML全体に'--ui-scale'を0.75として設定しUIを少し縮めています |
| 205 | `}` | iPhone用スケール調整のif文をここで閉じています |
| 206 | `` |  |
| 207 | `/* ===== Canvas ===== */` | ここからキャンバス描画に関するコードだと示すコメントです |
| 208 | `// メインキャンバスの初期化とリサイズ処理` | メインキャンバスの用意と、サイズ変更処理を行うことを説明しています |
| 209 | `const cv = document.getElementById('cv');` | idが'cv'のキャンバス要素を取得しcvという変数に入れています |
| 210 | `const ctx = cv.getContext('2d');` | キャンバスに2D描画用の道具箱（コンテキスト）を用意しています |
| 211 | `// ウィンドウの大きさに応じてキャンバスをリサイズし、Retina解像度にも対応` | 画面サイズに合わせてキャンバスを調整し高精細画面にも対応すると説明しています |
| 212 | `function resize(){ cv.width = innerWidth*devicePixelRatio; cv.height = innerHeight*devicePixelRatio; }` | resize関数を定義し画面幅と高さに応じてキャンバスの大きさを設定しています |
| 213 | `addEventListener('resize', resize); resize();` | 画面サイズ変更時にresizeを呼び出し、最初にも一度resizeを実行しています |
| 214 | `` |  |
| 215 | `/* ===== Music constants ===== */` | ここから音の周波数など音楽関連の決まり値をまとめると示しています |
| 216 | `// 周波数と描画範囲に関する定数群` | 周波数や描画範囲にかかわる固定の値を定義すると説明しています |
| 217 | `const F_LOW = 27.5, F_HIGH = 4186.009;` | 扱う周波数の下限F_LOWと上限F_HIGHを決めています |
| 218 | `const OCTAVES = Math.ceil(Math.log2(F_HIGH/F_LOW));` | 周波数の範囲が何オクターブ分かを計算しOCTAVESに入れています |
| 219 | `const MARGIN = 80;                               // 余白を広めに` | 図の周りに80ピクセル分の余白を取るための定数です |
| 220 | `const ANG0 = Math.PI/2;                          // Cを上（0°相当）` | 基準の角度を真上にして、Cの位置をそこに対応させています |
| 221 | `const GRAV_ABS = ANG0;                           // 重力方向=0°固定` | 重力方向（基準の下向き）を一定の角度に固定するための設定です |
| 222 | `const EXCLUDE_PAD_RAD = 0.1 * Math.PI / 180;       // 無効領域+0.1°` | 判定に使わないごくわずかな角度の範囲を0.1度分だけ広げています |
| 223 | `const LABEL_ENH = {0:"C",1:"C#/Db",2:"D",3:"D#/Eb",4:"E",5:"F",6:"F#/Gb",7:"G",8:"G#/Ab",9:"A",10:"A#/Bb",11:"B"};` | 0〜11の数字を音名（CやDなど）に対応させる表を作っています |
| 224 | `// 完全5度圏の配置を事前計算しておく` | 完全5度の順番で音を並べるための並びをあらかじめ計算すると説明しています |
| 225 | `const FIFTH_ORDER_PCS = (()=>{ let a=[],pc=0; for(let k=0;k<12;k++){ a.push(pc); pc=(pc+7)%12; } return a; })();` | 完全5度ずつ進む順番で0〜11のピッチクラスを並べた配列を作っています |
| 226 | `const FIFTH_INDEX = (()=>{ const m=Array(12).fill(0); FIFTH_ORDER_PCS.forEach((pc,i)=>m[pc]=i); return m; })();` | 各音が五度圏の何番目かをすぐ分かる対応表を作っています |
| 227 | `const FIFTH_LABELS = FIFTH_ORDER_PCS.map(pc=>LABEL_ENH[pc]);` | 五度圏の順番に対応する音名の文字列一覧を作っています |
| 228 | `const NOTE_BG = {0:[191,28,28],1:[191,109,28],2:[191,191,28],3:[109,191,28],4:[28,191,28],5:[28,191,109],6:[28,191,191],7:[28,109,191],8:[28,28,191],9:[109,28,191],10:[191,28,191],11:[191,28,109]};` | 12種類の音ごとに背景色に使うRGB値を決めた設定表です |
| 229 | `` |  |
| 230 | `/* ===== UI refs ===== */` | ここからUI部品への参照をまとめると示すコメントです |
| 231 | `// UI要素の参照をまとめて保持` | 画面上のUI部品をまとめて扱うための参照を持つと説明しています |
| 232 | `const uiPanel = document.getElementById('ui');` | UI全体を包む要素を取得しuiPanelという変数に入れています |
| 233 | `const uiToggle = document.getElementById('uiToggle');` | UIの表示・非表示を切り替えるボタン要素を取得しています |
| 234 | `const anchorSel = document.getElementById('anchor');` | アンカー（基準位置）を選ぶセレクトボックスを取得しています |
| 235 | `const devWrap = document.getElementById('devWrap');` | MIDIデバイス選択まわりを包む要素を取得しています |
| 236 | `const midiDev = document.getElementById('midiDev');` | MIDI接続先を選ぶためのセレクトボックスを取得しています |
| 237 | `const allWrap = document.getElementById('allWrap');` | すべてのMIDI入力を使うかどうかの設定部分を包む要素です |
| 238 | `const midiAll = document.getElementById('midiAll');` | 全MIDI入力を対象にするか選ぶチェックボックスなどを取得しています |
| 239 | `const liveMon = document.getElementById('liveMon');` | リアルタイムの入力を監視するための表示・設定要素を取得しています |
| 240 | `const resetBtn = document.getElementById('resetSettings');` | 設定を初期値に戻す「リセット」ボタン要素を取得しています |
| 241 | `` |  |
| 242 | `const excludeSel = document.getElementById('exclude');` | idが'exclude'の要素を取得し、操作しやすいように変数'excludeSel'に入れます。 |
| 243 | `const uiopSlider = document.getElementById('uiop'); const uiopVal = document.getElementById('uiopVal');` | id'uiop'のスライダーと'id'uiopVal'の表示用要素を取得して、セットで扱えるようにします。 |
| 244 | `const massSlider = document.getElementById('mass'); const massVal = document.getElementById('massVal');` | id'mass'スライダーと'id'massVal'表示用要素を取得し、質量設定と表示を連動させる準備です。 |
| 245 | `const dampSlider = document.getElementById('damp'); const dampVal = document.getElementById('dampVal');` | id'damp'スライダーと'id'dampVal'表示用要素を取得し、減衰の設定と表示を扱うための準備です。 |
| 246 | `const snapAlphaCheckbox = document.getElementById('snapAlpha');` | id'snapAlpha'のチェックボックス要素を取得し、そのON/OFF状態を扱えるようにします。 |
| 247 | `const info = document.getElementById('info');` | id'info'の要素を取得し、画面下部などのメッセージ表示に使えるようにします。 |
| 248 | `const midiStat = document.getElementById('midiStat'); const midiLast = document.getElementById('midiLast');` | MIDI状態表示用'id'midiStat'と最後の状態用'id'midiLast'の要素を取得します。 |
| 249 | `const lowCutSlider = document.getElementById('lowCut'); const lowCutVal = document.getElementById('lowCutVal');` | 低音カット用スライダー'id'lowCut'と、その値表示用'id'lowCutVal'を取得します。 |
| 250 | `const highCutSlider = document.getElementById('highCut'); const highCutVal = document.getElementById('highCutVal');` | 高音カット用スライダー'id'highCut'と、その値表示用'id'highCutVal'を取得します。 |
| 251 | `const lineASlider = document.getElementById('lineA'); const lineAVal = document.getElementById('lineAVal');` | 線の透明度用スライダー'id'lineA'と、その値表示用'id'lineAVal'を取得します。 |
| 252 | `const straightLineASlider = document.getElementById('straightLineA'); const straightLineAVal = document.getElementById('straightLineAVal');` | 直線の透明度用スライダー'id'straightLineA'と値表示用'id'straightLineAVal'を取得します。 |
| 253 | `const noteGuideASlider = document.getElementById('noteGuideA'); const noteGuideAVal = document.getElementById('noteGuideAVal');` | 音ガイドの透明度スライダー'id'noteGuideA'と表示用'id'noteGuideAVal'を取得します。 |
| 254 | `const noteGuideLabelASlider = document.getElementById('noteGuideLabelA'); const noteGuideLabelAVal = document.getElementById('noteGuideLabelAVal');` | 音ガイドの数字透明度スライダー'id'noteGuideLabelA'と表示用要素を取得します。 |
| 255 | `const waterASlider = document.getElementById('waterA'); const waterAVal = document.getElementById('waterAVal');` | 水面の透明度スライダー'id'waterA'と、その値表示用'id'waterAVal'を取得します。 |
| 256 | `const labelSizeSlider = document.getElementById('labelSize'); const labelSizeVal = document.getElementById('labelSizeVal');` | ラベルの文字サイズスライダー'id'labelSize'と、その値表示用要素を取得します。 |
| 257 | `const labelBGSlider = document.getElementById('labelBG'); const labelBGVal = document.getElementById('labelBGVal');` | ラベル背景の濃さスライダー'id'labelBG'と、その値表示用要素を取得します。 |
| 258 | `const labelAlphaSlider = document.getElementById('labelAlpha'); const labelAlphaVal = document.getElementById('labelAlphaVal');` | ラベル文字の透明度スライダー'id'labelAlpha'と、その値表示用要素を取得します。 |
| 259 | `const movNumASlider = document.getElementById('movNumA'); const movNumAVal = document.getElementById('movNumAVal');` | 度数番号の透明度スライダー'id'movNumA'と、その値表示用要素を取得します。 |
| 260 | `const movNumSizeSlider = document.getElementById('movNumSize'); const movNumSizeVal = document.getElementById('movNumSizeVal');` | 度数番号の大きさスライダー'id'movNumSize'と、その値表示用要素を取得します。 |
| 261 | `` |  |
| 262 | `const omegaMaxSlider = document.getElementById('omegaMax'); const omegaMaxVal = document.getElementById('omegaMaxVal');` | 最大回転速度用スライダー'id'omegaMax'と、その値表示用要素を取得します。 |
| 263 | `` |  |
| 264 | `const midiFileInput = document.getElementById('midiFile');` | MIDIファイルを選ぶ入力欄'id'midiFile'の要素を取得します。 |
| 265 | `const fileOp = document.getElementById('fileOp');` | 再生かトレーニングかを選ぶセレクト'id'fileOp'の要素を取得します。 |
| 266 | `const btnPlay = document.getElementById('btnPlay');` | 再生ボタン'id'btnPlay'の要素を取得し、クリック処理などに使えるようにします。 |
| 267 | `const btnPause = document.getElementById('btnPause');` | 一時停止ボタン'id'btnPause'の要素を取得します。 |
| 268 | `const btnStop = document.getElementById('btnStop');` | 停止ボタン'id'btnStop'の要素を取得します。 |
| 269 | `const btnStartTrain = document.getElementById('btnStartTrain');` | トレーニング開始ボタン'id'btnStartTrain'の要素を取得します。 |
| 270 | `const btnPrev = document.getElementById('btnPrev');` | 前へボタン'id'btnPrev'の要素を取得し、前の区間に移動する処理に備えます。 |
| 271 | `const btnNext = document.getElementById('btnNext');` | 次へボタン'id'btnNext'の要素を取得し、次の区間に移動する処理に備えます。 |
| 272 | `const fileInfo = document.getElementById('fileInfo');` | 読み込んだファイル情報を表示する'id'fileInfo'の要素を取得します。 |
| 273 | `const trainerStat = document.getElementById('trainerStat');` | トレーナーの状態を表示する'id'trainerStat'の要素を取得します。 |
| 274 | `` |  |
| 275 | `/* ===== i18n + persist ===== */` | ここから多言語表示と言語別設定保存に関するコードの開始を示します。 |
| 276 | `// 言語切り替え用の辞書データ` | 言語切り替えのための翻訳データを用意することを説明するコメントです。 |
| 277 | `const I18N = {` | I18Nという名前で、翻訳用の言葉の一覧をまとめるオブジェクトを定義します。 |
| 278 | `  en:{` | 英語用の翻訳データ'en'のまとまりを定義し始めています。 |
| 279 | `    language:"language", device:"device", allInputs:"All inputs",` | UIで使う単語の英語表現を、'language'などのキーに対応させて登録します。 |
| 280 | `    anchor:"anchor", waterFixed:"water fixed", diskFixed:"disk fixed",` | 'anchor'や'waterFixed'など、固定方法に関する英語テキストを登録しています。 |
| 281 | `    liveSound:"monitor live MIDI",` | リアルタイムMIDI音声関連の英語テキストを登録しています。 |
| 282 | `    torqueExclude:"Torque exclusion", filled:"filled", unfilled:"unfilled",` | トルク無効領域や塗りつぶし表示などの英語テキストを登録しています。 |
| 283 | `    uiOpacity:"UI opacity", diskMass:"disk mass", damping:"damping",` | UIの透明度やディスク質量、ダンピングなど物理設定の英語表現を登録します。 |
| 284 | `    snapZeroAlpha:"zero ω when α=0",` | α=0のとき角速度を0にする設定の英語ラベルを登録します。 |
| 285 | `    lineAlpha:"line α", straightLineAlpha:"straight lines α", noteGuideAlpha:"note guide α", noteGuideLabelAlpha:"note guide numbers α", waterAlpha:"water α", movNumAlpha:"degree numbers α", movNumSize:"degree numbers size",` | 線やガイド、数字、水面などの透明度やサイズの英語ラベルをまとめて登録します。 |
| 286 | `    labelSize:"label size", labelBG:"label bg α", labelAlpha:"label text α",` | ラベルのサイズや背景、文字の濃さに関する英語テキストを登録します。 |
| 287 | `    lowCut:"low cut (oct)", highCut:"high cut (oct)",` | 低音・高音カットに関する英語ラベルを登録します。 |
| 288 | `    omegaMax:"ω max",` | 最大回転速度(ω max)の英語ラベルを登録します。 |
| 289 | `    midiNotInit:"MIDI: not initialized", last:"last:", idle:"idle",` | MIDIの初期状態や最後の状態、アイドル時の英語テキストを登録します。 |
| 290 | `    midiNeedSecure:"need HTTPS/localhost", midiUnsupported:"unsupported",` | HTTPSが必要など、MIDI利用条件や未対応時の英語メッセージを登録します。 |
| 291 | `    midiReady:"ready", midiInitFailed:"init failed", midiAllInputsStat:"all inputs",` | MIDI準備完了や初期化失敗など、状態表示用の英語テキストを登録します。 |
| 292 | `    midiInputStatPrefix:"input:", midiNoDevice:"no device",` | 入力デバイス名や未接続時の英語メッセージを登録します。 |
| 293 | `    midiFile:"MIDI file", fileOp:"operation", play:"playback", train:"trainer",` | MIDIファイル、操作モード、再生やトレーナーなどの英語ラベルを登録します。 |
| 294 | `    trainStart:"start / restart",` | トレーニング開始ボタン用の英語ラベルを登録します。 |
| 295 | `    resetDefaults:"reset settings"` | 設定を初期状態に戻す操作の英語ラベルを登録します。 |
| 296 | `  },` | ここで英語部分の定義を終え、次に日本語の定義に続きます。 |
| 297 | `  ja:{` | 日本語用の翻訳データ'ja'のまとまりを定義し始めています。 |
| 298 | `    language:"言語", device:"デバイス", allInputs:"全入力",` | 言語、デバイス、全入力などの日本語ラベルを登録します。 |
| 299 | `    anchor:"固定", waterFixed:"水面固定", diskFixed:"ディスク固定",` | 固定方法や水面固定、ディスク固定の日本語ラベルを登録します。 |
| 300 | `    liveSound:"MIDI入力の音声再生",` | MIDI入力音声再生に関する日本語ラベルを登録します。 |
| 301 | `    torqueExclude:"トルク無効領域", filled:"塗りつぶし", unfilled:"非塗りつぶし",` | トルク無効領域や塗りつぶし表示などの日本語ラベルを登録しています。 |
| 302 | `    uiOpacity:"UI不透明度", diskMass:"ディスク質量", damping:"ダンピング",` | UI透明度やディスク質量、ダンピングなどの日本語ラベルを登録します。 |
| 303 | `    snapZeroAlpha:"α=0で角速度を停止",` | α=0で角速度を止める設定の日本語ラベルを登録します。 |
| 304 | `    lineAlpha:"曲線の不透明度", straightLineAlpha:"直線の不透明度", noteGuideAlpha:"音ガイドの不透明度", noteGuideLabelAlpha:"音ガイド数字の不透明度", waterAlpha:"水面の不透明度", movNumAlpha:"移動ド数字の不透明度", movNumSize:"移動ド数字サイズ",` | 曲線・直線・音ガイド・数字・水面などの透明度とサイズの日本語ラベルを登録します。 |
| 305 | `    labelSize:"ラベルサイズ", labelBG:"ラベル背景の不透明度", labelAlpha:"音名の不透明度",` | ラベルの文字サイズ、背景の濃さ、音名の見え方などの日本語ラベルを登録します。 |
| 306 | `    lowCut:"低音域カット", highCut:"高音域カット",` | 低音域・高音域カットに関する日本語ラベルを登録します。 |
| 307 | `    omegaMax:"最大回転速度",` | 最大回転速度の日本語ラベルを登録します。 |
| 308 | `    midiNotInit:"MIDI: 未初期化", last:"最後:", idle:"待機",` | MIDIの未初期化状態、最後、待機中などの日本語メッセージを登録します。 |
| 309 | `    midiNeedSecure:"HTTPS/localhostが必要", midiUnsupported:"未対応",` | HTTPSが必要、未対応などMIDI利用条件の日本語メッセージを登録します。 |
| 310 | `    midiReady:"準備完了", midiInitFailed:"初期化失敗", midiAllInputsStat:"全入力",` | MIDI準備完了や初期化失敗、全入力などの日本語ラベルを登録します。 |
| 311 | `    midiInputStatPrefix:"入力:", midiNoDevice:"デバイスなし",` | 入力デバイス表示や、デバイスなし時の日本語メッセージを登録します。 |
| 312 | `    midiFile:"MIDIファイル", fileOp:"操作", play:"再生", train:"トレーナー",` | MIDIファイル、操作、再生、トレーナーの日本語ラベルを登録します。 |
| 313 | `    trainStart:"開始/リスタート",` | トレーニング開始/再開ボタン用の日本語ラベルを登録します。 |
| 314 | `    resetDefaults:"初期設定に戻す"` | 設定リセットボタン用の日本語ラベルを登録します。 |
| 315 | `  }` | 英語と日本語の翻訳データオブジェクト定義をここで閉じます。 |
| 316 | `};` | 翻訳データ(I18N)の定義を終了し、オブジェクトとして確定します。 |
| 317 | `const SETTINGS_KEY = 'ppm:v6';` | ローカル保存に使う設定用キー名'SETTINGS_KEY'を定義します。 |
| 318 | `// 初回ロード時のデフォルト設定をキャッシュ` | ページ初回読み込み時の標準設定を保存しておくことを説明するコメントです。 |
| 319 | `let DEFAULT_SETTINGS = null;` | デフォルト設定を後で入れるための変数DEFAULT_SETTINGSを、最初はnullで用意します。 |
| 320 | `` |  |
| 321 | `// UIスケールと初期言語` | ここからUIの大きさと最初に使う言語設定について説明するコメントです。 |
| 322 | `let uiScale = 0.95;` | UI全体の拡大率'uiScale'を0.95（やや小さめ）に初期設定します。 |
| 323 | `let lang = (navigator.language\|\|'en').startsWith('ja') ? 'ja' : 'en';` | ブラウザの言語が日本語なら'ja'、それ以外は'en'を選んで初期言語とします。 |
| 324 | `function t(k){ return (I18N[lang]&&I18N[lang][k]) \|\| I18N.en[k] \|\| k; }` | キーkから現在の言語のテキストを取り出し、なければ英語かキー名を返す関数です。 |
| 325 | `// ラベル要素に翻訳済みテキストを設定` | ラベル用要素に、翻訳された文字列をセットする役割の関数であることを説明しています。 |
| 326 | `function setLabelText(labelEl, key){` | ラベル要素'labelEl'に、指定キー'key'の訳文を入れるための関数を定義します。 |
| 327 | `  if(!labelEl) return;` | ラベル要素が無ければ、何もせず処理を終了します。 |
| 328 | `  if(labelEl.firstChild && labelEl.firstChild.nodeType===Node.TEXT_NODE){` | ラベルにすでにテキストノードがあるかを確認し、あればその内容を上書きします。 |
| 329 | `    labelEl.firstChild.nodeValue = t(key)+' ';` | 既存のテキスト部分を、翻訳した文字列と後ろの空白に置き換えます。 |
| 330 | `  }else{` | テキストノードがない場合の処理として、ここから別の方法で文字を追加します。 |
| 331 | `    labelEl.prepend(document.createTextNode(t(key)+' '));` | 要素の先頭に、翻訳した文字列と空白からなる新しいテキストノードを差し込みます。 |
| 332 | `  }` | setLabelText関数の処理をここで終わります。 |
| 333 | `}` |  |
| 334 | `// HTML全体のCSSカスタムプロパティに反映してUIのサイズを切り替える` | CSS変数'--ui-scale'に値を入れて、UI全体の表示サイズを切り替えることを説明します。 |
| 335 | `function applyUIScale(){ document.documentElement.style.setProperty('--ui-scale', uiScale); }` | document要素のCSSプロパティ'--ui-scale'にuiScaleの値を設定し、UIサイズを反映します。 |
| 336 | `// ラベルやステータスの文言を現在の言語設定で書き換える` | ラベルや状態表示の文言を、現在選ばれている言語に合わせて更新することを説明します。 |
| 337 | `function applyI18N(){` | 翻訳を適用するapplyI18N関数を定義し、UI全体の表示を切り替えます。 |
| 338 | `  document.documentElement.lang = lang;` | HTMLのlang属性に現在の言語コードを入れ、ページの言語設定をブラウザに伝えます。 |
| 339 | `  // data-lbl属性を持つすべての要素に翻訳済みの文字列を注入` | data-lbl属性を持つすべての要素を探し、翻訳テキストを流し込むことを説明します。 |
| 340 | `  document.querySelectorAll('[data-lbl]').forEach(el=> setLabelText(el, el.getAttribute('data-lbl')));` | data-lblを持つ各要素に対し、対応する訳文をsetLabelTextでセットします。 |
| 341 | `  anchorSel.querySelector('option[value="water"]').textContent = t('waterFixed');` | 'water'オプションの表示文を、現在の言語の'waterFixed'に置き換えます。 |
| 342 | `  anchorSel.querySelector('option[value="disk"]').textContent  = t('diskFixed');` | 'disk'オプションの表示文を、現在の言語の'diskFixed'に置き換えます。 |
| 343 | `  excludeSel.querySelector('option[value="filled"]').textContent   = t('filled');` | 'filled'オプションの表示文を、翻訳された'filled'に更新します。 |
| 344 | `  excludeSel.querySelector('option[value="unfilled"]').textContent = t('unfilled');` | 'unfilled'オプションの表示文を、翻訳された'unfilled'に更新します。 |
| 345 | `  fileOp.querySelector('option[value="play"]').textContent = t('play');` | 'play'モード用オプションの表示文を、翻訳文字列'play'にします。 |
| 346 | `  fileOp.querySelector('option[value="train"]').textContent = t('train');` | 'train'モード用オプションの表示文を、翻訳文字列'train'にします。 |
| 347 | `  btnStartTrain.textContent = t('trainStart');` | トレーニング開始ボタンの表示テキストを、翻訳された'trainStart'にします。 |
| 348 | `  if(resetBtn) resetBtn.textContent = t('resetDefaults');` | resetBtnがあれば、そのボタンのテキストを'resetDefaults'の訳にします。 |
| 349 | `  uiToggle.textContent = uiVisible ? 'UI隠す' : 'UI表示';` | UIが見えているかで、ボタンに『UI隠す』または『UI表示』と表示する文言を切り替えます。 |
| 350 | `  updateCutDisplays();` | lowCut/highCutなどのカット表示を、現在の設定と言語で更新する関数を呼び出します。 |
| 351 | `  document.getElementById('lang').value = lang;` | 言語選択のドロップダウンの値を、現在の言語コードlangに合わせます。 |
| 352 | `  info.textContent = t('idle');` | info表示欄に、アイドル状態を示す翻訳テキスト'idle'をセットします。 |
| 353 | `  midiStat.textContent = t('midiNotInit');` | midiStat表示欄に、MIDIが未初期化であることを示すテキストをセットします。 |
| 354 | `  midiLast.textContent = t('last') + ' –';` | midiLast表示欄に、『最後:』に相当するテキストと「–」を表示します。 |
| 355 | `}` | applyI18N関数の定義をここで終えます。 |
| 356 | `// 言語選択ドロップダウンの変更ハンドラ` | 言語選択プルダウンが変更されたときの処理を設定することを説明するコメントです。 |
| 357 | `document.getElementById('lang').addEventListener('change', e=>{` | id'lang'要素の値変更イベントに、言語切り替え処理を行う関数を登録します。 |
| 358 | `  lang = e.target.value==='ja' ? 'ja' : 'en';` | 選ばれた値が'ja'なら日本語、それ以外は英語としてlang変数を更新します。 |
| 359 | `  applyI18N(); saveSettings();` | 言語設定をUI全体に反映し、その後現在の設定を保存します。 |
| 360 | `});` | 言語選択が変わったときのイベント処理関数定義をここで閉じます。 |
| 361 | `` |  |
| 362 | `// UIの状態をオブジェクトにまとめて保存用に返す` | UIの各設定を1つのまとまったデータとして取り出すことを説明している |
| 363 | `function collectSettingsFromUI(){` | 画面上の設定を集めて1つのオブジェクトとして返す関数を定義している |
| 364 | `  // 保存対象のプロパティを列挙` | どの設定項目を保存するか、これから列挙してまとめると説明している |
| 365 | `  return {` | ここから実際にまとめて返す設定オブジェクトの中身を書き始めている |
| 366 | `    lang, uiScale,` | 言語設定『lang』と表示倍率『uiScale』の現在値を保存用データに入れている |
| 367 | `    anchor: anchorSel.value, midiAll: midiAll.checked, liveMon: liveMon.checked,` | 基準位置『anchor』とMIDIの全体設定、リアルタイム監視のON/OFFを保存している |
| 368 | `    uiop: uiopSlider.value, mass: massSlider.value,` | UIの透明度『uiop』や動きの重さ『mass』のスライダー値を保存している |
| 369 | `    lineA: lineASlider.value, straightLineA: straightLineASlider.value, waterA: waterASlider.value,` | 線や水面などの見え方に関するスライダー値を保存している |
| 370 | `    noteGuideA: noteGuideASlider.value,` | 音の目安となるガイドの見え方『noteGuideA』の値を保存している |
| 371 | `    noteGuideLabelA: noteGuideLabelASlider.value,` | 音ガイドのラベル部分の見えやすさ『noteGuideLabelA』を保存している |
| 372 | `    movNumA: movNumASlider.value, movNumSize: movNumSizeSlider.value,` | 動きの番号表示の濃さと文字サイズを、それぞれのスライダー値で保存している |
| 373 | `    labelSize: labelSizeSlider.value, labelBG: labelBGSlider.value,` | ラベルの文字サイズと背景の濃さを、スライダー値として保存している |
| 374 | `    labelAlpha: labelAlphaSlider.value,` | ラベルの透明度『labelAlpha』のスライダー値を保存している |
| 375 | `    exclude: excludeSel.value,` | 『exclude』の選択値を保存し、どの音を外すかの設定を覚えておく |
| 376 | `    lowCut: lowCutOct,` | 低い音をどこまで切り捨てるかを示す『lowCutOct』の値を保存している |
| 377 | `    highCut: highCutOct,` | 高い音の切り捨て位置『highCutOct』を『highCut』という名前で保存している |
| 378 | `    omegaMaxExp: omegaMaxSlider.value,` | 動きの最大速さを決める『omegaMaxSlider』の値を保存している |
| 379 | `    dampPct: dampSlider.value,` | 減衰の割合を決める『dampSlider』の値を『dampPct』として保存している |
| 380 | `    snapZeroAlpha: snapAlphaCheckbox.checked,` | ゼロ付近に吸い寄せる機能のON/OFFを『snapZeroAlpha』として保存している |
| 381 | `    fileOp: fileOp.value,` | ファイル操作モード『fileOp』の選択状態を保存している |
| 382 | `    uiHidden: !uiVisible` | UIを隠しているかどうかを、現在の表示状態から逆転させて保存している |
| 383 | `  };` | まとめた設定オブジェクトをこの関数の戻り値として返している |
| 384 | `}` | 設定収集用の関数定義をここで終えている |
| 385 | `` |  |
| 386 | `// localStorageへ設定を保存（例外は握りつぶす）` | ブラウザの保存領域（localStorage）に設定を保存する関数だと説明している |
| 387 | `function saveSettings(){` | 現在の設定をブラウザに書き込む処理を行う関数を定義している |
| 388 | `  try{ localStorage.setItem(SETTINGS_KEY, JSON.stringify(collectSettingsFromUI())); }catch{}` | 設定を文字列に変えてlocalStorageに保存し、失敗してもエラーを出さないようにしている |
| 389 | `}` | 設定保存用の関数定義をここで終えている |
| 390 | `// 保存された設定をUIに反映する` | 保存しておいた設定内容を画面のUIに反映させる処理だと説明している |
| 391 | `function applySettings(settings, {force = false} = {}){` | 渡された設定をUIに適用する関数を定義し、『force』で上書き方法を制御している |
| 392 | `  const s = (settings && typeof settings === 'object') ? settings : {};` | 受け取った設定がオブジェクトならそのまま使い、そうでなければ空の設定にしている |
| 393 | `  const has = key => force ? (key in s) : (s[key] != null);` | 『force』に応じて、その項目を使うかどうかを調べる小さな関数『has』を定義している |
| 394 | `` |  |
| 395 | `  // 言語関連の復元` | ここからは言語に関する設定を復元することを示している |
| 396 | `  if(has('lang')){` | 設定に『lang』が含まれている場合だけ、言語を復元するようにしている |
| 397 | `    lang = s.lang === 'ja' ? 'ja' : 'en';` | 保存された言語が日本語なら『ja』、それ以外は英語『en』に切り替えている |
| 398 | `  }` | 言語設定の復元処理をここで終えている |
| 399 | `  // UIスケール関連の復元` | ここから画面表示の大きさ（UIスケール）を元に戻す処理だと説明している |
| 400 | `  if(has('uiScale')){` | 設定に『uiScale』がある場合だけ、画面スケールを復元するようにしている |
| 401 | `    const parsed = parseFloat(s.uiScale);` | 『uiScale』を数値として読み取り、正しいかどうかを確認できるようにしている |
| 402 | `    if(!Number.isNaN(parsed)) uiScale = parsed;` | 数値として有効なら『uiScale』に反映し、無効なら何もしないでいる |
| 403 | `  }` | UIスケールの復元処理を終え、次の設定に進む区切りになっている |
| 404 | `  // ここから下は順番依存のため見通しを良くするため小分けにコメントを挿入` | ここから下は処理の順番が大事なので、小分けにコメントして見やすくしている |
| 405 | `  // アンカーやMIDI関連の復元` | アンカー位置やMIDIまわりの設定を、保存内容から元に戻すことを示している |
| 406 | `  if(has('anchor') && s.anchor){` | 『anchor』があり中身もある場合に、セレクトボックスへ設定値を入れている |
| 407 | `    anchorSel.value = s.anchor;` | 『anchorSel』の選択値を保存された『s.anchor』に合わせている |
| 408 | `  }` | アンカー設定の復元をここで区切り、次はMIDI設定に移る |
| 409 | `  if(has('midiAll')){` | 『midiAll』が設定に含まれている場合だけ、チェック状態を復元するようにしている |
| 410 | `    midiAll.checked = !!s.midiAll;` | 『midiAll』を真偽値に変換して、チェックボックスのON/OFFに反映している |
| 411 | `  }` | MIDI全体設定の復元を終え、次の項目に進む部分になっている |
| 412 | `  if(has('liveMon')){` | 『liveMon』の設定があるか確認し、あれば復元する準備をしている |
| 413 | `    liveMon.checked = !!s.liveMon;` | 『liveMon』も真偽値にして、リアルタイム監視のチェック状態を反映している |
| 414 | `  }` | MIDI関連の復元が終わり、次に見た目の設定へ進む区切りになっている |
| 415 | `  // 視覚設定の値を順番に反映` | ここから見た目に関するスライダー値を、順番どおりに反映することを説明している |
| 416 | `  if(has('uiop')){` | 『uiop』の保存値があるときだけ、UIの透明度スライダーを更新するようにしている |
| 417 | `    uiopSlider.value = s.uiop;` | 『uiopSlider』に保存された透明度『s.uiop』をセットしている |
| 418 | `    applyUIOpacity();` | スライダーの変更に合わせて、実際のUIの透明度を更新している |
| 419 | `  }` | 透明度の反映処理を終え、次は質量の設定に進む |
| 420 | `  if(has('mass')){` | 『mass』が保存されていれば、重さに関する設定を復元するようにしている |
| 421 | `    massSlider.value = s.mass;` | 『massSlider』に保存された値『s.mass』をセットしている |
| 422 | `    updateMass();` | 新しい重さ設定に応じて動き方を更新する処理『updateMass』を呼び出している |
| 423 | `  }` | 質量設定の反映を終え、次の線の濃さなどの設定に進む区切りになっている |
| 424 | `  if(has('lineA')){` | 『lineA』の設定がある場合に、線の表示に関するスライダーを復元している |
| 425 | `    lineASlider.value = s.lineA;` | 『lineASlider』に保存された線の濃さ『s.lineA』をセットしている |
| 426 | `    lineASlider.oninput();` | スライダーに値を入れたあと、入力時と同じ処理を実行して見た目を更新している |
| 427 | `  }` | 線の設定の反映が終わり、次に直線の設定へ移る区切りになっている |
| 428 | `  if(has('straightLineA')){` | 『straightLineA』の設定があるとき、直線の表示スライダーを復元している |
| 429 | `    straightLineASlider.value = s.straightLineA;` | 『straightLineASlider』に保存された『s.straightLineA』をセットしている |
| 430 | `    straightLineASlider.oninput();` | スライダーに設定した値を画面へ反映させるため、oninput処理を呼び出している |
| 431 | `  }` | 直線の設定反映を終え、次に水の表現の設定へ進む |
| 432 | `  if(has('waterA')){` | 『waterA』があれば、水面の見え方の設定を復元するようにしている |
| 433 | `    waterASlider.value = s.waterA;` | 『waterASlider』に保存された『s.waterA』をセットしている |
| 434 | `    waterASlider.oninput();` | 水の見え方の変更を画面に反映させるため、スライダーの処理を実行している |
| 435 | `  }` | 水の設定が終わり、次は音ガイドの見え方の設定に進む |
| 436 | `  if(has('noteGuideA')){` | 『noteGuideA』があるとき、音ガイドの濃さのスライダーを復元している |
| 437 | `    noteGuideASlider.value = s.noteGuideA;` | 『noteGuideASlider』に保存された『s.noteGuideA』を入れている |
| 438 | `    noteGuideASlider.oninput();` | スライダー変更時の処理を呼び出し、音ガイドの見え方を更新している |
| 439 | `  }` | 音ガイド本体の設定を終え、次はそのラベル表示の設定に進む |
| 440 | `  if(has('noteGuideLabelA')){` | 『noteGuideLabelA』がある場合、音ラベルの濃さ設定を復元している |
| 441 | `    noteGuideLabelASlider.value = s.noteGuideLabelA;` | 『noteGuideLabelASlider』に保存された値『s.noteGuideLabelA』をセットしている |
| 442 | `    noteGuideLabelASlider.oninput();` | スライダーの処理を実行し、ラベルの見やすさを画面に反映している |
| 443 | `  }` | 音ラベル設定の反映を終え、次に動き番号の表示設定へ進む |
| 444 | `  if(has('movNumA')){` | 『movNumA』があるとき、動き番号の濃さの設定を復元している |
| 445 | `    movNumASlider.value = s.movNumA;` | 『movNumASlider』に保存された『s.movNumA』をセットしている |
| 446 | `    movNumASlider.oninput();` | スライダー処理を実行して、番号表示の見え方を更新している |
| 447 | `  }` | 番号の濃さ設定を終え、次は番号の大きさ設定に進んでいる |
| 448 | `  if(has('movNumSize')){` | 『movNumSize』があるとき、動き番号の文字サイズ設定を復元している |
| 449 | `    movNumSizeSlider.value = s.movNumSize;` | 『movNumSizeSlider』に保存されたサイズ『s.movNumSize』をセットしている |
| 450 | `    movNumSizeSlider.oninput();` | スライダー処理を呼び出し、番号の大きさを画面上で更新している |
| 451 | `  }` | 番号サイズ設定を終え、次はラベル全体の文字サイズ設定に移る |
| 452 | `  if(has('labelSize')){` | 『labelSize』があるとき、ラベル文字の大きさを復元するようにしている |
| 453 | `    labelSizeSlider.value = s.labelSize;` | 『labelSizeSlider』に保存された『s.labelSize』をセットしている |
| 454 | `    labelSizeSlider.oninput();` | スライダー処理を実行し、ラベル文字の大きさを画面に反映している |
| 455 | `  }` | ラベル文字サイズ設定を終え、次はラベル背景の設定へ進む |
| 456 | `  if(has('labelBG')){` | 『labelBG』がある場合、ラベル背景の濃さ設定を復元している |
| 457 | `    labelBGSlider.value = s.labelBG;` | 『labelBGSlider』に保存された『s.labelBG』をスライダーに反映している |
| 458 | `    labelBGSlider.oninput();` | スライダー処理を呼び出し、ラベル背景の見え方を更新している |
| 459 | `  }` | ラベル背景設定を終え、次はラベルの透明度設定に移っている |
| 460 | `  if(has('labelAlpha')){` | 『labelAlpha』があるとき、ラベルの透明度設定を復元している |
| 461 | `    labelAlphaSlider.value = s.labelAlpha;` | 『labelAlphaSlider』に保存された『s.labelAlpha』をセットしている |
| 462 | `    labelAlphaSlider.oninput();` | スライダー処理を実行して、ラベルの透明度を画面に反映している |
| 463 | `  }` | ラベル関連の設定反映を終え、次は除外設定などへ進む区切りになっている |
| 464 | `  if(has('exclude')){` | 『exclude』がある場合、どの音を除外するかの選択を復元している |
| 465 | `    excludeSel.value = s.exclude;` | 『excludeSel』の値を保存された『s.exclude』に合わせている |
| 466 | `  }` | 除外設定の復元を終え、次の周波数カット設定に進んでいる |
| 467 | `  if(has('lowCut')){` | 『lowCut』があるとき、低い音のカット設定を復元する準備をしている |
| 468 | `    // 入力値は整数として扱い、NaNなら0に戻す` | 『lowCut』の値を整数として読み取り、数字でない場合の扱いを明確にしている |
| 469 | `    const value = parseInt(s.lowCut,10);` | 読み取った値が数字ならそのまま、そうでなければ0として低域カットを適用している |
| 470 | `    applyLowCut(Number.isNaN(value) ? 0 : value, false);` | 低域カットを反映する処理を、決めた値で行っている（第2引数で挙動を制御） |
| 471 | `  }` | 低域側の設定を終え、次に高い音のカット設定に進んでいる |
| 472 | `  if(has('highCut')){` | 『highCut』があるとき、高い音のカット設定を復元する準備をしている |
| 473 | `    // 高域の制限も同様に安全な範囲へクランプ` | 高い音の制限も、整数値に直しつつ安全な範囲に収めると説明している |
| 474 | `    const value = parseInt(s.highCut,10);` | 『highCut』の値を整数として読み取り、数字かどうかを確認している |
| 475 | `    applyHighCut(Number.isNaN(value) ? 0 : value, false);` | 有効な数字ならその値で、そうでないなら0として高域カット処理を呼び出している |
| 476 | `  }` | 高域カット設定の反映を終え、次は最大速さの設定へ進む |
| 477 | `  if(has('omegaMaxExp')){` | 『omegaMaxExp』がある場合、最大速さの設定スライダーを復元するようにしている |
| 478 | `    omegaMaxSlider.value = s.omegaMaxExp;` | 『omegaMaxSlider』に保存された『s.omegaMaxExp』をセットしている |
| 479 | `  }` | 最大速さのスライダー値の復元を終え、次は減衰率の設定に移る |
| 480 | `  if(has('dampPct')){` | 『dampPct』があるとき、減衰の割合を復元する準備をしている |
| 481 | `    dampSlider.value = s.dampPct;` | 保存していた「dampPct」の値を、スライダーの位置としてそのまま反映する |
| 482 | `  }else if(!force && s.dampExp!=null){` | そうでなく、強制更新でなく「dampExp」がある場合はこちらの値を使う |
| 483 | `    const exp = parseFloat(s.dampExp);` | 文字列の「dampExp」を小数として読み取り、数値に変換している |
| 484 | `    if(!Number.isNaN(exp)){` | 変換した数値が「数ではない」状態でないかを確認している |
| 485 | `      const q = Math.min(99, Math.max(0.001, Math.pow(10, exp)));` | 10 の exp 乗から 0.001〜99 の範囲におさめた値 q を計算する |
| 486 | `      const p = 100 - q;` | q から 100 を引いて、逆向きの割合 p（0〜100 付近）を求める |
| 487 | `      dampSlider.value = Math.min(99, Math.max(0, p));` | p を 0〜99 に制限して、damp スライダーの値としてセットする |
| 488 | `    }` |  |
| 489 | `  }` |  |
| 490 | `  if(has('snapZeroAlpha')){` | 設定に「snapZeroAlpha」があるときだけ、その値を反映する準備をする |
| 491 | `    snapAlphaCheckbox.checked = !!s.snapZeroAlpha;` | snapZeroAlpha の設定を true/false に直し、チェックボックスの状態に反映する |
| 492 | `  }` |  |
| 493 | `  if(has('fileOp')){` | 設定に「fileOp」があるときだけ、ファイル操作モードを反映する |
| 494 | `    fileOp.value = s.fileOp;` | 保存されていた s.fileOp を、選択メニュー fileOp の値としてセットする |
| 495 | `  }` |  |
| 496 | `  if(has('uiHidden')){` | 設定に「uiHidden」があるときだけ、UI の表示状態を反映する |
| 497 | `    uiVisible = !s.uiHidden;` | s.uiHidden の逆を uiVisible に入れ、表示するかどうかを決める |
| 498 | `    updateUIVisibility();` | 今の uiVisible の値にもとづき、UI を表示・非表示に更新する |
| 499 | `  }` |  |
| 500 | `}` |  |
| 501 | `` |  |
| 502 | `function loadSettings(){` | 保存してある設定を読み込み、画面に反映するための処理をまとめた関数 |
| 503 | `  let stored = {};` | まず空のオブジェクト stored を用意し、ここに設定を読み込む |
| 504 | `  try{` | 壊れたデータがあっても止まらないよう、読み込み処理を try の中で行う |
| 505 | `    // localStorageから設定文字列を取得し、壊れていてもアプリが落ちないようにする` | localStorage から設定文字列を安全に取り出す意図をコメントで説明している |
| 506 | `    stored = JSON.parse(localStorage.getItem(SETTINGS_KEY) \|\| '{}') \|\| {};` | 保存文字列を JSON として読み込み、なければ空の設定オブジェクトにする |
| 507 | `  }catch{}` | 読み込みに失敗した場合は何もせずスルーして、アプリを止めない |
| 508 | `  applySettings(stored);` | 読み込んだ stored を使い、各種設定を画面と内部状態に反映する |
| 509 | `  applyUIScale();` | UI の拡大率設定を現在の設定値にもとづいて適用する |
| 510 | `  applyI18N();` | 多言語対応の表示（テキストなど）を、現在の設定に合わせて更新する |
| 511 | `  snapZeroAlpha = snapAlphaCheckbox.checked;` | チェックボックスの状態から snapZeroAlpha を読み取り、内部の値として保持する |
| 512 | `  updateDampFromSlider();` | スライダー位置からダンプ値を再計算し、表示と内部状態をそろえる |
| 513 | `  updateFileOpUI();` | ファイル操作モードに応じて、関連するボタンなどのUIを更新する |
| 514 | `}` |  |
| 515 | `` |  |
| 516 | `/* ===== UI show/hide ===== */` | ここから UI の表示・非表示に関する処理が始まることを示すコメント |
| 517 | `let uiVisible = true;` | UI が見えているかどうかを表すフラグを、初期状態は true（表示）で持つ |
| 518 | `function updateUIVisibility(){` | uiVisible の状態に合わせて、UIを表示・非表示に切り替える関数 |
| 519 | `  // displayプロパティで丸ごとパネルを非表示にする` | CSS の display を変えて、パネル全体を丸ごと隠す方針だと説明している |
| 520 | `  uiPanel.style.display = uiVisible ? '' : 'none';` | uiVisible が true なら表示、false なら 'none' で完全に隠す |
| 521 | `  uiToggle.setAttribute('aria-pressed', String(!uiVisible));` | UIが隠れているかどうかを、キーボード用の属性 aria-pressed に反映する |
| 522 | `  uiToggle.textContent = uiVisible ? 'UI隠す' : 'UI表示';` | UI が見えているかで、ボタンのラベルを「UI隠す」「UI表示」と切り替える |
| 523 | `}` |  |
| 524 | `// ボタン操作時は状態をトグルして即座に保存` | ボタンを押したときに状態を切り替え、すぐ保存することを説明している |
| 525 | `uiToggle.onclick = ()=>{ uiVisible = !uiVisible; updateUIVisibility(); saveSettings(); };` | ボタンが押されたら uiVisible を反転し、表示更新と設定保存を行う |
| 526 | `// キーボードショートカット（Uキー）での開閉をサポート` | Uキーで UI を開閉できるショートカットがあることを説明している |
| 527 | `addEventListener('keydown', e=>{ if(e.key==='u' \|\| e.key==='U'){ uiVisible = !uiVisible; updateUIVisibility(); saveSettings(); }});` | キー入力で U/u が押されたとき、UI表示状態を切り替え保存する |
| 528 | `` |  |
| 529 | `/* ファイル操作UIの表示切替（再生 or トレーナー） */` | 再生モードとトレーナーモードで、ファイル操作UIの表示を切り替える説明 |
| 530 | `function updateFileOpUI(){` | fileOp の値に応じて、どのボタン群を見せるか決める関数 |
| 531 | `  const isPlay = (fileOp.value === 'play');` | fileOp が 'play' かどうかで、再生モードかどうかを判定している |
| 532 | `  // 再生モードでは再生ボタン群、トレーナーモードでは練習用ボタン群だけを見せる` | 再生モード時は再生ボタンだけ、トレーナーモード時は練習用ボタンだけ出すと説明 |
| 533 | `  document.getElementById('playBtns').style.display  = isPlay ? '' : 'none';` | 再生モードなら再生ボタンを表示し、それ以外では隠す |
| 534 | `  document.getElementById('trainBtns').style.display = isPlay ? 'none' : '';` | 再生モードでないときに練習用ボタンを表示し、再生モードでは隠す |
| 535 | `  if(isPlay){` | 再生モードである場合の表示更新処理をここから書いている |
| 536 | `    // 再生モード時は最新の進行状況を再生ステータスで置き換える` | 再生モードに入ったら、進行状況表示を「再生中」を示す文に置き換える説明 |
| 537 | `    info.textContent = 'file playback';` | 情報欄 info に 'file playback' と表示し、再生ステータスを示す |
| 538 | `  }else{` | 再生モードでない場合（トレーナー時）の処理はこちら |
| 539 | `    // トレーナーモードに切り替わると進捗インジケータを初期化` | トレーナーモードになったら、練習ステップ表示を初期状態に戻すと説明 |
| 540 | `    trainerStat.textContent = 'step: –';` | trainerStat を 'step: –' にして、進捗がリセットされたことを示す |
| 541 | `  }` |  |
| 542 | `}` |  |
| 543 | `fileOp.addEventListener('change', ()=>{ updateFileOpUI(); saveSettings(); });` | fileOp の選択が変わったら UI を更新し、その状態を保存しておく |
| 544 | `` |  |
| 545 | `/* ===== Helpers ===== */` | ここから共通で使う小さな補助関数（ヘルパー）をまとめている |
| 546 | `function midiToHz(m){ return 440*Math.pow(2,(m-69)/12); }` | MIDI 番号 m を、対応する音の周波数（Hz）に変換して返す |
| 547 | `function ringParams(){` | 円形の表示に必要な、リングのサイズ情報などを計算して返す関数 |
| 548 | `  const half = Math.max(1, Math.min(cv.width, cv.height) / 2);` | キャンバスの短い辺の半分を取り、最低 1 以上で半径の基準値 half を決める |
| 549 | `  const safeHalf = Math.max(1, half - 4);` | 半径から余白 4 を引いた安全な半径 safeHalf を計算し、極端な値を避ける |
| 550 | `  let rMax = half - MARGIN;` | 表示に使う最大半径 rMax を、half から余白 MARGIN を引いて仮決定する |
| 551 | `  if(!Number.isFinite(rMax)) rMax = safeHalf;` | rMax が有限な数でなければ、安全な半径 safeHalf を代わりに使う |
| 552 | `  if(rMax < 1) rMax = safeHalf;` | rMax が 1 未満になったときも、安全な半径 safeHalf に差し替える |
| 553 | `  rMax = Math.max(1, Math.min(rMax, safeHalf));` | rMax を 1〜safeHalf の範囲におさめ、無理のない半径になるよう調整する |
| 554 | `  const octaves = activeOctaveCount();` | 現在有効なオクターブ数を調べ、リングの分割数として使う |
| 555 | `  const minRadius = (highCutOct > 0) ? rMax * 0.1 : 0;` | 高音カット設定があれば、中心側に 10% 分の最小半径を確保する |
| 556 | `  const span = Math.max(0, rMax - minRadius);` | 最大半径から最小半径を引き、実際に音を描ける半径範囲 span を出す |
| 557 | `  const step = octaves ? (span / octaves) : 0;` | オクターブ数で割って、オクターブ1つあたりの半径間隔 step を求める |
| 558 | `  return {rMax, step, octaves, minRadius, minFreq: minDisplayFreq(), maxFreq: maxDisplayFreq()};` | 計算した半径やオクターブ数、表示する周波数範囲をまとめて返す |
| 559 | `}` |  |
| 560 | `function baseAngleFromFifthIndex(i){ return ANG0 + 2*Math.PI*(i%12)/12; }` | 五度圏インデックス i から、円周上の基準角度を計算して返す |
| 561 | `function angleForMidiAbs(m){ const pc=((m%12)+12)%12; const idx=FIFTH_INDEX[pc]; return baseAngleFromFifthIndex(idx) + diskAngle; } // 物理用` | MIDI 番号から音名を求め、五度圏の角度と diskAngle を足した物理用角度を返す |
| 562 | `function angleForMidiDraw(m, drawRot){ const pc=((m%12)+12)%12; const idx=FIFTH_INDEX[pc]; return baseAngleFromFifthIndex(idx) + drawRot; } // 描画用` | 同様にMIDI番号から角度を出すが、描画用の回転量 drawRot を使って計算する |
| 563 | `function radiusFromFreq(f, rMax, step, minRadius = 0){` | 周波数と最大半径などから、円のどの半径位置に点を置くか計算する関数 |
| 564 | `  const octaves = activeOctaveCount();` | 今有効なオクターブ数を取得し、半径計算の上限として使う |
| 565 | `  const oc = Math.log2(f / minDisplayFreq());` | 最小表示周波数から見た f のオクターブ差を、対数計算で求める |
| 566 | `  const ocClamped = Math.max(0, Math.min(octaves, oc));` | オクターブ数 oc を 0〜最大オクターブ数の範囲に収める |
| 567 | `  const r = rMax - step*ocClamped;` | 最大半径からオクターブ分の距離を引いて、実際の半径 r を出す |
| 568 | `  return Math.max(minRadius, Math.min(rMax, r));` | r を最小半径〜最大半径に丸め込んで、最終的な半径として返す |
| 569 | `}` |  |
| 570 | `function polarToXY(cx,cy,r,th){ return { x: cx + r*Math.cos(th), y: cy - r*Math.sin(th) }; }` | 中心(cx,cy)から半径 r と角度 th の点を、X,Y 座標に変換して返す |
| 571 | `function shortestDelta(a,b){ let d=b-a; while(d> Math.PI) d-=2*Math.PI; while(d<=-Math.PI) d+=2*Math.PI; return d; }` | 2つの角度差が最も短くなるよう、-π〜π の範囲におさめて返す |
| 572 | `// ステータス表示の更新を一元化` | MIDI 状態の表示更新を一か所で行うための関数だと説明している |
| 573 | `function updateMIDIStat(text){ midiStat.textContent = 'MIDI: ' + text; }` | 渡された文字列の前に 'MIDI: ' を付けて、midiStat に表示する |
| 574 | `` |  |
| 575 | `/* 表示系 */` | ここから表示まわりの設定（不透明度など）を扱うことを示すコメント |
| 576 | `let linkAlpha = parseInt(lineASlider.value,10)/100; lineAVal.textContent=\`${Math.round(linkAlpha*100)}%\`;` | 初期状態で線Aスライダーの値から割合を計算し、パーセント表示を更新する |
| 577 | `lineASlider.oninput = ()=>{ linkAlpha = parseInt(lineASlider.value,10)/100; lineAVal.textContent=\`${Math.round(linkAlpha*100)}%\`; saveSettings(); };` | スライダー操作のたびに linkAlpha を更新し、表示と設定保存を行う |
| 578 | `` |  |
| 579 | `// 直線表示の不透明度をスライダーで制御` | 直線の見えやすさ（透明度）をスライダーで変えられることを説明している |
| 580 | `let straightLinkAlpha = parseInt(straightLineASlider.value,10)/100; straightLineAVal.textContent=\`${Math.round(straightLinkAlpha*100)}%\`;` | 直線用スライダーの値から割合を計算し、表示テキストを初期設定する |
| 581 | `straightLineASlider.oninput = ()=>{` | 直線用スライダーが動いたときの処理をここから定義している |
| 582 | `  straightLinkAlpha = parseInt(straightLineASlider.value,10)/100;` | スライダーの現在値から straightLinkAlpha の割合を再計算する |
| 583 | `  straightLineAVal.textContent = \`${Math.round(straightLinkAlpha*100)}%\`;` | 再計算した割合をパーセントに丸め、ラベルに反映する |
| 584 | `  saveSettings();` | 変更した透明度設定を保存し、次回も同じ見た目で始められるようにする |
| 585 | `};` |  |
| 586 | `` |  |
| 587 | `// ガイド線の可視性調整` | 音のガイド線の見え具合を、スライダーで調整できることを説明している |
| 588 | `let noteGuideAlpha = parseInt(noteGuideASlider.value,10)/100; noteGuideAVal.textContent=\`${Math.round(noteGuideAlpha*100)}%\`;` | ガイド線スライダーの初期値から割合を出し、パーセント表示を用意する |
| 589 | `noteGuideASlider.oninput = ()=>{` | ガイド線スライダーが動いたときの処理を定義している |
| 590 | `  noteGuideAlpha = parseInt(noteGuideASlider.value,10)/100;` | 現在のスライダー値から noteGuideAlpha を計算し直す |
| 591 | `  noteGuideAVal.textContent = \`${Math.round(noteGuideAlpha*100)}%\`;` | 計算した値をパーセント文字列にして、表示ラベルに反映する |
| 592 | `  saveSettings();` | 変更したガイド線の透明度設定を保存しておく |
| 593 | `};` |  |
| 594 | `` |  |
| 595 | `// ガイド番号の不透明度` | ガイド用の番号表示の透明度を調整することを説明している |
| 596 | `let noteGuideLabelAlpha = parseInt(noteGuideLabelASlider.value,10)/100; noteGuideLabelAVal.textContent=\`${Math.round(noteGuideLabelAlpha*100)}%\`;` | 番号用スライダーの初期値から割合を計算し、パーセント表示を更新する |
| 597 | `noteGuideLabelASlider.oninput = ()=>{` | 番号用スライダーが動いたときの処理を定義している |
| 598 | `  noteGuideLabelAlpha = parseInt(noteGuideLabelASlider.value,10)/100;` | スライダー値から noteGuideLabelAlpha を計算し直す |
| 599 | `  noteGuideLabelAVal.textContent = \`${Math.round(noteGuideLabelAlpha*100)}%\`;` | 計算した透明度をパーセント表示にし、ラベルの文字を更新する |
| 600 | `  saveSettings();` | 変更した番号の透明度設定を保存し、次回も同じ状態にする |
| 601 | `};` |  |
| 602 | `` |  |
| 603 | `// 水面表現の濃さを調整` | 水面の見た目の濃さ（不透明さ）を調整するための設定と説明です。 |
| 604 | `let waterAlpha = parseInt(waterASlider.value,10)/100; waterAVal.textContent=\`${Math.round(waterAlpha*100)}%\`;` | スライダー値から水面の透明度を0〜1に変換し、現在の割合をテキスト表示します。 |
| 605 | `waterASlider.oninput = ()=>{ waterAlpha = parseInt(waterASlider.value,10)/100; waterAVal.textContent=\`${Math.round(waterAlpha*100)}%\`; saveSettings(); };` | 水面濃さスライダーが動いたときに透明度と表示を更新し、設定を保存します。 |
| 606 | `` |  |
| 607 | `// 移動ド番号の表示強度` | 移動ド番号（動く数字）の見えやすさをどれくらいにするかの説明です。 |
| 608 | `let movNumAlpha = parseInt(movNumASlider.value,10)/100; movNumAVal.textContent=\`${Math.round(movNumAlpha*100)}%\`;` | スライダー値から移動ド番号の透明度を計算し、何％かを画面に表示します。 |
| 609 | `movNumASlider.oninput = ()=>{ movNumAlpha = parseInt(movNumASlider.value,10)/100; movNumAVal.textContent=\`${Math.round(movNumAlpha*100)}%\`; saveSettings(); };` | 移動ド番号の濃さスライダー変更時に透明度と表示を更新し、設定を保存します。 |
| 610 | `` |  |
| 611 | `// 移動ド番号の文字サイズ` | 移動ド番号の文字サイズを調整するための設定の説明です。 |
| 612 | `let movNumSizePx = parseInt(movNumSizeSlider.value,10); movNumSizeVal.textContent=\`${movNumSizePx}px\`;` | スライダーから文字サイズをピクセル値に変換し、そのサイズを文字として表示します。 |
| 613 | `movNumSizeSlider.oninput = ()=>{ movNumSizePx = parseInt(movNumSizeSlider.value,10); movNumSizeVal.textContent=\`${movNumSizePx}px\`; saveSettings(); };` | 文字サイズスライダーが動いたら新しいサイズを反映し、表示と設定を更新します。 |
| 614 | `` |  |
| 615 | `// ラベル文字サイズ` | ラベルの文字サイズ（テキストの大きさ）を調整する設定の説明です。 |
| 616 | `let labelFontPx = parseInt(labelSizeSlider.value,10); labelSizeVal.textContent=\`${labelFontPx}px\`;` | スライダー値からラベル文字の大きさを読み取り、『xxpx』として表示します。 |
| 617 | `labelSizeSlider.oninput = ()=>{ labelFontPx = parseInt(labelSizeSlider.value,10); labelSizeVal.textContent=\`${labelFontPx}px\`; saveSettings(); };` | ラベル文字サイズスライダー操作時にサイズと表示を更新し、設定を保存します。 |
| 618 | `` |  |
| 619 | `// ラベル背景の透明度` | ラベルの背景部分の透明度をどれくらいにするかの説明です。 |
| 620 | `let labelBgAlpha = parseInt(labelBGSlider.value,10)/100; labelBGVal.textContent=\`${Math.round(labelBgAlpha*100)}%\`;` | スライダー値から背景の透明度を0〜1に計算し、何％かを文字で表示します。 |
| 621 | `labelBGSlider.oninput = ()=>{ labelBgAlpha = parseInt(labelBGSlider.value,10)/100; labelBGVal.textContent=\`${Math.round(labelBgAlpha*100)}%\`; saveSettings(); };` | 背景透明度スライダー変更時に値と表示を更新し、設定を保存します。 |
| 622 | `` |  |
| 623 | `// ラベルテキストの透明度` | ラベル文字そのものの透明度（薄さ）を変える設定の説明です。 |
| 624 | `let labelTextAlpha = parseInt(labelAlphaSlider.value,10)/100; labelAlphaVal.textContent=\`${Math.round(labelTextAlpha*100)}%\`;` | スライダー値からラベル文字の透明度を計算し、現在の％を表示します。 |
| 625 | `labelAlphaSlider.oninput = ()=>{` | ラベル文字透明度スライダーが変わったときの処理をまとめて定義します。 |
| 626 | `  labelTextAlpha = parseInt(labelAlphaSlider.value,10)/100;` | スライダーの現在値からラベル文字の透明度を0〜1の数値に更新します。 |
| 627 | `  labelAlphaVal.textContent = \`${Math.round(labelTextAlpha*100)}%\`;` | 更新した透明度を％に直して、画面上の表示テキストを書き換えます。 |
| 628 | `  saveSettings();` | 変更した透明度設定を保存して、次回も同じ状態で使えるようにします。 |
| 629 | `};` | ラベル文字透明度変更時の処理のまとまりをここで閉じています。 |
| 630 | `` |  |
| 631 | `/* ===== Global state ===== */` | ここからアプリ全体で共有して使う状態（グローバル変数）の説明です。 |
| 632 | `let worldRot = 0;          // 描画用回転（anchorにより決定）` | 描画の回転角度worldRotを0で初期化し、基準位置にしておきます。 |
| 633 | `let diskAngle = 0, diskOmega = 0;` | ディスクの角度diskAngleと回転速度diskOmegaを0で初期化します。 |
| 634 | `let diskMass = Math.pow(10, parseFloat(massSlider.value));` | 質量スライダー値を10のべき乗に変換し、ディスクの質量diskMassにします。 |
| 635 | `let excludeMode = excludeSel.value;` | 除外モードの現在の選択値をexcludeModeに覚えておきます。 |
| 636 | `excludeSel.onchange = ()=>{ excludeMode = excludeSel.value; saveSettings(); };` | 除外モードの選択が変わったとき、新しい値を反映し設定を保存します。 |
| 637 | `` |  |
| 638 | `/* ωmax（log10軸） */` | 最大角速度ωmax（対数スケール）の表示方法に関する説明です。 |
| 639 | `function fmtOmega(v){` | 角速度vの大きさに応じて、小数点以下の桁数を変えて表示する関数です。 |
| 640 | `  if (v >= 10) return v.toFixed(0);` | vが10以上なら小数なしの整数として文字列にします。 |
| 641 | `  if (v >= 1)  return v.toFixed(2);` | vが1以上10未満なら小数2桁で文字列にします。 |
| 642 | `  if (v >= 0.1) return v.toFixed(3);` | vが0.1以上1未満なら小数3桁で文字列にします。 |
| 643 | `  return v.toFixed(4);` | それより小さいときは小数4桁で細かく表示します。 |
| 644 | `}` | 角速度表示を整えるfmtOmega関数の定義をここで終えます。 |
| 645 | `let omegaMaxExp = parseFloat(omegaMaxSlider.value);` | スライダーから最大角速度の指数（log10値）omegaMaxExpを読み取ります。 |
| 646 | `let omegaMax = Math.pow(10, omegaMaxExp);` | 10のomegaMaxExp乗を取り、本当の最大角速度omegaMaxを計算します。 |
| 647 | `omegaMaxVal.textContent = \`${fmtOmega(omegaMax)} rad/s\`;` | 整形したomegaMaxと単位rad/sを組み合わせて画面に表示します。 |
| 648 | `omegaMaxSlider.oninput = ()=>{` | 最大角速度スライダーが動いたときの処理内容をここで定義します。 |
| 649 | `  omegaMaxExp = parseFloat(omegaMaxSlider.value);` | スライダーから新しい指数値を読み取り、omegaMaxExpを更新します。 |
| 650 | `  omegaMax = Math.pow(10, omegaMaxExp);` | 更新された指数から新しい最大角速度omegaMaxを10のべき乗で計算します。 |
| 651 | `  omegaMaxVal.textContent = \`${fmtOmega(omegaMax)} rad/s\`;` | 計算したomegaMaxを見やすい文字列にして、表示欄にセットします。 |
| 652 | `  // UI操作に追従して設定を永続化` | ユーザー操作に合わせて、設定をすぐ保存することを説明するコメントです。 |
| 653 | `  saveSettings();` | 現在の最大角速度設定を保存し、次回も同じ値から始められるようにします。 |
| 654 | `};` | 最大角速度スライダーの処理定義をここで閉じています。 |
| 655 | `` |  |
| 656 | `/* ダンピング（比例）。スライダー値 = p%/s */` | ダンピング（時間あたり何％減らすか）を扱う設定の説明です。 |
| 657 | `let dampPerSec = 0.99; // 初期（99%/s）` | 1秒あたり99％を保つダンピング率dampPerSecの初期値を0.99にします。 |
| 658 | `function fmtPct(p){ return p.toFixed(3); }` | パーセンテージpを小数第3位までの文字列に整える関数です。 |
| 659 | `function updateDampFromSlider(){` | ダンピングのスライダー値から内部状態と表示を更新する処理です。 |
| 660 | `  const raw = parseFloat(dampSlider.value);` | スライダーの現在値を数値として読み取り、rawに保存します。 |
| 661 | `  const p = Number.isNaN(raw) ? 0 : Math.max(0, Math.min(99, raw));` | 値が変かどうかを確認し、0〜99％の範囲に収まるようpを調整します。 |
| 662 | `  dampPerSec = p / 100;                                   // 0.00〜0.99` | 調整したpを100で割り、0〜0.99のダンピング率としてdampPerSecに保存します。 |
| 663 | `  dampVal.textContent = \`${fmtPct(p)}%/s\`;` | 整形したパーセント文字列をdampValに入れ、『xx.x%/s』と画面表示します。 |
| 664 | `}` | ダンピング値更新用関数の定義をここで終えます。 |
| 665 | `updateDampFromSlider();` | ページ表示時に一度、スライダーから現在のダンピング値を反映します。 |
| 666 | `// スライダーを動かすたびに内部状態と保存処理を更新` | スライダー操作のたびに状態更新と保存を行うことを説明するコメントです。 |
| 667 | `dampSlider.oninput = ()=>{ updateDampFromSlider(); saveSettings(); };` | ダンピングスライダー変更時に内部値を更新し、その結果を保存します。 |
| 668 | `` |  |
| 669 | `let snapZeroAlpha = snapAlphaCheckbox.checked;` | チェックボックスの状態から、α=0で速度をゼロにするかどうかを記録します。 |
| 670 | `// α=0時に角速度を強制的にゼロにするかどうかを反映` | αが0のときに角速度を強制的に止める設定を反映する説明コメントです。 |
| 671 | `snapAlphaCheckbox.onchange = ()=>{ snapZeroAlpha = snapAlphaCheckbox.checked; saveSettings(); };` | チェック状態が変わったらsnapZeroAlphaに反映し、設定を保存します。 |
| 672 | `` |  |
| 673 | `/* UI opacity / mass */` | ここからUIの透明度や質量など見た目系の設定を扱う部分です。 |
| 674 | `// UI全体の透明度をスライダーから算出し、最低値を0.1までに制限` | UI全体の透明度をスライダーから計算し、0.1〜1に制限する説明コメントです。 |
| 675 | `function applyUIOpacity(){ const a=Math.max(0.1, Math.min(1, parseInt(uiopSlider.value,10)/100)); uiPanel.style.opacity=a; uiopVal.textContent=\`${Math.round(a*100)}%\`; }` | UI透明度を計算して画面に反映し、現在の％をテキスト表示する関数です。 |
| 676 | `applyUIOpacity(); uiopSlider.oninput = ()=>{ applyUIOpacity(); saveSettings(); };` | 初期表示時に透明度を反映し、スライダー操作時にも更新と保存を行います。 |
| 677 | `// 対数スライダーで受け取った値を指数化してディスク質量へ変換` | 対数スライダーの値を10のべき乗に変え、ディスク質量にする説明コメントです。 |
| 678 | `function updateMass(){ const lg=parseFloat(massSlider.value); diskMass=Math.pow(10,lg); massVal.textContent=\`M=${diskMass.toFixed(2)}\`; }` | 質量スライダー値からdiskMassを計算し、『M=xx』形式で表示します。 |
| 679 | `updateMass(); massSlider.oninput = ()=>{ updateMass(); saveSettings(); };` | 初期に質量を反映し、スライダー変更時にも更新と設定保存を行います。 |
| 680 | `` |  |
| 681 | `const CUT_MAX = 6;` | カットできるオクターブ数の上限を6として定数CUT_MAXに保存します。 |
| 682 | `let lowCutOct = Math.max(0, Math.min(CUT_MAX, parseInt(lowCutSlider.value,10) \|\| 0));` | 低域カットの初期値をスライダーから読み、0〜CUT_MAXの範囲に収めます。 |
| 683 | `let highCutOct = Math.max(0, Math.min(CUT_MAX, parseInt(highCutSlider.value,10) \|\| 0));` | 高域カットの初期値も同様に読み取り、0〜CUT_MAX内に制限します。 |
| 684 | `function activeOctaveCount(){ return Math.max(1, OCTAVES - lowCutOct - highCutOct); }` | 有効なオクターブ数を計算し、最低でも1オクターブ残すようにします。 |
| 685 | `function minDisplayFreq(){ return F_LOW * Math.pow(2, lowCutOct); }` | 低域カット数に応じて、表示する最も低い周波数を求めます。 |
| 686 | `function maxDisplayFreq(){ return F_LOW * Math.pow(2, lowCutOct + activeOctaveCount()); }` | 現在のカット設定から、表示する最も高い周波数を計算します。 |
| 687 | `function formatCutValue(v){ return lang==='ja' ? \`${v}オクターブ\` : \`${v} oct\`; }` | 言語に合わせて『○オクターブ』または『○ oct』の表示文字列を作ります。 |
| 688 | `function updateCutDisplays(){` | 低域・高域カットの表示部分をまとめて更新するための関数です。 |
| 689 | `  lowCutVal.textContent = formatCutValue(lowCutOct);` | 現在のlowCutOctの値を文字列にして、低域カット表示欄に入れます。 |
| 690 | `  highCutVal.textContent = formatCutValue(highCutOct);` | 現在のhighCutOctを文字列化し、高域カット表示欄に反映します。 |
| 691 | `}` | カット表示更新関数の定義をここで終えます。 |
| 692 | `function clampLowCut(value){` | 低域カット値が許される範囲に収まるよう調整する関数の始まりです。 |
| 693 | `  const maxAllowed = Math.min(CUT_MAX, Math.max(0, OCTAVES - 1 - highCutOct));` | 高域側との兼ね合いを見て、低域側として許される最大値maxAllowedを計算します。 |
| 694 | `  return Math.max(0, Math.min(maxAllowed, value));` | 与えられたvalueを0〜maxAllowedの範囲に収めて返します。 |
| 695 | `}` | 低域カット値の調整処理の定義をここで終えます。 |
| 696 | `function clampHighCut(value){` | 高域カット値を範囲内に収めるための調整関数の始まりです。 |
| 697 | `  const maxAllowed = Math.min(CUT_MAX, Math.max(0, OCTAVES - 1 - lowCutOct));` | 低域カットとの合計が限度を超えないよう、高域側の最大値maxAllowedを算出します。 |
| 698 | `  return Math.max(0, Math.min(maxAllowed, value));` | 渡されたvalueを0〜maxAllowedの間におさめ、その値を返します。 |
| 699 | `}` | 高域カット調整関数の定義をここで終えます。 |
| 700 | `function applyLowCut(value, shouldSave = true){` | 低域カット値を適用し、必要なら保存も行う関数の始まりです。 |
| 701 | `  const clamped = clampLowCut(Number.isNaN(value) ? 0 : value);` | 値が未定義やNaNなら0にし、clampLowCutで範囲内に調整します。 |
| 702 | `  // スライダー表示と内部状態をクランプ後の値に揃える` | スライダー表示と内部の値を、調整済みの値にそろえることを説明しています。 |
| 703 | `  if(String(clamped) !== lowCutSlider.value) lowCutSlider.value = String(clamped);` | スライダー表示値と違っていれば、スライダーの数字を調整後の値に直します。 |
| 704 | `  if(lowCutOct !== clamped){` | 内部のlowCutOctと新しい値が違うかどうかで、その後の処理を分けます。 |
| 705 | `    lowCutOct = clamped;` | 値が変わっていればlowCutOctを更新し、新しい低域カットを採用します。 |
| 706 | `    if(shouldSave) saveSettings();` | shouldSaveがtrueなら、変更された設定を保存します。 |
| 707 | `  }else if(shouldSave){` | 値が変わらなくても、保存するよう指定されていれば保存処理を行います。 |
| 708 | `    saveSettings();` | 保存完了後の分岐を閉じています。 |
| 709 | `  }` | 低域カット適用処理の本体ブロックをここで閉じます。 |
| 710 | `  updateCutDisplays();` | 最新のlowCutOctとhighCutOctを使って表示を更新します。 |
| 711 | `}` | 低域カット適用関数の定義をここで終えます。 |
| 712 | `function applyHighCut(value, shouldSave = true){` | 高域カット値を適用し、必要であれば保存も行う関数の始まりです。 |
| 713 | `  const clamped = clampHighCut(Number.isNaN(value) ? 0 : value);` | 値がNaNなら0にし、clampHighCutで許される範囲内の値に直します。 |
| 714 | `  // 無駄な保存処理を避けるため、変化があったときだけ保存` | 不要な保存を減らすため、値が変わったときだけ保存する方針の説明です。 |
| 715 | `  if(String(clamped) !== highCutSlider.value) highCutSlider.value = String(clamped);` | スライダーの表示値が実際の値と違うときだけ、表示を新しい値に更新します。 |
| 716 | `  if(highCutOct !== clamped){` | highCutOctと新しい値が違うかどうかを確認し、その後の処理を分けます。 |
| 717 | `    highCutOct = clamped;` | 高域カット値が変わったときはhighCutOctを更新します。 |
| 718 | `    if(shouldSave) saveSettings();` | 必要であればここで設定を保存し、変更を記憶します。 |
| 719 | `  }else if(shouldSave){` | 値が変わらなくても保存指定があれば、保存を実行します。 |
| 720 | `    saveSettings();` | 高域カット適用処理の条件分岐ブロックをここで閉じます。 |
| 721 | `  }` |  |
| 722 | `  updateCutDisplays();` | カット関連の表示を、現在の設定に合わせて描き直します。 |
| 723 | `}` |  |
| 724 | `updateCutDisplays();` | ページ読み込み時に一度、カット表示を最新の状態に更新します。 |
| 725 | `lowCutSlider.addEventListener('input', ()=>{` | 'lowCutSlider' が動かされたときの処理を登録します。 |
| 726 | `  const value = parseInt(lowCutSlider.value,10);` | スライダーの文字の値を、10進数の整数として読み取ります。 |
| 727 | `  applyLowCut(Number.isNaN(value) ? 0 : value);` | 値が数字ならその値で、数字でなければ 0 としてローカットを反映します。 |
| 728 | `});` |  |
| 729 | `highCutSlider.addEventListener('input', ()=>{` | 'highCutSlider' が動かされたときの処理を登録します。 |
| 730 | `  const value = parseInt(highCutSlider.value,10);` | ハイカット用スライダーの値を、10進数の整数として読み取ります。 |
| 731 | `  applyHighCut(Number.isNaN(value) ? 0 : value);` | 値が数字ならその値で、数字でなければ 0 としてハイカットを反映します。 |
| 732 | `});` |  |
| 733 | `` |  |
| 734 | `DEFAULT_SETTINGS = collectSettingsFromUI();` | 画面から現在の設定を集め、初期状態として 'DEFAULT_SETTINGS' に保存します。 |
| 735 | `if(resetBtn){` | 'resetBtn' が存在するときだけ、リセット処理を用意します。 |
| 736 | `  resetBtn.addEventListener('click', ()=>{` | リセットボタンがクリックされたときの処理を登録します。 |
| 737 | `    // ページ初期化直後の設定スナップショットを基準値として利用` |  |
| 738 | `    const defaults = DEFAULT_SETTINGS \|\| collectSettingsFromUI();` | 保存済みの初期設定があればそれを、なければ今の画面設定を基準にします。 |
| 739 | `    const currentLang = lang;` | 現在選ばれている言語 'lang' を別に控えておきます。 |
| 740 | `    // 言語選択だけは保持したまま他のパラメータをリセット` |  |
| 741 | `    applySettings(defaults, {force:true});` | 基準となる設定を画面全体に反映し、強制的に上書きします。 |
| 742 | `    lang = currentLang;` | さきほど控えた言語設定を 'lang' に戻します。 |
| 743 | `    applyUIScale();` | 画面の拡大率など、見た目のスケールを改めて反映します。 |
| 744 | `    applyI18N();` | 現在の言語に合わせて、表示テキストを切り替えます。 |
| 745 | `    snapZeroAlpha = snapAlphaCheckbox.checked;` | 'snapAlphaCheckbox' の状態から 'snapZeroAlpha' を更新します。 |
| 746 | `    updateDampFromSlider();` | ダンピング量（減衰の強さ）を、スライダーの位置から再計算します。 |
| 747 | `    updateFileOpUI();` | ファイル読み込みや保存ボタンまわりの表示を更新します。 |
| 748 | `    saveSettings();` | 今の設定を保存し、次回も同じ状態から始められるようにします。 |
| 749 | `    connectMIDIAccordingToUI();` | 画面上の設定に合わせて、MIDI の接続状態を更新します。 |
| 750 | `  });` |  |
| 751 | `}` |  |
| 752 | `` |  |
| 753 | `/* ===== Note state ===== */` |  |
| 754 | `// liveNotes と fileNotes は後段の描画・物理計算で参照する入力ノート集合を保持する。` | リアルタイム入力やファイル再生のノート情報を、あとで使えるように持ちます。 |
| 755 | `// どちらも MIDI ノート番号をキー、ベロシティを値とした Map とし、` | どちらも「鍵盤番号→強さ」の対応表として保存します。 |
| 756 | `// 実行時に随時追加・削除される動的な状態を扱う。` | 演奏中にノートの追加・削除が起こる、動く状態を扱います。 |
| 757 | `const liveNotes = new Map();     // ハードMIDI入力の現在押下` | 今まさに押されているハードウェアMIDI鍵盤の情報を保存します。 |
| 758 | `const fileNotes = new Map();     // 再生中のMIDIファイル由来` | 再生中のMIDIファイルから来たノート情報を保存します。 |
| 759 | `` |  |
| 760 | `// NOTE_GUIDE_MARKS は水面に描画する目盛りラベルの一覧。` | 水面に表示する目盛りラベル（音の目安）の一覧を示します。 |
| 761 | `// degree 方向と表示文字列を組み合わせて定義し、` | 角度 'deg' と表示文字 'label' を組み合わせて定義します。 |
| 762 | `// drawNoteGuides 内で極座標位置決定に用いる。` | 'drawNoteGuides' で、極座標上の位置決めに使われます。 |
| 763 | `const NOTE_GUIDE_MARKS = [` | 目盛りラベルの角度と表示文字を並べた配列を定義します。 |
| 764 | `  {deg: 30, label: '-1'},` | 角度 30 度の位置に「-1」というラベルを付けます。 |
| 765 | `  {deg: 60, label: '-2'},` | 角度 60 度の位置に「-2」というラベルを付けます。 |
| 766 | `  {deg: 90, label: '-3'},` | 角度 90 度の位置に「-3」というラベルを付けます。 |
| 767 | `  {deg: 120, label: '-4'},` | 角度 120 度の位置に「-4」というラベルを付けます。 |
| 768 | `  {deg: 150, label: '-5'},` | 角度 150 度の位置に「-5」というラベルを付けます。 |
| 769 | `  {deg: 180, label: 'T'},` | 角度 180 度の位置に「T」というラベルを付けます。 |
| 770 | `  {deg: -30, label: '+1'},` | 角度 -30 度の位置に「+1」というラベルを付けます。 |
| 771 | `  {deg: -60, label: '+2'},` | 角度 -60 度の位置に「+2」というラベルを付けます。 |
| 772 | `  {deg: -90, label: '+3'},` | 角度 -90 度の位置に「+3」というラベルを付けます。 |
| 773 | `  {deg: -120, label: '+4'},` | 角度 -120 度の位置に「+4」というラベルを付けます。 |
| 774 | `  {deg: -150, label: '+5'}` | 角度 -150 度の位置に「+5」というラベルを付けます。 |
| 775 | `];` | 目盛りラベルの定義リストをここで閉じます。 |
| 776 | `` |  |
| 777 | `// NOTE_GUIDE_BASE_COLORS は 1 周分のグラデーション定義。` | 1 周分の色の移り変わり（グラデーション）の元データを表します。 |
| 778 | `// offset を 0.0-1.0 の範囲で解釈し、各区間を線形補間することで` | 0〜1 の範囲の 'offset' を使い、間の色をなめらかに計算します。 |
| 779 | `// 現在角度に応じた色を生成する。` | 角度に応じた色を作るため、このリストをもとに色を求めます。 |
| 780 | `const NOTE_GUIDE_BASE_COLORS = [` | グラデーションの色の区切り点を配列として定義します。 |
| 781 | `  {offset: 0.00, rgba: [255, 255, 255, 0]},  // south -> transparent` | 南方向(0.0)では透明な白色になるように設定します。 |
| 782 | `  {offset: 0.25, rgba: [224, 64, 48, 1]},    // west -> red` | 西方向(0.25)では赤色になるように設定します。 |
| 783 | `  {offset: 0.50, rgba: [0, 0, 0, 1]},        // north -> black` | 北方向(0.50)では黒色になるように設定します。 |
| 784 | `  {offset: 0.75, rgba: [64, 200, 120, 1]},   // east -> green` | 東方向(0.75)では緑色になるように設定します。 |
| 785 | `  {offset: 1.00, rgba: [255, 255, 255, 0]}   // wrap back to south` | 一周回って再び南方向で透明な白に戻るようにします。 |
| 786 | `];` | グラデーションの定義リストをここで閉じます。 |
| 787 | `` |  |
| 788 | `// 与えられた offset（周回位置）から NOTE_GUIDE_BASE_COLORS を補間し、` | 与えられた位置から、先ほどの色リストを使って中間の色を計算します。 |
| 789 | `// 実際に使用する RGBA 値を算出する。` | 計算結果として使う実際の RGBA の値を求めます。 |
| 790 | `function interpolateNoteGuideColor(offset){` | 指定位置から目盛り用の色を計算する関数を定義します。 |
| 791 | `  const normalized = ((offset % 1) + 1) % 1;` | offset を 0〜1 の範囲に収まるように調整します。 |
| 792 | `  const stops = NOTE_GUIDE_BASE_COLORS;` | 色の区切りリスト 'NOTE_GUIDE_BASE_COLORS' を 'stops' として参照します。 |
| 793 | `  if(normalized === 0){` | 位置がちょうど 0 なら、最初の色をそのまま返します。 |
| 794 | `    const [r,g,b,a] = stops[0].rgba;` | 最初の区切り点の RGBA 値を取り出します。 |
| 795 | `    return {r, g, b, a};` | 取り出した RGBA をオブジェクトとして返します。 |
| 796 | `  }` |  |
| 797 | `  for(let i=0; i<stops.length-1; i++){` | 各色区間を順番に見て、どの範囲に入るかを調べます。 |
| 798 | `    const current = stops[i];` | 今見ている区切り点の情報を 'current' に入れます。 |
| 799 | `    const next = stops[i+1];` | 次の区切り点の情報を 'next' に入れます。 |
| 800 | `    if(normalized >= current.offset && normalized <= next.offset){` | 現在の位置が、この 2 点の間にあるかどうかを判定します。 |
| 801 | `      const span = next.offset - current.offset;` | 'current' と 'next' の offset の差を計算します。 |
| 802 | `      const t = span === 0 ? 0 : (normalized - current.offset) / span;` | 区間内での相対的な位置 t を 0〜1 の値として計算します。 |
| 803 | `      const r = Math.round(current.rgba[0] + (next.rgba[0] - current.rgba[0]) * t);` | 赤成分を、current から next へ直線的に混ぜて求めます。 |
| 804 | `      const g = Math.round(current.rgba[1] + (next.rgba[1] - current.rgba[1]) * t);` | 緑成分を、current と next の間で補間して求めます。 |
| 805 | `      const b = Math.round(current.rgba[2] + (next.rgba[2] - current.rgba[2]) * t);` | 青成分を、current と next の間で補間して求めます。 |
| 806 | `      const a = current.rgba[3] + (next.rgba[3] - current.rgba[3]) * t;` | 透明度 a を、current と next の間で補間して求めます。 |
| 807 | `      return {r, g, b, a};` | 計算した RGBA 値をオブジェクトにして返します。 |
| 808 | `    }` |  |
| 809 | `  }` | どの区間にも当てはまらない場合、最後の区切り点の色を使います。 |
| 810 | `  const [r,g,b,a] = stops[stops.length-1].rgba;` | 最後の区切り点の RGBA 値を取り出します。 |
| 811 | `  return {r, g, b, a};` | その最後の色をそのまま返します。 |
| 812 | `}` |  |
| 813 | `` |  |
| 814 | `// RGBA オブジェクトを CSS 互換の rgba() 文字列へ変換する小さなユーティリティ。` | RGBA の値を、CSS で使える 'rgba(...)' 形式の文字に変える小さな関数です。 |
| 815 | `function rgbaToCss({r,g,b,a}){` | 引数から r, g, b, a を取り出して扱いやすくします。 |
| 816 | `  const alpha = Math.max(0, Math.min(1, a));` | 透明度 a が 0〜1 の範囲に収まるように調整します。 |
| 817 | `  const rounded = Math.round(alpha * 1000) / 1000;` | 透明度を小数第 3 位までに丸めます。 |
| 818 | `  return \`rgba(${r},${g},${b},${rounded})\`;` | r,g,b,a の値から 'rgba(r,g,b,a)' 形式の文字列を作って返します。 |
| 819 | `}` |  |
| 820 | `` |  |
| 821 | `// NOTE_GUIDE_BASE_COLORS と interpolateNoteGuideColor を組み合わせて` | 先ほどの色リストと補間関数を組み合わせて色文字列を得ます。 |
| 822 | `// 指定 offset に対応する CSS 色文字列を得るヘルパー。` | 指定された offset に対応する CSS 用の色文字列を作る補助関数です。 |
| 823 | `function noteGuideColorForOffset(offset){` | offset から色を計算し、CSS で使える形に変えて返します。 |
| 824 | `  return rgbaToCss(interpolateNoteGuideColor(offset));` | 'interpolateNoteGuideColor' の結果を 'rgbaToCss' で文字列にします。 |
| 825 | `}` |  |
| 826 | `` |  |
| 827 | `const NOTE_GUIDE_SEGMENT_COUNT = 12;` | 目盛りの色分割数を 12 として定義します。 |
| 828 | `const NOTE_GUIDE_SEGMENT_SPAN = 1 / NOTE_GUIDE_SEGMENT_COUNT;` | 全体 1 周を、12 個の区間に均等に割った長さを求めます。 |
| 829 | `const NOTE_GUIDE_SEGMENT_HALF_SPAN = NOTE_GUIDE_SEGMENT_SPAN / 2;` | 1 区間の半分の長さを求め、中心からの幅として使います。 |
| 830 | `// NOTE_GUIDE_SEGMENTS はグラデーションをセグメント単位に事前分割した配列。` | グラデーションをあらかじめ区切った色セグメントの配列を定義します。 |
| 831 | `// 描画ループで毎回補間するコストを抑えるため、中心 offset ごとに色を保持する。` | 描画のたびに計算しなくてよいよう、区間ごとの色を先に用意します。 |
| 832 | `const NOTE_GUIDE_SEGMENTS = Array.from({length: NOTE_GUIDE_SEGMENT_COUNT}, (_, i)=>{` | セグメント数ぶんの要素を作り、それぞれの情報を埋めていきます。 |
| 833 | `  const centerOffset = i / NOTE_GUIDE_SEGMENT_COUNT;` | i 番目のセグメントの中央位置を 0〜1 の範囲で求めます。 |
| 834 | `  const startOffset = centerOffset - NOTE_GUIDE_SEGMENT_HALF_SPAN;` | セグメントの開始位置（左端）となる offset を計算します。 |
| 835 | `  const endOffset = centerOffset + NOTE_GUIDE_SEGMENT_HALF_SPAN;` | セグメントの終了位置（右端）となる offset を計算します。 |
| 836 | `  let rgba = interpolateNoteGuideColor(centerOffset);` | 中央位置に対応する色を補間して 'rgba' に入れます。 |
| 837 | `  if(i === 0){` | 最初のセグメントの場合だけ、特別に色を上書きします。 |
| 838 | `    rgba = {r: 255, g: 255, b: 255, a: 0};` | 最初のセグメントを透明な白に固定します。 |
| 839 | `  }` |  |
| 840 | `  return {startOffset, endOffset, rgba, css: rgbaToCss(rgba)};` | 開始・終了位置と色、および CSS 用色文字列を1まとめにして返します。 |
| 841 | `});` |  |
| 842 | `` |  |
| 843 | `// drawNoteGuides は音の位置に応じて水面の扇形やラベルを描画する。` | drawNoteGuides が、音の位置に合わせた水面の扇形やラベルを描く関数だと説明している行です。 |
| 844 | `// notePositions: 描画対象となる polar 座標情報を含む配列。` | notePositions は、極座標（角度と距離）の情報が入った配列だと説明しています。 |
| 845 | `// cx/cy: キャンバス中心、diskRadius: 最大半径。` | cx,cy はキャンバス中心の座標、diskRadius は描画に使う最大の半径だと説明しています。 |
| 846 | `  function drawNoteGuides(notePositions, cx, cy, diskRadius){` | drawNoteGuides 関数を定義し、音の位置とキャンバス中心・最大半径を受け取れるようにします。 |
| 847 | `    // ガイドを描く必要が無い状況 (データが無い、透明度 0) は即座に打ち切る。` | ガイドが不要な状況なら、無駄な計算や描画をしないよう早めに処理を終えると説明しています。 |
| 848 | `    if(!notePositions.length \|\| (noteGuideAlpha <= 0 && noteGuideLabelAlpha <= 0)) return;` | 音の情報がないか、ガイドとラベル両方の透明度が 0 以下なら、そのまま関数を抜けます。 |
| 849 | `    const fontPx = Math.round(12 * devicePixelRatio);` | 文字サイズを、12px を画面倍率（devicePixelRatio）で調整して決めています。 |
| 850 | `` |  |
| 851 | `    if(noteGuideAlpha > 0){` | ガイド本体を描く透明度が 0 より大きいときだけ、ガイド扇形の描画処理を行います。 |
| 852 | `      ctx.save();` | 現在の描画設定（色や線の太さなど）を保存して、後で元に戻せるようにします。 |
| 853 | `      ctx.globalAlpha = noteGuideAlpha;` | ガイド用の透明度 noteGuideAlpha を、キャンバス全体の透明度設定に反映します。 |
| 854 | `      const fullTurn = Math.PI * 2;` | 円一周分の角度（2π）を fullTurn として分かりやすく定数にしています。 |
| 855 | `      // rAbs が有効なノートだけを取り出し、遠い順に並べて半径の大小関係を把握する。` | 有効な距離 rAbs を持つ音だけ取り出し、遠い順に並べて半径の関係を把握すると説明しています。 |
| 856 | `      const sortedByRadius = [...notePositions]` | notePositions をコピーして、新しい配列 sortedByRadius の元データにします。 |
| 857 | `        .filter(pos=>Number.isFinite(pos.rAbs) && pos.rAbs > 0)` | rAbs が数値として正しく、かつ 0 より大きい音だけに絞り込んでいます。 |
| 858 | `        .sort((a,b)=> b.rAbs - a.rAbs);` | rAbs が大きい順（遠い順）になるように、配列を並べ替えています。 |
| 859 | `      const innerRadiusByMidi = new Map();` | 各 MIDI ノートごとに、内側の半径を記録するための連想配列（Map）を作ります。 |
| 860 | `      // 各ノートについて、次に近いノートの半径を「内側の境界」として記録する。` | 各ノートに対して、次に近いノートの半径を「内側の境界」として使うと説明しています。 |
| 861 | `      // 次のノートが存在しない場合はディスクを 12 分割した幅だけ内側へ縮める。` | 次のノートがない場合は、円を 12 分割したぶん内側に縮めた半径を境界にすると説明しています。 |
| 862 | `      for(let i=0; i<sortedByRadius.length; i++){` | 並べ替えたノート一覧を先頭から順に調べるループを始めています。 |
| 863 | `        const current = sortedByRadius[i];` | 今見ているノート情報を current という変数に取り出しています。 |
| 864 | `        const next = sortedByRadius[i+1];` | 次の位置のノートを next として取得し、なければ undefined になります。 |
| 865 | `        let inner = next ? next.rAbs : current.rAbs - (diskRadius / 12);` | 次のノートがあればその半径、なければディスク半径の 1/12 だけ内側にした半径を inner にします。 |
| 866 | `        if(!Number.isFinite(inner)) inner = 0;` | inner が有限な数でない場合は、0 に置き換えて安全な値にしています。 |
| 867 | `        innerRadiusByMidi.set(current.midi, Math.max(0, inner));` | current.midi をキーにして、そのノート用の内側半径を innerRadiusByMidi に記録します。 |
| 868 | `      }` | ノートごとの内側半径を計算して記録する処理を締めくくっています。 |
| 869 | `` |  |
| 870 | `      // ノートごとに外周半径と求めた内周半径でドーナツ状の扇形を描画する。` | それぞれの音について、外側と内側の半径でドーナツ状の扇形を描くと説明しています。 |
| 871 | `      for(const pos of notePositions){` | すべての notePositions を順番に取り出し、扇形を描くための処理を始めます。 |
| 872 | `        const outerRadius = pos.rAbs;` | この音の外側の半径として pos.rAbs を outerRadius に保存します。 |
| 873 | `        if(!Number.isFinite(outerRadius) \|\| outerRadius <= 0) continue;` | 外側半径が数値でないか 0 以下なら、その音の描画はスキップします。 |
| 874 | `        const rawInner = innerRadiusByMidi.get(pos.midi);` | その音の MIDI 番号に対応する内側半径 rawInner を、さきほど作った Map から取り出します。 |
| 875 | `        const innerRadius = rawInner==null ? 0 : Math.max(0, Math.min(outerRadius, rawInner));` | 内側半径が未定義なら 0、そうでなければ 0 以上 outerRadius 以下になるよう調整して使います。 |
| 876 | `        if(innerRadius >= outerRadius && innerRadius !== 0) continue;` | 内側半径が外側以上で 0 でない場合は、扇形にならないため描画をスキップします。 |
| 877 | `` |  |
| 878 | `        // NOTE_GUIDE_SEGMENTS で事前計算した色グラデーションを扇形ごとに適用する。` | 事前計算済みの NOTE_GUIDE_SEGMENTS を使い、扇形ごとに色のグラデーションをつけると説明しています。 |
| 879 | `        for(let i=0; i<NOTE_GUIDE_SEGMENT_COUNT; i++){` | NOTE_GUIDE_SEGMENT_COUNT の回数だけ繰り返し、各グラデーション要素を処理します。 |
| 880 | `          const segment = NOTE_GUIDE_SEGMENTS[i];` | 現在のループのグラデーション情報を segment として取り出します。 |
| 881 | `          const {rgba, css, startOffset, endOffset} = segment;` | segment から色情報や開始・終了オフセットを分解して、それぞれ変数に入れています。 |
| 882 | `          if(rgba.a <= 0) continue;` | 透明度 rgba.a が 0 以下のセグメントは、見えないので描画を省きます。 |
| 883 | `          const startAngle = pos.theta - startOffset * fullTurn;` | 扇形の開始角度を、音の向き pos.theta から startOffset 分だけずらして求めます。 |
| 884 | `          const endAngle = pos.theta - endOffset * fullTurn;` | 扇形の終了角度を、pos.theta から endOffset 分だけずらして計算します。 |
| 885 | `` |  |
| 886 | `          // 外周から内周に向かってパスを閉じ、水面に重ねる扇状の塗りを行う。` | 外側から内側に向かって線を閉じ、水面に重ねる扇形の塗りつぶしを行うと説明しています。 |
| 887 | `          ctx.beginPath();` | 新しい図形を描くために、パス（輪郭の記録）を開始します。 |
| 888 | `          ctx.arc(cx, cy, outerRadius, startAngle, endAngle, true);` | 中心 (cx,cy) を基準に outerRadius の円弧を、startAngle から endAngle まで反時計回りに描きます。 |
| 889 | `          if(innerRadius > 0){` | 内側半径が 0 より大きい場合の、内側の円弧を描くかどうかの分岐を始めています。 |
| 890 | `            ctx.arc(cx, cy, innerRadius, endAngle, startAngle, false);` | 内側半径の円弧を、今度は時計回りに描き、ドーナツ状になるよう形を閉じます。 |
| 891 | `          }else{` | 内側半径が 0 のとき、中心点 (cx,cy) へ線を引いて扇形を三角形状に閉じます。 |
| 892 | `            ctx.lineTo(cx, cy);` | 外側から中心へ直線を引き、扇形の輪郭を作る線を追加します。 |
| 893 | `          }` |  |
| 894 | `          ctx.closePath();` | パスの始点と終点をつなぎ、図形の輪郭を完全に閉じます。 |
| 895 | `          ctx.fillStyle = css;` | 塗りつぶしに使う色として、segment で指定された css 色を設定します。 |
| 896 | `          ctx.fill();` | 今のパスの内部を指定した色で塗りつぶし、実際の扇形を描きます。 |
| 897 | `        }` | この音に対する全グラデーションセグメントの描画を終えるための行です。 |
| 898 | `      }` | ノートごとの扇形描画ループを締めくくる行です。 |
| 899 | `` |  |
| 900 | `      ctx.restore();` | 先ほど保存した描画設定を復元し、ガイド描画前の状態に戻します。 |
| 901 | `    }` | ガイド本体の描画処理の if ブロックを閉じています。 |
| 902 | `` |  |
| 903 | `    if(noteGuideLabelAlpha > 0){` | ラベルの透明度が 0 より大きいときだけ、文字ラベルを描く処理を行います。 |
| 904 | `      ctx.save();` | 現在の描画設定を保存し、ラベル描画用に変更しても後で戻せるようにします。 |
| 905 | `      ctx.globalAlpha = noteGuideLabelAlpha;` | ラベル全体の透明度を noteGuideLabelAlpha に設定し、薄く表示できるようにします。 |
| 906 | `      ctx.fillStyle = '#fff';` | ラベル文字の色を白（#fff）に設定しています。 |
| 907 | `      ctx.textAlign = 'center';` | テキスト配置の基準を中央揃えに設定し、左右の中心に文字がくるようにします。 |
| 908 | `      ctx.textBaseline = 'middle';` | テキストの縦方向の基準を中央にし、文字の上下が均等になるようにします。 |
| 909 | `      ctx.font = \`${fontPx}px system-ui\`;` | フォントサイズを fontPx にし、システム標準フォントを使うように指定しています。 |
| 910 | `` |  |
| 911 | `      // それぞれのノートの極座標をデカルト座標に変換し、ラベル文字列を配置する。` | 各音の極座標（角度と距離）を普通の x,y 座標に変換して、ラベルをその位置に置くと説明しています。 |
| 912 | `      for(const pos of notePositions){` | notePositions の各要素を順番に取り出し、それぞれにラベルを描く処理を行います。 |
| 913 | `        const radius = pos.rAbs;` | この音の半径を radius に入れ、ラベル位置の計算に使えるようにします。 |
| 914 | `        if(!Number.isFinite(radius) \|\| radius <= 0) continue;` | 半径が数値でないか 0 以下のときは、その音のラベル描画をスキップします。 |
| 915 | `` |  |
| 916 | `        // NOTE_GUIDE_MARKS に定義されたマーク (度数や文字) を回転角度分だけ配置。` | NOTE_GUIDE_MARKS に書かれた度数や文字を、音の角度分だけ回転して配置すると説明しています。 |
| 917 | `        for(const mark of NOTE_GUIDE_MARKS){` | NOTE_GUIDE_MARKS の各マークを取り出し、それぞれの位置にラベルを描く準備をします。 |
| 918 | `          const angle = pos.theta + mark.deg * Math.PI / 180;` | 音の角度 pos.theta に、マークの角度 deg を足して、実際に描く位置の角度 angle を求めます。 |
| 919 | `          const {x, y} = polarToXY(cx, cy, radius, angle);` | polarToXY を使って、中心と radius, angle からラベルを置く x,y 座標を計算します。 |
| 920 | `          ctx.fillText(mark.label, x, y);` | 計算した位置 (x,y) に、mark.label の文字列を描きます。 |
| 921 | `        }` | 1 つの音に対して、全マークのラベル描画を終えるための行です。 |
| 922 | `      }` | すべての音のラベル描画ループを締めくくる行です。 |
| 923 | `` |  |
| 924 | `      ctx.restore();` | 保存していた描画設定を元に戻し、ラベル描画前の状態へ復帰します。 |
| 925 | `    }` | ラベル描画処理を囲んでいた if ブロックを閉じています。 |
| 926 | `  }` | drawNoteGuides 関数の定義をここで終了します。 |
| 927 | `` |  |
| 928 | `/* ===== Drawing ===== */` | ここから描画処理（Drawing）に関するコードが始まることを示すコメントです。 |
| 929 | `function drawNotes(points, drawRot){` | drawNotes 関数を定義し、与えられた音の点と回転量からノート描画を行えるようにします。 |
| 930 | `  if(!points.length) return;` | 描くべき点が 1 つもないときは、何もせず関数を終えて無駄な処理を避けます。 |
| 931 | `  const {rMax, step, minRadius, minFreq: displayMinFreq, maxFreq: displayMaxFreq}=ringParams(); const cx=cv.width/2, cy=cv.height/2;` | ringParams から描画用の各種パラメータを取得し、キャンバス中心の座標 cx,cy を計算しています。 |
| 932 | `` |  |
| 933 | `  const inRange = [];` | 画面の周波数範囲内に入る音を入れておく配列 inRange を用意します。 |
| 934 | `  const belowRange = [];` | 表示範囲より低い音を入れておく配列 belowRange を用意します。 |
| 935 | `  const aboveRange = [];` | 表示範囲より高い音を入れておく配列 aboveRange を用意します。 |
| 936 | `  // 画面内に入る音・低すぎる音・高すぎる音を分類してエッジケースの描画を安定させる` | 音を範囲内・低すぎ・高すぎに分けて、境界付近の描画を安定させると説明しています。 |
| 937 | `  for(const p of points){` | すべての points を順に取り出し、どの範囲に属するか分類するためのループを始めます。 |
| 938 | `    const f = midiToHz(p.midi);` | この点の MIDI 番号から周波数 f を求め、表示範囲との比較に使います。 |
| 939 | `    if(f < displayMinFreq){` | 周波数が最小表示周波数より低いとき、belowRange にこの音の情報を追加します。 |
| 940 | `      belowRange.push({midi:p.midi, vel:p.vel, f});` | belowRange に、midi・vel（強さ）・周波数 f をまとめたオブジェクトを追加しています。 |
| 941 | `    }else if(f > displayMaxFreq){` | 周波数が最大表示周波数より高い場合、aboveRange にこの音の情報を追加します。 |
| 942 | `      aboveRange.push({midi:p.midi, vel:p.vel, f});` | aboveRange に、midi・vel・周波数 f をまとめて追加しています。 |
| 943 | `    }else{` | それ以外の（範囲内の）音は、inRange に登録します。 |
| 944 | `      inRange.push({midi:p.midi, vel:p.vel, f});` | inRange に、midi・vel・周波数 f をまとめたオブジェクトを入れています。 |
| 945 | `    }` | 分類処理を終え、for ループを閉じています。 |
| 946 | `  }` | どの配列にも音がない場合、描くべきものがないので処理を終了します。 |
| 947 | `  if(!inRange.length && !belowRange.length && !aboveRange.length) return;` |  |
| 948 | `` | 最も低い音 low と最も高い音 high を入れる変数を、まだ値なし（null）で用意します。 |
| 949 | `  let low=null, high=null;` | すべての音をまとめた配列 allPoints を作り、後で最低・最高の周波数を探しやすくします。 |
| 950 | `  const allPoints = [...inRange, ...belowRange, ...aboveRange];` | allPoints の各要素を順に見て、low と high を更新するループを始めます。 |
| 951 | `  for(const p of allPoints){` | low が未設定か、今の音の周波数がより低いとき、その音を最小周波数の候補とします。 |
| 952 | `    if(!low \|\| p.f<low.f) low=p;` | high が未設定か、今の音の周波数がより高いとき、その音を最大周波数の候補とします。 |
| 953 | `    if(!high\|\| p.f>high.f) high=p;` | 最小・最大周波数の更新処理を終え、ループを閉じています。 |
| 954 | `  }` | 個々の音をリング状に描くための補助関数 ring を定義し始めています。 |
| 955 | `  function ring(p, color, label, position = 'top'){` | ring 関数は、MIDI ノートを極座標に変えて円形マーカーとラベルを描くと説明しています。 |
| 956 | `    // MIDIノートを極座標に変換して円形のマーカーとラベルを描く` | p に周波数 f があればそれを使い、なければ MIDI から計算して freq に入れています。 |
| 957 | `    const freq = (p && p.f!=null) ? p.f : midiToHz(p.midi);` | MIDI から角度 th と半径 r を求めて x,y 座標に変換し、描画位置を決めています。 |
| 958 | `    const th=angleForMidiDraw(p.midi, drawRot), r=radiusFromFreq(freq,rMax,step,minRadius), {x,y}=polarToXY(cx,cy,r,th);` | 円形マーカーを描くために線の色・太さを設定し、速度 vel に応じた大きさの円を描いています。 |
| 959 | `    ctx.beginPath(); ctx.strokeStyle=color; ctx.lineWidth=3; ctx.arc(x,y,16+10*p.vel*devicePixelRatio,0,2*Math.PI); ctx.stroke();` | 文字色やフォントを設定し、マーカーの中心に文字ラベルを中央揃えで描く準備をしています。 |
| 960 | `    ctx.fillStyle=color; ctx.font=\`${11*devicePixelRatio}px system-ui\`; ctx.textAlign='center';` |  |
| 961 | `    const labelOffset = 22 * devicePixelRatio;` | ラベルを円からどれだけ離して描くかの距離を、画面の密度に合わせて計算している。 |
| 962 | `    if(position === 'bottom'){` | ラベルの位置指定が 'bottom' かどうかを調べて、描く向きを分けている。 |
| 963 | `      ctx.textBaseline='top';` | ラベルの基準位置を「文字の上側」を基準にして配置するように設定している。 |
| 964 | `      ctx.fillText(label, x, y + labelOffset);` | ラベル文字列を、計算した位置より下側に少しずらして描いている。 |
| 965 | `    }else{` | それ以外（bottom 以外）の位置の場合の描画処理に切り替えている。 |
| 966 | `      ctx.textBaseline='bottom';` | ラベルの基準位置を「文字の下側」を基準にして配置するように設定している。 |
| 967 | `      ctx.fillText(label, x, y - labelOffset);` | ラベル文字列を、計算した位置より上側に少しずらして描いている。 |
| 968 | `    }` |  |
| 969 | `  }` |  |
| 970 | `  function labelOnly(p, label, position = 'top', color = 'rgba(220,220,220,0.9)'){` | 指定した点 p に対して、ラベルだけを描くための小さな関数を定義している。 |
| 971 | `    const freq = (p && p.f!=null) ? p.f : midiToHz(p.midi);` | 点 p に周波数 f があればそれを使い、なければ MIDI 番号から周波数に変換している。 |
| 972 | `    const th=angleForMidiDraw(p.midi, drawRot), r=radiusFromFreq(freq,rMax,step,minRadius), {x,y}=polarToXY(cx,cy,r,th);` | MIDI 番号から角度を、周波数から半径を計算し、その極座標を x,y の位置に変換している。 |
| 973 | `    ctx.fillStyle=color; ctx.font=\`${11*devicePixelRatio}px system-ui\`; ctx.textAlign='center';` | ラベルの色と文字サイズ、中央揃えなどの文字描画の基本設定をしている。 |
| 974 | `    const labelOffset = 18 * devicePixelRatio;` | このラベル専用に、少し短めのラベルのずらし量（距離）を計算している。 |
| 975 | `    if(position === 'bottom'){` | ラベル位置が 'bottom' かどうかを調べて、上下どちらに描くかを分けている。 |
| 976 | `      ctx.textBaseline='top';` | ラベルの基準を「文字の上側」にして、下方向に余白ができるようにしている。 |
| 977 | `      ctx.fillText(label, x, y + labelOffset);` | 計算した位置より下側に、ラベル文字をずらして描画している。 |
| 978 | `    }else{` | bottom 以外の場合のラベル描画処理を行う分岐に入っている。 |
| 979 | `      ctx.textBaseline='bottom';` | ラベルの基準を「文字の下側」にして、上方向に余白ができるようにしている。 |
| 980 | `      ctx.fillText(label, x, y - labelOffset);` | 計算した位置より上側に、ラベル文字をずらして描画している。 |
| 981 | `    }` |  |
| 982 | `  }` |  |
| 983 | `  if(low)  ring(low,'rgba(0,200,255,0.95)','LOW','bottom');` | low があれば、その位置に青系のリングと “LOW” ラベルを下側に描いている。 |
| 984 | `  if(high) ring(high,'rgba(255,160,0,0.95)','HIGH','top');` | high があれば、その位置にオレンジ系のリングと “HIGH” ラベルを上側に描いている。 |
| 985 | `` |  |
| 986 | `  if(inRange.length){` | 表示範囲内の点が 1 つ以上ある場合に、その点を処理するためのブロックを始めている。 |
| 987 | `    const strongestByMidi = new Map();` | 同じ MIDI 番号ごとに一番強い音を保存するためのマップを用意している。 |
| 988 | `    for(const p of inRange){` | 表示範囲内の各点 p について、もっとも強いものを選ぶ処理を始めている。 |
| 989 | `      const current = strongestByMidi.get(p.midi);` | その MIDI 番号ですでに登録されている点があるかどうかを取り出している。 |
| 990 | `      if(!current \|\| p.vel > current.vel){` | まだ登録がないか、今回の点の強さが上回っていれば、記録を更新する条件を作っている。 |
| 991 | `        strongestByMidi.set(p.midi, p);` | 条件を満たした場合、その MIDI 番号に対して点 p を「一番強い音」として登録している。 |
| 992 | `      }` |  |
| 993 | `    }` |  |
| 994 | `    const ranked = Array.from(strongestByMidi.values())` | MIDI ごとに一番強い音だけを集めて配列にし、それを ranked という名前で持っている。 |
| 995 | `      .sort((a,b)=> a.f - b.f);` | 周波数 f が低い順に並ぶように、strongestByMidi の値を並べ替えている。 |
| 996 | `    for(let i=0;i<ranked.length;i++){` | 並べ替えた点の配列 ranked を、先頭から順に処理するループを始めている。 |
| 997 | `      const p = ranked[i];` | 現在の順位にある点 p を取り出して、ラベル付けなどに使う準備をしている。 |
| 998 | `      if((low && p.midi === low.midi) \|\| (high && p.midi === high.midi)) continue;` | p が low または high と同じ MIDI の場合は、番号ラベルを付けずに次へ進んでいる。 |
| 999 | `      labelOnly(p, String(i+1), 'top');` | low/high 以外の点に、順位 (i+1) を文字にして上側にラベル表示している。 |
| 1000 | `    }` |  |
| 1001 | `  }` |  |
| 1002 | `` |  |
| 1003 | `  const toPosition = (p)=>{` | 点 p の情報から、描画用の位置や角度を計算して付け足す関数 toPosition を定義している。 |
| 1004 | `    const theta = angleForMidiDraw(p.midi, drawRot);` | p の MIDI 番号から、リング上での角度 theta を求めている。 |
| 1005 | `    const rAbs = radiusFromFreq(p.f, rMax, step, minRadius);` | p の周波数から、リングの半径 rAbs を求めている。 |
| 1006 | `    const {x, y} = polarToXY(cx, cy, rAbs, theta);` | 中心 cx,cy と半径・角度から、実際の画面上の x,y 座標を計算している。 |
| 1007 | `    return {...p, theta, rAbs, x, y};` | 元の p に theta, rAbs, x, y を追加した新しいオブジェクトを返している。 |
| 1008 | `  };` |  |
| 1009 | `` |  |
| 1010 | `  const notePositions = inRange.map(toPosition);` | 表示範囲内のすべての点に対して位置を計算し、notePositions として保存している。 |
| 1011 | `  if(notePositions.length) drawNoteGuides(notePositions, cx, cy, rMax);` | notePositions があれば、その位置情報を使ってガイド線などを描画している。 |
| 1012 | `  const straightLinePositions = allPoints.map(toPosition);` | すべての点 allPoints に対して位置を計算し、straightLinePositions にまとめている。 |
| 1013 | `` |  |
| 1014 | `  if(straightLinePositions.length>=2 && straightLinkAlpha>0){` | 点が 2 つ以上あり、直線リンクの透明度が正なら、直線で結ぶ描画を行う条件をチェックしている。 |
| 1015 | `    ctx.save();` | 現在の描画設定を保存しておき、この後の変更が他に影響しないようにしている。 |
| 1016 | `    ctx.lineWidth = 1.5;` | これから描く直線の太さを 1.5 ピクセルに設定している。 |
| 1017 | `    ctx.strokeStyle = \`rgba(255,128,0,${straightLinkAlpha})\`;` | 直線の色を、透明度 straightLinkAlpha を使ったオレンジ色に設定している。 |
| 1018 | `    for(let i=0;i<straightLinePositions.length-1;i++){` | すべての点の組を作るため、まず i 番目の点 a を選ぶループを回している。 |
| 1019 | `      const a = straightLinePositions[i];` | i 番目の点 a の位置情報を取り出して、線の始点として使う準備をしている。 |
| 1020 | `      for(let j=i+1;j<straightLinePositions.length;j++){` | a 以降の点 b を順に取り出し、a と b の組み合わせごとに線を引くループを回している。 |
| 1021 | `        const b = straightLinePositions[j];` | 現在の組み合わせで、線の終点となる点 b の位置情報を取り出している。 |
| 1022 | `        ctx.beginPath();` | 新しい線を描く準備として、パス（線の経路）の開始を宣言している。 |
| 1023 | `        ctx.moveTo(a.x, a.y);` | 線の描き始めの位置を a の x,y 座標にセットしている。 |
| 1024 | `        ctx.lineTo(b.x, b.y);` | 線の終わりの位置を b の x,y 座標にセットして、a から b への直線を作っている。 |
| 1025 | `        ctx.stroke();` | 設定した線の経路に沿って、実際に線を画面に描いている。 |
| 1026 | `      }` |  |
| 1027 | `    }` |  |
| 1028 | `    ctx.restore();` | 保存していた元の描画設定を戻し、このブロックの影響を外に残さないようにしている。 |
| 1029 | `  }` |  |
| 1030 | `` |  |
| 1031 | `  for(const p of notePositions){` | 計算済みの notePositions の各点について、丸いマーカーを描くループを回している。 |
| 1032 | `    const radius=4+12*p.vel, alpha=0.3+0.6*p.vel;` | 音の強さ vel に応じて丸の大きさと透明度を変え、強い音ほど目立つようにしている。 |
| 1033 | `    ctx.beginPath(); ctx.fillStyle=\`rgba(255,255,255,${alpha})\`; ctx.arc(p.x,p.y,radius,0,2*Math.PI); ctx.fill();` | 白い円を指定の半径で描画し、音の位置を視覚的に示している。 |
| 1034 | `  }` |  |
| 1035 | `` |  |
| 1036 | `  if(inRange.length>=2){` | 表示範囲内の点が 2 つ以上あるとき、隣り合う音同士を滑らかな線で結ぶ処理を行う。 |
| 1037 | `    const xs = inRange.map(p=>({m:p.midi,f:p.f})).sort((a,b)=>a.f-b.f);` | MIDI と周波数だけを取り出し、周波数が低い順に並べた配列 xs を作っている。 |
| 1038 | `    ctx.lineWidth=2; ctx.strokeStyle=\`rgba(255,255,255,${linkAlpha})\`;` | これから描く線の太さと色（透明度 linkAlpha）を設定している。 |
| 1039 | `    for(let i=0;i<xs.length-1;i++){` | 並び替えた xs の隣り合うペアごとに線を引くためのループを回している。 |
| 1040 | `      const m0=xs[i].m,f0=xs[i].f,m1=xs[i+1].m,f1=xs[i+1].f;` | 現在のペアの両端の MIDI と周波数を、それぞれ m0,f0 と m1,f1 として取り出している。 |
| 1041 | `      const r0=radiusFromFreq(f0,rMax,step,minRadius), th0=angleForMidiDraw(m0, drawRot);` | 両端の周波数から半径を、MIDI から角度を求め、始点側の座標情報を用意している。 |
| 1042 | `      const r1=radiusFromFreq(f1,rMax,step,minRadius), th1=angleForMidiDraw(m1, drawRot);` | 同じように終点側の半径と角度を求め、線の終点の準備をしている。 |
| 1043 | `      const dth = shortestDelta(th0, th1);` | 角度の差を、一番短い回り方になるように調整した値 dth として計算している。 |
| 1044 | `      const steps=48; ctx.beginPath();` | 線を 48 分割して滑らかに描くために、分割数 steps を決めパスを開始している。 |
| 1045 | `      for(let s=0;s<=steps;s++){ const t=s/steps, r=r0+t*(r1-r0), th=th0+t*dth; const {x,y}=polarToXY(cx,cy,r,th); if(s===0) ctx.moveTo(x,y); else ctx.lineTo(x,y); }` | 0〜1 の割合 t ごとに半径と角度を補間し、極座標から点を計算して曲線として線を引いている。 |
| 1046 | `      ctx.stroke();` | 設定した曲線のパスに沿って、実際に線を描いている。 |
| 1047 | `    }` |  |
| 1048 | `  }` |  |
| 1049 | `` |  |
| 1050 | `  if(belowRange.length \|\| aboveRange.length){` | 範囲外（低すぎる・高すぎる）にある音がある場合、それらを別の場所に表示する準備をしている。 |
| 1051 | `    const highMarkerRadius = Math.max(minRadius, rMax * 0.1);` | 高い音用マーカーを置く半径を決め、最低半径と全体の 10% の大きい方を使っている。 |
| 1052 | `    const drawOutOfRange = (list, radius, color)=>{` | 範囲外の音リストを受け取り、指定した半径と色でマーカーを描く関数を定義している。 |
| 1053 | `      for(const p of list){` | 渡された範囲外の各点 p について、位置計算と描画を行うループを始めている。 |
| 1054 | `        const theta = angleForMidiDraw(p.midi, drawRot);` | その音の MIDI 番号から角度を計算し、リング上の向きを決めている。 |
| 1055 | `        const {x,y}=polarToXY(cx,cy,radius,theta);` | 中心と半径・角度から、実際に描画する x,y 座標を求めている。 |
| 1056 | `        const markerRadius=4+12*p.vel;` | 音の強さ vel に応じてマーカーの円の大きさを変え、強い音ほど大きくしている。 |
| 1057 | `        ctx.beginPath(); ctx.fillStyle=color; ctx.arc(x,y,markerRadius,0,2*Math.PI); ctx.fill();` | 指定された色の円を描き、範囲外の音の位置を目立たせて表示している。 |
| 1058 | `      }` |  |
| 1059 | `    };` |  |
| 1060 | `    if(belowRange.length){` | 低すぎる音が 1 つ以上あれば、外側のリング上に赤系のマーカーを描いている。 |
| 1061 | `      drawOutOfRange(belowRange, rMax, 'rgba(255,120,120,0.85)');` | belowRange の音を、rMax の半径と赤っぽい色で drawOutOfRange に描かせている。 |
| 1062 | `    }` |  |
| 1063 | `    if(aboveRange.length){` | 高すぎる音が 1 つ以上あれば、内側の別リング上に青系のマーカーを描いている。 |
| 1064 | `      drawOutOfRange(aboveRange, highMarkerRadius, 'rgba(120,180,255,0.85)');` | aboveRange の音を、高音用半径と青っぽい色で drawOutOfRange に描かせている。 |
| 1065 | `    }` |  |
| 1066 | `  }` |  |
| 1067 | `}` |  |
| 1068 | `` |  |
| 1069 | `/* ターゲット描画（トレーナー） */` | /* トレーニング用の目標音をリング上に描く処理の区切りコメント。 */ |
| 1070 | `// drawTargetNotes はトレーナーモードで指定したターゲットノートを視覚化する。` | // トレーナーモードで指定したターゲット音を、画面に見えるように描く説明。 |
| 1071 | `// MIDI 番号を受け取り、表示範囲内でリング上にハイライトを描画する。` | // MIDI 番号を元に、リング上の該当位置を光らせて表示することを説明している。 |
| 1072 | `function drawTargetNotes(targets, drawRot){` | ターゲットとなる MIDI 番号の配列を描画する関数 drawTargetNotes を定義している。 |
| 1073 | `  if(!targets \|\| !targets.length) return;` | targets が無いか空なら、何もせずに処理を終了している。 |
| 1074 | `  const {rMax, step, minRadius, minFreq: displayMinFreq, maxFreq: displayMaxFreq}=ringParams(); const cx=cv.width/2, cy=cv.height/2;` | リングの描画設定とキャンバス中心座標を取得し、後の計算で使えるようにしている。 |
| 1075 | `  for(const midi of targets){` | 渡された targets の各 MIDI 番号について、1 つずつ処理するループを回している。 |
| 1076 | `    const freq = midiToHz(midi);` | その MIDI 番号から対応する周波数（音の高さ）を計算している。 |
| 1077 | `    if(freq < displayMinFreq \|\| freq > displayMaxFreq) continue;` | 表示範囲の周波数外なら、その音は画面に描かずスキップしている。 |
| 1078 | `    const th=angleForMidiDraw(midi, drawRot), r=radiusFromFreq(freq,rMax,step,minRadius), {x,y}=polarToXY(cx,cy,r,th);` | MIDI から角度、周波数から半径を求め、リング上での x,y の位置に変換している。 |
| 1079 | `    ctx.beginPath(); ctx.strokeStyle='rgba(100,255,120,0.95)'; ctx.lineWidth=4; ctx.arc(x,y,15*devicePixelRatio,0,2*Math.PI); ctx.stroke();` | その位置に緑色の太い円環を描き、ターゲット音の位置を強調して表示している。 |
| 1080 | `    ctx.fillStyle='rgba(100,255,120,0.95)'; ctx.font=\`${12*devicePixelRatio}px system-ui\`; ctx.textAlign='center'; ctx.textBaseline='top';` | 同じ緑色で文字の設定を行い、ターゲット音のラベルを上側に表示できるよう準備している。 |
| 1081 | `    ctx.fillText('TARGET', x, y+22*devicePixelRatio);` | キャンバス上の位置 (x, y+22*倍率) に「TARGET」という文字を書き込む |
| 1082 | `  }` |  |
| 1083 | `}` |  |
| 1084 | `` |  |
| 1085 | `/* 移動ド数字（水面回転と同期） */` | 水面の回転に合わせて動く数字（移動ド）についての説明コメント |
| 1086 | `// drawMovableDoNumbers は移動ド（メロディック・ソルフェージュ）の数字を描く。` | drawMovableDoNumbers 関数の役割を説明しているコメント |
| 1087 | `// 回転角 halfCenter に追従しながらリング内側に等間隔で表示する。` | 回転角に合わせてリングの内側に等間隔で数字を並べる説明コメント |
| 1088 | `function drawMovableDoNumbers(halfCenter, rMax, cx, cy){` | 移動ドの数字を描く関数を定義し、回転や半径・中心位置を受け取る |
| 1089 | `  const r = rMax * 0.78;` | 最大半径 rMax から少し内側（78%）の位置に描画用の半径 r を決める |
| 1090 | `  const fontPx = Math.round(Math.max(12, movNumSizePx) * devicePixelRatio);` | 文字サイズをピクセルに直し、devicePixelRatio を掛けてくっきり表示にする |
| 1091 | `  const pf=ctx.font, pa=ctx.globalAlpha, ps=ctx.fillStyle, pal=ctx.textAlign, pb=ctx.textBaseline;` | 今のフォントや透明度など描画設定を一時的に保存しておく |
| 1092 | `  // 現在のフォント設定を保存しつつ移動ドの番号を書き込む` | いまの設定を覚えておきつつ、移動ドの番号を書く準備をするという説明 |
| 1093 | `  ctx.font = \`${fontPx}px system-ui\`;` | 保存した文字サイズで、システム標準フォントを使うよう設定する |
| 1094 | `  ctx.textAlign='center'; ctx.textBaseline='middle';` | 文字を中央寄せ・縦方向の中央基準で配置するように設定する |
| 1095 | `  ctx.globalAlpha = movNumAlpha;` | 移動ドの数字の透け具合（透明度）を movNumAlpha に設定する |
| 1096 | `  ctx.fillStyle = 'rgba(255,220,70,1)';` | 移動ドの数字の色を少し黄色がかった明るい色に設定する |
| 1097 | `  const seq = ['7','3','6','2','5','1','4','-7','-3','-6','-2','+4'];` | 表示する移動ドの数字列（7,3,6…など）を配列として用意する |
| 1098 | `  const start = halfCenter - Math.PI/2; // 水面右端` | 水面の右端から描き始める角度を計算し、基準となる start に入れる |
| 1099 | `  for(let i=0;i<12;i++){` | 12個の数字を順番に配置するためのループを回す |
| 1100 | `    const theta = start + i*(Math.PI/6);` | それぞれの数字を、30度ずつずらした角度 theta に配置する |
| 1101 | `    const x = cx + r*Math.cos(theta), y = cy + r*Math.sin(theta);` | 角度 theta と半径 r から、数字を描くキャンバス上の位置 (x, y) を計算する |
| 1102 | `    ctx.fillText(seq[i], x, y);` | 計算した位置 (x, y) に、seq[i] の数字文字を描き込む |
| 1103 | `  }` | 12個ぶんの数字の描画ループを終える |
| 1104 | `  ctx.font=pf; ctx.globalAlpha=pa; ctx.fillStyle=ps; ctx.textAlign=pal; ctx.textBaseline=pb;` | 保存しておいたフォントや色などの描画設定を元に戻す |
| 1105 | `}` |  |
| 1106 | `` |  |
| 1107 | `/* ===== Main draw loop ===== */` | メインの描画ループについての区切りコメント |
| 1108 | `let prevT=null;` | 前回の描画時刻を保存するための変数 prevT を用意し、最初は null にする |
| 1109 | `// draw はキャンバス全体のメイン描画ループ。` | draw 関数がキャンバス全体を描く主な処理であることを説明するコメント |
| 1110 | `// 物理演算の結果を反映しながら、水面・ノート・補助情報を毎フレーム再描画する。` | 物理演算の結果を反映しつつ、水面やノートなどを毎フレーム描く説明コメント |
| 1111 | `function draw(){` | メイン描画処理 draw 関数を定義する |
| 1112 | `  const w=cv.width, h=cv.height, cx=w/2, cy=h/2;` | キャンバスの幅・高さと、その中心座標 (cx, cy) を計算する |
| 1113 | `  const {rMax, step, octaves, minRadius, minFreq: displayMinFreq, maxFreq: displayMaxFreq} = ringParams();` | ringParams からリングの大きさや段差、周波数範囲などの設定をまとめて受け取る |
| 1114 | `  const now = performance.now()/1000;` | 現在時刻をミリ秒から秒に直して now に保存する |
| 1115 | `  // 前フレームとの経過時間を計算し、極端な変動はクランプ` | 前のフレームからの経過時間を計算し、極端な値は抑えるという説明コメント |
| 1116 | `  const dt = prevT? Math.max(1/240, Math.min(0.25, now-prevT)) : 1/60;` | 前回時刻があれば now との差を dt として使い、範囲を 1/240〜0.25秒に制限する |
| 1117 | `  prevT = now;` | 今回の時刻 now を、次回用に prevT として保存しておく |
| 1118 | `` |  |
| 1119 | `  ctx.clearRect(0,0,w,h);` | キャンバス全体を一度きれいに消去してから描き直す |
| 1120 | `` |  |
| 1121 | `  // 物理に使う入力` | 物理演算で使う入力データについての説明コメント |
| 1122 | `  // - 再生: ファイル由来 + ライブ入力` | 再生モードではファイル音とライブ入力の両方を使うと説明しているコメント |
| 1123 | `  // - トレーナ: ライブ入力のみ（ターゲットは描画だけ）` | トレーナモードではライブ入力だけを物理に使う（ターゲットは表示のみ）の説明 |
| 1124 | `  const physicsPoints = (fileOp.value==='play')` | 再生モードかどうかで、物理に使うノートの元（ファイル＋ライブ／ライブだけ）を選ぶ |
| 1125 | `    ? [...Array.from(liveNotes, ([m,v])=>({midi:m, vel:v})),` | ライブ入力メモを {midi, vel} 形式のオブジェクトに変換して配列にする |
| 1126 | `       ...Array.from(fileNotes, ([m,v])=>({midi:m, vel:v}))]` | ファイル由来のノートも同じ形式に変換し、ライブ側の配列に続けて足す |
| 1127 | `    : [...Array.from(liveNotes, ([m,v])=>({midi:m, vel:v}))];` | トレーナモード時はライブ入力だけを {midi, vel} の配列にして使う |
| 1128 | `` |  |
| 1129 | `  const hasPhysInput = physicsPoints.length>0;` | 物理計算用のノート配列に1つ以上データがあるかどうかを調べる |
| 1130 | `  // 物理計算に使えるノートがあるかどうかを示すフラグ` | 物理演算に使えるノートがあるかどうかを示すフラグであることを説明するコメント |
| 1131 | `` |  |
| 1132 | `  // 物理` | ここから物理計算（回転など）を行うという区切りコメント |
| 1133 | `  const tau = hasPhysInput ? torqueFromPoints(physicsPoints, GRAV_ABS, rMax, step, minRadius, displayMinFreq, displayMaxFreq, excludeMode) : 0;` | ノート群からトルク tau を計算し、入力がないときは 0 にする |
| 1134 | `  // トルクを質量で割って角加速度を求める` | 求めたトルクを質量で割り、回転の加速（角加速度）を求める説明コメント |
| 1135 | `  const alpha = tau / Math.max(1e-6, diskMass);` | diskMass が極端に小さくならないようにしつつ、角加速度 alpha を計算する |
| 1136 | `  if (snapZeroAlpha && Math.abs(alpha) < 1e-6){` | ゼロ近くの小さい加速度なら、回転をきっちり止める設定かどうかをチェックする |
| 1137 | `    diskOmega = 0;` | 条件を満たすとき、角速度 diskOmega を 0 にしてぴたりと止める |
| 1138 | `  }else{` | そうでない場合の処理に進むための else ブロックを開始する |
| 1139 | `    diskOmega += alpha * dt;` | 角加速度 alpha と経過時間 dt を使って、角速度 diskOmega を更新する |
| 1140 | `  }` |  |
| 1141 | `` |  |
| 1142 | `  // ダンピング：1秒あたり (1 - p%)^dt` | 回転の減速具合（ダンピング）を、1秒あたり何％落とすかで表す説明コメント |
| 1143 | `  const k = Math.max(0, Math.min(1, 1 - dampPerSec));` | ダンピング率から、1ステップの減衰係数 k を 0〜1の範囲に収めて計算する |
| 1144 | `  diskOmega *= Math.pow(k, dt);` | 角速度 diskOmega に減衰係数 k^dt を掛けて、少しずつ回転を弱める |
| 1145 | `` |  |
| 1146 | `  // 最大回転速度（対数スライダで設定）` | 回転の上限速度を、対数スライダーで決めた値に制限する説明コメント |
| 1147 | `  if(diskOmega > omegaMax) diskOmega = omegaMax;` | 角速度が正の上限 omegaMax を超えていたら、上限値に切り詰める |
| 1148 | `  else if(diskOmega < -omegaMax) diskOmega = -omegaMax;` | 角速度が負の下限 -omegaMax より小さければ、その下限値に切り詰める |
| 1149 | `` |  |
| 1150 | `  diskAngle += diskOmega * dt;` | 現在の角速度 diskOmega と経過時間 dt から、新しい回転角 diskAngle を計算する |
| 1151 | `` |  |
| 1152 | `  // 表示回転と水面中心` | ここからは表示用の回転と水面の中心角度を決める処理だと示すコメント |
| 1153 | `  const anchor = anchorSel.value;                 // 'water' \| 'disk'` | 水面基準かディスク基準かを anchorSel の選択値から読み取る |
| 1154 | `  const drawRot = (anchor==='water') ? diskAngle : 0;` | 水面基準ならディスクの回転角で描画を回し、それ以外なら回さない |
| 1155 | `  const halfCenter = (anchor==='water') ? GRAV_ABS : (GRAV_ABS + diskAngle);` | 水面の中心角 halfCenter を、水面基準かディスク基準かに応じて決める |
| 1156 | `  worldRot = drawRot;` | 決めた表示回転角 drawRot を、世界全体の回転として worldRot に記録する |
| 1157 | `` |  |
| 1158 | `  info.textContent = \`disk \| τ=${tau.toFixed(3)} α=${alpha.toFixed(3)} ω=${diskOmega.toFixed(3)} rad/s\`;` | デバッグ用の情報欄にトルクや角加速度・角速度を小数3桁で表示する |
| 1159 | `` |  |
| 1160 | `  // 放射線` | ここから音の並びに沿った放射状の線を描く処理だと示すコメント |
| 1161 | `  ctx.save(); ctx.translate(cx,cy);` | 現在の描画状態を保存し、原点をキャンバス中心 (cx, cy) に移動する |
| 1162 | `  // 完全5度圏に基づく放射線を一度に描き、A音だけを強調表示` | 完全5度の並びに沿って線を描き、その中で A の線だけ強く表示する説明コメント |
| 1163 | `  const highlightAIndex = FIFTH_INDEX[9];` | A 音に対応するインデックスを完全5度の並びから取り出して保存する |
| 1164 | `  for(let k2=0;k2<12;k2++){` | 12音ぶんの放射線を順番に描くためのループを回す |
| 1165 | `    const ang = baseAngleFromFifthIndex(k2) - drawRot;` | 各音の基本角度から描画回転 drawRot を引き、実際に描く角度 ang を求める |
| 1166 | `    const isA = (k2 === highlightAIndex);` | 今の音が A 音かどうかを調べ、強調するかどうかのフラグにする |
| 1167 | `    ctx.beginPath();` | 一本の線を描く準備として新しいパスを開始する |
| 1168 | `    ctx.strokeStyle = isA ? 'rgba(0,140,140,0.95)' : 'rgba(255,255,255,0.18)';` | A 音なら濃い色、それ以外は薄い白色で線の色を決める |
| 1169 | `    ctx.lineWidth = isA ? 3 : 1.5;` | A 音は太めの線幅 3、それ以外は 1.5 の細めの線幅にする |
| 1170 | `    ctx.moveTo(0,0); ctx.lineTo((rMax+6)*Math.cos(ang),(rMax+6)*Math.sin(ang));` | 中心から、rMax+6 の長さだけ角度 ang の方向に線を引くよう経路を指定する |
| 1171 | `    ctx.stroke();` | 設定したパスを実際に画面に描画する |
| 1172 | `  }` | 12本分の放射線の描画ループを終える |
| 1173 | `  ctx.restore();` | 保存していた描画状態を復元し、原点やスタイルを元に戻す |
| 1174 | `` |  |
| 1175 | `  // 同心円` | ここから同心円（中心を共有する丸）を描く処理であることを示すコメント |
| 1176 | `  ctx.strokeStyle='rgba(255,255,255,0.22)';` | 同心円の線の色を、少し透明な白色に設定する |
| 1177 | `  ctx.lineWidth = 1.5;` | 同心円の線の太さを 1.5 ピクセルに設定する |
| 1178 | `  for(let i=0;i<=octaves;i++){` | オクターブ数ぶん、半径を変えながら同心円を描くループを回す |
| 1179 | `    const rRaw = rMax - i*step;` | 最大半径から step ごとに内側へ下げた円の半径 rRaw を計算する |
| 1180 | `    const radius = Math.max(minRadius, Math.min(rMax, rRaw));` | rRaw が最小・最大の範囲に収まるよう調整して、実際に使う半径 radius にする |
| 1181 | `    if(radius <= 0) continue; // iOS Safari throws if radius is 0 or negative` | radius が 0 以下なら円を描かずに次へ進み、エラーを避ける |
| 1182 | `    // 半径が負にならないように安全策を入れつつ同心円を描く` | 半径がマイナスにならないよう安全対策しつつ、同心円を描く説明コメント |
| 1183 | `    ctx.beginPath();` | 新しい円を描くためのパスを開始する |
| 1184 | `    ctx.arc(cx, cy, radius, 0, 2*Math.PI);` | 中心 (cx, cy) と半径 radius で、0〜2π（1周）の円弧を指定する |
| 1185 | `    ctx.stroke();` | 指定した円弧を実際に画面に描く |
| 1186 | `  }` | すべての同心円を描き終える |
| 1187 | `  ctx.lineWidth = 1;` | 線の太さをふつうの 1 ピクセルに戻す |
| 1188 | `` |  |
| 1189 | `  if(440 >= displayMinFreq && 440 <= displayMaxFreq){` | 440Hz が表示範囲に含まれるときだけ、特別なリングを描くようにする |
| 1190 | `    // 標準ピッチA4=440Hzの位置を特別なリングで示す` | 標準ピッチ A4=440Hz の位置を、特別な円で示すと説明しているコメント |
| 1191 | `    const r440 = radiusFromFreq(440, rMax, step);` | 440Hz に対応する半径 r440 を、周波数から円の位置に変換して求める |
| 1192 | `    ctx.beginPath();` | 440Hz 用の円を描くためのパスを新しく開始する |
| 1193 | `    ctx.strokeStyle = 'rgba(00,100,100,0.9)';` | 440Hz を示す円の線の色を、濃い青緑っぽい色に設定する |
| 1194 | `    ctx.lineWidth = 3;` | この特別な円の線幅を、目立つよう 3 ピクセルに設定する |
| 1195 | `    ctx.arc(cx, cy, r440, 0, 2*Math.PI);` | 中心 (cx, cy) と半径 r440 で一周する円を指定する |
| 1196 | `    ctx.stroke();` | 指定した 440Hz の円を実際に描画する |
| 1197 | `  }` |  |
| 1198 | `  ctx.lineWidth = 1;` | その後に描く線の太さを、また 1 ピクセルに戻す |
| 1199 | `` |  |
| 1200 | `  // 外周ラベル` | ここから外周に文字ラベルなどを描く処理が始まることを示すコメント |
| 1201 | `  const fontPx = labelFontPx * devicePixelRatio * 0.95;` | ラベル用の文字サイズを、表示倍率と少し小さめの係数をかけて計算します |
| 1202 | `  ctx.textAlign='center'; ctx.textBaseline='middle';` | 文字のそろえ位置を横中央・縦中央にして、中心基準で描けるようにします |
| 1203 | `  ctx.font = \`${fontPx}px system-ui\`;` | キャンバスのフォントを、計算した大きさのシステム標準フォントに設定します |
| 1204 | `  for(let k2=0;k2<12;k2++){` | 12個ぶん、五度圏ラベルを順番に描くためのくり返しを始めます |
| 1205 | `    const ang = baseAngleFromFifthIndex(k2) + drawRot;` | 今のラベルの角度を、五度圏の基本角度と回転量から求めます |
| 1206 | `    const tx = cx + (rMax+18)*Math.cos(ang), ty = cy - (rMax+18)*Math.sin(ang);` | 角度と半径から、このラベルを置くキャンバス上の位置(tx, ty)を計算します |
| 1207 | `    const text = FIFTH_LABELS[k2];` | 今の位置に表示するラベル文字を、FIFTH_LABELS から取り出します |
| 1208 | `    const pc = FIFTH_ORDER_PCS[k2]; const [r,g,b] = NOTE_BG[pc];` | 対応する音(pc)を求め、その音に対応した背景色(r,g,b)を取得します |
| 1209 | `    const m = ctx.measureText(text);` | 描く前に文字の幅を測り、背景枠の大きさを決める準備をします |
| 1210 | `    const padX = 6*devicePixelRatio, padY = 3*devicePixelRatio;` | 文字まわりの左右・上下の余白サイズを、画面倍率に合わせて決めます |
| 1211 | `    const wbg = m.width + padX*2, hbg = fontPx + padY*2;` | 文字幅と余白、フォント高さから背景の幅と高さを計算します |
| 1212 | `    const vx = tx - cx, vy = ty - cy;` | 円の中心からラベル位置までのベクトル(vx, vy)を求めます |
| 1213 | `    const safeX = (w/2) - (wbg/2 + 2*devicePixelRatio);` | 画面左右の安全な表示範囲（背景がはみ出さない最大X距離）を計算します |
| 1214 | `    const safeY = (h/2) - (hbg/2 + 2*devicePixelRatio);` | 画面上下の安全な表示範囲（背景がはみ出さない最大Y距離）を計算します |
| 1215 | `    const sx = Math.min(1, Math.abs(vx)>0 ? safeX/Math.abs(vx) : 1);` | X方向で、背景が画面外にはみ出さないように縮小率sxを求めます |
| 1216 | `    const sy = Math.min(1, Math.abs(vy)>0 ? safeY/Math.abs(vy) : 1);` | Y方向で、背景が画面外にはみ出さないように縮小率syを求めます |
| 1217 | `    const s  = Math.min(sx, sy);` | XとYの縮小率のうち小さい方を選び、全体の縮小率sとします |
| 1218 | `    const tx2 = cx + vx*s, ty2 = cy + vy*s;` | 縮小率sをかけて、はみ出さない位置(tx2, ty2)にラベル中心をずらします |
| 1219 | `    ctx.fillStyle = \`rgba(${r},${g},${b},${labelBgAlpha})\`;` | ラベル背景の塗り色を、指定の色と透明度(labelBgAlpha)で設定します |
| 1220 | `    ctx.fillRect(tx2 - wbg/2, ty2 - hbg/2, wbg, hbg);` | 計算した位置とサイズで、ラベル用の背景四角形を描きます |
| 1221 | `    if(labelTextAlpha>0){` | 文字の透明度が0より大きいときだけ文字を描くよう条件をつけます |
| 1222 | `      ctx.fillStyle=\`rgba(255,255,255,${labelTextAlpha})\`;` | 文字色を白+指定の透明度(labelTextAlpha)に設定します |
| 1223 | `      ctx.fillText(text, tx2, ty2);` | 背景の中央(tx2, ty2)にラベルの文字を描きます |
| 1224 | `    }` |  |
| 1225 | `  }` |  |
| 1226 | `` |  |
| 1227 | `  // 水面半円＋移動ド数字` | 水面をイメージした半円と、移動ド用の数字を描く処理の開始コメントです |
| 1228 | `  ctx.save(); ctx.translate(cx,cy);` | 現在の描画状態を保存し、原点を円の中心(cx, cy)に移動します |
| 1229 | `  ctx.beginPath(); ctx.moveTo(0,0);` | 新しい図形のパスを始め、中心(0,0)から描き始めます |
| 1230 | `  ctx.arc(0,0, rMax+6, halfCenter - Math.PI/2, halfCenter + Math.PI/2, false);` | 中心から半径rMax+6の半円弧を、水面の位置に合わせて描きます |
| 1231 | `  ctx.closePath();` | 始点と終点をつないでパスを閉じ、半円の輪郭を完成させます |
| 1232 | `  ctx.fillStyle=\`rgba(0,128,255,${waterAlpha})\`; ctx.fill();` | 水色+透明度(waterAlpha)で塗りつぶし、半円の中身を色で満たします |
| 1233 | `  ctx.beginPath();` | 枠線を描くために新しいパスを書き始めます |
| 1234 | `  ctx.arc(0,0, rMax+6, halfCenter - Math.PI/2, halfCenter + Math.PI/2);` | 同じ半径・角度で再度半円弧を描き、枠線用の形をつくります |
| 1235 | `  ctx.strokeStyle=\`rgba(0,128,255,${waterAlpha})\`; ctx.lineWidth=2; ctx.stroke();` | 枠線の色と太さを設定し、半円の輪郭線を描きます |
| 1236 | `  ctx.restore();` | 座標移動などの設定を元に戻し、他の描画への影響を防ぎます |
| 1237 | `  drawMovableDoNumbers(halfCenter, rMax, cx, cy);` | 半円に合わせて、移動ド方式の音名の数字を描く関数を呼び出します |
| 1238 | `` |  |
| 1239 | `  // 入力の可視化` | ここから、実際の入力音を画面に見えるようにする処理です |
| 1240 | `  const livePts = Array.from(liveNotes, ([m,v])=>({midi:m, vel:v}));` | liveNotes から、MIDI番号と強さを持つ点の配列(livePts)を作ります |
| 1241 | `  const filePts = Array.from(fileNotes, ([m,v])=>({midi:m, vel:v}));` | fileNotes から、MIDI番号と強さを持つ点の配列(filePts)を作ります |
| 1242 | `` |  |
| 1243 | `  if(livePts.length) drawNotes(livePts, drawRot);` | 今鳴っている入力(livePts)があれば、円上にノートを描きます |
| 1244 | `  if(filePts.length && fileOp.value==='play') drawNotes(filePts, drawRot);` | ファイル再生中なら(fileOpがplay)、そのノートも描画します |
| 1245 | `` |  |
| 1246 | `  // ★トレーナーのターゲット表示（trainer.currentNotesを直接描画）` | トレーナーモード用の目標音を画面に表示する処理の説明コメントです |
| 1247 | `  if(fileOp.value==='train' && trainer && trainer.active){` | モードがtrainで、trainerが有効なときだけターゲット表示を行います |
| 1248 | `    const tn = trainer.currentNotes();` | トレーナーから、現在の課題ノート一覧を取得します |
| 1249 | `    if(tn && tn.length) drawTargetNotes(tn, drawRot);` | 課題ノートがあれば、それらを目標として円上に描きます |
| 1250 | `  }` |  |
| 1251 | `` |  |
| 1252 | `  requestAnimationFrame(draw);` | 次の画面更新タイミングで、もう一度draw関数を呼ぶよう予約します |
| 1253 | `}` | 描画処理をまとめたdraw関数の定義を終えます |
| 1254 | `requestAnimationFrame(draw);` | 最初の一回目の描画を始めるために、draw関数を予約して呼び出します |
| 1255 | `` |  |
| 1256 | `/* ===== Audio ctx & synth ===== */` | ここから、音を出すためのAudioContextとシンセの設定部分です |
| 1257 | `let audioCtx=null;` | 共有して使うAudioContextを入れておく変数を、最初はnullで用意します |
| 1258 | `// 再利用できるAudioContextを返し、存在しない場合は新規作成` | 使い回せるAudioContextを返し、無ければ新しく作ることを説明するコメントです |
| 1259 | `function ensureCtx(){ if(!audioCtx) audioCtx=new (window.AudioContext\|\|window.webkitAudioContext)({sampleRate:48000}); return audioCtx; }` | audioCtxがなければ作成し、常に同じAudioContextを返す関数です |
| 1260 | `class PolySynth{` | 同時に複数の音を鳴らせるPolySynthクラスの定義を始めます |
| 1261 | `  constructor(ctx){ this.ctx=ctx; this.master=ctx.createGain(); this.master.gain.value=0.9; this.master.connect(ctx.destination); this.voices=new Map(); }` | シンセの音量調整ノードを作り、出力先に接続し、発音中の音を管理します |
| 1262 | `  // ノートオン時に2つのオシレータとローパスフィルタを構成し、ADSRでゲインを制御` | ノートオン時の仕組み（発振器2つ＋フィルタ＋音量カーブ）を説明するコメントです |
| 1263 | `  noteOn(midi, vel=1, when=null){` | 指定したMIDI音を鳴らし始めるnoteOn処理の本体です |
| 1264 | `    const t = (when!=null)? when : this.ctx.currentTime;` | 発音開始時刻tを、指定がなければ現在時刻から決めます |
| 1265 | `    if(this.voices.has(midi)) this.noteOff(midi, t);` | 同じ音がすでに鳴っている場合は、一度ノートオフしてから鳴らし直します |
| 1266 | `    const f=midiToHz(midi);` | MIDI番号を、実際に鳴らす周波数(Hz)に変換します |
| 1267 | `    const g=this.ctx.createGain(); g.gain.setValueAtTime(0,t);` | 音量を調整するゲインノードを作り、最初は音が出ない0からスタートさせます |
| 1268 | `    const o1=this.ctx.createOscillator(), o2=this.ctx.createOscillator();` | 2つの発振器(波形の元)を作成します |
| 1269 | `    o1.type='sawtooth'; o2.type='square'; o1.frequency.setValueAtTime(f,t); o2.frequency.setValueAtTime(f,t); o2.detune.setValueAtTime(+3,t);` | 1つ目をノコギリ波、2つ目を矩形波にし、周波数と少しの音程ズレを設定します |
| 1270 | `    const flt=this.ctx.createBiquadFilter(); flt.type='lowpass'; flt.frequency.setValueAtTime(3000,t); flt.Q.setValueAtTime(0.7,t);` | ローパスフィルタを作り、高域を少し抑えた柔らかい音になるよう設定します |
| 1271 | `    o1.connect(flt); o2.connect(flt); flt.connect(g); g.connect(this.master);` | 2つの発振器をフィルタ→ゲイン→マスターへとつなぎ、音の流れを作ります |
| 1272 | `    const A=0.005,D=0.12,S=0.25+0.5*vel,R=0.32,peak=0.8*vel;` | アタックなどの時間と音量(ADSR)を決め、ベロシティに応じて強さを変えます |
| 1273 | `    g.gain.linearRampToValueAtTime(peak, t+A);` | 音量を、指定時間Aで一気にピークまで上げるようにします |
| 1274 | `    g.gain.linearRampToValueAtTime(S*peak, t+A+D);` | その後、時間Dをかけて少し小さい維持レベル(S)まで音量を下げます |
| 1275 | `    o1.start(t); o2.start(t);` | 2つの発振器の再生を、時刻tから開始します |
| 1276 | `    this.voices.set(midi,{o1,o2,g,flt,R});` | このMIDI音に対応する発振器やゲインなどを記録しておきます |
| 1277 | `  }` |  |
| 1278 | `  // ノートオフ時はターゲット減衰を設定し、一定時間後にノードを破棄` | ノートオフ時の処理内容（音量を自然に下げて停止）を説明するコメントです |
| 1279 | `  noteOff(midi, when=null){` | 指定されたMIDI音の発音を止める準備をするnoteOff関数です |
| 1280 | `    const v=this.voices.get(midi); if(!v) return;` | 対応する音データが無ければ何もせず終了します |
| 1281 | `    const t=(when!=null)? when : this.ctx.currentTime, R=v.R;` | 止め始める時刻tを決め、保存しておいたリリース時間Rを取り出します |
| 1282 | `    v.g.gain.setTargetAtTime(0,t,R/3);` | ゲインを、目標0に向かって滑らかに減らし、音をフェードアウトさせます |
| 1283 | `    try { v.o1.stop(t+R+0.05); v.o2.stop(t+R+0.05); } catch(e){}` | 少し先の時刻で発振器を止め、エラーが出ても無視します |
| 1284 | `    setTimeout(()=>{ try{ v.g.disconnect(); v.flt.disconnect(); }catch{} }, (R+0.1)*1000);` | 少し遅らせてフィルタとゲインを切り離し、不要なノードを片付けます |
| 1285 | `    this.voices.delete(midi);` | このMIDI音の情報をvoicesリストから削除します |
| 1286 | `  }` |  |
| 1287 | `  allNotesOff(){ for(const m of Array.from(this.voices.keys())) this.noteOff(m); }` | 現在鳴っているすべての音について、順番にノートオフを呼び出します |
| 1288 | `}` |  |
| 1289 | `let synth=null;` | PolySynthのインスタンスを入れておく変数を、最初はnullで用意します |
| 1290 | `` |  |
| 1291 | `/* ===== Web MIDI In（常時） ===== */` | ここから、常に有効なWeb MIDI入力の処理部分が始まります |
| 1292 | `let midiAccess=null;` | MIDIデバイスへのアクセス情報を保存する変数を用意します |
| 1293 | `const attachedInputs = new Set();` | すでにイベントをつないだMIDI入力を記録する集合(Set)です |
| 1294 | `` |  |
| 1295 | `function hex(n){ return n.toString(16).padStart(2,'0'); }` | 数値を2桁の16進数文字列にして返す、小さな変換関数です |
| 1296 | `function logMidi(ev){` | 受け取ったMIDIメッセージを人が読める形にして記録する処理です |
| 1297 | `  const d = Array.from(ev.data\|\|[]).map(hex).join(' ');` | メッセージ本体のバイト列を取り出し、16進数文字の並びに変換します |
| 1298 | `  const name = ev.currentTarget && (ev.currentTarget.name\|\|ev.currentTarget.id\|\|'input');` | イベント元の入力名かIDを取り出し、なければ 'input' を使います |
| 1299 | `  midiLast.textContent = \`${t('last')} ${name}  ${d}\`;` | 最後に受け取ったMIDIメッセージを、画面のテキスト表示に反映します |
| 1300 | `}` |  |
| 1301 | `function midiMessageHandler(ev){` | すべてのMIDIメッセージをここで受け取り、解釈・処理します |
| 1302 | `  logMidi(ev);` | ログ表示のために、受信したメッセージ内容を記録します |
| 1303 | `  const d=ev.data;` | 生のMIDIデータ配列をdとして取り出します |
| 1304 | `  if(!d \|\| d.length<3) return;` | データがなかったり3バイト未満なら、不完全なので何もせず戻ります |
| 1305 | `  const st=d[0]&0xf0, note=d[1], vel=d[2];` | 最初のバイトからステータス、2・3バイト目から音程と強さを読み取ります |
| 1306 | `  // ノートオン/ノートオフを解釈して可視化用のマップに反映` | ノートオン／オフの内容を判断し、画面表示用の状態に反映します |
| 1307 | `  if(st===0x90){` | ノートオン(鍵盤を押した)メッセージの場合の分岐です |
| 1308 | `    if(vel>0){` | ベロシティが0より大きいとき、本当にノートオンとして扱います |
| 1309 | `      liveNotes.set(note, vel/127);` | liveNotesマップに、この音と強さ(0〜1)を登録します |
| 1310 | `      if(liveMon.checked){ if(!synth) synth=new PolySynth(ensureCtx()); synth.noteOn(note, vel/127); }` | モニターONならシンセを用意し、実際にその音を発音します |
| 1311 | `    }else{` | ベロシティ0は実質ノートオフなので、その音をliveNotesから消します |
| 1312 | `      liveNotes.delete(note);` | liveNotesから消した音が鳴っていれば、シンセ側でもノートオフします |
| 1313 | `      if(synth) synth.noteOff(note);` | シンセが存在する場合、対応する音を止めます |
| 1314 | `    }` |  |
| 1315 | `  }else if(st===0x80){` | 明示的なノートオフメッセージ(0x80)の場合の処理です |
| 1316 | `    liveNotes.delete(note);` | liveNotesから、そのノートを削除して画面からも消します |
| 1317 | `    if(synth) synth.noteOff(note);` | シンセがあれば、その音の発音を止めます |
| 1318 | `  }` |  |
| 1319 | `` |  |
| 1320 | `  // ★トレーナー：離鍵必須のエッジ検出でステップ進行` | ここから、トレーナーで鍵盤を離したタイミングを使ってステップを進める処理に続きます |
| 1321 | `  if(fileOp.value==='train' && trainer && trainer.active){` | ファイル操作が「train」で、かつトレーナーが動作中なら以下の処理を行う |
| 1322 | `    trainer.considerAdvance(liveNotes);` | 現在の「liveNotes」を使って、次に進めてよいかトレーナーに判断させる |
| 1323 | `    updateTrainerUI();` | トレーナーの状態が変わったので、画面上の表示を更新する |
| 1324 | `  }` |  |
| 1325 | `}` |  |
| 1326 | `async function setupMIDIInputs(){` | MIDI入力機器を使えるように初期設定する非同期関数を定義する |
| 1327 | `  if(!isSecureContext && !window.__NATIVE_APP__){ updateMIDIStat(t('midiNeedSecure')); return; }` | 安全な通信でない場合は、MIDIには安全な環境が必要と表示して処理を終える |
| 1328 | `  if(!('requestMIDIAccess' in navigator)){ updateMIDIStat(t('midiUnsupported')); return; }` | ブラウザがMIDI機能を持たない場合は、対応していないと表示して処理を終える |
| 1329 | `  try{` | MIDIの初期化を試し、失敗したら下のcatchで処理する |
| 1330 | `    // Web MIDI APIから利用可能なデバイス一覧を取得` | Web MIDI APIで使えるMIDI機器一覧を取ってくる処理の説明コメント |
| 1331 | `    midiAccess = await navigator.requestMIDIAccess({sysex:false, software:true});` | MIDI機器の一覧をブラウザから取得し、結果を「midiAccess」に保存する |
| 1332 | `    midiAccess.onstatechange = refreshMIDIInputs;` | MIDI機器の接続状態が変わったときに「refreshMIDIInputs」を呼ぶよう設定する |
| 1333 | `    await refreshMIDIInputs();` | 今あるMIDI入力機器一覧を読み取り、画面の選択肢に反映させる |
| 1334 | `    updateMIDIStat(\`${t('midiReady')} (${midiAccess.inputs.size})\`);` | 準備できたMIDI入力数を数えて、「準備完了」と共に状態表示を更新する |
| 1335 | `  }catch(e){` | MIDI初期化時にエラーが出た場合の処理をここで行う |
| 1336 | `    updateMIDIStat(\`${t('midiInitFailed')}: ${e.name\|\|e.message}\`);` | 初期化失敗のメッセージとエラー内容を画面下部の状態表示に出す |
| 1337 | `  }` |  |
| 1338 | `}` |  |
| 1339 | `async function refreshMIDIInputs(){` | MIDI入力機器の一覧を読み直して、UIに反映する非同期関数を定義する |
| 1340 | `  if(!midiAccess) return;` | MIDIにまだアクセスできない場合は、何もせず終わる |
| 1341 | `  midiDev.innerHTML='';` | MIDIデバイス用の選択リストの中身をいったん全部消す |
| 1342 | `  const inputs = Array.from(midiAccess.inputs.values());` | 現在利用可能なMIDI入力機器を配列として取得する |
| 1343 | `  // 利用可能なMIDI入力をプルダウンに並べる` | 見つかったMIDI入力機器を、プルダウンメニューに並べる説明コメント |
| 1344 | `  for(const inp of inputs){` | 見つかった各MIDI入力機器ごとに順番に処理を行う |
| 1345 | `    const opt=document.createElement('option'); opt.value=inp.id; opt.textContent=inp.name\|\|inp.id; midiDev.appendChild(opt);` | option要素を作り、機器のidと名前をセットしてプルダウンに追加する |
| 1346 | `  }` |  |
| 1347 | `  await connectMIDIAccordingToUI();` | UI上の選択状態に合わせて、どのMIDI入力に接続するかを更新する |
| 1348 | `}` |  |
| 1349 | `function detachAllInputs(){` | すべてのMIDI入力機器からの受信を止める関数を定義する |
| 1350 | `  for(const inp of attachedInputs){` | 今つながっている全てのMIDI入力機器に対して順番に処理する |
| 1351 | `    try{ inp.onmidimessage=null; if(inp.removeEventListener) inp.removeEventListener('midimessage', midiMessageHandler); }catch{}` | 各入力のMIDIメッセージ受け取りを無効にし、監視用のイベントも外す |
| 1352 | `  }` |  |
| 1353 | `  attachedInputs.clear();` | 接続中リスト「attachedInputs」を空にして、記録もリセットする |
| 1354 | `}` |  |
| 1355 | `async function attachInput(inp){` | 指定されたMIDI入力機器「inp」を接続対象として有効にする非同期関数 |
| 1356 | `  try{ await inp.open(); }catch{}` | MIDI入力を開こうとし、失敗してもエラーは無視する |
| 1357 | `  inp.onmidimessage = midiMessageHandler;` | この入力から来るMIDIメッセージを「midiMessageHandler」で処理するよう指定する |
| 1358 | `  if(inp.addEventListener) inp.addEventListener('midimessage', midiMessageHandler);` | ブラウザが対応していれば、イベントリスナーでもMIDIメッセージを受け取る |
| 1359 | `  attachedInputs.add(inp);` | 接続済み入力セット「attachedInputs」に、この入力機器を登録する |
| 1360 | `}` |  |
| 1361 | `async function connectMIDIAccordingToUI(){` | 画面上の設定にしたがってMIDI入力への接続をやり直す非同期関数 |
| 1362 | `  if(!midiAccess) return;` | MIDIにアクセスできないなら、何もせず終わる |
| 1363 | `  detachAllInputs();` | 今つながっている全てのMIDI入力を一度すべて切断する |
| 1364 | `  const inputs = Array.from(midiAccess.inputs.values());` | 現在利用可能なすべてのMIDI入力機器を配列にする |
| 1365 | `  // 「全入力」がオンなら全ポートを購読し、そうでなければ選択されたデバイスに限定` | 「全入力」を選んだかどうかで、どの機器に接続するか決める説明コメント |
| 1366 | `  if(midiAll.checked \|\| !midiDev.value){` | 「全入力」選択か何も選ばれていない場合は、全ての入力を対象にする |
| 1367 | `    for(const inp of inputs) await attachInput(inp);` | 全てのMIDI入力機器について「attachInput」で接続を有効にする |
| 1368 | `    updateMIDIStat(\`${t('midiAllInputsStat')} (${inputs.length})\`);` | 「全入力」モードで何台接続しているかを状態表示に書き出す |
| 1369 | `  }else{` |  |
| 1370 | `    const target = midiAccess.inputs.get(midiDev.value);` | 選択リストで選ばれているidに対応するMIDI入力機器を取得する |
| 1371 | `    if(target){ await attachInput(target); updateMIDIStat(\`${t('midiInputStatPrefix')} ${target.name\|\|target.id}\`); }` | 機器が見つかれば接続し、その機器名を含めて状態表示を更新する |
| 1372 | `    else{ updateMIDIStat(t('midiNoDevice')); }` | 機器が見つからない場合は、MIDIデバイスがないことを表示する |
| 1373 | `  }` |  |
| 1374 | `}` |  |
| 1375 | `midiDev.onchange = ()=>{ connectMIDIAccordingToUI(); saveSettings(); };` | MIDIデバイス選択が変わったら接続を更新し、設定を保存するようにする |
| 1376 | `midiAll.onchange = ()=>{ connectMIDIAccordingToUI(); saveSettings(); };` | 「全入力」チェックが変わったら接続を更新し、設定を保存するようにする |
| 1377 | `// ライブモニタのON/OFFだけは状態を保存するだけで十分` | ライブモニタのON/OFFは、実際の処理ではなく保存だけしておけばよいという説明 |
| 1378 | `liveMon.onchange = ()=>{ saveSettings(); };` | ライブモニタの状態が変わったとき、その設定だけを保存する |
| 1379 | `` |  |
| 1380 | `/* ===== 自動開始 ===== */` | ここから下は自動で開始するときの処理ブロックであることを示すコメント |
| 1381 | `function autoStart(){` | アプリ起動時のまとめて初期化処理「autoStart」を定義する |
| 1382 | `  // AudioContextとMIDI初期化をアプリ起動時にまとめて実施` | 音を出すためのAudioContextとMIDIの初期化を最初にまとめて行う説明コメント |
| 1383 | `  ensureCtx();` | AudioContextがなければ作るなど、音声用の準備を行う |
| 1384 | `  setupMIDIInputs().then(connectMIDIAccordingToUI);` | MIDI入力を準備したあと、その設定に合わせて接続処理を続けて行う |
| 1385 | `}` |  |
| 1386 | `document.addEventListener('DOMContentLoaded', ()=>{` | ページの読み込みが完全に終わったときに実行する処理を登録する |
| 1387 | `  // ページ読み込み完了後にUIやMIDIの初期状態を整える` | ページ読込完了後に、画面やMIDIの初期状態を整える説明コメント |
| 1388 | `  loadSettings();` | 前回の設定（選択状態など）を記録から読み込む |
| 1389 | `  updateUIVisibility();` | 現在の設定に合わせて、見せるUIと隠すUIを切り替える |
| 1390 | `  updateFileOpUI();` | ファイル操作に関するボタンなどの有効・無効表示を更新する |
| 1391 | `  autoStart();` | 起動時の初期化処理を実行し、AudioとMIDIを準備する |
| 1392 | `  loadDefaultMIDI();` | あらかじめ用意された標準のMIDIデータを読み込む |
| 1393 | `});` |  |
| 1394 | `` |  |
| 1395 | `// iOS: ユーザー操作でAudioContextを復帰` | iOSではユーザー操作をきっかけにAudioContextを再開する必要がある説明コメント |
| 1396 | `['pointerdown','keydown','touchstart'].forEach(ev=>{` | クリックやキー押下などのイベント種類ごとに、後続の処理を登録する |
| 1397 | `  // iOS Safariは自動再生を禁止するため、初回操作でresumeを試みる` | iOS Safariの自動再生制限のため、最初の操作時にresumeを試すことの説明 |
| 1398 | `  addEventListener(ev, ()=>{ try{ if(audioCtx && audioCtx.state==='suspended') audioCtx.resume(); }catch{} }, {once:true});` | 最初の操作があったとき、一度だけAudioContextが止まっていれば再開を試みる |
| 1399 | `});` |  |
| 1400 | `` |  |
| 1401 | `/* ===== Disk torque ===== */` | ここからディスク型モデルのトルク計算（回転力の計算）処理が始まることを示す |
| 1402 | `function torqueFromPoints(points, gravAbs, rMax, step, minRadius, minFreq, maxFreq, excludeMode){` | 音の点群情報から、重力位置などを元にトルク（回転方向の力）を計算する関数 |
| 1403 | `  let tau = 0;` | トルクの合計値「tau」を0で初期化する |
| 1404 | `  for(const p of points){` | 渡された全ての点「points」を順番に取り出して計算する |
| 1405 | `    const thAbs = angleForMidiAbs(p.midi);  // ディスク絶対角` | その点のMIDI番号からディスク上での角度を求める |
| 1406 | `    const freq = midiToHz(p.midi);` | その点のMIDI番号から音の周波数（高さ）を求める |
| 1407 | `    const r = radiusFromFreq(freq, rMax, step, minRadius);` | 周波数からディスク上の半径位置を計算する |
| 1408 | `    const rn = r / rMax;` | 半径を最大半径で割って、0〜1の範囲に正規化する |
| 1409 | `    const d = shortestDelta(gravAbs, thAbs);` | 重力方向との角度差「d」を、最も近い差になるように計算する |
| 1410 | `    const absd = Math.abs(d);` | 角度差「d」の絶対値を「absd」として保存する |
| 1411 | `` |  |
| 1412 | `    // 除外側だけを±1°だけ広げる` | 除外すべき領域を少しだけ広げることで、境目をなめらかに扱う説明コメント |
| 1413 | `    let excluded;` | この点が除外範囲に入るかどうかを示す変数を用意する |
| 1414 | `    if (excludeMode === 'filled'){` | 「filled」モードの場合の除外条件を計算する準備 |
| 1415 | `      excluded = absd <= (Math.PI/2 + EXCLUDE_PAD_RAD);` | 角度差が90度＋少しの幅以内なら、この点は除外対象とする |
| 1416 | `    }else{` | それ以外のモードでは、逆側を除外する条件に切り替える |
| 1417 | `      excluded = absd >= (Math.PI/2 - EXCLUDE_PAD_RAD);` | 角度差が90度−少しの幅以上なら、この点は除外対象とする |
| 1418 | `    }` |  |
| 1419 | `    if (excluded) continue;` | 除外対象の点なら、この点はスキップして次の点の計算に移る |
| 1420 | `` |  |
| 1421 | `    // ベロシティを0〜1に正規化し、半径と角度差からトルク寄与を計算` | ベロシティを0〜1に収め、半径と角度差からトルクへの貢献を計算する説明 |
| 1422 | `    const m = Math.max(0, Math.min(1, p.vel));` | ベロシティ「p.vel」を0〜1の範囲に切り詰めて「m」として使う |
| 1423 | `    tau += m * rn * Math.sin(d);` | 強さmと半径rnと角度差のsinを掛け合わせ、この点のトルクを合計に足す |
| 1424 | `  }` |  |
| 1425 | `  return tau;` | 全ての点からのトルクの合計値「tau」を返す |
| 1426 | `}` |  |
| 1427 | `` |  |
| 1428 | `/* ===== MIDI File loader / parser ===== */` | ここからMIDIファイルの読み込みと解析に関する処理が始まることを示すコメント |
| 1429 | `let midiData = null; // {ppq, tempos:[...], notes:[...], lengthSec, onsets, onsetTicks}` | 読み込んだMIDIのテンポや音符リストなどを入れておく変数midiDataを用意する |
| 1430 | `// ファイル関連のメッセージを下部UIに表示` | ファイルに関するメッセージを画面下の表示エリアに出すための説明コメント |
| 1431 | `function uiLog(msg){ fileInfo.textContent = msg; }` | 渡された文字「msg」をファイル情報表示エリアにそのまま表示する |
| 1432 | `` |  |
| 1433 | `async function fileToArrayBuffer(file){` | 渡されたファイルをArrayBuffer形式に読み込むための非同期関数を定義する |
| 1434 | `  if (file && file.arrayBuffer) {` | fileが存在し、かつarrayBufferメソッドが使えるかを確認する |
| 1435 | `    // 新しいブラウザではFile#arrayBufferが直接使える` | 新しめのブラウザではFile#arrayBufferをそのまま使えることの説明コメント |
| 1436 | `    try { return await file.arrayBuffer(); } catch(e) { /* fallback */ }` | 新しい方法での読み込みを試し、失敗したら古い方法に切り替える |
| 1437 | `  }` |  |
| 1438 | `  // 上記が失敗した場合はFileReaderで読み込むレガシールートを使用` | 上の方法が使えない場合、FileReaderを使う昔ながらの読み込み方法を使う説明 |
| 1439 | `  return await new Promise((resolve, reject)=>{` | Promiseを使い、FileReaderでの読み込みが終わるまで待てるようにする |
| 1440 | `    const fr = new FileReader();` | 実際にFileReaderのインスタンス「fr」を作成する |
| 1441 | `    fr.onload = ()=> resolve(fr.result);` | 読み込み完了したときに、結果データを使えるようにして処理を成功で終わらせます |
| 1442 | `    fr.onerror = ()=> reject(fr.error \|\| new Error('FileReader error'));` | 読み込み中にエラーが起きたときに、その内容を伝えて処理を失敗として終わらせます |
| 1443 | `    fr.readAsArrayBuffer(file);` | FileReader に渡された file を、生のバイト列（ArrayBuffer）として読み始めます |
| 1444 | `  });` | Promise（結果をあとで返す仕組み）をここで閉じています |
| 1445 | `}` |  |
| 1446 | `async function handlePickedFile(file){` | 選ばれたファイルを受け取り、中身を解析するメイン処理を始めます |
| 1447 | `  try{` | エラーが起きたときに備えて、try 節の中の処理を見守ります |
| 1448 | `    uiLog(\`picked: ${file?.name \|\| '(no name)'}  type:${file?.type \|\| 'unknown'}  size:${file?.size \|\| 0}B\`);` | 選択されたファイルの名前・種類・サイズを画面ログに表示します |
| 1449 | `    if(!file) throw new Error('no file');` | ファイルが無い場合は「ファイルがない」というエラーを投げて処理を止めます |
| 1450 | `    // ファイルをArrayBufferへ変換し、MIDIパーサに渡す準備をする` | ファイルをバイト列（ArrayBuffer）に変えて、MIDI を読む準備をする説明コメントです |
| 1451 | `    const ab = await fileToArrayBuffer(file);` | fileToArrayBuffer を使って、ファイルをバイト列データ ab に変換します |
| 1452 | `    if(!ab) throw new Error('arrayBuffer empty');` | 変換結果 ab が空なら「中身がない」というエラーを出して処理を止めます |
| 1453 | `` |  |
| 1454 | `    const parsed = parseMIDI(ab);` | バイト列 ab を parseMIDI に渡して、MIDI として読み取り結果を得ます |
| 1455 | `    if(!parsed \|\| !parsed.notes) throw new Error('parse failed');` | 解析結果や notes 情報が無ければ、解析失敗としてエラーにします |
| 1456 | `    midiData = parsed;` | 解析した MIDI データを、後で使えるように midiData に保存します |
| 1457 | `` |  |
| 1458 | `    const trks = (Array.isArray(midiData.tracks) ? midiData.tracks.length : (midiData.tracks ?? 0));` | トラック数を調べ、配列なら長さ、そうでなければ 0 として数を決めます |
| 1459 | `    uiLog(\`OK: ${file.name}  trks:${trks}  ppq:${midiData.ppq}  len:${midiData.lengthSec.toFixed(2)}s  notes:${midiData.notes.length}\`);` | 読み込んだファイル名やトラック数、長さ、ノート数などをログに表示します |
| 1460 | `` |  |
| 1461 | `    trainer = new Trainer(midiData);` | 解析した midiData を使って、練習用の Trainer オブジェクトを作ります |
| 1462 | `    updateTrainerUI();` | Trainer の内容に合わせて、画面の表示や状態を更新します |
| 1463 | `  }catch(err){` | try 節で起きたエラーを受け取り、ここで処理します |
| 1464 | `    uiLog(\`解析失敗: ${err && err.message ? err.message : err}\`);` | 解析に失敗した理由を、わかる範囲でメッセージとして画面ログに出します |
| 1465 | `    console.error(err);` | エラーの詳しい情報を、開発者向けにコンソールへ出力します |
| 1466 | `  }` | エラー処理を終え、handlePickedFile の処理をここで締めくくります |
| 1467 | `}` |  |
| 1468 | `` |  |
| 1469 | `async function loadMIDIFromNative(base64, fileName = 'sample.mid'){` | ネイティブ側から受け取った base64 文字列を、MIDI ファイルとして読み込む関数です |
| 1470 | `  try{` | この関数内でもエラーを拾うために、try 節から処理を始めます |
| 1471 | `    const binary = atob(base64);` | base64 文字列を元のバイナリ文字列に戻します |
| 1472 | `    const len = binary.length;` | バイナリ文字列の長さを調べて、あとで配列を作るために使います |
| 1473 | `    const bytes = new Uint8Array(len);` | 長さ分だけ入るバイト配列（Uint8Array）を作ります |
| 1474 | `    for(let i = 0; i < len; i++){ bytes[i] = binary.charCodeAt(i); }` | 文字列の各文字コードを取り出し、1 バイトずつ bytes 配列に入れます |
| 1475 | `    const blob = new Blob([bytes], { type: 'audio/midi' });` | bytes 配列をもとに、MIDI 用の Blob データを作ります |
| 1476 | `    let fileLike;` | File のように扱うための変数 fileLike を用意します |
| 1477 | `    try{` | まずは通常の File オブジェクトとして作れるか試します |
| 1478 | `      fileLike = new File([blob], fileName, { type: blob.type \|\| 'audio/midi', lastModified: Date.now() });` | Blob から File を作り、名前や種類、更新日時などの情報を設定します |
| 1479 | `    }catch{` | File コンストラクタが使えない環境だった場合の処理に移ります |
| 1480 | `      fileLike = {` | File が使えないとき用に、自前の「ファイル風オブジェクト」を作り始めます |
| 1481 | `        name: fileName,` | 自前オブジェクトにファイル名を設定します |
| 1482 | `        type: blob.type \|\| 'audio/midi',` | 自前オブジェクトにファイルの種類（MIDI など）を記録します |
| 1483 | `        size: blob.size,` | 自前オブジェクトに Blob のサイズを設定します |
| 1484 | `        arrayBuffer: () => blob.arrayBuffer()` | 必要になったときに Blob から ArrayBuffer を取り出す関数を用意します |
| 1485 | `      };` | 自前で作ったファイル風オブジェクトを完成させます |
| 1486 | `    }` | try〜catch での File 作成処理を終えます |
| 1487 | `    await handlePickedFile(fileLike);` | できあがった fileLike を、通常のファイルと同じように解析処理へ渡します |
| 1488 | `  }catch(err){` | 全体の処理で起きたエラーを受け取り、ここで扱います |
| 1489 | `    console.warn('failed to load MIDI from native:', err);` | ネイティブからの MIDI 読み込みに失敗したことを、注意ログとして出します |
| 1490 | `  }` | エラー処理を終え、loadMIDIFromNative の処理を締めくくります |
| 1491 | `}` |  |
| 1492 | `window.__loadMIDIFromNative = loadMIDIFromNative;` | loadMIDIFromNative 関数を window 直下に公開し、外部から呼び出せるようにします |
| 1493 | `` |  |
| 1494 | `function onFileInput(e){` | ファイル入力欄でファイルが選ばれたときに呼ばれる処理です |
| 1495 | `  const f = e.target && e.target.files && e.target.files[0];` | イベントから最初の選択ファイルを取り出し、変数 f に入れます |
| 1496 | `  if(f) handlePickedFile(f);` | ファイル f があれば、MIDI として解析する処理に渡します |
| 1497 | `}` | onFileInput 関数の定義をここで終えます |
| 1498 | `midiFileInput.addEventListener('change', onFileInput);` | ファイルが変わったとき（change）のイベントで onFileInput を呼び出します |
| 1499 | `midiFileInput.addEventListener('input',  onFileInput);` | 入力が行われたとき（input）のイベントでも onFileInput を呼び出します |
| 1500 | `` |  |
| 1501 | `async function loadDefaultMIDI(){` | まだ MIDI が読み込まれていないときに、標準のサンプル MIDI を読む関数です |
| 1502 | `  if(midiData) return;` | すでに midiData がある場合は、何もせずにここで終わります |
| 1503 | `  if(window.__NATIVE_APP__){` | ネイティブアプリ内で動いているかどうかを確認します |
| 1504 | `    return;` | ネイティブアプリの場合は、サンプル読み込みを行わずに抜けます |
| 1505 | `  }` | ネイティブ判定の if ブロックをここで閉じます |
| 1506 | `  try{` | サンプル読み込み中のエラーに備えて、try 節から実行します |
| 1507 | `    uiLog('loading: sample.mid');` | 「sample.mid を読み込み中」と、画面ログに表示します |
| 1508 | `    const res = await fetch('sample.mid');` | 'sample.mid' をサーバーから取得するようにリクエストを送ります |
| 1509 | `    if(!res.ok) throw new Error(\`HTTP ${res.status}\`);` | 取得に失敗していないか確認し、エラーなら HTTP 状態付きで止めます |
| 1510 | `    const blob = await res.blob();` | 取得したレスポンスを Blob（生データ）として受け取ります |
| 1511 | `    const type = blob.type \|\| 'audio/midi';` | Blob から種類情報を取り出し、無ければ 'audio/midi' として扱います |
| 1512 | `    const fileName = 'sample.mid';` | サンプルファイルの名前を 'sample.mid' として決めます |
| 1513 | `    let fileLike;` | File またはファイル風オブジェクトを入れる変数 fileLike を準備します |
| 1514 | `    try{` | まずは Blob から通常の File を作れるかどうか試します |
| 1515 | `      fileLike = new File([blob], fileName, { type, lastModified: Date.now() });` | Blob から File を作り、種類と更新日時を設定します |
| 1516 | `    }catch{` | File が使えない環境の場合に備えて、別の方法に切り替えます |
| 1517 | `      fileLike = {` | File の代わりに使う、自前のファイル風オブジェクトの中身を作り始めます |
| 1518 | `        name: fileName,` | ファイル風オブジェクトにファイル名をセットします |
| 1519 | `        type,` | ファイル風オブジェクトにファイルの種類をセットします |
| 1520 | `        size: blob.size,` | ファイル風オブジェクトにデータサイズ（バイト数）をセットします |
| 1521 | `        arrayBuffer: () => blob.arrayBuffer()` | 必要なときに Blob から ArrayBuffer を取り出す関数を用意します |
| 1522 | `      };` | ファイル風オブジェクトの組み立てを完了します |
| 1523 | `    }` | File 作成の try〜catch ブロックを閉じます |
| 1524 | `    await handlePickedFile(fileLike);` | できあがった fileLike を通常のファイルと同じように解析処理へ渡します |
| 1525 | `  }catch(err){` | この関数内で発生したエラーを受け取り、ここで処理します |
| 1526 | `    console.warn('failed to load default MIDI file:', err);` | 標準の MIDI ファイル読み込みが失敗したことを、警告ログとして表示します |
| 1527 | `  }` | エラー処理を終え、loadDefaultMIDI 関数の処理を締めくくります |
| 1528 | `}` |  |
| 1529 | `` |  |
| 1530 | `// D&D` | ここからドラッグ＆ドロップでファイルを読み込むための設定が始まる説明です |
| 1531 | `addEventListener('dragover', e=>{ e.preventDefault(); });` | ドラッグ中のデフォルト動作を止め、ドロップできるようにします |
| 1532 | `addEventListener('drop', e=>{` | ファイルがドロップされたときの処理を定義します |
| 1533 | `  e.preventDefault();` | ブラウザの標準のドロップ動作（ページ遷移など）を無効にします |
| 1534 | `  const f = e.dataTransfer && e.dataTransfer.files && e.dataTransfer.files[0];` | ドロップされた中から最初のファイルを取り出して f に入れます |
| 1535 | `  if(f && /\.mid(i)?$/i.test(f.name)) handlePickedFile(f);` | ファイル名が .mid/.midi の場合だけ、MIDI として解析処理に回します |
| 1536 | `});` | ドロップ処理のイベントリスナー定義をここで閉じます |
| 1537 | `` |  |
| 1538 | `/* ---- Simple Standard MIDI parser (format 0/1) ---- */` | ここからシンプルな標準 MIDI を読み取るためのパーサーの説明コメントです |
| 1539 | `function parseMIDI(ab){` | ArrayBuffer ab を受け取り、MIDI データとして解析する関数です |
| 1540 | `  const u8 = new Uint8Array(ab);` | ArrayBuffer を 1 バイトずつ扱える Uint8 配列 u8 に変換します |
| 1541 | `  let p = 0;` | 今どこまで読んだかを示す位置 p を 0 で初期化します |
| 1542 | `  function rdU32(){ const v=((u8[p]<<24)\|(u8[p+1]<<16)\|(u8[p+2]<<8)\|u8[p+3])>>>0; p+=4; return v; }` | 現在位置から 4 バイトを読み、32ビットの数値として取り出し、位置を進めます |
| 1543 | `  function rdU16(){ const v=((u8[p]<<8)\|u8[p+1])>>>0; p+=2; return v; }` | 現在位置から 2 バイトを読み、16ビットの数値として取り出し、位置を進めます |
| 1544 | `  function rdStr(n){ const s=String.fromCharCode.apply(null, u8.slice(p,p+n)); p+=n; return s; }` | 現在位置から n 文字分を文字列として読み出し、その分だけ位置を進めます |
| 1545 | `  function rdVLQ(){ let v=0; let b; do{ b=u8[p++]; v=(v<<7)\|(b&0x7f); }while(b&0x80); return v; }` | 可変長の数値（VLQ）を読み込み、ビットをつなげて 1つの数値として返します |
| 1546 | `` |  |
| 1547 | `  function expect(tag){ const s=rdStr(4); if(s!==tag) throw new Error(\`expect ${tag}, got ${s}\`); }` | 次の4文字が指定の tag と一致するか確認し、違えばエラーにします |
| 1548 | `  expect('MThd'); const len=rdU32(); const pHdr=p; const format=rdU16(); const ntrks=rdU16(); const division=rdU16(); p=pHdr+len;` | MIDI ヘッダ MThd を読み、長さや形式、トラック数、タイミング情報を取得します |
| 1549 | `` |  |
| 1550 | `  if(division & 0x8000) throw new Error('SMPTE time not supported');` | division が特殊な形式（SMPTE）の場合は対応外としてエラーにします |
| 1551 | `  const ppq = division;` | division の値を、そのまま 1拍あたりの細かさ（ppq）として使います |
| 1552 | `` |  |
| 1553 | `  const tracks=[];` | 各トラックのデータを入れていくための配列 tracks を用意します |
| 1554 | `  for(let t=0;t<ntrks;t++){` | トラック数ぶん繰り返し、各トラックの情報を順に読み取ります |
| 1555 | `    expect('MTrk'); const tlen=rdU32(); const end=p+tlen; let tick=0; let running=0; const evs=[];` | トラックヘッダ MTrk と長さを読み、開始位置や時間用の変数を準備します |
| 1556 | `    let tempoEvents=[];` | テンポ変更のイベントを集める配列 tempoEvents を用意します |
| 1557 | `    while(p<end){` | トラックの終わりまで、イベントを一つずつ読み取るループです |
| 1558 | `      const dt = rdVLQ(); tick += dt;` | 可変長の時間 dt を読み、現在の tick（時間位置）に足し込みます |
| 1559 | `      let st = u8[p++];` | 次のステータスバイトを読み取り、イベントの種類を判断します |
| 1560 | `      if(st<0x80){ p--; st = running; } else { running = st; }` | ステータスが省略されたときは前回の値を使い、そうでなければ更新します |
| 1561 | `      if(st===0xFF){` | ステータスバイトが 0xFF（メタイベント）の場合の処理に入ります。 |
| 1562 | `        const type=u8[p++]; const len=rdVLQ(); const data=u8.slice(p,p+len); p+=len;` | メタイベントの種類と長さを読み取り、その長さ分のデータを取り出して位置 p を進めます。 |
| 1563 | `        if(type===0x51 && len===3){ const usPerQ = (data[0]<<16)\|(data[1]<<8)\|data[2]; tempoEvents.push({tick, usPerQ}); }` | テンポ変更（0x51）で長さ3なら、3バイトから「四分音符あたりのマイクロ秒」を計算し、tempoEvents に記録します。 |
| 1564 | `      }else if(st===0xF0 \|\| st===0xF7){` | ステータスが 0xF0 または 0xF7（システムエクスクルーシブ）の場合の処理に入ります。 |
| 1565 | `        const len=rdVLQ(); p+=len;` | SysEx データの長さを読み取り、その分だけ p を進めて中身をまとめて飛ばします。 |
| 1566 | `      }else{` | 上記以外の通常MIDIイベント（ノートなど）の処理に入ります。 |
| 1567 | `        const hi=st&0xF0, ch=st&0x0F;` | ステータスから上位4ビットを hi、下位4ビットをチャンネル ch として取り出します。 |
| 1568 | `        function d(){ return u8[p++]; }` | 1バイト読み取って p を進める、小さな読み取り関数 d を定義しています。 |
| 1569 | `        if(hi===0xC0 \|\| hi===0xD0){ d(); }` | プログラムチェンジやチャンネルプレッシャー（データ1バイトだけ）の場合、1バイトだけ読み捨てます。 |
| 1570 | `        else{` | それ以外（多くのノート系イベント）を処理する分岐に入ります。 |
| 1571 | `          const d1=d(), d2=d();` | 2バイト分のデータを d1, d2 として読み取ります。 |
| 1572 | `          if(hi===0x90){ const note=d1, vel=d2; evs.push({type:(vel>0)?'on':'off', tick, ch, note, vel}); }` | ノートオン(0x90)なら note と強さ vel を取り、vel が0ならオフ扱いとして evs に記録します。 |
| 1573 | `          else if(hi===0x80){ evs.push({type:'off', tick, ch, note:d1, vel:d2}); }` | ノートオフ(0x80)なら、ノート番号と強さをそのままオフイベントとして evs に追加します。 |
| 1574 | `        }` |  |
| 1575 | `      }` |  |
| 1576 | `    }` |  |
| 1577 | `    tracks.push({events:evs, tempos:tempoEvents});` | 1トラック分のイベントとテンポ情報をまとめて tracks 配列に追加します。 |
| 1578 | `  }` |  |
| 1579 | `` |  |
| 1580 | `  let tempos = tracks.flatMap(tr=>tr.tempos);` | 全トラックからテンポイベントだけを抜き出し、1つの配列 tempos にまとめます。 |
| 1581 | `  tempos.sort((a,b)=>a.tick-b.tick);` | テンポイベントを tick（時間順）に並び替えます。 |
| 1582 | `  if(!tempos.length \|\| tempos[0].tick!==0) tempos.unshift({tick:0, usPerQ:500000});` | テンポが無いか、最初が tick0 でなければ、デフォルトテンポ 500000 を先頭に追加します。 |
| 1583 | `` |  |
| 1584 | `  const segments = [];` | テンポが変わる区間ごとの情報を入れる segments 配列を用意します。 |
| 1585 | `  let lastTick=0, curUsPerQ=tempos[0].usPerQ, accSec=0;` | 前回の tick, 現在のテンポ, 積算秒数 accSec を初期化します。 |
| 1586 | `  segments.push({tick:0, usPerQ:curUsPerQ, timeSec:0});` | 最初の区間（tick0, 現在テンポ, 時間0秒）を segments に追加します。 |
| 1587 | `  for(let i=1;i<tempos.length;i++){` | 2つ目以降のテンポイベントを順に見て、区間情報を作っていきます。 |
| 1588 | `    const T = tempos[i].tick;` | 今回のテンポが始まる tick を T として取り出します。 |
| 1589 | `    accSec += ((T-lastTick) * curUsPerQ) / 1e6 / ppq;` | 前のテンポで (T-lastTick) 分進んだ秒数を計算し、accSec に足します。 |
| 1590 | `    segments.push({tick:T, usPerQ:tempos[i].usPerQ, timeSec:accSec});` | このテンポが始まる tick とテンポ、開始秒数を segments に追加します。 |
| 1591 | `    lastTick = T; curUsPerQ = tempos[i].usPerQ;` | lastTick と現在テンポを、今回のテンポ情報に更新します。 |
| 1592 | `  }` |  |
| 1593 | `  function ticksToSec(t){` | tick 値 t を実際の秒数に変換する関数 ticksToSec を定義します。 |
| 1594 | `    let lo=0, hi=segments.length-1, idx=0;` | 二分探索用に下限 lo, 上限 hi, 見つけた区間の index idx を準備します。 |
| 1595 | `    while(lo<=hi){ const mid=(lo+hi)>>1; if(segments[mid].tick<=t){ idx=mid; lo=mid+1; } else hi=mid-1; }` | tick t が属する segments の区間を、二分探索で素早く探します。 |
| 1596 | `    const s=segments[idx];` | 見つかった区間情報を s として取り出します。 |
| 1597 | `    return s.timeSec + ((t - s.tick) * s.usPerQ) / 1e6 / ppq;` | 区間開始からの差分 tick を秒に換算し、区間開始秒に足して返します。 |
| 1598 | `  }` |  |
| 1599 | `` |  |
| 1600 | `  const all = tracks.flatMap(tr=>tr.events);` | 全トラックからノートイベントだけを集めて、1つの配列 all にします。 |
| 1601 | `  all.sort((a,b)=> (a.tick-b.tick) \|\| (a.type==='off'?1:-1));` | tick 昇順で、同時ならノートオンを先にするよう all を並び替えます。 |
| 1602 | `  const onStack = Array.from({length:16}, ()=>Array(128).fill(null));` | 16チャンネル×128音ごとに、押されているノートを記憶する配列 onStack を作ります。 |
| 1603 | `  const notes = [];` | 最終的なノート情報を入れる notes 配列を用意します。 |
| 1604 | `  let lastTickAll = 0;` | 最後に現れた tick を記録するための lastTickAll を初期化します。 |
| 1605 | `  for(const e of all){` | 全イベント all を1つずつ順に処理します。 |
| 1606 | `    lastTickAll = Math.max(lastTickAll, e.tick);` | 曲全体での最大 tick を更新して、lastTickAll に保存します。 |
| 1607 | `    if(e.type==='on'){` | イベントがノートオンなら、onStack に押された情報として記録します。 |
| 1608 | `      onStack[e.ch][e.note] = onStack[e.ch][e.note] \|\| [];` | そのチャンネルとノートのスタック配列が無ければ作り、参照をセットします。 |
| 1609 | `      onStack[e.ch][e.note].push({tick:e.tick, vel:e.vel});` | ノートオンの tick と強さ vel をスタックに追加します。 |
| 1610 | `    }else if(e.type==='off'){` | イベントがノートオフの場合の処理に入ります。 |
| 1611 | `      const st = onStack[e.ch][e.note];` | 対応するチャンネルとノートのスタック st を取り出します。 |
| 1612 | `      if(st && st.length){` | もし st に未処理のノートオンが残っていれば、ペアとして扱います。 |
| 1613 | `        const on = st.shift();` | 一番古いノートオン情報を取り出します（先頭から取り出し）。 |
| 1614 | `        notes.push({note:e.note, chan:e.ch, vel:Math.max(1,on.vel), startTick:on.tick, endTick:e.tick});` | ノート番号などと開始・終了tickをまとめ、notes に1音として追加します。 |
| 1615 | `      }` | 対応するノートオンが無かった場合は何もせずスキップします。 |
| 1616 | `    }` |  |
| 1617 | `  }` |  |
| 1618 | `  for(let ch=0; ch<16; ch++){` | 全チャンネルについて、押しっぱなしで終わったノートが無いかを確認します。 |
| 1619 | `    for(let n=0;n<128;n++){` | 各チャンネル内で、全てのノート番号 0〜127 を順に見ていきます。 |
| 1620 | `      const st = onStack[ch][n];` | そのチャンネル・ノートのスタック st を取り出します。 |
| 1621 | `      if(st && st.length){` | まだ残っているノートオンがあれば、未解決として処理します。 |
| 1622 | `        for(const on of st){` | 残っている全てのノートオン on について、終わりを補う処理をします。 |
| 1623 | `          notes.push({note:n, chan:ch, vel:Math.max(1,on.vel), startTick:on.tick, endTick:lastTickAll});` | 終了 tick を曲の最後の tick として、notes に音情報を追加します。 |
| 1624 | `        }` |  |
| 1625 | `      }` |  |
| 1626 | `    }` |  |
| 1627 | `  }` |  |
| 1628 | `  for(const n of notes){ n.startSec = ticksToSec(n.startTick); n.endSec = ticksToSec(n.endTick); }` | 各ノートについて、startTick/endTick を秒に変換し、startSec/endSec として保存します。 |
| 1629 | `  const lengthSec = notes.reduce((m,n)=>Math.max(m, n.endSec), 0);` | 全てのノートの終了秒の最大値を取り、曲全体の長さ lengthSec として求めます。 |
| 1630 | `` |  |
| 1631 | `  const onsets = new Map();` | 開始 tick ごとにノートをまとめるための Map onsets を用意します。 |
| 1632 | `  for(const n of notes){ const arr = onsets.get(n.startTick) \|\| []; arr.push({note:n.note, vel:n.vel}); onsets.set(n.startTick, arr); }` | 各ノートを開始 tick ごとにグループ化し、onsets に {note, vel} の配列として登録します。 |
| 1633 | `  const onsetTicks = Array.from(onsets.keys()).sort((a,b)=>a-b);` | onsets にある tick のキー一覧を取り出し、数値の小さい順に並べます。 |
| 1634 | `` |  |
| 1635 | `  return { ppq, tracks, tempos, segments, ticksToSec, notes, lengthSec, onsets, onsetTicks };` | 解析結果一式（ppq や notes など）をオブジェクトとして返します。 |
| 1636 | `}` | MIDI解析関数の定義をここで終了します。 |
| 1637 | `` |  |
| 1638 | `/* ===== Player ===== */` | ここからプレイヤー部分のコードであることをコメントで示しています。 |
| 1639 | `class Player{` | MIDIを再生するための Player クラスを定義します。 |
| 1640 | `  constructor(ctx, notes){` | Player の初期化時に、音声コンテキスト ctx とノート一覧 notes を受け取ります。 |
| 1641 | `    this.ctx=ctx; this.notes=notes;` | 受け取った ctx と notes をインスタンスに保存します。 |
| 1642 | `    this.events = [];` | 再生用に時系列イベントを保存する events 配列を用意します。 |
| 1643 | `    for(const n of notes){` | 全ノートについて、再生用のオン・オフイベントを作成していきます。 |
| 1644 | `      this.events.push({time:n.startSec, type:'on', note:n.note, vel:n.vel/127});` | ノートの開始秒に、ノートオンイベントを events に追加します（強さは0〜1に正規化）。 |
| 1645 | `      this.events.push({time:n.endSec,   type:'off', note:n.note});` | ノートの終了秒に、ノートオフイベントを events に追加します。 |
| 1646 | `    }` | events を時間順で並べ替え、再生しやすい形にします。 |
| 1647 | `    this.events.sort((a,b)=>a.time-b.time);` | 次に再生するイベントの位置を示す nextIdx を 0 に初期化します。 |
| 1648 | `    this.nextIdx = 0;` | 現在の再生位置（秒）を表す posSec を 0 にします。 |
| 1649 | `    this.posSec = 0;` | オーディオコンテキスト時間との基準 t0Ctx を 0 に初期化します。 |
| 1650 | `    this.t0Ctx = 0;` | タイマーIDを保存する timer を null にしておきます。 |
| 1651 | `    this.timer = null;` | 先読みする時間幅 lookahead を 0.1秒に設定します。 |
| 1652 | `    this.lookahead = 0.1; // s` | 再生中かどうかを示すフラグ running を false にします。 |
| 1653 | `    this.running = false;` | setTimeout で設定したタイマーを管理するための集合 timeouts を用意します。 |
| 1654 | `    this.timeouts = new Set();` |  |
| 1655 | `  }` | 指定時間 tCut までのイベントを音声エンジンに予約する関数です。 |
| 1656 | `  scheduleUntil(tCut){` | 使いやすくするため、ctx をローカル変数として取り出します。 |
| 1657 | `    const ctx=this.ctx;` | synth が未作成なら、新しく PolySynth を作って再生に使います。 |
| 1658 | `    if(!synth) synth=new PolySynth(ctx);` | 次のイベントが tCut より前のものは、順に予約していきます。 |
| 1659 | `    while(this.nextIdx < this.events.length && this.events[this.nextIdx].time <= tCut){` | 処理対象のイベント ev を取り出し、次に進めるため nextIdx を1つ進めます。 |
| 1660 | `      const ev = this.events[this.nextIdx++];` | 再生開始基準 t0Ctx を足して、絶対時間 whenAbs（実際に鳴る時刻）を計算します。 |
| 1661 | `      const whenAbs = this.t0Ctx + ev.time;` | イベントがノートオンの場合の処理に入ります。 |
| 1662 | `      if(ev.type==='on'){` | synth にノートオンを予約し、指定時刻 whenAbs にその音が鳴るようにします。 |
| 1663 | `        synth.noteOn(ev.note, ev.vel\|\|0.8, whenAbs);` | 現在時刻との差から、セットタイムアウト用の delay（ミリ秒）を計算します。 |
| 1664 | `        const delay = Math.max(0, (whenAbs - ctx.currentTime))*1000;` | その delay 後に fileNotes にノートを追加するタイマーを設定します。 |
| 1665 | `        const to = setTimeout(()=>{ fileNotes.set(ev.note, ev.vel\|\|0.8); }, delay);` | 作ったタイマーIDを timeouts に記録し、後でまとめて止められるようにします。 |
| 1666 | `        this.timeouts.add(to);` | ノートオフイベントの場合の処理に入ります。 |
| 1667 | `      }else{` | synth にノートオフを予約し、指定時刻 whenAbs に音を止めます。 |
| 1668 | `        synth.noteOff(ev.note, whenAbs);` | 同じく delay を計算し、fileNotes からノートを消すタイミングを決めます。 |
| 1669 | `        const delay = Math.max(0, (whenAbs - ctx.currentTime))*1000;` | 少し余裕を持たせた delay+5ms 後にノートを削除するタイマーを設定します。 |
| 1670 | `        const to = setTimeout(()=>{ fileNotes.delete(ev.note); }, delay+5);` | このタイマーIDも timeouts に保存して管理します。 |
| 1671 | `        this.timeouts.add(to);` |  |
| 1672 | `      }` |  |
| 1673 | `    }` | tick 関数の定義を終え、scheduleUntil 関数もここで終了します。 |
| 1674 | `  }` | 短い間隔で呼び出される tick 関数（再生の心臓部）を定義しています。 |
| 1675 | `  tick = ()=>{` | もし再生中でなければ、何もせず終了します。 |
| 1676 | `    if(!this.running) return;` | 現在の再生経過時間 now（秒）を計算します。 |
| 1677 | `    const now = this.ctx.currentTime - this.t0Ctx;` | now から少し先 (lookahead) までのイベントを予約します。 |
| 1678 | `    this.scheduleUntil(now + this.lookahead);` | 曲の総時間に達していれば stop を呼び、再生を止めます。 |
| 1679 | `    if(now >= this.totalLength()){ this.stop(); return; }` | 20ミリ秒後にもう一度 tick を呼ぶタイマーをセットし、定期的に更新します。 |
| 1680 | `    this.timer = setTimeout(this.tick, 20);` |  |
| 1681 | `  }` |  |
| 1682 | `  totalLength(){ return this.events.length? this.events[this.events.length-1].time : 0; }` | 演奏データの最後のイベント時刻を返し、なければ 0 を返す関数です。 |
| 1683 | `  play(){` | 演奏を開始するための関数を定義しています。 |
| 1684 | `    if(this.running) return;` | すでに再生中なら、これ以上何もせずに終わります。 |
| 1685 | `    this.t0Ctx = this.ctx.currentTime - this.posSec;` | 今の音声時間から『再生位置』を引き、再生開始の基準時刻を記録します。 |
| 1686 | `    this.running = true;` | 再生中であることを示すフラグを true にします。 |
| 1687 | `    this.tick();` | タイマー処理 tick() を呼んで、実際の再生を進めます。 |
| 1688 | `  }` |  |
| 1689 | `  pause(){ if(!this.running) return; this.posSec = this.ctx.currentTime - this.t0Ctx; this.running = false; if(this.timer) clearTimeout(this.timer); }` | 再生中なら現在位置を保存し、再生中フラグを下げ、タイマーを止めて一時停止します。 |
| 1690 | `  stop(){` | 演奏を完全に止めるための関数を定義しています。 |
| 1691 | `    this.running = false; this.posSec = 0; this.nextIdx = 0;` | 再生中フラグを下げ、位置を先頭に戻し、次のイベント番号も 0 にします。 |
| 1692 | `    if(this.timer) clearTimeout(this.timer);` | もしメインのタイマーがあれば、キャンセルして止めます。 |
| 1693 | `    for(const to of this.timeouts) clearTimeout(to);` | 登録してある各種タイマーも 1つずつ止めます。 |
| 1694 | `    this.timeouts.clear();` | 保存していたタイマーの一覧を空にします。 |
| 1695 | `    fileNotes.clear();` | 表示用などに使っていた fileNotes の情報を全て消します。 |
| 1696 | `    if(synth) synth.allNotesOff();` | シンセがあれば、鳴っている全ての音を止めます。 |
| 1697 | `  }` |  |
| 1698 | `}` |  |
| 1699 | `let player = null;` | 再生用の Player インスタンスを入れておく変数を用意します。 |
| 1700 | `` |  |
| 1701 | `/* ===== Trainer（離鍵必須のエッジ検出） ===== */` | トレーニング用機能（鍵盤から指を離すことを検出）に関する説明コメントです。 |
| 1702 | `class Trainer{` | Trainer というトレーニング用クラスを定義しています。 |
| 1703 | `  constructor(midi){` | Trainer の初期化処理（コンストラクタ）を定義しています。 |
| 1704 | `    this.midi = midi;` | 渡された MIDI データを this.midi に保存します。 |
| 1705 | `    this.steps = midi.onsetTicks.map(tk => ({tick:tk, notes: midi.onsets.get(tk).map(o=>o.note)}));` | 各 onset 時刻ごとに、その時に鳴る音の番号一覧を steps として作ります。 |
| 1706 | `    this.idx = 0;` | 今どのステップにいるかを示す番号 idx を 0 に設定します。 |
| 1707 | `    this.active = false;` | トレーニング中かどうかのフラグを false（停止中）にします。 |
| 1708 | `    this.gateReady = true; // 成立の立ち上がりのみ許可するゲート` | gateReady を true にし、成立の立ち上がりだけを受け付ける状態にします。 |
| 1709 | `  }` |  |
| 1710 | `` |  |
| 1711 | `  currentNotes(){ return (this.steps[this.idx]?.notes \|\| []).slice().sort((a,b)=>a-b); }` | 現在のステップの音番号一覧を取り出し、コピーして小さい順に並べて返します。 |
| 1712 | `` |  |
| 1713 | `  satisfied(live){` | 今の押されている鍵盤 live が、必要な音を満たしているか判定する関数です。 |
| 1714 | `    const t = this.currentNotes();` | 今のステップで弾くべき音の一覧を t として取得します。 |
| 1715 | `    if(!t.length) return true;` | 弾くべき音がなければ、条件は満たされていると見なして true を返します。 |
| 1716 | `    for(const n of t){ if(!live.has(n)) return false; }` | 必要な音 t の中に、押されていない音があれば false を返します。 |
| 1717 | `    return true;` | 全ての必要な音が押されていたら true を返します。 |
| 1718 | `  }` |  |
| 1719 | `` |  |
| 1720 | `  armAccordingToState(live){` | 今の押し方 live を見て、ゲートの準備状態を更新する処理です。 |
| 1721 | `    this.gateReady = !this.satisfied(live); // 既に成立していたら離鍵を要求` | すでに条件を満たしていたら gateReady を false にし、いったん指を離すことを要求します。 |
| 1722 | `  }` |  |
| 1723 | `` |  |
| 1724 | `  start(live = liveNotes){` | トレーニングを開始し、liveNotes を初期状態として使います。 |
| 1725 | `    this.idx = 0;` | ステップ番号 idx を 0 に戻します。 |
| 1726 | `    this.active = true;` | トレーニングを有効（進行中）状態にします。 |
| 1727 | `    this.armAccordingToState(live);` | 開始時の押されている鍵盤を見て、ゲート状態を整えます。 |
| 1728 | `  }` |  |
| 1729 | `` |  |
| 1730 | `  next(live = liveNotes){` | 次のステップへ進む処理を定義し、liveNotes を標準引数にします。 |
| 1731 | `    if(!this.active) return;` | トレーニングが動いていなければ、何もせずに終わります。 |
| 1732 | `    this.idx++;` | ステップ番号 idx を 1 つ進めます。 |
| 1733 | `    if(this.idx >= this.steps.length){ this.finish(); return; }` | 最後のステップを超えたら finish を呼んで終了します。 |
| 1734 | `    this.armAccordingToState(live);` | 新しいステップの状態に合わせてゲートを設定し直します。 |
| 1735 | `  }` |  |
| 1736 | `` |  |
| 1737 | `  prev(live = liveNotes){` | 一つ前のステップに戻る処理を定義します。 |
| 1738 | `    if(!this.active) return;` | トレーニング中でなければ、何もせずに終わります。 |
| 1739 | `    this.idx = Math.max(0, this.idx-1);` | idx を 1 減らしますが、0 未満にはならないようにします。 |
| 1740 | `    this.armAccordingToState(live);` | 戻ったステップに合わせてゲート状態を整えます。 |
| 1741 | `  }` |  |
| 1742 | `` |  |
| 1743 | `  finish(){ this.active = false; }` | トレーニングを終了状態にし、active を false にします。 |
| 1744 | `` |  |
| 1745 | `  considerAdvance(live = liveNotes){` | 現在の鍵盤状態 live を見て、ステップを進めるか判断します。 |
| 1746 | `    if(!this.active) return;` | トレーニングが止まっていれば、何もせずに終わります。 |
| 1747 | `    const ok = this.satisfied(live);` | 必要な音がそろっているかを ok として調べます。 |
| 1748 | `    if(!this.gateReady){` | まだゲート準備ができていない場合の処理です。 |
| 1749 | `      if(!ok) this.gateReady = true; // 一度“不成立”になったら武装` | 条件が一度崩れたら gateReady を true にし、次の成立を待てる状態にします。 |
| 1750 | `      return;` | この時点ではステップを進めず、関数を終了します。 |
| 1751 | `    }` |  |
| 1752 | `    if(ok){` | ゲート準備ができていて、かつ条件が満たされた場合の処理です。 |
| 1753 | `      this.gateReady = false;        // 次は必ず離鍵` | 次に進む前に gateReady を false にし、次回は離鍵が必要な状態にします。 |
| 1754 | `      this.next(live);` | 条件がそろったので、次のステップへ進みます。 |
| 1755 | `    }` |  |
| 1756 | `  }` |  |
| 1757 | `}` | Trainer クラスの定義を終えています。 |
| 1758 | `let trainer = null;` | トレーニング用 Trainer のインスタンスを保存する変数です。 |
| 1759 | `` |  |
| 1760 | `/* ===== UI actions ===== */` | ここからボタン操作などの画面操作処理をまとめています。 |
| 1761 | `btnPlay.onclick = ()=>{` | 再生ボタンが押されたときの処理を指定します。 |
| 1762 | `  if(!midiData){ fileInfo.textContent='file: –'; return; }` | MIDI データがなければラベルを「–」にして何もせず終わります。 |
| 1763 | `  const ctx = ensureCtx();` | 音声の再生に使う AudioContext を用意します。 |
| 1764 | `  try{ if(ctx.state==='suspended') ctx.resume(); }catch{}` | AudioContext が一時停止中なら再開し、エラーは無視します。 |
| 1765 | `  if(player) player.stop();` | 既に Player があれば、一度 stop() して停止させます。 |
| 1766 | `  player = new Player(ctx, midiData.notes);` | 新しい Player を作り、ctx と MIDI のノート情報を渡します。 |
| 1767 | `  player.play();` | 作った Player で再生を開始します。 |
| 1768 | `};` | 再生ボタン用のクリック処理の定義を閉じています。 |
| 1769 | `btnPause.onclick = ()=>{ if(player) player.pause(); };` | 一時停止ボタンで、Player があれば pause() を呼びます。 |
| 1770 | `btnStop.onclick = ()=>{ if(player) player.stop(); };` | 停止ボタンで、Player があれば stop() を呼びます。 |
| 1771 | `` |  |
| 1772 | `btnStartTrain.onclick = ()=>{` | トレーニング開始ボタンが押されたときの処理を指定します。 |
| 1773 | `  if(!midiData){ fileInfo.textContent='file: –'; return; }` | MIDI データがなければラベルを更新して処理を終えます。 |
| 1774 | `  if(player) player.stop();` | 再生中の Player があれば止めてからトレーニングを始めます。 |
| 1775 | `  trainer = new Trainer(midiData);` | MIDI データを元に、新しい Trainer を作成します。 |
| 1776 | `  trainer.start(liveNotes);   // 開始時点の押下状態でゲート初期化` | 現在押されている鍵盤状態を使って、トレーニングを開始します。 |
| 1777 | `  updateTrainerUI();` | 画面上のトレーニング表示を最新の内容に更新します。 |
| 1778 | `};` | トレーニング開始ボタン処理の定義を閉じています。 |
| 1779 | `btnPrev.onclick = ()=>{ if(trainer && trainer.active){ trainer.prev(liveNotes); updateTrainerUI(); } };` | 前へボタンで、トレーニング中なら 1 ステップ戻り、表示を更新します。 |
| 1780 | `btnNext.onclick = ()=>{ if(trainer && trainer.active){ trainer.next(liveNotes); updateTrainerUI(); } };` | 次へボタンで、トレーニング中なら 1 ステップ進み、表示を更新します。 |
| 1781 | `` |  |
| 1782 | `function updateTrainerUI(){` | トレーニングの状態に合わせて、画面表示を更新する関数です。 |
| 1783 | `  if(trainer && trainer.active){` | トレーニング中の場合の表示更新処理を行います。 |
| 1784 | `    const tn = trainer.currentNotes();` | 今のステップで弾くべき音の一覧を tn として取得します。 |
| 1785 | `    trainerStat.textContent = \`step: ${trainer.idx+1}/${trainer.steps.length}  notes: [${tn.join(', ')}]\`;` | 現在のステップ番号や全体数、必要な音の一覧をテキストとして表示します。 |
| 1786 | `  }else if(trainer && !trainer.active){` | トレーナーはあるが活動していない場合の表示を設定します。 |
| 1787 | `    trainerStat.textContent = \`step: done (${trainer?.steps?.length\|\|0})\`;` | 完了したステップ数を含めて『done』と表示します。 |
| 1788 | `  }else{` | トレーナー自体がない場合の表示を行う条件分岐です。 |
| 1789 | `    trainerStat.textContent = 'step: –';` | トレーニング未開始として『step: –』を画面に表示します。 |
| 1790 | `  }` | if 文全体と関数 updateTrainerUI の処理を閉じています。 |
| 1791 | `}` |  |
| 1792 | `` |  |
| 1793 | `/* ===== Keyboard shortcuts ===== */` | ここからキーボードショートカット（キー操作）を設定しています。 |
| 1794 | `addEventListener('keydown', e=>{` | キーが押されたときに呼ばれる処理を追加します。 |
| 1795 | `  if(fileOp.value==='train' && trainer && trainer.active){` | モードが train で、トレーニング中のときだけキー操作を受け付けます。 |
| 1796 | `    if(e.key==='ArrowLeft'){ trainer.prev(liveNotes); updateTrainerUI(); }` | 左矢印キーで 1 つ前のステップに戻り、表示を更新します。 |
| 1797 | `    else if(e.key==='ArrowRight'){ trainer.next(liveNotes); updateTrainerUI(); }` | 右矢印キーで 1 つ先のステップへ進み、表示を更新します。 |
| 1798 | `  }` | 条件分岐を閉じています。 |
| 1799 | `});` | キーボードイベントの処理定義を終了します。 |
| 1800 | `</script>` | JavaScript の記述を終える script タグの閉じタグです。 |
