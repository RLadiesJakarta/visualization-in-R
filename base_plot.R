setwd("D:/to share r ladies jkt 4")
getwd()

# Visualization using base R #
# Use mtcars dataset
# Outline: 
# - Boxplot
# - Barplot
# - Regression plot
# - color palettes in R
# - par function
# - Examples of others PCA, MDS, pretty barplots

#boxplot
head(mtcars)
mtcars$carb <- as.character(mtcars$carb)
boxplot(qsec~carb,data=mtcars)
boxplot(qsec~carb,data=mtcars, #beri judul
        main = "Frekuensi menangis anak umur 1-8 tahun")
boxplot(qsec~carb,data=mtcars, #beri label y dan x axis
        main = "Frekuensi menangis anak umur 1-8 tahun",
        ylab="Usian anak (tahun)", xlab="Frekuensi menangis per bulan")
boxplot(qsec~carb,data=mtcars, #ganti ukuran label/judul
        main = "Frekuensi menangis anak umur 1-8 tahun",
        ylab="Usian anak (tahun)", xlab="Frekuensi menangis per bulan",
        cex.main = "0.5", cex.axis="2")
boxplot(qsec~carb,data=mtcars, #ganti rentang y atau x limit
        main = "Frekuensi menangis anak umur 1-8 tahun",
        ylab="Usian anak (tahun)", xlab="Frekuensi menangis per bulan",
        cex.main = "1", cex.axis="1",
        ylim=c(0,30))
boxplot(qsec~carb,data=mtcars, #ganti rentang y atau x limit
        main = "Frekuensi menangis anak umur 1-8 tahun",
        ylab="Usian anak (tahun)", xlab="Frekuensi menangis per bulan",
        cex.main = "1", cex.axis="1",
        ylim=c(0,30), col ="red")
#barplot
counts <- table(mtcars$gear) #kalkulasi jumlah count masing2 gear
barplot(counts)
barplot(counts, main="Berapa kali pekerja menguap di sore hari",
        names.arg=c("Jam 15.00", "Jam 16.00", "Jam 17.00"),
        ylim=c(0,20))
abline(h=0)
barplot(counts, main="Berapa kali pekerja menguap di sore hari", horiz=TRUE,
        names.arg=c("Jam 15.00", "Jam 16.00", "Jam 17.00"))

#barplot bertumpuk (stacked barplot)
counts <- table(mtcars$vs, mtcars$gear)

barplot(counts, main="Berapa kali pekerja menguap di sore hari 
        bila break minum/tidak minum kopi",
        xlab="Jam kerja", col=c("darkblue","red"),
        legend = rownames(counts),
        names.arg=c("Jam 15.00", "Jam 16.00", "Jam 17.00"))

barplot(counts, main="Berapa kali pekerja menguap di sore hari 
        bila break minum/tidak minum kopi", #ganti legend
        xlab="Jam kerja", ylab = "Frekuensi menguap",
        col=c("darkblue","red"),
        names.arg=c("Jam 15.00", "Jam 16.00", "Jam 17.00"))
legend("topright",legend=c("Minum kopi","Tidak minum kopi"), #opsi legend 1
       col=c("darkblue","red"),pch=15)
legend(2,14,legend=c("Minum kopi","Tidak minum kopi"), #opsi legend 2
       col=c("darkblue","red"),pch=15, bty="n") #gunakan koordinat & buang bingkai kotak


## untuk linear regression
x<-1:10; y1=x*x; y2=2*y1

plot(x, y1, type="b", pch=19, col="red", xlab="Jumlah jam kerja", ylab="% pekerjaan selesai")
# Add a line
lines(x, y2, pch=18, col="blue", type="b", lty=2)
# Add a legend
legend(1, 95, legend=c("Minum kopi", "Tidak minum kopi"),
       col=c("red", "blue"), lty=1:2, cex=0.8)

# color palettes in R
library(RColorBrewer)

display.brewer.pal(n = 8, name = 'Paired')
display.brewer.pal(n = 8, name = 'Dark2')
display.brewer.pal(n = 8, name = 'Blues')


boxplot(qsec~carb,data=mtcars, #ganti rentang y atau x limit
        main = "Frekuensi menangis anak umur 1-8 tahun",
        ylab="Usian anak (tahun)", xlab="Frekuensi menangis per bulan",
        cex.main = "1", cex.axis="1",
        ylim=c(10,25), col=brewer.pal(6, "Paired"))

library(wesanderson)
wes_palette("GrandBudapest1", n = 4)
wes_palette("FantasticFox1", n = 5)
wes_palette("Royal2", n = 5) 

