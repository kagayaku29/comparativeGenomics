# Сравнительный анализ генома с использованием JupiterPlot

1. Скачиавание и установка Jupiner plot

   ```bash
      conda create -n jupiterplot
      conda activate jupiterplot
      conda install -c bioconda jupiterplot
      conda install bioconda::bedtools
      conda install -c conda-forge perl-gd
   ```
 2.  Построение графика  Jupiner plot

     ```bash
       jupiter name=jup_plot_2 ref=ref.fna fa=gen.fna t=2
     ```
  ![jup_plot_2.png](https://github.com/kagayaku29/comparativeGenomics/blob/main/hw3/jup_plot_2.png)

JupiterPlot использовался для визуализации хромосомных перестроек между референсным и иследуюмум геномом Arabidopsis. JupiterPlot помогает идентифицировать крупномасштабные структурные изменения, такие как инверсии и транслокации, связывая гомологичные области между хромосомами.



Эти перестройки могут играть роль в экологических различиях, наблюдаемых между двумя видами, влияя на функцию генов или паттерны экспрессии.

  # Визуализация содержания GC, генов и плотности повторов с использованием Circos

1. Подготовка и запуск

   ```bash
     samtools faidx ref.fna
     samtools faidx gen.fna
     cut -f1,2 gen.fna.fai > scaffolds_info_sample.txt
   ```
   
   ```bash
     nano kariotipe.sh
     chmod +x karyotipe.sh
     ./kariotipe.sh
     bedtools makewindows -g scaffolds_info_sample.txt -w 20000 > interval_arab.bed
     bedtools nuc -fi gen.fna -bed interval_arab.bed > gc_content.txt
     awk '{print $1, $2, $3, $5}' gc_content.txt > gc_for_circos.txt
     nano circos_plot.conf
     circos -conf circos_plot.conf
   ```
   
  ![gc_content_circos.svg](https://github.com/kagayaku29/comparativeGenomics/blob/main/hw3/gc_content_circos.svg)

Содержание GC отображено с использованием цветовой схемы, и для каждой хромосомы наблюдается несколько "пиков", которые соответствуют участкам с пониженным содержанием GC. Это, вероятно, связано с присутствием специфических структурных элементов в хромосоме или с участками, характеризующимися низким содержанием GC.


# График Кимуры

1. Подготовка и запуск

   ```bash
     BuildDatabase -name db_gen gen.fna
     RepeatModeler -database db_gen -threads 4 -LTRStruct
     RepeatMasker -lib /home/abaranova/hw/hw3/RM_992729.FriNov151719222024/consensi.fa  -a -pa 7 -s -xsmall  /home/abaranova/hw/hw3/gen.fna
   ```
   
   ```bash
     calcDivergenceFromAlign.pl -s divsum /home/abaranova/hw/hw3/gen.fna.align
     createRepeatLandscape.pl -div divsum -g 31581135 > divsum.html
   ```
   



 

  
