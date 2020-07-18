dir=getDirectory("Please choose the source directory");
dir3=getDirectory("Please choose the images directory");
dir2=getDirectory("Please choose the results directory");
filenames=getFileList(dir);
run("Bio-Formats Macro Extensions");

for(i=0; i<filenames.length; i++){
	path=dir+filenames[i];
	run("Bio-Formats", "open=[path] autoscale color_mode=Grayscale specify_range view=Hyperstack stack_order=XYCZT c_begin=1 c_end=1 c_step=1");
	title = getTitle;
	roiManager("reset");
	run("Set Measurements...", "area mean standard modal min centroid center perimeter bounding fit shape feret's integrated median skewness kurtosis area_fraction stack limit display redirect=None decimal=3");
	// colony identification//
	run("Z Project...", " projection=[Sum Slices]");
	//run("Threshold...");
	setAutoThreshold("Huang dark");
	waitForUser("Check");
	run("Make Binary");
	run("Dilate");
	run("Analyze Particles...", "size=10-Infinity exclude include add");
	run("Close");

	selectWindow(title);
	run("Z Project...", " projection=[Sum Slices]");
	for(j=0;j< roiManager("count"); j++){
		roiManager("Select", j);
		run("Measure");
	}
	saveAs("Results",  dir2 + title + "colony.csv"); 
	run("Clear Results");
	roiManager("show all without labels");
	run("Flatten");
	saveAs("Jpeg",dir3+title+"DNA.jpeg" );
	run("Close");
	
    //pcna measurement//
    run("Set Measurements...", "mean standard min integrated median skewness kurtosis display redirect=None decimal=4");
	 run("Bio-Formats", "open=[path] autoscale color_mode=Grayscale specify_range view=Hyperstack stack_order=XYCZT c_begin=2 c_end=2 c_step=1");
	 run("Z Project...", "projection=[Sum Slices]");
	 
	for(j=0;j< roiManager("count"); j++){
		roiManager("Select", j);
		run("Measure");
	}
	
	saveAs("Results",  dir2 + title + "pcna.csv"); 
	run("Clear Results");
	//generate image//
	roiManager("show all without labels");
	run("Flatten");
	saveAs("Jpeg",dir3+title+"pcna.jpeg" );

	
	run("Close All"); 
	//delete all rois//
	roiManager("reset");

	

}




