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
      number: 3,
      title: "Qualitative Dynamics: The Fate of the Orbit"
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

+ Consirese a gunção raiz quadrada. $f(x) = sqrt(x)$.
  #set enum(numbering: "(a)")
  + Determine a linha de fase para $f(x)$ para $x$ não negativo. Explique seu raciocínio cuidadosamente.

  + Determine todos os pontos fixos, se existirem, de $f(x)$.

  + Qual é a estabilidade desses pontos fixos?

  #solution([
    Inicialmente, determinemos os pontos fixos de $f$:
    $
      f(x^*) = x^* &=> sqrt(x^*) = x^*\
      &=> x^* - sqrt(x^*) = 0\
      &=> sqrt(x^*) (sqrt(x^*) - 1) = 0\
      &=> cases(
        sqrt(x^*) = 0 &=> x^*_1 = 0,,
        sqrt(x^*) - 1 = 0 => sqrt(x^*) = 1 &=> x^*_2 = 1 
      )
    $

    Para a classificação dos pontos fixos em *estável* ou *instável*, consideremos alguns exemplos de sementes nos intervalos: $(0, 1)$ e $(1, infinity)$, conforme tabela abaixo:

    #let seeds = (0.2, 0.6, 0.8, 1.5, 10, 120)
    #let f(x) = calc.sqrt(x)

    #let orbitas = (seeds,)

    #for i in range(10) {
      orbitas.push(orbitas.last().map(x => f(x)))
    }

    #show table.cell.where(y: 0): strong


    #set table(
      stroke: (x, y) => {
        if y == 0 {
          (top: 0.7pt + primary-color)
          (bottom: 0.7pt + primary-color)
        } else if y == 11 {
          (bottom: 0.7pt + primary-color)
        }
      },
      align: (x, y) => (
        if y > 0 {right}
      )
    )


    #figure(
      kind: table
    )[
      #table(
        columns: seeds.len() + 1,
        align: right,
        table.header([n], table.cell(colspan: seeds.len())[#align(center)[Órbitas]]),
        [0], ..orbitas.at(0).map(x => fmt(x, digits: 4)),
        [1], ..orbitas.at(1).map(x => fmt(x, digits: 4)),
        [2], ..orbitas.at(2).map(x => fmt(x, digits: 4)),
        [3], ..orbitas.at(3).map(x => fmt(x, digits: 4)),
        [4], ..orbitas.at(4).map(x => fmt(x, digits: 4)),
        [5], ..orbitas.at(5).map(x => fmt(x, digits: 4)),
        [6], ..orbitas.at(6).map(x => fmt(x, digits: 4)),
        [7], ..orbitas.at(7).map(x => fmt(x, digits: 4)),
        [8], ..orbitas.at(8).map(x => fmt(x, digits: 4)),
        [8], ..orbitas.at(9).map(x => fmt(x, digits: 4)),
        [10], ..orbitas.at(10).map(x => fmt(x, digits: 4)),
      )
    ]

    Note que todas as órbitas de sementes no intervalo $(0, 1)$ _afastam-se_ fo ponto fixo $x^*_1 = 0$ e _aproximam-se_ do ponto fixo $x^*_2 = 1$. Por sua vez, as órbitas de sementes no intervalo $1, infinity$ também tende a $1$. Logo, o ponto fixo $x^*_1 = 0$ é um ponto *repulsor* enquanto o ponto fixo $x^*_2 = 1$ é *atrator*.

    A linha de fase de $f$ é mostrada na figura abaixo:
    #figure()[
      #cetz.canvas({
        import cetz.draw: *

        scale(400%)

        line((0, 0), (3, 0), stroke: 2pt+primary-color)
        for x0 in (0, 1) {
          circle((x0, 0), radius: 1pt, fill: primary-color, stroke: none)
          content((x0, 0), [$x0$], anchor: "south", padding: 0.3)
        }
        for i in range(20) {
          let x = i * 0.25
          if x > 0 and x < 1 {
            polygon((x, 0), 3, radius: 2pt, fill: primary-color, stroke: none)
          } else if x > 1 and x < 3 {
            polygon((x, 0), 3, radius: 2pt, fill: primary-color, stroke: none, angle: 180deg)
          }
        }
        content((3, 0), [$x$], anchor: "north", padding: 0.2)
      })
    ]
  ])

