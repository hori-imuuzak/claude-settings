# review-comments

GitHub PRのレビューコメントを確認し、必要な修正を行います。

## 使用方法
`review-comments <PR番号>`

## 実行内容
1. 指定されたPRのレビューコメントを全て取得する（`gh pr view $ARGUMENTS --comments`）
2. 各コメントを分析し、以下を判断する：
   - コメントの投稿者（gemini-code-assistかどうか）
   - コメントの内容と修正の必要性
   - 修正が必要な場合の優先度
3. 修正が必要と判断した場合：
   - 該当するファイルと行を特定
   - 適切な修正を実施
   - 修正内容をコミット
4. 修正完了後、コメントに返信する（`gh pr comment $ARGUMENTS --body "修正完了"`）

## 注意事項
- gemini-code-assistのコメントを優先的に対応
- 破壊的変更や大幅な仕様変更を伴う場合は、実施前に確認を求める