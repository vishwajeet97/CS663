%% function file for myShrinkImageByFactorD 
%% window is always considered to be odd
function contrastImg = myAHE(input, window)
	[len,width,c] = size(input);
	constant1 = (window-1)/2;
	constant2 = (window+1)/2;

	paddedImg = -1*ones(len + window-1, width + window-1,c);
	paddedImg(constant2:len+constant1, constant2:width+constant1,:) = input;

	contrastImg = zeros(len,width,c);
	for k=1:c
		for i=constant2:(len+constant1)
			for j=constant2:(width+constant1)
				patch = paddedImg(i-constant1:i+constant1, j-constant1:j+constant1,k);
				if (i>=window && i<=len && j>=window && j<=width)
					counts = hist(patch(:), 256);
                else
                    counts = hist(patch(:), 257);
	                counts = counts(2:end);
				end
				cdf = cumsum(counts)/double(sum(counts));
				contrastImg(i-constant1, j-constant1,k) = round(cdf(paddedImg(i,j,k)+1)*255);
			end
		end
	end
end
