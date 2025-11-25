#import "../common.typ": *

== 2025-11-25 精神信条

时间很快，一晃眼已毕业四年，来到了26岁的年纪。
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




































