#import "@preview/theorion:0.3.2": *

// Document configuration
#let title = "Think Notes - isomoes"
#let author = "isomoes"
#let date = datetime.today()

// Custom color scheme inspired by elegant academic style
#let primary-color = rgb("#20B2AA")  // Light sea green
#let secondary-color = rgb("#4682B4") // Steel blue
#let accent-color = rgb("#DC143C")    // Crimson
#let text-color = rgb("#2F4F4F")      // Dark slate gray

// Page setup with academic styling
#set page(
  paper: "a4",
  margin: (left: 2.5cm, right: 2.5cm, top: 3cm, bottom: 3cm),
  number-align: center,
  header: context {
    if counter(page).get().first() > 1 {
      align(center, line(length: 100%, stroke: 0.5pt + gray))
      v(-0.75em)
      align(center, text(size: 10pt, fill: gray, title))
    }
  },
)

// Typography setup
#set text(
  font: ("New Computer Modern", "Source Han Serif"),
  size: 11pt,
  fill: text-color,
  lang: "en",
  fallback: true,
)

#set par(
  justify: true,
  leading: 0.65em,
  spacing: 1.2em,
)

// Heading numbering (starting from 0)
#set heading(numbering: "1.1")

// Heading styles
#show heading.where(level: 2): it => {
  v(1.5em)
  block[
    #set text(size: 16pt, weight: "bold", fill: secondary-color)
    #if it.numbering != none [
      #counter(heading).display(it.numbering)
      #h(0.5em)
    ]
    #it.body
    #v(0.5em)
    #line(length: 100%, stroke: 1pt + secondary-color)
  ]
  v(1em)
}

#show heading.where(level: 3): it => {
  v(1em)
  block[
    #set text(size: 14pt, weight: "bold", fill: text-color)
    #if it.numbering != none [
      #counter(heading).display(it.numbering)
      #h(0.5em)
    ]
    #it.body
  ]
  v(0.75em)
}

// Configure theorem environments with theorion
#show: show-theorion

// Style all links with blue color and underline
#show link: it => {
  set text(fill: rgb("#1E90FF"))
  underline(it)
}

// Customize reference display to show section number and title
#show ref: it => {
  let styled-content = if it.element != none and it.element.func() == heading {
    let el = it.element
    let number = if el.numbering != none {
      numbering(el.numbering, ..counter(heading).at(el.location()))
    }
    if number != none {
      link(it.target)[ #el.body]
    } else {
      link(it.target)[#el.body]
    }
  } else {
    it
  }

  // Apply blue color and underline to all references
  set text(fill: rgb("#1E90FF"))
  underline(styled-content)
}

// Figure and table numbering (section-based, resets per section)
#set figure(numbering: num => {
  let h = counter(heading).get().first()
  numbering("1.1", h, num)
})

// Reset figure counter at each level 1 heading
#show heading.where(level: 1): it => {
  counter(figure.where(kind: image)).update(0)
  counter(figure.where(kind: table)).update(0)
  counter(figure.where(kind: raw)).update(0)

  pagebreak(weak: true)
  v(2em)
  block[
    #set align(center)
    #set text(size: 20pt, weight: "bold", fill: primary-color)
    #if it.numbering != none [
      #counter(heading).display(it.numbering)
      #h(0.5em)
    ]
    #upper(it.body)
    #v(1em)
    #line(length: 60%, stroke: 2pt + primary-color)
  ]
  v(1.5em)
}

// Math equation numbering
#set math.equation(numbering: "(1)")

// Bibliography setup (if references.bib exists)
#let bibliography-file = "references.bib"

// Custom functions for colored text shortcuts
#let redt(content) = text(fill: rgb("#DC143C"), content)
#let bluet(content) = text(fill: rgb("#1E90FF"), content)
#let greent(content) = text(fill: rgb("#32CD32"), content)

// Title page
#align(center)[
  #v(2cm)
  #text(size: 24pt, weight: "bold", fill: primary-color)[
    #upper(title)
  ]
  #v(1cm)
  #text(size: 14pt, fill: secondary-color)[
    日常随想
  ]
  #v(2cm)
  #text(size: 12pt)[
    *Author:* #author \
    *Date:* #date.display("[month repr:long] [day], [year]")
  ]
  #v(1cm)
  #line(length: 50%, stroke: 1pt + primary-color)
]

#pagebreak()

// Table of contents with Roman numerals
#set page(numbering: "i")
#counter(page).update(1)

#outline(
  title: [Table of Contents],
  indent: auto,
  depth: 2,
)

#pagebreak()

// Preface
= 前言

从很久开始以前，就是有写日记的习惯，口语化，碎片化。
但是随着记录的东西，或者不同时间的💡不一致，所以想用更正式的方式去记录，所以有了这个随记。
我们看了👀很多过往时间写的东西，很多事情是随机的，独立的。
但是之间却是在讨论*同一个主题*，只是在不同时间，不同场景下，用不同的方式去描述。
所以，我想把这些碎片化的想法，整理成一个更*系统化*的记录，回看的时候更像连续剧，而不是碎片化的短视频。

+ 关于*组织的形式*，首先按照事件所属主题来分类，对应到不同的章节，最低层的标题对应其所属的的时间。这样，我们可以按照主题来查看，也可以按照时间线来查看。
  - 如果单篇文章内容太长，可以单独拆分成一个文件，然后在主文件中引用，避免对于LLM处理过长的的token限制。
+ 对于*内容*来说，可以是英文也可以中文，这个得益于新的_typst_的排版引擎@typst2024documentation，可以很好的处理中英文混排。还可以有emoji👿，真的是很爽。还可以有文章引用，比之前排版ctex👌蛮多的@ctex2020manual.

#pagebreak()

// Reset page numbering to Arabic numerals for main content
#set page(numbering: "1")
#counter(page).update(1)

// ============================================================================
// Content Sections - Include sub-files
// Each sub-file starts with its own topic heading (= Topic Name)
// Multiple files with the same topic heading will be merged into one chapter
// ============================================================================

#include "adjust/2024-12-15.typ"
#include "adjust/2025-07-04.typ"

#include "emotion/2024-06-02.typ"
#include "emotion/2024-08-03.typ"
#include "emotion/2024-10-04.typ"

#include "review/2024-07-07.typ"
#include "review/2024-09-12.typ"
#include "review/2025-05-14.typ"
#include "review/2025-05-19.typ"
#include "review/2025-11-25.typ"
#include "review/2025-12-13.typ"
#include "review/2025-12-29.typ"
#include "review/2026-05-15.typ"

#include "misc/2025-04-03.typ"
#include "misc/2026-01-21.typ"

#pagebreak()

// Bibliography (uncomment if references.bib exists)
#bibliography(bibliography-file, style: "ieee")
