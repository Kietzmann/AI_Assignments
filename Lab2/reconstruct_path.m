

function path = reconstruct_path(node)
    path(1) = node;
    i = 2;
    
    while ~isempty(node.parent)
        node = node.parent;
        path(i) = node;
        i = i + 1;
    end
    
    path = fliplr(path); 

    for i = 1:length(path)
        disp(path(i).state)
    end
end