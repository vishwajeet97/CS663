function myDisplayThreeImage(img1,img2,img3)
    figure;
    subplot(1,3,1);
    myDisplayImageGrey(img1,"Original Image");
    subplot(1,3,2);
    myDisplayImageGrey(img2,"Corrupted Image");
    subplot(1,3,3);
    myDisplayImageGrey(img3,"Filtered Image");
end