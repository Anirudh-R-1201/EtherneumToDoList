pragma solidity >=0.4.21 <0.7.0;

contract TodoList {
    uint public taskCount = 0;
    mapping (uint=>Task) public tasks; 

    struct Task {
        uint id;
        string content;
        bool completed;
    }

    constructor() public{
        createTask("Test");
    }

    function createTask(string memory content) public{
        taskCount++;
        tasks[taskCount] = Task(taskCount, content, false);
    }


}