##setting vector x* (base values)
x <- c(0,1/3,2/3)
X <- sample(x, size = 15, replace = TRUE, prob = c(1/3, 1/3, 1/3))

##setting matrix Jm1
Jm1 <- matrix(1, nrow = 16, ncol = 1, byrow = FALSE, dimnames = NULL)

##setting matrix B
b <- import("B.csv")
B <- data.matrix(b)

##setting matrix Jmk
Jmk <- matrix(1, nrow = 16, ncol = 15, byrow = FALSE, dimnames = NULL)

##setting matrix D*
dd <- c(1,-1)
diagonal <- sample(dd, size = 15, replace = TRUE, prob = c(.5, .5))
D <- diag(x = diagonal, nrow = 15, ncol = 15)


Bprime <- (1/2)*(((2*B) - Jmk) %*% D+Jmk)
BB <- ((Jm1 %*% X) + (1/3)*(Bprime))
BBB <- BB[,sample(1:15)]
write.csv(BBB, file = "EEffect_5.csv")