+ Considere a função elevar ao cubo, $h(x) = x^3$.
  #set enum(numbering: "(a)")
  + Determine a linha de fase para $h(x)$. Considere ambos positivos e nevativos $x$. Explique seu raciocínio cuidadosamente.
  + Determine todos os pontos fixos, se existirem, de $h(x)$.
  + Qual é a estabilidade desses pontos fixos?

  #solution([
    Determinemos os pontos fixos de $h$:
    $
      h(x^*) = x^* &=> (x^*)^3 = x^* => (x^*)^3 - x^* = 0\
      &=> x^* ((x^*)^2 - 1) = 0\
      &=> x^* (x^* - 1) (x^* + 1) = 0\
      &=> cases(
        x^* + 1 = 0 => x^*_1 = -1, ,
        x^*_2 = 0, , 
        x^* - 1 = 0 => x^*_3 = +1
      )
    $

    Para a classificação dos pontos fixos acima, utilizemos o seguinte teorema:

    *Teorema*: Seja $f$ uma função _suave_#footnote[Contínua e com derivadas contínuas em $RR$.] e assuma $p$ um ponto fixo de $f$. Então:
      #set enum(numbering: "1.")
      + Se $|f^prime (p)| < 1$, então $p$ é um ponto fixo atrator;
      + Se $|f^prime (p)| > 1$, então $p$ é um ponto fixo repulsor.

    Calculemos a derivada de $h$:
    $
      h^prime (x) = d/(d x) (x^3) = 3x^2
    $
    
    Aplicando o teorema aos pontos fixos encontrados, temos:
    $
      &x^*_1 &= -1 &=> |h^prime (x^*_1)| &=& |3 dot (-1)^2| &= 3 > 1\ 
      &x^*_2 &= 0 &=> |h^prime (x^*_2)| &=& |3 dot 0^2| &= 0 < 1\ 
      &x^*_3 &= +1 &=> |h^prime (x^*_3)| &=& |3 dot 1^2| &= 3 > 1\ 
    $

    Portanto, os pontos fixos $x^*_1 = -1$ e $x^*_3 = 1$ são repulsores e o ponto fixo $x^*_2 = 0$ é atrator. A figura seguinte ilustra a linha de fase de $h(x)$.

    #figure()[
      #cetz.canvas({
        import cetz.draw: *

        let pontos = (-1, 0, 1)

        scale(400%)
        line((-2, 0), (2, 0), stroke: 2pt + primary-color)

        for p in pontos {
          circle((p, 0), radius: 1pt, stroke: none, fill: primary-color)
          content((p, 0), [$#p$], anchor: "south", padding: 0.3)
        }

        for i in range(20) {
          let x = -2 + i * 0.25
          if x < -1 or (x > 0 and x < 1) {
            polygon((x, 0), 3, radius: 2pt, fill: primary-color, stroke: none, angle: 180deg)
          } else if (x > 1 and x <= 2) or (x > -1 and x < 0) {
            polygon((x, 0), 3, radius: 2pt, fill: primary-color, stroke: none, angle: 0deg)
          }
        }
      })
    ]
  ])

+ Encontre os pontos fixos, se existirem, de $f(x) = 2x - 5$.
  #solution([
    $
      f(x^*) = x^* => 2x^* - 5 = x^* => x^* = 5
    $
  ])

+ Encontre os pontos fixos, se existirem, de $g(x) = 1/2 x + 4$.
  #solution([
    $
      g(x^*) = x^* => 1/2 x^* + 4 = x^* => 1/2 x^* = -4 => x^* = -8
    $
  ])

+ Encontre os pontos fixos, se existirem, de $h(x) = x^2 - 1$.
  #solution([
    $
      h(x^*) = x^* &=> (x^*)^2 - 1 = x^* => (x^*)^2 - x^* - 1 = 0\
      &=> x^* = (-(-1) plus.minus sqrt((-1)^2 - 4 dot 1 dot (-1)))/(2 dot 1)\
      &=> x^* = (1 plus.minus sqrt(5))/2
    $
  ])

+ Encontre os pontos fixos, se existirem, de $f(x) = x^2 + 1$.
  #solution([
    $
      f(x^*) = x^* &=> (x^*)^2 + 1 = x^* => (x^*)^2 - x^* + 1 = 0\
      &=> x^* = (-(-1) plus.minus sqrt((-1)^2 - 4 dot 1 dot 1))/(2 dot 1)\
      &=> x^* = (1 plus.minus sqrt(-3))/2
    $
    Como encontramos uma raiz quadrada negativa, não existem soluções reais para a equação $f(x^*) = x^*$. Logo,  a função $f$ não possui pontos fixos.
  ])

+ Encontre os pontos fixos, se existirem, de $g(x) = x - 3$.
  #solution([
    $
      g(x^*) = x^* => x^* - 3 = x^*
    $
    A igualdade acima é impossível para qualquer $x in RR$. Logo,  a função $g$ não possui pontos fixos.
  ])

+ Encontre os pontos fixos, se existirem, de $h(x) = x^3$.
  #solution([
    $
      h(x^*) = x^* &=> (x^*)^3 = x^* => (x^*)^3 - x^* = 0\
      &=> x^* ((x^*)^2 - 1) = 0\
      &=> x^* (x^* - 1) (x^* + 1) = 0\
      &=> cases(
        x^* + 1 = 0 => x^*_1 = -1, ,
        x^*_2 = 0, , 
        x^* - 1 = 0 => x^*_3 = +1
      )
    $
  ])