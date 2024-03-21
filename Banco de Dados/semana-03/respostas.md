# Resolução dos exercícios

## Verdadeiro e falso 1

| Afirmação                                                            | Resposta |
| -------------------------------------------------------------------- | -------- |
| O conjunto de atributos de uma relação é chamado de relação esquema. | `V`      |
| Cada atributo possui um domínio.                                     | `V`      |
| O grau de uma relação é o número de atributos da relação.            | `V`      |
| Tuplas são as linhas da tabela.                                      | `V`      |
| Cada relação pode ser entendida como uma tabela.                     | `V`      |

## Verdadeiro e falso 2

| Afirmação                                                                                                                                                                     | Resposta |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| Os registros (ou tuplas) contidos em cada relação são apresentados nas Tabelas.                                                                                               | `V`      |
| O símbolo σ (sigma) é usado para indicar o operador SELEÇÃO e a condição de seleção é uma expressão booleana (condição) especificada nos atributos da relação R.              | `V`      |
| É a operação usada para selecionar um subconjunto de tuplas de uma relação R que satisfaça uma condição de projeção.                                                          | `F`      |
| A união de duas relações R e S é o conjunto de todas as tuplas pertencentes à relação R ou à relação S ou a ambas                                                             | `V`      |
| A junção é representada pelo símbolo Theta, essa junção também é conhecida como Junção Condicional e baseia-se em uma combinação dos operadores produto cartesiano e seleção. | `V`      |

## Exercício 23

**D)** `Estudante(10, 'jsilva@ig.com.br', 1, 50);` `FonePessoa(1, '019', '2761', '1370')`

## Aplicação do exercício 23

```sql
create database if not exists Exercicio23;
use Exercicio23;
 
create table if not exists Pessoa(
	IdPessoa 		int primary key auto_increment,
    Nome			varchar (40),
    Endereco		varchar(40)
); 
select * from Pessoa;
 
create table if not exists FonePessoa(
	IdPessoa		int primary key auto_increment,
    DDD				varchar(3),
    Prefixo			char(4),
    Nro				char(4),
    foreign key(IdPessoa) references Pessoa(IdPessoa)
);
 
create table if not exists Republica(
	IdRep			int primary key auto_increment,
    Nome			varchar(30),
    Endereco		varchar(40)
);
SELECT * FROM Republica;
 
create table if not exists Estudante(
	RA				int primary key auto_increment,
    Email			varchar(30),
    IdPessoa		int,
    IdRep			int,
    foreign key(IdPessoa) references Pessoa(IdPessoa),
    foreign key(IdRep) references Republica(IdRep)
);
 
INSERT INTO Pessoa (Nome, Endereco)
VALUES ("José Silva", "Rua 1, 20");
 
INSERT INTO Republica values (20, "Várzea", "Rua Chaves, 2001");
```


## Verdadeiro e falso 3

| Afirmação                                                                                                                                                                                  | Resposta |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| Para uma operação de União e Intersecção ser válida é preciso que as relações R e S possuam o mesmo número de atributos.                                                                   | `F`      |
| Seleção é a operação usada para selecionar determinadas colunas de uma relação R.                                                                                                          | `F`      |
| Junção é utilizada para combinar tuplas relacionadas de duas relações em uma única tupla.                                                                                                  | `V`      |
| O produto cartesiano de duas relações R e S é o uma relação T cujas tuplas são a combinação das tuplas das relações R e S, tomando-se uma tupla de R e concatenando-a com cada tupla de S. | `V`      |
| A diferença de duas relações R e S é o conjunto de todas as tuplas pertencentes à relação R e não pertencentes à relação S.                                                                | `V`      |

## Exercício 40

### A) Escreva o código de uma consulta em SQL que corresponda à solução proposta

```sql
SELECT nome, endereco FROM Cliente WHERE idade < 40
UNION
SELECT nome, endereco FROM Cliente WHERE renda > 30000;
```

### B) Desenha a árvore de consulta para essa solução

$$
\pi_{\text{nome, endereço}}(\sigma_{\text{idade}\lt40}(\text{Clientes}))
\cup
\pi_{\text{nome, endereço}}(\sigma_{\text{renda}\gt30000}(\text{Clientes}))
$$

## Exercício 24

### C)

```sql
SELECT E.nome_estado FROM Estado AS E
WHERE E.UF NOT IN (
  SELECT F.UF FROM Fornecedor AS F);
```

## Exercício 19

### E)

