---
name: release
description: "develop から release ブランチを作成し、main に対して PR を出す"
args:
  - name: version
    description: "リリースするバージョン番号"
---

## Release ブランチ作成と PR 作成手順

1. **main ブランチを最新化**

   - `main` にチェックアウトし、`git pull` を実行して最新のリモート状態を取得してください。

2. **develop ブランチを最新化**

   - `develop` にチェックアウトし、`git pull` を実行して最新のリモート状態を取得してください。

3. **buildNumber の更新**

   - `env.dart` を確認し、`buildNumber` の値を インクリメント(+1)してください。

4. **release ブランチを作成**

   - ブランチ名は次の形式としてください:
     ```
     releases/v{{version}}-patch-{{buildNumber}}
     ```

5. **Pull Request を作成**
   - ベースブランチ: **develop**
   - 比較対象: 作成した **release ブランチ**
   - プルリクエストでのマージ先のブランチ: **main**
   - **PR の description のルール:**
     - 差分の commit 履歴やマージ済みのプルリクエストを確認し、変更内容を整理して記載すること。
     - `.graphql` ファイルの変更が含まれている場合は、**API に合わせたリリース手順が必要である旨を warning として明記**すること。
