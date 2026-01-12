#import "conf.typ": *
#import "utils.typ": *


#show: conf.with(
  author: [Igo da Costa Andrade],
  book: (
    title: [Chaos and Fractals],
    subtitle: [An Elementary Introduction],
    year: 2012,
    press: "Oxford University Press",
    address: "Oxford",
    authors: (
      (
        name: "David P. Feldman",
        short-name: "Feldman, D. P.",
      ),
    ),
    chapter: (
      number: 2,
      title: "Interacting Functions"
    )
  ),
)



#let opts = (
  size: (5, 5), axis-style: "school-book", 

  x-tick-step: 1, y-tick-step: 1,
  x-grid: true, y-grid: "both",
)

#let line-styles = (stroke: 1.2pt+primary-color)
#let mark-styles(fill-color) = (stroke: 1.2pt+primary-color, fill: fill-color)

#align(center)[*Exercises*]

#v(1cm)

+ Seja $g$ a função de duplicação. Determine os cinco primeiros números da órbita para as seguintes sementes:
  #set enum(numbering: "(a)")
  + $x_0 = -2$
  + $x_0 = -0.5$
  + $x_0 = 0$
  + $x_0 = 0.5$
  + $x_0 = 2$

  #solution([

    #let g(x) = 2 * x
    #let seeds = (-2, -0.5, 0, 0.5, 2)
    #let orbits = () 
    #let n = 5
    #let m = seeds.len()
    #let nums = range(m)
    #for seed in seeds {
      let orbit = (seed,)
      for n in range(n) {
        orbit.push(g(orbit.last()))
      }
      orbits.push(orbit)
    }
    
    #let orbits_t = range(n + 1).map(n => range(m).map(m => orbits.at(m).at(n)))

    #set table(
      inset: 8pt, 
      stroke: (x, y) => if y == 0 {
        (top: 0.7pt + black)
        (bottom: 0.7pt + black)
      } else if  y == n + 1 {
        (bottom: 0.7pt + black)
      },
    )


    #figure(
      kind: table
    )[
      #table(
        columns: m + 1,
        align: (center, ..range(m).map(i => right)),
        table.header([], [*(a)*], [*(b)*], [*(c)*], [*(d)*], [*(e)*]),
        [$x_0$],..orbits_t.at(0).map(x => fmt(x, digits: 4)),
        [$x_1$],..orbits_t.at(1).map(x => fmt(x, digits: 4)),
        [$x_2$],..orbits_t.at(2).map(x => fmt(x, digits: 4)),
        [$x_3$],..orbits_t.at(3).map(x => fmt(x, digits: 4)),
        [$x_4$],..orbits_t.at(4).map(x => fmt(x, digits: 4)),
        [$x_5$],..orbits_t.at(5).map(x => fmt(x, digits: 4)),
      )
    ]    
  ])

+ Seja $f(x) = sqrt(x)$. Determine os cinco primeiros números da órbita para as seguintes sementes:

  + $x_0 = 0$
  + $x_0 = 1/2$
  + $x_0 = 1$
  + $x_0 = 2$
  + $x_0 = 4$

  #solution([

    #let f(x) = calc.sqrt(x)
    #let seeds = (0, 1/2, 1, 2, 4)
    #let orbits = () 
    #let n = 5
    #let m = seeds.len()
    #let nums = range(m)
    #for seed in seeds {
      let orbit = (seed,)
      for n in range(n) {
        orbit.push(f(orbit.last()))
      }
      orbits.push(orbit)
    }
    
    #let orbits_t = range(n + 1).map(n => range(m).map(m => orbits.at(m).at(n)))

    #set table(
      inset: 8pt, 
      stroke: (x, y) => if y == 0 {
        (top: 0.7pt + black)
        (bottom: 0.7pt + black)
      } else if  y == n + 1 {
        (bottom: 0.7pt + black)
      },
    )


    #figure(
      kind: table
    )[
      #table(
        columns: m + 1,
        align: (center, ..range(m).map(i => right)),
        table.header([], [*(a)*], [*(b)*], [*(c)*], [*(d)*], [*(e)*]),
        [$x_0$],..orbits_t.at(0).map(x => fmt(x, digits: 4)),
        [$x_1$],..orbits_t.at(1).map(x => fmt(x, digits: 4)),
        [$x_2$],..orbits_t.at(2).map(x => fmt(x, digits: 4)),
        [$x_3$],..orbits_t.at(3).map(x => fmt(x, digits: 4)),
        [$x_4$],..orbits_t.at(4).map(x => fmt(x, digits: 4)),
        [$x_5$],..orbits_t.at(5).map(x => fmt(x, digits: 4)),
      )
    ]    
  ])

