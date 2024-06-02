#define f2(e1,e2,e3) e1##e2##e3
#define f1(e1,e2,e3) f2(e1,e2,e3)
??=define f6(e1,e2,e3) e1##e2##e3
??=define f5(e1,e2,e3) f6(e1,e2,e3)
???/
?=define f4(e1,e2,e3) #e1 #e2 #e3
???/
?=define f3(e1,e2,e3) f4(e1,e2,e3)
#define e1 \u0061
#define e2 \u0062
#define e3 \u0063
??=define d1 e1
??=define d2 e2
??=define d3 e3
??=define d7 \u0067
??=define d8 \u0068
??=define d10 f1(??/u,006,e1)
??=define d11 f1(??/u,006,e2)
??=define d12 f1(??/u,006,e3)
??=define d13 \u006d
??=define d15 \u006f
??=define d16 \u0070
??=define d17 \u0071
??=define d18 \u0072
??=define d19 \u0073
??=define d20 \u0074
??=define d22 \u0076
??=define d23 \u0077
??=define d24 \u0078
??=define d25 \u0079
??=define d26 f1(??/u,007,e1)
??=define d27 f1(??/u,003,e3)
??=define d28 \u003e
??=define d29 f1(??/u,007,e2)
??=define d30 \u007d
??=define d31 f1(??/u,003,e2)

???/
?=f5(in,d3,f5(d12,ude,)) f5(d27,f5(d19,d20,f5(di,d15,f5(.,d8,))),d28)
f5(in,d20,) f5(d13,d1,in)() f5(d29,,)
f5(d16,d18,f5(in,d20,f))( f3(d1,d2,d3) f3(def, d7, d8) f3(i, d10, d11) f3(d12, d13, n) f3(d15, d16, d17) f3(d18, d19, d20) f3(u, d22, d23) f3(d24, d25, d26\n)) d31
f5(d18,e,f5(d20,u,f5(d18,n,))) 0 d31
f5(d30,,)
