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

+ Seja $f(x) = x^2$. Determine uma expressão algébrica para:
  #set enum(numbering: "(a)")
  + $f^((2))(x)$
    #solution([
      $
        f^((2)) = f(f(x)) = f(x^2) = (x^2)^2 = x^(2 dot 2) = x^(2^2) = x^4
      $
    ])

  + $f^((3))(x)$
    #solution([
      $
        f^((3)) = f(f^((2))(x)) = f(x^4) = (x^4)^2 = x^(4 dot 2) = x^(2^3) = x^8
      $
    ])

  + $f^((n))(x)$
    #solution([
      Os resultados anteriores sugerem a seguinte fórmula geral para $f^((n))(x)$: $ x^(2^n) $
      Para $n = 1$, a fórmula proposta é imediatamente verdadeira. Suponhamos que para algum $k >= 1$, a fórmula proposta seja verdadeira. Então, para $n = k + 1$, temos:
      $
        f^((k+ 1)) = f(f^(k)(x)) = f(x^(2^k)) = (x^(2^k))^2 = x^(2^k dot 2) = x^(2^k dot 2^1) = x^(2^(k + 1))
      $

      Logo, pelo Princípio de Indução Matemática, a fórmula
      $
        f^((n))(x) = x^(2^(n))
      $
      é verdadeira.
    ])

+ Seja $h(x) = 3x - 1$. Determine o valor numérico de:
  #set enum(numbering: "(a)")
  + $h^((2))(1)$
    #solution([
      $
        h(1) = 3 dot 1 - 1 = 2 => h^((2))(1) = h(2) = 3 dot 2 - 1 = 5
      $
    ])

  + $h^((2))(3)$
    #solution([
      $
        h(1) = 3 dot 3 - 1 = 8 => h^((2))(3) = h(8) = 3 dot 8 - 1 = 23
      $
    ])

  + $h^((4))(2/3)$
    #solution([
      $
        h(2/3) = 3 dot 2/3 - 1 = 1 &=> h^((2))(2/3) = h(h(2/3)) = h(1) = 3 dot 1 - 1 = 2\
        &=> h^((3))(2/3) = h(h^((2))(2/3)) = h(2) = 3 dot 2 - 1 = 5\
        &=> h^((4))(2/3) = h(h^((3))(2/3)) = h(5) = 3 dot 5 - 1 = 14
      $
    ])

  + $h^((3))(2)$
    #solution([
      $
        h(2) = 3 dot 2 - 1 = 5 &=> h^((2))(2) = h(h(2)) = h(5) = 3 dot 5 - 1 = 14\
        &=> h^((3))(2) = h(h^((2))(2)) = h(14) = 3 dot 14 - 1 = 41
      $
    ])

+ Seja $g(x) = x^2 + 1$. Determine o valor numérico de:
  #set enum(numbering: "(a)")
  + $g^((2))(1)$
    #solution([
      $
        g(1) = 1^2 + 1 = 2 => g^((2))(1) = g(g(1)) = g(2) = 2^2 + 1= 5
      $
    ])

  + $g^((2))(3)$
    #solution([
      $
        g(3) = 3^2 + 1 = 10 => g^((2))(3) = g(g(3)) = g(10) = 10^2 + 1= 101
      $
    ])

  + $g^((4))(0)$
    #solution([
      $
        g(0) = 0^2 + 1 = 1 
          &=> g^((2))(0) &=  &g(g(0))       &=& g(1) &=& 1^2 + 1 &=& &2\
          &=> g^((3))(0) &=  &g(g^((2))(0)) &=& g(2) &=& 2^2 + 1 &=& &5\
          &=> g^((4))(0) &=  &g(g^((3))(0)) &=& g(5) &=& 5^2 + 1 &=& 2&6\
      $
    ])

  + $g^((3))(2)$
      #solution([
        $
          g(2) = 2^2 + 1 = 5 
            &=> g^((2))(2) &=  &g(g(2))       &=& g(5) &=& 5^2 + 1 &=& &26\
            &=> g^((3))(2) &=  &g(g^((2))(2)) &=& g(26) &=& 26^2 + 1 &=& 6&76
        $
      ])

+ Seja $f(x) = x^2 - 1$. Determine uma expressão algébrica para $f^((2))(x)$.
  #solution([
    $
      f(x) = x^2 - 1 &=> f^((2))(x) = f(f(x)) = (x^2 - 1)^2 - 1\
          &=> f^((2))(x) = x^4 - 2x^2 + 1 - 1\
          &=> f^((2))(x) = x^4 - 2x^2
    $
  ])

