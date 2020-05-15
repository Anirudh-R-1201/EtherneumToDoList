pragma solidity >=0.4.21 <0.7.0;

contract TodoList {
    uint public taskCount = 0;
    mapping (uint=>Task) public tasks; 

    //brodcast event to be triggered
    event TaskCreated(
        uint id,
        string content,
        bool completed
    );

    event TaskCompleted(
        uint id,
        bool completed
    );

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
        emit TaskCreated(taskCount, content, false);
    }

    function toggleCompleted(uint taskNumber) public{
        Task memory _task = tasks[taskNumber];
        _task.completed = !_task.completed;
        tasks[taskNumber] = _task;
        emit TaskCompleted(taskNumber, _task.completed);
    }
}