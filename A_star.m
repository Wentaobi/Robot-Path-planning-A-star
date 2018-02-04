function [g,x,y] = A_star(grid,goal,start,delta,cost,h)
    global delta_name
    S=size(grid);
    checked = zeros(size(grid));
    actions=zeros(size(grid));
    path=zeros(size(grid));
    checked(start)=1;
    x=start(1);
    y=start(2);
    g=0;
    f=g+h(x,y);
    openL=[g,x,y,f];
    sizeD = size(delta);
    sizeGrid = size(grid);
    found =false;
    resign = false;
    while (~found && ~resign)
        if isempty(openL)
            resign = true;
            disp('fail');
            return
        else

            openL = sortrows(openL,4);
            next = openL(1,:);
            openL(1,:)=[];
            g= next(1);
            x= next(2);
            y= next(3);
            if x == goal(1) && y == goal(2)
                found = true;
            else
                for i=1:sizeD(1)
                    x2 = x + delta(i,1);
                    y2 = y + delta(i,2);
                    if ((x2 >=1) && (x2 <= sizeGrid(1)) && (y2 >= 1) && (y2<=sizeGrid(2)))
                        if (checked(x2,y2)==0 && grid(x2,y2)==0)
                            g2=g+cost;
                            f2=g2+h(x2,y2);
                            openL = [openL;[g2,x2,y2,f2]];
                            checked(x2,y2)=i;
                        end
                    end
                end
            end

         end
    end
    

    for i=1:S(1)
        for j=1:S(2)
            if checked(i,j) == 0
                actions(i,j) = '-';
            else
                actions(i,j) = delta_name(checked(i,j));
            end
            fprintf('%s ',actions(i,j));
        end
        fprintf('\n');
    end
    fprintf('\n');
    for i=1:S(1)
        for j=1:S(2)
            path(i,j)='-';
        end
    end    
     path(end,end)='*';
     x=S(1);
     y=S(2);
     while x>start(1) || y>start(2)
         x2=x-delta(checked(x,y),1);
         y2=y-delta(checked(x,y),2);
         path(x2,y2) = delta_name(checked(x,y));
         x=x2;
         y=y2;
     end
     
     for i=1:S(1)
        for j=1:S(2)
            fprintf('%s ',path(i,j));
        end
        fprintf('\n');
     end
    
end



