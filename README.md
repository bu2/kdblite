# kdblite

### This is not a KX official product.

### Getting Started

#### Start the kdblite server
$ q kdblite.q -p 5555

#### From a q client
q)h:hopen 5555
q)h(`.kdblite.createTable;`t;([] `long$(); `long$()))
`t
q)h(`.kdblite.listTables;::)
,`t
q)h(`.kdblite.schema;`t)
c | t f a
--| -----
x | j    
x1| j    
q)h(`.kdblite.insert;`t;([] til 10; 10?10))
`t
q)h(`.kdblite.insert;`t;flip(10+til 10; 10?10))
`t
q)h(`.kdblite.get;`t)
x  x1
-----
0  8 
1  1 
2  9 
3  5 
4  4 
5  6 
6  6 
7  1 
8  8 
9  5 
10 8 
11 1 
12 7 
13 2 
14 4 
15 5 
16 4 
17 2 
18 7 
19 8 
q)
q)h(`.kdblite.select;`t;();0b;())
x  x1
-----
0  8 
1  1 
2  9 
3  5 
4  4 
5  6 
6  6 
7  1 
8  8 
9  5 
10 8 
11 1 
12 7 
13 2 
14 4 
15 5 
16 4 
17 2 
18 7 
19 8 
q)h(`.kdblite.select;`t;enlist(=;(mod;`i;2);0);0b;())
x  x1
-----
0  8 
2  9 
4  4 
6  6 
8  8 
10 8 
12 7 
14 4 
16 4 
18 7 
q)h(`.kdblite.select;`t;();`x1;enlist[`y]!enlist(count;`i))
 | y
-| -
1| 3
2| 2
4| 3
5| 3
6| 2
7| 2
8| 4
9| 1
q)h(`.kdblite.query;"select y:count i by x:x1 from t")
x| y
-| -
1| 3
2| 2
4| 3
5| 3
6| 2
7| 2
8| 4
9| 1
q)h(`.kdblite.deleteTable;`t)
`.
q)h(`.kdblite.listTables;::)
`symbol$()
