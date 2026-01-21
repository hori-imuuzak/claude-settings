developブランチからreleaseブランチを作成して、mainブランチに対してプルリクエストを作成してください。

1. developにチェックアウトし、pullを行い、最新のリモートの状態を取得する
2. releases/v[$ARGUMENTS]ブランチを作成
3. pubspec.yamlを確認し、バージョンを変更する
    - 以下の書式で、バージョンコードをインクリメントする
    - version: [$ARGUMENTS]+バージョンコード
4. 以下のルールに従ってPRを作成する
    - PRのdescriptionは、差分のcommitの履歴・マージされたプルリクエストを確認し変更内容をまとめたものを記載してください
    - grpahqlファイルの変更が含まれる場合はAPIに合わせたリリース手順の注意書きをdescriptionにwarningで表示する