+ Seja $f(x) = 3x - 1$. Determine uma expressão algébrica para $f^((2))(x)$.
  #solution([
    $
      f(x) = 3x - 1 &=> f^((2))(x) = f(f(x)) = 3 (3x - 1) - 1\
      &=> f^((2))(x) = 9x - 4
    $
  ])

+ Consideremos novamente a função para população de coelhos do capítulo anterior. A função é mostrada na Fig. 2.2. Determine:

  #figure(
    image("assets/images/figura_02-02.png", width: 55%)
  )
  #set enum(numbering: "(a)")
  + $P(50)$
  + $P^((2))(75)$
  + $P^((3)) (10)$

  

  #solution([
    $
      P(50) approx 90\
      P(75) approx 90 => P^((2))(75) = P(P(75)) = P(90) approx 70\
      P(10) approx 50 => P^((2))(10) = P(50) approx 90 => P^((3))(10) = P(P^((2))(10)) = p(90) approx 70
    $
  ])

+ Considere a função $f$ definida na Fig. 2.3. Determine:
  #figure(
    image("assets/images/figura_02-03.png", width: 55%)
  )
  #set enum(numbering: "(a)")
  + $f(-5)$
    #solution([
      $
        f(-5) = 12
      $
    ])
  + $f^((2))(-5)$
    #solution([
      $
        f^((2))(-5) = f(f(-5)) = f(12) approx 5
      $
    ])
  + As primeiras quatro iterações de $0$.
    #solution([
      $
        f(0) approx 10\
        f^((2))(0) = f(10) = 6\
        f^((3))(0) = f(f^((2))(0)) = f(6) approx 7\
        f^((4))(0) = f(f^((3))(0)) = f(7) approx 7,5
      $
    ])
  + As primeiras quatro iterações de $-15$.
    #solution([
      $
        f(-15) approx 16\
        f^((2))(-15) = f(16) = 3\
        f^((3))(-15) = f(f^((2))(-15)) = f(3) approx 9\
        f^((4))(-15) = f(f^((3))(-15)) = f(9) approx 7
      $
    ])

+ Considere a função $f(x)$ mostrada na Fig. 2.4. Determine:
  #figure(
    image("assets/images/figura_02-04.png", width: 55%)
  )

  #set enum(numbering: "(a)")
  + As primeiras três iterações de $0.5$.
    #solution([
      $
        f(0,5) approx 1,3\
        f^((2))(0,5) = f(f(0,5)) = f(1,3) approx 0,7\
        f^((3))(0,5) = f(f^((2))(0,5)) = f(0,7) approx 1,1
      $
    ])

  + As primeiras três iterações de $2.0$.
    #solution([
      $
        f(2,0) approx 0,25\
        f^((2))(2,0) = f(f(2,0)) = f(0,25) approx 1,1\
        f^((3))(2,0) = f(f^((2))(2,0)) = f(1,1) approx 0,8
      $
    ])

+ Seja $g$ a função elevar ao quadrado: $g(x) = x^2$.
  
  #set enum(numbering: "(a)")
  + Calcule as cinco primeiras iterações de $2$.
    #solution([
      $
        g(2) = 2^2 = 4\
        g^((2))(2) = g(g(2)) = g(4) = 4^2 = 16\
        g^((3))(2) = g(g^((2))(2)) = g(16) = 16^2 = 256\
        g^((4))(2) = g(g^((3))(2)) = g(256) = 256^2 = #calc.pow(256, 2)\
        g^((5))(2) = g(g^((4))(2)) = g(#calc.pow(256, 2)) = #calc.pow(256, 2)^2 = #calc.pow(calc.pow(256, 2), 2)\
      $
    ])

  + O que você acha que acontece com $g^((n))(2)$ quando $n$ torna-se grande?
    #solution([
      Para $n$ grande, $g^((n))(2)$ tende ao infinito.
    ])

  + Calcule as primeiras cinco iterações de $1$.
    #solution([
      $
        g(1) = 1^2 = 1\
        g^((2))(1) = g(g(1)) = g(1) = 1^2 = 1\
        g^((3))(1) = g(g^((2))(1)) = g(1) = 1^2 = 1\
        g^((4))(1) = g(g^((3))(1)) = g(1) = 1^2 = 1\
        g^((5))(1) = g(g^((4))(1)) = g(1) = 1^2 = 1\
      $
    ])

  + O que você acha que acontece com $g^((n))(1)$ quando $n$ torna-se grande?
    #solution([
      Para $n$ grande, $g^((n))(1)$ permanece constante e igual a 1.
    ])

  + Calcule as cinco primeiras iterações de $3/4$.
    #solution([
      #let g(x) = calc.pow(x, 2)
      #let orbita = (3/4, )
      #for i in range(5) {
        orbita.push(g(orbita.last()))
      }

      Seja a semente $x_0 = 3/4 = 0,75$, então as cinco primeiras iterações da órbita de $x_0$ são:
      #for (i, xi) in orbita.enumerate() {
        if i == 0 {
          $ x_#i =  #fmt(xi, digits: 4) $
        } else {
          let j = i - 1
          if i == 1 {
            $ x_#i = g(x_(#j)) = g(#fmt(orbita.at(j), digits: 4)) = #fmt(xi, digits: 4) $
          } else {
            $ x_#i = g^((#i))(x_(0)) = g(g^((#j))(x_0)) = g(g^((#j))(#fmt(orbita.at(0), digits: 4))) = g(#fmt(orbita.at(j), digits: 4))= #fmt(xi, digits: 4) $
          }
          
        }
      }
    ])

  + O que você acha que aconcete com $g^((n))(3/4)$ quando $n$ torna-se grande?
    #solution([
      Para $n$ grande, $g^((n))(3/4)$ tende a zero.
    ])

