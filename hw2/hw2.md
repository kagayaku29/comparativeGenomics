# Построение MuMMer plot:

1. Скачиавание и установка MuMMer (эта часть выполнялась в ![Google Colab](https://colab.research.google.com/drive/1Rgu3w58QsTC7VWDvVcI3KdL9ycqln3Nq#scrollTo=p_aYb7M0SLJK)

   ```bash
      wget https://github.com/mummer4/mummer/releases/download/v4.0.0rc1/mummer-4.0.0rc1.tar.gz
      tar -xvf /content/mummer-4.0.0rc1.tar.gz
      /content/mummer-4.0.0rc1/configure --prefix=/path/to/installation
      make
      make install
   ```
 2.  Выравниваниее и построение графика ddplot

     ```bash
        /content/nucmer /content/out/refchrom1.fna /content/out/chrom1.fna
        sudo apt-get install gnuplot
        sudo apt-get install xclip
        /content/mummerplot /content/out.delta
        gnuplot -e "set terminal png; set output 'out_fplot.png'; plot 'out.fplot' with lines"
     ```
  ![out.delta](https://github.com/kagayaku29/comparativeGenomics/blob/main/hw2/out_fplot.png)

  В ходе исследования была проанализирована первая хромосома организма Arabidopsis thaliana (GCA_903064285.1). Выравнивание последовательности исследуемого образца на референсный геном выполнено с помощью инструмента MUMmer, на основе чего построен dotplot-график. По вертикальной оси отражены координаты генов образца, по горизонтальной — референса.


График демонстрирует линейную зависимость, что свидетельствует о высокой гомологии последовательностей. Однако в центре наблюдается разрыв со смещением вверх, указывающий на наличие делеции (разрывы в 1 хромосоме) в этой области хромосомы образца. Это структурное изменение может быть следствием эволюционных процессов, специфических условий культивирования или ошибок сборки.

  # Построение MCScan:

1. Скачиавание и установка agat

   ```bash
      conda create -n agat
      conda install bioconda::agat
      conda install jcvi -c conda-forge -c bioconda
      conda install bioconda::last
      apt-get install -y texlive texlive-latex-extra
      apt-get install -y cups
   ```
 2.  Подготовка файлов

     ```bash
        agat_convert_sp_gff2bed.pl --gff ref.gff -o ref.bed
        agat_convert_sp_gff2bed.pl --gff gen.gff -o gen.bed
        agat_sp_extract_sequences.pl -g gen.gff -f gen.fna -t tRNA -o gen_trna.fasta
        agat_sp_extract_sequences.pl -g ref.gff -f ref.fna -t cds -o ref_cds.fasta
     ```
   3.  Запуск и построение графика

     ```bash
        cat gen_cds.fasta gen_trna.fasta > gen_sample.cds
        cat ref_cds.fasta ref_trna.fasta > ref.cds
        python -m jcvi.compara.catalog ortholog ref gen_sample --no_strip_names
        python -m jcvi.compara.synteny screen --minspan=30 --simple ref.gen_sample.anchors ref.gen_sample.anchors.new 
        python -m jcvi.graphics.karyotype seqids layout
     ```
     
  ![out.delta](https://github.com/kagayaku29/comparativeGenomics/blob/main/hw2/karyotype.pdf)

  

  
