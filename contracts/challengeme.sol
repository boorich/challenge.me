pragma solidity ^0.4.18;

contract challengeMe {
    
    address goalkeeper;                 // the one who "owns" a goal
    address challenger;                 // the one who challenges an owner
    string goal;                        // the goal (restricted to 200 characters)
    uint stake;                         // the stake for a goal
    
        modifier ifGoalTooBig{
        require(utfStringLength(goal) < 2);
        _;
    }
    
    function testGoal(string testGoal)public returns(string){
        goal = testGoal;
        
        return (goal);
    }
    
    function setGoal(string myGoal, uint myStake)public payable ifGoalTooBig returns(string, uint){
        goal = myGoal;
        stake = myStake;
        
        
        return (goal, stake);
    }
    
    function utfStringLength(string _mygoal) constant returns (uint length){
        uint i=0;
        bytes memory string_rep = bytes(testGoal(goal));

        while (i<string_rep.length)
        {
            if (string_rep[i]>>7==0)
                i+=1;
            else if (string_rep[i]>>5==0x6)
                i+=2;
            else if (string_rep[i]>>4==0xE)
                i+=3;
            else if (string_rep[i]>>3==0x1E)
                i+=4;
            else
                //For safety
                i+=1;

            length++;
        }
    }
    
    function getGoal() constant ifGoalTooBig public returns (string, uint){
        return (goal, stake);
    }
}