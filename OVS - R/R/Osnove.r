# Numerični vektorji
teza <- c(60, 72, 57, 90, 95, 72)
#koristne funkcije : 
sum
mean
var
sd
min
max
sort
#itn.

# Operatorji
x <- TRUE
y <- FALSE

x & y  # ovrednoti x,y. Če sta oba TRUE, vrne TRUE, sicer vrne FALSE
x && y # ovrednoti x, če je treba, ovrednoti y


# znakovni vektorji
niz <- c("aaaaaa", "bbbbbbb", "ccccccc")
toupper(niz)
substr(niz, 1, 2)
paste() #poveže znakovne vektorje v en vektor


# funkcjije:
c() # poveže vrednosti v vektor
seq() # ustvari aritmetično zaporedje
4:9
rep(niz, times = 1, each = 1) # ponovi vektor glede na argumente


#specialne vrednosti
NA # manjkajoča vrednost
NaN #Neveljavna številka
Inf
-Inf

# izbira elementov

niz[2]
teza[1:3]
niz[-2] #izbere vse, razen 2


#matrike
x <- matrix(1:12, nrow = 3, byrow = T)
rownames(x) <- LETTERS[1:3]
colnames(x) <- month.abb[1:4]

t(x) # transponira matriko
diag(x) # diagonala matrike


y <- matrix(rep(1:6, c(3, 4, 2, 1, 4, 2)), ncol = 4)

det(y) #izračuna determinanto kvadratne matrice

solve(y) #izračuna inverz matrike


B <- matrix(c(-2, 1, 0, 3), ncol = 2)
C <- matrix(c(2, -3, 1, 4), ncol = 2)


B %*% C # množenje matrik


