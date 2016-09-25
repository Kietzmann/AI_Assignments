
puzzles = []

for n = 5:29
    numPuzzleForEachDepth = 0;
    
    while(numPuzzleForEachDepth < 4)
        array = pgenerator(n)

        alreadyCreated = false;
        for i = 1:size(puzzles, 1)
            if(isequal(puzzles(i,:), array))
                alreadyCreated = true;
                break;
            end
        end
        
        if(alreadyCreated == false)
            puzzles = vertcat(puzzles, array);
            numPuzzleForEachDepth = numPuzzleForEachDepth + 1;
        end
    end 
end