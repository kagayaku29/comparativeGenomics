# Построение MuMMer plot создание окружения и установка:

1. Скачиавание и установка MuMMer (эта часть выполнялась в [Google Colab](https://colab.research.google.com/drive/1Rgu3w58QsTC7VWDvVcI3KdL9ycqln3Nq#scrollTo=p_aYb7M0SLJK)

   '''
   wget https://github.com/mummer4/mummer/releases/download/v4.0.0rc1/mummer-4.0.0rc1.tar.gz
   tar -xvf /content/mummer-4.0.0rc1.tar.gz
   /content/mummer-4.0.0rc1/configure --prefix=/path/to/installation
   make
   make install
   ''''
 2.  Выравниваниее и построение графика ddplot

  '''
  /content/nucmer /content/out/refchrom1.fna /content/out/chrom1.fna
  sudo apt-get install gnuplot
  sudo apt-get install xclip
  /content/mummerplot /content/out.delta
  gnuplot -e "set terminal png; set output 'out_fplot.png'; plot 'out.fplot' with lines"
  '''

  [out.delta](https://github.com/kagayaku29/comparativeGenomics/blob/main/hw2/out_fplot.png)

  
