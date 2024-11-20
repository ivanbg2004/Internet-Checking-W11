@echo off
:: ===============================================
:: Internet Optimization Script v3.0
:: Powered by Oblivion Development & Hosting
:: ===============================================

:: Display the current network configurations
echo Displaying current network settings...
ipconfig /all
echo.

:: Continuous network latency test (replace with your gateway or reliable IP)
echo Initiating network latency check...
ping -t 192.168.12.1 > nul
echo.

:: Refreshing IP configurations
echo Renewing IP address...
ipconfig /release
ipconfig /renew
echo.

:: Clearing DNS cache for faster resolution
echo Flushing DNS cache...
ipconfig /flushdns
echo.

:: Updating TCP/IP stack for better efficiency
echo Optimizing TCP/IP stack...
netsh int ip reset
netsh winsock reset
echo.

:: Disable TCP auto-tuning to reduce packet delays
netsh interface tcp set global autotuning=disable

:: Disable TCP Chimney Offload for stability
netsh int tcp set global chimney=disabled

:: Disable Receive Side Scaling (RSS) for enhanced data transfer
netsh int tcp set global rss=disabled

:: Enable Direct Cache Access (DCA) for faster data transfer rates
netsh int tcp set global dca=enabled

:: Disable TCP timestamps to reduce overhead
netsh int tcp set global timestamps=disabled

:: Set maximum transmission unit (MTU) to 1500 for optimal performance
echo Setting MTU size...
netsh interface ipv4 set subinterface "Ethernet" mtu=1500 store=persistent
echo.

:: Resetting the ARP cache for cleaner routing
echo Clearing ARP cache...
arp -d *
echo.

:: Cleaning old routes for better routing paths
echo Cleaning old routing entries...
route /f
echo.

:: Configure DNS to use Google's Public DNS for faster lookups
echo Configuring Google Public DNS...
netsh interface ip set dns "Ethernet" static 8.8.8.8
netsh interface ip add dns "Ethernet" 8.8.4.4 index=2
echo.

:: Verifying applied settings
echo Verifying optimizations...
netsh int tcp show global
ipconfig /displaydns
echo.

:: Final instructions
echo ===============================================
echo Internet optimization completed successfully!
echo Script powered by Oblivion Development & Hosting.
echo ===============================================
pause
