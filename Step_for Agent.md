System prerequisites
Configure your account
Configure your account by following the steps outlined here.

1) Download the agent
Download	

2) Create the agent
~/$ mkdir myagent && cd myagent
~/myagent$ tar zxvf ~/Downloads/vsts-agent-linux-x64-4.258.1.tar.gz

3) Configure the agentDetailed instructions
~/myagent$ ./config.sh

This will ask for the server url https://dev.azure.com/<your_organization>
https://dev.azure.com/manojkumararunachalam88
=> Follow the instaructio on the screen by giving the agentpool name and the VM name

4) Optionally run the agent interactively
If you didn't run as a service above:
~/myagent$ ./run.sh
