classdef puzzle
       
    properties
        state
        parent
        depth
        g_score
        f_score
    end
    
    methods
        function obj = puzzle(numbers)
            if(nargin > 0)
                obj.state = numbers;
                obj.depth = 0;
                obj.g_score = 0;
                obj.f_score = 0;
            end
        end
        
        function obj = moveBlankUp(obj)
            str = int2str(obj.state);
            k = strfind(str, '9'); 
            
            if(k - 3 >= 1)
                str(k) = str(k-3);
                str(k - 3) = '9';
            end
            
            obj.state = str2num(str);
        end
        
        function obj = moveBlankDown(obj)
            str = int2str(obj.state); 
            k = strfind(str, '9'); 
            
            if(k + 3 <= 9)
                str(k) = str(k+3);
                str(k + 3) = '9';
            end
            
            obj.state = str2num(str);
        end
        
        function obj = moveBlankLeft(obj)
            str = int2str(obj.state); 
            k = strfind(str, '9'); 
            
            if(k ~= 1 && k ~= 4 && k ~= 7)
                str(k) = str(k - 1);
                str(k - 1) = '9';
            end
            
            obj.state = str2num(str);
        end

        function obj = moveBlankRight(obj)
            str = int2str(obj.state); 
            k = strfind(str, '9'); 
            
            if(mod(k,3) ~= 0)
                str(k) = str(k + 1);
                str(k + 1) = '9';
            end
            
            obj.state = str2num(str);
        end
    end 
end

