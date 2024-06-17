%The snake game has been divided into function. Each function is performing
%a specified operation. The main function is snake and all the remaining
%functions are inside this snake function. Every function is calling after
%an interval to perform its operation.
function snake ()%main function starts from here

%defining the area of game that is 30 by 30 
lenx = 30;
leny = 30;
grid = zeros(lenx,leny); %making an array 30 by 30 of all zeros

%defining the starting point of game at (15,15) that is the center of
%playing field
startx = 15;
starty = 15;
grid(startx,starty) = 1; %giving these points the value of 1.
%Based on the value assigned, the colour will be assigned when we use
%imagesec function of a matlab

%flags to be used in this game
%score counter has been initialized with zero to count the score
scoreCounter=0;
scoreFlag = 0;
game_end = 0;

%this function with setup the playing field
 function gameSetup()
        flag = 1;
%the flag value will be used to make the correct playing field. The while
%loop is used to perform iterations untill wwe reach the desired playing
%field thats is where the snake postion and its target position cant be at
%the same place. 
        while (flag)
    %randi function is used to give random coordinates for the target. So,
    %we will always get the new positiion of the target
                foodx = randi(lenx);
                foody = randi(leny);
                flag = 0;
                for i = 1:snake_size
                    %if else loop is used to check wheather the target
                    %position will be at different position than the snake.
                    if (foodx==snakeX(i))&&(foody==snakeY(i))
                        flag=1;
%if both target and snake at the same position, the flag is initialized to
%1 to  perform another iteration of while loop to give another positions. 
                    end
                end
                if (foodx==startx && foody ==starty)
                    flag=1;
                end
        end
        %assigning the specified value to the target using grid. 
        grid(foodx,foody) = 0.5;
 end


snake_size = 1;%the snake size has been defined to be 1
%making an array of snake size using zero function. We will assign
%different value to these points using grid 
snakeX = zeros(snake_size);
snakeY = zeros(snake_size);
snakeX(1) = startx;
snakeY(1) = starty;

%the location of the target 
foodx = randi(lenx);
foody = randi(leny);

%after initializing all the necessary variables, i am calling gamesetup
%function to setup the playing field
gameSetup()


fig = figure;
%making a figure to display results
set(fig,'menubar','none');
set(fig,'CurrentObject',imagesc(grid));
set(fig,'KeyPressFcn',@keyPress);


    %this function is for any keypress
    function keyPress (~,evt)
        %the while loop will perform iterations untill we lost the game
        while(~game_end)
            pause(0.1);
            StartGame(evt.Key);%this function contains all the important functions of the game
        end
    end
   
    %the game has been finally started from here
    function StartGame(mov)
        playing(mov);%it is calling the first function to play the game
        
        if ~game_end    
            checkBody();
            if ~game_end
                %we are updating the flags if we are still in the game
                scoreFlag = 0;

                grid(snakeX(1),snakeY(1)) = 0;

                %this ifelse loop is increasing the size of snake
                if (snake_size~=1)
                    for i = 1:snake_size-1
                        snakeX(i) = snakeX(i+1);
                        snakeY(i) = snakeY(i+1);
                    end
                end

                snakeX(snake_size) = startx;
                snakeY(snake_size) = starty;
%calling ScoreCounter function to update the score value 
                ScoreCounter()
%giving specified value of 1 to the body of snake
                grid(startx,starty) = 1;
                set(fig,'CurrentObject',imagesc(grid));
            end
        end
    end

 %increasing the bosdy of snake after each bite of target
    function checkBody() 
        if (snake_size~=1)
            for i=1:snake_size-scoreFlag
                if (startx==snakeX(i))&&(starty==snakeY(i))
                    gameEnded();
                    break;
                end
            end
        end
        
    end


  %updating the score counter value after the bite of a target
    function ScoreCounter() 
        %the consitions of if loop is saying that the snake has been
        %reached the target
        if (startx==foodx)&&(starty==foody)
            snake_size = snake_size + 1;
            snakeX(snake_size) = startx;
            snakeY(snake_size) = starty;
            gameSetup();%the game setup function is called to update the playing field
            scoreFlag = 1;
            scoreCounter = scoreCounter+1;%score counter has been updated
        end
    end



%this function will move the snake in the direction of arrow we press
    function playing(mov)
        flag = 1;
        %while loop and switch case is used to perform a specified
        %operation
        while flag
            switch(mov)
                %when downarrow will be pressed
                case 'downarrow'
                    if (startx==lenx)
                        gameEnded();
                        break;
                    end
                    startx=startx+1;
                %when uparrow will be pressed
                case 'uparrow'
                    if (startx==1)
                        gameEnded();
                        break;
                    end
                    startx=startx-1;
                %when rightarrow will be pressed
                case 'rightarrow'
                    if (starty==leny)
                        gameEnded();
                        break;
                    end
                    starty=starty+1;
                %when left arrow will be pressed
                case 'leftarrow'
                    if (starty==1)
                        gameEnded();
                        break;
                    end
                    starty=starty-1;
            end
        flag = 0;    
        end
    end

   

  %this function will be used to stop the game. After this function called,
  %it will perform nothing
    function stopGame(~,~)
    end

    %this function will be callled when the game ended
    function gameEnded()
       set(fig,'KeyPressFcn',@stopGame);
       grid(:,:) = 0.2;
       set(fig,'CurrentObject',imagesc(grid));
       pause(1);
%we are displaying that our game has been ended and score of game. 
       disp('Game over');
       disp('Your Score is: ');
       disp(scoreCounter);
       game_end = 1;
     
    end

end%main function has been ended