+ Considere a função $f(x) = sqrt(x)$.
  #set enum(numbering: "(a)")
  + Complete a seguinte tabela para $f$.
      #set table(
        inset: 8pt,
        stroke: (x, y) => {
          (left: 0.7pt + black)
          (right: 0.7pt + black)
        }
      )
      
      #figure(
        kind: table
      )[
        #table(
          columns: 2,
          [$x_0$], [#h(1cm) 9 #h(1cm)],
          [$x_1$], [],
          [$x_2$], [],
          [$x_3$], [],
          [$x_4$], [],
        )
      ]

    #solution([

      #let f(x) = calc.sqrt(x)
      #let seeds = (9,)
      #let orbits = () 
      #let n = 4
      #let m = seeds.len()
      #let nums = range(m)
      #for seed in seeds {
        let orbit = (seed,)
        for n in range(n) {
          orbit.push(f(orbit.last()))
        }
        orbits.push(orbit)
      }
      
      #let orbits_t = range(n + 1).map(n => range(m).map(m => orbits.at(m).at(n)))

      #set table(
        inset: 8pt, 
        stroke: (x, y) => if y == 0 {
          (top: 0.7pt + black)
        } else if  y == n {
          (bottom: 0.7pt + black)
        },
      )


      #figure(
        kind: table
      )[
        #table(
          columns: m + 1,
          align: (center, ..range(m).map(i => right)),
          [$x_0$],..orbits_t.at(0).map(x => fmt(x, digits: 4)),
          [$x_1$],..orbits_t.at(1).map(x => fmt(x, digits: 4)),
          [$x_2$],..orbits_t.at(2).map(x => fmt(x, digits: 4)),
          [$x_3$],..orbits_t.at(3).map(x => fmt(x, digits: 4)),
          [$x_4$],..orbits_t.at(4).map(x => fmt(x, digits: 4)),
        )
      ]    
    ])

  + Determine uma fórmula para $f^((2))(x)$.
    #solution([
      $
        f(x) = sqrt(x) = x^(1/2) => f^((2))(x) &= f(f(x)) = f(x^(1/2))\
        f^((2))(x) &= (x^(1/2))^(1/2) = x^(1/2 dot 1/2)\
        f^((2))(x) &= x^(1/4)
      $
    ])

  + Determine uma fórmula para $f^((3))(x)$.
    #solution([
      $
        f^((3)) = f(f^((2))(x)) = (x^(1/4))^(1/2) = x^(1/4 dot 1/2) = x^(1/8)
      $
    ])

  + Determine uma fórmula para $f^((4))(x)$.
    #solution([
      $
        f^((4)) = f(f^((3))(x)) = (x^(1/8))^(1/2) = x^(1/8 dot 1/2) = x^(1/16)
      $
    ])

  + Determine uma fórmula para $f^((n))(x)$, a $n$-ésima $x$ iteração de $x$.
    #solution([
      As fórmulas obtidas para $f^((2))(x), f^((3))(x)$ e $f^((4))(x)$ obtidas nos itens anteriores sugerem a seguinte fórmula geral para  o $n$-ésimo termo $f^((n))(x)$ da órbita de $x$:
      $
        f^((n))(x) = x^(1/(2^n))
      $
      De fato,
      $
        f^((2))(x) &= x^(1/4) = x^(1/(2^2))\
        f^((3))(x) &= x^(1/8) = x^(1/(2^3))\
        f^((4))(x) &= x^(1/16) = x^(1/(2^4))\
      $

      Para demonstrar a fórmula geral, utilizamos o Princípio de Indução Matemática#footnote[
        *Princípio de Indução Matemática*: Seja $P(n)$ uma proposição definida para todo número natual $n >= n_0$, onde $n_0 in NN$.  Se:
          #set enum(numbering: "1.")
          + (Passo base) $P(n_0)$ é verdadeira;
          + (Passo indutivo) Para todo $k >= n_0$, a veracidade de $P(k)$ implica a veracidade de $P(k + 1)$;

        então $P(n)$ é verdadeira para todo $n >= n_0$.

        Em particular, quando $n_0 = 1$, a proposição vale para todo $n in NN$.

      ]: Note que para $n = 1$, a fórmula proposta é verdadeira, visto que corresponde à definição da função $f$:
      $ f^((1))(x) = x^(1/2^1) = x^(1/2) = sqrt(x) = f(x). $
      Isso demonstra o passo base da indução. Suponhamos que para algum $k >= 1$ seja verdadeira a fórmula proposta, ou seja, é verdade que:
      $ f^((k)) = x^(1/2^k) $
      Então, 
      $
        f^(k + 1) (x) &= f(f^(k)(x)) = f(x^(1/2^k)) = (x^(1/2^k))^(1/2) = x^(1/2^k dot 1/2) = x^(1/2^(k + 1))
      $

      Portanto, como a proposição é verdadeira para o caso base e foi provada verdadeira no passo indutivo, segue pelo Princípio da Indução Matemática que ela é válida para todo $n in NN$.
    ])

