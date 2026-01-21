---
description: Generate a Pull Request description for the current branch and copy it to the clipboard.
---

1.  **Analyze Changes**:
    *   Identify the default branch (usually `main` or `develop`).
    *   Run `git diff <default_branch>...HEAD` to inspect the changes in the current branch.
    *   Summarize the key changes, focusing on the "why" and "what".

2.  **Read Template**:
    *   Read the content of `.github/pull_request_template.md`.

3.  **Generate Description**:
    *   Draft a Pull Request description that follows the structure of the template.
    *   Fill in the sections based on your analysis of the code changes.
    *   **Write the description in Japanese.**
    *   Ensure the tone is professional and the details are accurate.

4.  **Copy to Clipboard**:
    *   Once the description is generated, use the `pbcopy` command to copy it to the system clipboard.
    *   Example: `echo "GENERATED_PR_DESCRIPTION" | pbcopy`
    *   Notify the user that the description has been copied.
