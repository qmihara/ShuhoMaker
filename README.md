# ShuhoMaker

## 環境

- Swift 4

Linux で動くかどうかは知りません。

## 準備

1. `$ make setup`
1. [Slack アプリ](https://api.slack.com/apps)を登録
  - 権限は以下のものを付けてください
    - `chat:write:bot`
    - `search:read`
1. Slack アプリの `OAuth & Permissions` より OAuth トークンをコピーして `Settings.swift` に貼り付ける
1. `Settings.swift` を完成させる
  - `accountName`: 週報のネタとなる発言をしているアカウント名
  - `targetChannel`: 週報のネタとなる発言をしている先のチャンネル名
  - `keyword`: 週報のネタとなる発言の目印となるキーワード
  - `destinationChannelID`: 週報の投稿先チャンネル ID

## Xcode プロジェクトの作成

    $ make generate-xcodeproj

## ビルド

    $ make build

## 実行

    $ make shuho