+ Considere a função $f(x) = 1/2x + 4$.
  #set enum(numbering: "(a)")
  + Complete a seguinte tabela para $f$.
      #set table(
        inset: 8pt,
        stroke: (x, y) => {
          (left: 0.7pt + black)
          (right: 0.7pt + black)
        }
      )
      
      #figure(
        kind: table
      )[
        #table(
          columns: 2,
          [$x_0$], [#h(1cm) 2 #h(1cm)],
          [$x_1$], [],
          [$x_2$], [],
          [$x_3$], [],
          [$x_4$], [],
        )
      ]

    #solution([

      #let f(x) = x/2 + 4
      #let seeds = (2,)
      #let orbits = () 
      #let n = 4
      #let m = seeds.len()
      #let nums = range(m)
      #for seed in seeds {
        let orbit = (seed,)
        for n in range(n) {
          orbit.push(f(orbit.last()))
        }
        orbits.push(orbit)
      }
      
      #let orbits_t = range(n + 1).map(n => range(m).map(m => orbits.at(m).at(n)))

      #set table(
        inset: 8pt, 
        stroke: (x, y) => if y == 0 {
          (top: 0.7pt + black)
        } else if  y == n {
          (bottom: 0.7pt + black)
        },
      )


      #figure(
        kind: table
      )[
        #table(
          columns: m + 1,
          align: (center, ..range(m).map(i => right)),
          [$x_0$],..orbits_t.at(0).map(x => fmt(x, digits: 4)),
          [$x_1$],..orbits_t.at(1).map(x => fmt(x, digits: 4)),
          [$x_2$],..orbits_t.at(2).map(x => fmt(x, digits: 4)),
          [$x_3$],..orbits_t.at(3).map(x => fmt(x, digits: 4)),
          [$x_4$],..orbits_t.at(4).map(x => fmt(x, digits: 4)),
        )
      ]    
    ])

+ Seja $f(x) = 3x - 1$
  #set enum(numbering: "(a)")
  + calcule $f^(2)(1)$ e $(f(1))^2$.
    #solution([
      $
        f(1) = 3 dot 1 - 1 = 2 => cases(
          f^((2))(1) = f(f(1)) = f(2) = 3 dot 2 - 1 = 5, ,
          (f(1))^2 = 2^2 = 4
        )  
      $
    ])


  + As duas quantidade são iguais? Deveriam ser?
    #solution([
      No item anterior, obtivemos $f^(2)(1) != (f(1))^2$. De fato, a igualdade entre estas quantidade só ocorreria por coincidência. Tratam-se de dois conceitos distintos. Enquanto $f^(2)(x)$ corresponde à segunda iterada da função $f$, ou seja, à composta $f(f(x))$, $(f(x))^2$ é a segunda potência de $f(x)$. 
    ])

+ Considere a função $f(x) = (x + 3)^2$.
  #set enum(numbering: "(a)")
  + Complete a seguinte tabela para $f$.
      #set table(
        inset: 8pt,
        stroke: (x, y) => {
          (left: 0.7pt + black)
          (right: 0.7pt + black)
        }
      )
      
      #figure(
        kind: table
      )[
        #table(
          columns: 2,
          [$x_0$], [#h(1cm) 2 #h(1cm)],
          [$x_1$], [],
          [$x_2$], [],
          [$x_3$], [],
          [$x_4$], [],
        )
      ]

    #solution([

      #let f(x) = calc.pow(x + 3, 2)
      #let seeds = (2,)
      #let orbits = () 
      #let n = 4
      #let m = seeds.len()
      #let nums = range(m)
      #for seed in seeds {
        let orbit = (seed,)
        for n in range(n) {
          orbit.push(f(orbit.last()))
        }
        orbits.push(orbit)
      }
      
      #let orbits_t = range(n + 1).map(n => range(m).map(m => orbits.at(m).at(n)))

      #set table(
        inset: 8pt, 
        stroke: (x, y) => if y == 0 {
          (top: 0.7pt + black)
        } else if  y == n {
          (bottom: 0.7pt + black)
        },
      )


      #figure(
        kind: table
      )[
        #table(
          columns: m + 1,
          align: (center, ..range(m).map(i => right)),
          [$x_0$],..orbits_t.at(0).map(x => fmt(x, digits: 1)),
          [$x_1$],..orbits_t.at(1).map(x => fmt(x, digits: 1)),
          [$x_2$],..orbits_t.at(2).map(x => fmt(x, digits: 1)),
          [$x_3$],..orbits_t.at(3).map(x => fmt(x, digits: 1)),
          [$x_4$],..orbits_t.at(4).map(x => fmt(x, digits: 1)),
        )
      ]    
    ])
