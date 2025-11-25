# Think Notes - isomo

Personal reflections and thoughts organized by topic and timeline, beautifully typeset with Typst.

## Overview

This repository contains my personal notes and reflections on various topics, organized thematically with chronological progression. The content is written in a mix of Chinese and English, leveraging Typst's excellent multilingual typography support.

## Structure

The notes are organized by topic folders, with each file named by date:

```
think-isomo/
├── think-isomo.typ          # Main document
├── common.typ               # Shared utilities and theorem environments
├── references.bib           # Bibliography
├── adjust/                  # Adjustment and adaptation topics
│   ├── 2024-12-15.typ
│   └── 2025-07-04.typ
├── emotion/                 # Emotional reflections
│   ├── 2024-06-02.typ
│   ├── 2024-08-03.typ
│   └── 2024-10-04.typ
├── review/                  # Reviews and retrospectives
│   ├── 2024-07-07.typ
│   ├── 2024-09-12.typ
│   ├── 2025-05-14.typ
│   └── 2025-05-19.typ
└── misc/                    # Miscellaneous thoughts
    └── 2025-04-03.typ
```

### Organization Principles

- **Topic Classification**: Content is organized by theme in separate folders
- **Chronological Ordering**: Files within each topic are named by date (`YYYY-MM-DD.typ`)
- **Dual Perspective**: View content by topic or follow the timeline across topics

## Building

### Prerequisites

- [Typst](https://github.com/typst/typst) (latest version)
- Source Han Serif fonts (for Chinese typography)

### Local Compilation

```bash
typst compile think-isomo.typ
```

### Automated Releases

When you push a version tag (e.g., `v1.0.0`), GitHub Actions automatically:

1. Installs Source Han Serif fonts
2. Compiles the document
3. Creates a release with the PDF named `think-isomo-v1.0.0.pdf`

To create a release:

```bash
git tag v1.0.0
git push origin v1.0.0
```

## Features

- **Elegant Typography**: Uses Source Han Serif for Chinese and New Computer Modern for English
- **Professional Layout**: Academic-style formatting with proper page numbering
  - Title page: unnumbered
  - Table of Contents: Roman numerals (i, ii, iii...)
  - Main content: Arabic numerals (1, 2, 3...)
- **Theorem Environments**: Powered by the theorion package
- **Bibliography Support**: IEEE-style citations

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.