+ Seja $h$ a função raiz quadrada: $h(x) = sqrt(x)$.
  #set enum(numbering: "(a)")
  + Calcule as cinco primeiras iterações de $2$.
    #solution([
      #let h(x) = calc.sqrt(x)

      #let orbita = (2,)
      #for i in range(5) {
        orbita.push(h(orbita.last()))
      }

      Seja a semente $x_0 = 2$, então as cinco primeiras iterações da órbita de $x_0$ são:
      #for (i, xi) in orbita.enumerate() {
        if i == 0 {
          $ x_#i =  #fmt(xi, digits: 4) $
        } else {
          let j = i - 1
          if i == 1 {
            $ x_#i = h(x_(#j)) = h(#fmt(orbita.at(j), digits: 4)) = #fmt(xi, digits: 4) $
          } else {
            $ x_#i = h^((#i))(x_(0)) = h(h^((#j))(x_0)) = h(h^((#j))(#fmt(orbita.at(0), digits: 4))) = h(#fmt(orbita.at(j), digits: 4))= #fmt(xi, digits: 4) $
          }
          
        }
      }
    ])

  + O que você acha que acontece com $h^((n)) (2)$ quanto $n$ torna-se grande?
    #solution([
      Para $n$ grande, $h^((n))(1)$ decresce e tende a $1$.
    ])

  + Calcule as cinco primeiras iterações de $1$.
    #solution([
      #let h(x) = calc.sqrt(x)

      #let orbita = (1,)
      #for i in range(5) {
        orbita.push(h(orbita.last()))
      }

      Seja a semente $x_0 = 1$, então as cinco primeiras iterações da órbita de $x_0$ são:
      #for (i, xi) in orbita.enumerate() {
        if i == 0 {
          $ x_#i =  #fmt(xi, digits: 4) $
        } else {
          let j = i - 1
          if i == 1 {
            $ x_#i = h(x_(#j)) = h(#fmt(orbita.at(j), digits: 4)) = #fmt(xi, digits: 4) $
          } else {
            $ x_#i = h^((#i))(x_(0)) = h(h^((#j))(x_0)) = h(h^((#j))(#fmt(orbita.at(0), digits: 4))) = h(#fmt(orbita.at(j), digits: 4))= #fmt(xi, digits: 4) $
          }
          
        }
      }
    ])

  + O que você acha que acontece com $h^((n)) (1)$ quanto $n$ torna-se grande?
    #solution([
      Para $n$ grande, $h^((n))(1)$ permanece constante e igual a $1$.
    ])

  + Calcule as cinco primeiras iterações de $3/4$.
    #solution([
      #let h(x) = calc.sqrt(x)

      #let orbita = (3/4,)
      #for i in range(5) {
        orbita.push(h(orbita.last()))
      }

      Seja a semente $x_0 = 3/4 = 0,75$, então as cinco primeiras iterações da órbita de $x_0$ são:
      #for (i, xi) in orbita.enumerate() {
        if i == 0 {
          $ x_#i =  #fmt(xi, digits: 4) $
        } else {
          let j = i - 1
          if i == 1 {
            $ x_#i = h(x_(#j)) = h(#fmt(orbita.at(j), digits: 4)) = #fmt(xi, digits: 4) $
          } else {
            $ x_#i = h^((#i))(x_(0)) = h(h^((#j))(x_0)) = h(h^((#j))(#fmt(orbita.at(0), digits: 4))) = h(#fmt(orbita.at(j), digits: 4))= #fmt(xi, digits: 4) $
          }
          
        }
      }
    ])

  + O que você acha que acontece com $h^((n)) (3/4)$ quanto $n$ torna-se grande?
    #solution([
      Para $n$ grande, $h^((n))(1)$ cresce e tende a $1$.
    ])
