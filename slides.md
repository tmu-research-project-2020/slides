---
theme: "white"
transition: "slide"
slideNumber: false
title: "Word Cloud"
---

# Word Cloud を用いた流行の可視化

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
* Stop word (wordcloud + training, via, image, language, word)

---

# 傾向

---

### 2014 年ごろから deep, neural が流行

画像をはる？

---

### EMNLP では 2018 年以降から BERT が出現

画像をはる？
