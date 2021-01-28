---
theme: "white"
transition: "slide"
slideNumber: false
title: "Word Cloud"
---

## 『バズってる』の見える化
### 研究プロジェクト演習
### 担当：横山昌平准教授

---

# スクレイピング班
### 担当者：相田、海老根、住吉

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
