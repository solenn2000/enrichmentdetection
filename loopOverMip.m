cnt = 1;
for n = 1:size(regionStruct,1)
    if regionStruct(n).Area < 800 && regionStruct(n).Area > 10
        f = figure();
        centroid = regionStruct(n).Centroid;
        plane = centroid(3);
        plane = round(plane);
        imshow(mip(:,:,plane), []);
        hold on;
        scatter(centroid(1), centroid(2), 'rx');
        set(f,'position',get(0,'screensize'));
        title('Left Click to Draw ROI,Right Click to Proceed');
        hold off;
        [~,~,button]=ginput(1);
        if button == 1
            title('Left Click to Confirm, Right Click to Continue');
            h1 = imrect;
            h1.wait;
            position = h1.getPosition;
            [~,~,button]=ginput(1);
            if button == 1
                positions(cnt,:) = position;
                cnt = cnt + 1;
                pause(1)
                title(sprintf('Position %d Recorded', cnt));
                close(f)
            elseif button == 3
                title('Position not Recorded!');
                pause(1);
                close(f);
            end
        elseif button == 3
            close(f)
        end
    end
end