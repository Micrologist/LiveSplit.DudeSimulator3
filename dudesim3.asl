/*Dude Simulator 3 Load Remover and Auto Splitter
Written by Radioactiv03 and Meta and a lot of help from Micrologist who is absolutely big brain*/

state("DudeSimulator3")
{
    string50 sceneName: "UnityPlayer.dll", 0x010DB628, 0x28, 0xC, 0x0;
    string255 task1text : "UnityPlayer.dll", 0x010C7D3C, 0x38, 0x58, 0x1C, 0x4, 0x60, 0x1C, 0x1C, 0x14, 0x18, 0x34, 0x8, 0x1C, 0x74, 0x18, 0x64, 0x5C, 0xC;
}

startup
{
    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {        
        var timingMessage = MessageBox.Show (
            "This game uses Time without Loads (Game Time) as the main timing method.\n"+
            "LiveSplit is currently set to show Real Time (RTA).\n"+
            "Would you like to set the timing method to Game Time?",
            "LiveSplit | Dude Simulator 3",
            MessageBoxButtons.YesNo,MessageBoxIcon.Question
        );
        
        if (timingMessage == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }
}

isLoading
{
    return current.sceneName == null;
}


start
{
    return current.sceneName == ("Assets/Home.unity") && current.sceneName != old.sceneName;
}

split
{
    return (
        (current.sceneName != (old.sceneName) && current.sceneName != ("Assets/MainMenu.unity") && current.sceneName != null)
        || (current.sceneName == "Assets/SmallTown.unity" && current.task1text == "Game Completed" && old.task1text != "Game Completed")
    );
}
