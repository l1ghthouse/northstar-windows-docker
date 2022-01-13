FROM mcr.microsoft.com/windows:1809
WORKDIR "/Program Files (x86)/Origin Games/Titanfall2"

COPY ./ ./
ADD https://aka.ms/vs/17/release/vc_redist.x64.exe vc_redist.x64.exe 
RUN start /w vc_redist.x64.exe /install /quiet /norestart
RUN del vc_redist.x64.exe
ADD https://aka.ms/vs/17/release/vc_redist.x86.exe vc_redist.x86.exe 
RUN start /w vc_redist.x86.exe /install /quiet /norestart 
RUN del vc_redist.x86.exe
ADD https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe vc_redist.x64.exe 
RUN start /w vc_redist.x64.exe /install /quiet /norestart 
RUN del vc_redist.x64.exe
ADD https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe vc_redist.x86.exe 
RUN start /w vc_redist.x86.exe /install /quiet /norestart 
RUN del vc_redist.x86.exe
RUN powershell Start-Process -FilePath ".\__Installer\directx\redist\DXSETUP.exe" -ArgumentList "/Silent" -Wait
RUN start /w .\__Installer\vc\vc2010sp1\redist\vcredist_x64.exe /install /quiet /norestart
RUN start /w .\__Installer\vc\vc2012Update4\redist\vcredist_x64.exe /install /quiet /norestart
RUN powershell Set-ExecutionPolicy Unrestricted

ENTRYPOINT [ "NorthstarLauncher.exe" ]

#docker run -p 8000-8050:8000-8050 -p 36000-36050:36000-36050/udp -ti --memory 8192m --cpus 4 --rm --isolation=hyperv <DOCKER_ID> powershell
#./NorthstarLauncher.exe -dedicated -softwared3d11 -multiple -Port 36000 +setplaylist private_match +ns_player_auth_port 8000 +ns_server_name TEST-WINDOWS-DOCKER +sv_updaterate_mp 20 +cl_updaterate_mp 20 +cl_cmdrate 20 +sv_minupdaterate 20 +base_tickinterval_mp 0.05 +sv_max_snapshots_multiplayer 300 +ns_auth_allow_insecure 1