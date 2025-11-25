#import "../common.typ": *

== 2025-11-25 精神信条

时间很快，一晃眼已毕业四年，来到了*26岁*的年纪。
物质收获等或于无，然*精神信条*有余，遂记之#footnote[
  就是说没搞到啥钱，规矩却多了蛮多😄。
]。我们来思辨一下接触到的有意思的观点。
1) keep 是前提 opportunity 是运气
2) _less is more_
3) 从sound里找非complete的truth
4) probability 交换 cost

#theorem(title: "keep 是前提 opportunity 是运气")[
  此句适用的场景，应为如何去做一件事情，
  我们为了事情A，坚持keep做了B，但是A能否成立还是需要👀运气。
]

#proof[
  设目标事件 $A$ 的实现需要必要条件集合 $B = {b_1, b_2, ..., b_n}$ 和充分条件 $O$ (opportunity)。

  + *必要性证明*：若不持续执行 $B$ 中的行动，则 $P(A) = 0$。
    即：$not "keep"(B) => P(A) = 0$
  + *非充分性证明*：即使完成所有 $b_i in B$，仍有 $P(A | B) < 1$。
    因为 $A$ 的实现依赖于外部随机变量 $O$，满足：
    $ P(A) = P(B) dot P(O | B) $
    其中 $P(O | B)$ 不受我们控制，本质上是运气。
  + *结论*：keep 做 $B$ 是 $P(A) > 0$ 的前提条件，但 $A$ 能否发生取决于 $P(O | B)$，
    这个概率由外部环境、时机、他人决策等*不可控因素*决定。

  $therefore$ keep 是让可能性存在的基础，opportunity 是最终能否实现的关键随机变量。
]

此处引用案例，Isomo-bilibili发197条视频，至今还没单条破1W播放量👎。

#definition(title: "less is more")[
  此处少非直指拥有东西的多少，而是拥有的东西的*类别的多少*.
  具体来说，我们不是去追求集合中的最大值，而是追求集合中元素的个数。
  而less $arrow$ more 的过程，是我们将时间精力于少数事件上，将其从问题表象转化(抽象)为本质的过程。
  从下至上，我们将能看到更多层次结构的事物，从而获得更多的*信息量*。
]

#example()[
  以技术栈为例：浅尝Python、Go、Rust、Java、JavaScript五门语言，
  不如深入掌握一门语言的runtime机制、内存模型、并发原语。
  前者停留在语法层面(表象)，后者触及计算本质(抽象)，
  当你理解了一门语言的底层原理，再看其他语言不过是同一套概念的不同表达罢了。
  这便是*减少类别*换来*认知深度*的过程。
]

#definition(title: "从sound里找非complete的truth")[
  借用程序分析中的概念#footnote[
    参考：Static Program Analysis, Nanjing University
  ]：
  我们的认知过程是从*猜测*到*验证*的筛选——
  从*Sound*（推理猜测，可能正确）中寻找*Truth*（实际为真的事实），
  并通过验证将其固化为*Complete*（已证明的知识）。

  #figure(
    caption: [从推理到验证的筛选过程],
    {
      import "@preview/cetz:0.3.1": canvas, draw
      canvas({
        import draw: *

        // Sound - 最外层（推理、假设、猜测）
        circle((0, 0), radius: 3.2, stroke: gray + 2pt, fill: gray.lighten(85%), name: "sound")
        content((0, 2.7), [*Sound*], anchor: "center", fill: gray)
        content((0, 2.3), text(size: 0.75em)[推理与猜测], anchor: "center")

        // Truth - 中间层（实际为真的事实）
        circle((0, 0), radius: 2, stroke: blue + 1.8pt, fill: blue.lighten(80%), name: "truth")
        content((0, 1.6), [*Truth*], anchor: "center", fill: blue)
        content((0, 1.2), text(size: 0.7em)[真实存在], anchor: "center", fill: blue)

        // Complete - 最内层（已验证证明的知识）
        circle((0, 0), radius: 1, stroke: green + 1.5pt, fill: green.lighten(70%), name: "complete")
        content((0, 0), [*Complete*], anchor: "center", fill: green)
        content((0, -0.4), text(size: 0.7em)[已证明], anchor: "center")
      })
    },
  )
]

#example()[
  认识世界时：
  我们从Sound推理出发，基于观察和经验做出各种猜测假设，
  通过实验验证从中识别出Truth（实际为真的规律），
  再通过重复验证将其固化为Complete知识。
  关键在于大量Sound猜测中筛选出可验证的Truth。
]

#theorem(title: "probability 交换 cost")[当我们*不追求100%成功率*时，可以避免遍历所有路径，
  从而用*低计算成本*换取*高概率*的可行解。
  本质上是在确定性与效率之间做权衡。
]

#proof[
  设问题空间为 $S$，完全遍历需要成本 $C_("total")$，能达到成功率 $P_("total") = 1$。

  + *完全遍历的困境*：对于NP问题或组合爆炸问题，
    $C_("total")$ 随问题规模呈指数增长，实际不可行。
    即：$C_("total") = O(2^n) "OR" O(n!)$，对于大规模 $n$ 无法计算。

  + *概率性策略*：只探索部分路径，成本降为 $C_("partial") << C_("total")$，
    但仍能获得较高成功概率 $P_("partial")$。
    关键trade-off：
    $ C_("partial") / C_("total") << 1 quad "AND" quad P_("partial") approx 1 - epsilon $
    其中 $epsilon$ 是可接受的小失败率。

  $therefore$ 用*概率性接受*换取*计算效率*，是解决复杂问题的实用策略。
]

#example()[
  以*大语言模型(LLM)*为例：
  确定性方案需要穷举所有可能的token序列以找到完全正确的答案，
  其计算成本为 $O("词汇表大小"^"序列长度") approx O(50000^(1000))$，实际不可计算，
  虽然理论上能达到100%成功率，但永远无法完成。
  而LLM采用概率性方案，通过transformer学习概率分布 $P("token" | "context")$，
  采样生成时每步选择高概率token而不保证全局最优，
  计算成本降至 $O(n dot d^2)$(序列长度 × 模型维度的平方)，几秒内即可完成，
  成功率约为85-95%，允许5-15%的失败或需重试。
  这正是现代AI的核心哲学：*不求完美，但求可用*。
  我们用概率的不确定性，交换了计算的可行性。
]




































