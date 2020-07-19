# Cell Shape modulates cellular response to TNF-alpha
Analysis in the paper Mitra et.al. PNAS 2017. 

In the paper, we study the cellular response of cells of two different shapes (rectangle and circle) to the inflammatory cytokine TNF-alpha. 
Briefly, we find that cells of different shapes process the NF-kB nuclear shuttling at different rates and also have cell shape dependant transcriptional output. 

In this repository, we share the scripts used to analyse the transciption profile of rectangular and circular cells with and without TNF-alpha treatment. Our transcirptional analyis proved that there are cell shape dependent gene expression changes to TNF-alpha treatment. 

<br/>
<p align="center">
<img src='/Expression_Analysis/TNF-alpha-transcription.jpeg' height='500' width='500'><br/>
</p>

We also present scripts used for specific image processing tasks. 
1. *ikb_localization_Actin_Filament_vs_nodes.ijm* was used to obtain the IkB intensity on the filamentous, nodal and total F-actin content.
Below is an example of filamentous and nodal actin structures as identified from the original image by the algorithm. 
<br/>
<p align="center">
<img src='/Image_Analysis/Actin_structures.png' height='300' width='400'><br/>
</p>


1. *iPI_PARP_PCNA_quantification.ijm* was used to calculate Floroscent signal per colony. 

Our work is presented in this [scientific feature](https://mbi.nus.edu.sg/science-features/signaling-in-3d/).
<br/>
For more details visit [our paper](https://www.pnas.org/content/114/20/E3882).  
<br/>
