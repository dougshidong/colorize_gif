close all;
clear;
filename = "unnamed.gif";
img = gifread(filename,'tcidx','imagemagick','rgb','coalesce');
n_frames = size(img,4);
map = bone(256); % Or whatever colormap you want.

% for iframe = 1:n_frames
%     frame = img(:,:,:,iframe);
%     rgbImage = ind2rgb(frame(:,:,1), map); % im is a grayscale or indexed image.
%     img(:,:,:,iframe) = rgbImage*256;
%     %figure
%     %imshow(img(:,:,:,iframe))
% end
% 
% gifwrite(img,'color.gif')

percentdarker = 0.0;
img = gifread(filename,'tcidx','imagemagick','rgb','coalesce');
for iframe = 1:n_frames
    frame = img(:,:,:,iframe);
    rgbImage = ind2rgb(frame(:,:,1), map); % im is a grayscale or indexed image.
    img(:,:,:,iframe) = (rgbImage*256).*(1-rgbImage*percentdarker);
    %figure
    %imshow(img(:,:,:,iframe))
end

gifwrite(img,'bone.gif')