```sql
SELECT Deputado.nomeDeputado, Secao.dataSecao FROM Deputado
INNER JOIN Participacao ON Deputado.idDeputado = Participacao.idDeputado
INNER JOIN Secao ON Participacao.idSecao=Secao.idSecao;
```
## Aplicação do exercício 19
```sql
create database if not exists Exercicio19;
 
use Exercicio19;
 
create table if not exists Partido (
idPartido int not null,
        siglaPartido varchar(45) not null,
        descricaoPartido varchar(45) not null,
        primary key(idPartido));
 
create table if not exists Deputado (
idPartido int not null,
        nomeDeputado varchar(60) not null,
        primary key(idPartido),
        foreign key(idPartido) references Partido(idPartido));
 
create table if not exists Participacao (
idSecao int not null,
        idDeputado int null,
        primary key (idSecao, idDeputado),
        foreign key(idSecao) references Deputado(idPartido),
        foreign key(idDeputado) references Deputado(idPartido));
 
create table if not exists Secao (
idSecao int not null,
dataSecao date not null,
horasecao time not null,
decisao varchar(2000) not null,
        foreign key(idSecao) references Participacao(idSecao));
        
insert into Partido(idPartido, siglaPartido, descricaoPartido) values
(1, "MDB", "Movimento Democrático Brasileiro"),
(2, "PSB", "Partido Socialista Brasileiro"),
(3, "PSOL", "rtido Socialismo E Liberdade"),
(4, "PT", " Partido dos Trabalhadores"),
(5, "PL", "Partido Liberal");
 
insert into Deputado(idPartido, nomeDeputado) values
(2, "Eduardo Bandeira de Mello"),
(5, "Carla Zambelli"),
(1, "Célio Silveira "),
(3, "Guilherme Cortez"),
(4, "Benedita da Silva");
 
insert into Participacao(idSecao, idDeputado) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
 
insert into Secao(idSecao, dataSecao, horasecao, decisao) values
(1, curdate(), "13:40", "decisão alternativa"),
(2, curdate(), "11:58", "decisão alternativa"),
(3, curdate(), "12:30", "decisão alternativa"),
(4, curdate(), "18:10", "decisão alternativa"),
(5, curdate(), "21:06", "decisão alternativa");
 
select Deputado.nomeDeputado, Secao.dataSecao
from Deputado
INNER JOIN Participacao ON Deputado.idPartido = Participacao.idDeputado
INNER JOIN Secao ON Participacao.idSecao = Secao.idSecao;
```

## Exercício 30

### E)

```sql
SELECT NOME, PONTOS FROM JOGADOR, NIVEL
WHERE JOGADOR.PSEUDONIMO = NIVEL. NOMEPSEUD ORDER BY NIVEL. BONUS ASC
```

## Aplicação do exercício 30

```sql
create database if not exists Exercicio30;
 
use Exercicio30;
 
create table if not exists JOGADOR (

	PSEUDONIMO VARCHAR(10) NOT NULL,

    NOME VARCHAR(25) NOT NULL,

    SENHA VARCHAR(3) NOT NULL,

    PRIMARY KEY(PSEUDONIMO));
 
create table if not exists NIVEL ( 

NIVEL NUMERIC(3) NOT NULL,

NOMEPSEUD VARCHAR(10) NOT NULL,

PONTOS NUMERIC(5) NOT NULL,

BONUS NUMERIC(5) NOT NULL,

PRIMARY KEY(NIVEL, NOMEPSEUD),

foreign key (NOMEPSEUD) references JOGADOR(PSEUDONIMO));
 
insert into JOGADOR(PSEUDONIMO, NOME, SENHA) values

("Biel", "Gabriel", "374"),

("Ray", "Rayane", "981"),

("Babi", "Barbara", "7U9"),

("Gigi", "Giovanni", "4FV"),

("Thi", "Thiago", "J9A");
 
insert into NIVEL(NIVEl, NOMEPSEUD, PONTOS, BONUS) values 

(15, "Ray", 170, 33),

(27, "Gigi", 210, 40),

(8, "Biel", 90, 5),

(12, "Thi", 145, 26),

(39, "Babi", 421, 54);
 
select * from NIVEL;
 
select NOME, PONTOS FROM JOGADOR, NIVEL WHERE JOGADOR.PSEUDONIMO = NIVEL.NOMEPSEUD ORDER BY NIVEL.BONUS ASC;

drop table NIVEL;
 
drop table JOGADOR;
```


