function mip = calcMip(filename, zStepNum)
%%calcMip Calculates maximum intensity projection from a single channel,
%%image stack.
%
%   inputs :
%       filename : String variable containing the filename of the image
%       file you want to processing into a max intensity projection.
%
%       zStepNum : Integer that specifies the number of z steps per zStack.
%
%   output :
%       mip : A 3D matrix contianing the maximum intensity projections.
imMat = readTiffStack(filename);
mip = zeros([size(imMat,1), size(imMat,2), size(imMat,3)/zStepNum]);
for n = 1:size(imMat,3)/zStepNum
    startIdx =zStepNum*n-(zStepNum-1);
    endIdx = zStepNum*n;
    zStack = imMat(:,:,startIdx:endIdx);
    mip(:,:,n) = max(zStack, [], 3);
end


