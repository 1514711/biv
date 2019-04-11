function showQuadView(a,b,c,d)
    figure;

    subplot('Position',[0 0.5 0.5 0.5]);
    subimage(a);
    axis off;

    subplot('Position',[0.5 0.5 0.5 0.5]); 
    subimage(b);
    axis off;

    subplot('Position',[0 0 0.5 0.5]); 
    subimage(c);
    axis off;

    subplot('Position',[0.5 0 0.5 0.5]); 
    subimage(d);
    axis off;
end
