
---

## 『バズってる』の見える化
### 研究プロジェクト演習
### 担当：横山昌平准教授

---

# 概要
国際会議の論文データやGoogle Scholarの論文データを利用し、興味がある論文や最近話題の論文を可視化するシステムの構築を目指した

---

# 環境構築
### 担当者：平尾、高橋

---

## 使用したサービス
- Github: チーム開発のコード管理
- Heroku: サービスの公開
- Firebase: データの保存・読み出し
- Streamlit: データの可視化
- Reveal.js: スライドの公開

---

## 全体像
![google_scholar_visualizer](https://user-images.githubusercontent.com/38539915/106381385-a0c2e380-63fb-11eb-82e7-1317afd41239.png)


---

## 公開ページ
- スライド: https://tmu-research-project-2020.github.io/slides

- ドキュメント: https://tmu-research-project-2020.github.io/documentation/

- サービスページ: https://gs-visualizer-production.herokuapp.com/

---

## 班構成
- インフラ班: 他サービスとの連携等を設定

（平尾、高橋）
- 入出力可視化班: データの可視化を行う

（伊藤、金、山下）
- スクレイピング班: データ収集を行う

（相田、海老根、住吉）

---

# 会議検索
### 担当者：平尾、高橋

---

## モチベーション

* 会議を限定して論文の検索を行いたい
* 会議によってページの構造異なるので検索が難しい
* 会議・年代を指定して検索できるようにした

---

## 可視化の流れ

1. 会議ごとに 2010-2020 間の論文タイトルを収集
2. 収集した論文タイトルと入力したキーワードの類似度のランキング作成

---

## 可視化を行った会議

* 画像：CVPR
* 自然言語処理：ACL, EMNLP, NAACL
* その他：NeurIPS, VLDB

---

## 類似度の計算

* pythonの標準ライブラリに入っている文字列の類似度を測定する[`difflib.SequenceMatcher`](https://docs.python.org/ja/3/library/difflib.html)を使用
* 中身のアルゴリズムは[Gestalt Pattern Matching](https://en.wikipedia.org/wiki/Gestalt_Pattern_Matching)
* ざっくり言うと最長共通部分列 / 全体の長さ

---

## ACLで「Attention Is All You Need」に対して出る論文
<img width="600" alt="suggest_sample" src="https://user-images.githubusercontent.com/38539915/106094592-998aa400-6175-11eb-91af-c97bab2a1587.png">

---

# Word Cloud, TF-IDFを用いた流行の可視化
### 担当者：伊藤、金、山下

---

## モチベーション
* バズってるの可視化
* 自分で見るのはめんどくさい
* 年ごとの傾向を一目で見たい！
* 年ごとのバズってるキーワードを可視化

---

## 可視化の流れ

1. 会議ごとに 2010-2020 間の論文タイトルを収集
2. 収集した論文タイトルを会議、年代ごとに word cloud, tf-idf で可視化

---

## 可視化を行った会議

* 画像：CVPR
* 自然言語処理：ACL, EMNLP, NAACL
* その他：NeurIPS, VLDB

---

## タイトルの前処理

* Lowercase
* Stop word (既存のものに論文タイトルに頻出する単語を追加 (例: training, via, など))

---

# 傾向

---

## Word Cloudの傾向

---

## TF-IDFの傾向

---

# レジェンド・バズ論文の可視化

### 担当者：相田、海老根、住吉

---

## モチベーション
**分野の初学者**に向けて
読んでおくべき2種類の論文を提案  
- **レジェンド論文**：年代を問わず重要な論文
- **バズ論文**：最近出版され注目されている論文

---

## 概要

- レジェンド・バズ論文は以下のように定義
	- レジェンド論文：キーワード検索で上位
	- バズ論文：キーワード＋出版年検索で上位

- Google Scholarの検索結果をスクレイピング

- 得られた論文情報を**可視化**

---

## 1. スクレイピング
Google Scholarの検索結果をスクレイピング
論文情報を取得、分析

1. PythonのHTTP通信ライブラリ**requests**を使用
Google ScholarのHTMLを取得
1. **BeautifulSoup**を使用して必要な情報を抽出

<img width="600" alt="scholar" src="https://user-images.githubusercontent.com/49933783/106438184-818a8b80-64b9-11eb-90c2-3e804c38d3d0.png">

---

### 1回のスクレイピングで取得できる情報
- タイトル
- URL
- 著者
- 出版年
- 出版元
- 引用数
- スニペット

---

## 2. 引用推移の取得
発行年〜2021年間の年ごとの引用数を取得
- 引用元の発行年を取得することで実現

それぞれの被引用推移の可視化に使用
![citation](https://user-images.githubusercontent.com/49933783/106441316-3ecab280-64bd-11eb-9bb4-83c8b03d5a8d.png)

---

## 3. 複合キーワード検索
通常のキーワード検索だと**古く有名な文献**が出る  
<img width="600" alt="machine-translation-only-keyword" src="https://user-images.githubusercontent.com/49933783/106438244-98c97900-64b9-11eb-8200-4e63b3d46861.png">
→検索の際**キーワード**だけではなく、  
**出版（会議）名**・**出版年**も指定したい  

---

## 3. 複合キーワード検索

**複合条件**で検索できるように修正（公開予定）
1. キーワード、出版名、出版年を入力
1. url をリクエストし、上位100件を検索
1. 論文の情報を抽出
1. csv に出力

---

## 4. レジェンド•バズ論文を可視化

得られた情報を**Web アプリ上に可視化**

https://gs-visualizer-production.herokuapp.com/

---

## まとめ
国際会議やGoogle Scholarの論文データを利用し
様々な条件で論文を可視化するシステムを構築
- 会議毎のキーワードに対する関連度を可視化
- 会議、年ごとの流行をword cloudで可視化
- 初学者が読んでおくべき2種類の論文を可視化



