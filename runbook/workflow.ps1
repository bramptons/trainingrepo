workflow Test-Workflow
{
    Param(
    [string]$VMName,
    [string]$ResourceGroupName
    )

    Start-AzureRmVM -Name $VMName -ResourceGroupName $ResourceGroupName
    #workflow checkpoint, in the event of an exception being thrown continue from here - a break point
    Checkpoint-Workflow
    #create the following vms in parallel
    Parallel
    {
        Start-AzureRmVM -Name $vm0 -ResourceGroupName $rg1
        Start-AzureRmVM -Name $vm1 -ResourceGroupName $rg1
    }

}