boxplot(qsec~carb,data=mtcars, #ganti rentang y atau x limit
        main = "Frekuensi menangis anak umur 1-8 tahun",
        ylab="Usian anak (tahun)", xlab="Frekuensi menangis per bulan",
        cex.main = "1", cex.axis="1",
        ylim=c(10,25), col=wes_palette("GrandBudapest1", n = 4))

# others
barplot(1:5, col=rainbow(5))
barplot(1:5, col=heat.colors(5))
barplot(1:5, col=terrain.colors(5))
barplot(1:5, col=topo.colors(5))
barplot(1:5, col=cm.colors(5))

boxplot(qsec~carb,data=mtcars, #ganti rentang y atau x limit
        main = "Frekuensi menangis anak umur 1-8 tahun",
        ylab="Usian anak (tahun)", xlab="Frekuensi menangis per bulan",
        cex.main = "1", cex.axis="1",
        ylim=c(10,25), col=heat.colors(6))

install.packages('ghibli')
library(ghibli)

ghibli_palette("PonyoMedium", direction = 1, type = "continuous")
ghibli_palette("MononokeMedium", direction = 1, type = "discrete")

boxplot(qsec~carb,data=mtcars, #ganti rentang y atau x limit
        main = "Frekuensi menangis anak umur 1-8 tahun",
        ylab="Usian anak (tahun)", xlab="Frekuensi menangis per bulan",
        cex.main = "1", cex.axis="1",
        ylim=c(10,25), col=ghibli_palette("PonyoMedium", direction = -1, type = "continuous"))
boxplot(qsec~carb,data=mtcars, #ganti rentang y atau x limit
        main = "Frekuensi menangis anak umur 1-8 tahun",
        ylab="Usian anak (tahun)", xlab="Frekuensi menangis per bulan",
        cex.main = "1", cex.axis="1",
        ylim=c(10,25), col=ghibli_palette("PonyoMedium", direction = 1, type = "continuous"))
boxplot(qsec~carb,data=mtcars, #ganti rentang y atau x limit
        main = "Frekuensi menangis anak umur 1-8 tahun",
        ylab="Usian anak (tahun)", xlab="Frekuensi menangis per bulan",
        cex.main = "1", cex.axis="1",
        ylim=c(10,25), col=ghibli_palette("KikiLight", direction = -1, type = "continuous"))

#par function
#default: par(mar=c(5.1,4.1,4.1,2.1)
par(mar=c(10,10,10,10))
boxplot(qsec~carb,data=mtcars, #ganti rentang y atau x limit
        main = "Frekuensi menangis anak umur 1-8 tahun",
        ylab="Usian anak (tahun)", xlab="Frekuensi menangis per bulan",
        cex.main = "1", cex.axis="1",
        ylim=c(10,25), col=ghibli_palette("KikiLight", direction = -1, type = "continuous"))

par(mar=c(5.1,4.1,4.1,2.1)) #kembali ke default
par(mfrow=c(1,1)) #1 baris, 1 kolom
boxplot(qsec~carb,data=mtcars, #ganti rentang y atau x limit
        main = "Frekuensi menangis anak umur 1-8 tahun",
        ylab="Usian anak (tahun)", xlab="Frekuensi menangis per bulan",
        cex.main = "1", cex.axis="1",
        ylim=c(10,25), col=ghibli_palette("KikiLight", direction = -1, type = "continuous"))

par(mfrow=c(1,2)) #1 baris, 2 kolom
boxplot(qsec~carb,data=mtcars, #ganti rentang y atau x limit
        main = "Frekuensi menangis anak umur 1-8 tahun",
        ylab="Usian anak (tahun)", xlab="Frekuensi menangis per bulan",
        cex.main = "1", cex.axis="1",
        ylim=c(10,25), col=ghibli_palette("KikiLight", direction = -1, type = "continuous"))

boxplot(qsec~carb,data=mtcars, #ganti rentang y atau x limit
        main = "Frekuensi menangis anak umur 1-8 tahun",
        ylab="Usian anak (tahun)", xlab="Frekuensi menangis per bulan",
        cex.main = "1", cex.axis="1",
        ylim=c(10,25), col=ghibli_palette("PonyoMedium", direction = -1, type = "continuous"))

par(mar=c(2,4,5,1),mfrow=c(3,3))

#tugas!
#gunakan data mtcars
library(vtable)
vtable(mtcars)
#anggap cyl = jumlah jam commute, dan disp = tingkat stress
#jadikan cyl = as.character
#buatlah plot berukuran 1 baris, 3 kolom
#gambar 1 = boxplot tingkat stress untuk tiap jumlah jam commute, warna dasar R
#gambar 2 = boxplot tingkat stress untuk tiap jumlah jam commute, warna RColorBrewer
#gambar 3 = terserah (bisa gunakan dataset lain)

