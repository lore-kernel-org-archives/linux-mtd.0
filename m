From: guo_zl9@hotmail.com (guo_zhenglin)
Date: Thu, 20 Mar 2003 16:01:01 +0800
Subject: help: network cannot startup from FLASH
Message-ID: <OE64iIWMzRsft83wxnG00000add@hotmail.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

 1) I have a MBX860 board.
    my linux kernel is 2.4.4
  
 2) when I boot linux from MBX860 RAM,
    BOOTP is ok. detail messages following:

       .....     
      POSIX conformance testing by UNIFIX
     Linux NET4.0 for Linux 2.4
    Based upon Swansea University Computer Society NET3.039
    Starting kswapd v1.8
    CPM UART driver version 0.03
    ttyS0 on SMC1 at 0x0280, BRG1
    pty: 256 Unix98 ptys configured
    block: queued sectors max/low 8186kB/2728kB, 64 slots per queue
    RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize

    eth0: CPM ENET Version 0.2 on SCC1, 08:00:3e:2e:68:41

    ....
    NET4: Linux TCP/IP 1.0 for NET4.0
    IP Protocols: ICMP, UDP, TCP, IGMP
    IP: routing cache hash table of 512 buckets, 4Kbytes
    TCP: Hash tables configured (established 1024 bind 1024)

    Sending BOOTP requests.... OK
    IP-Config: Got BOOTP answer from 192.168.1.252, my address is 
    192.168.1.1

    NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.

  3) I ping 192.168.1.252 ,is success.
  4) then I put linux's kernel file in MBX860 FLASH,
      boot it from FLASH,
    BOOTP is NOT success . detail messages following: 
    
    ....
    eth0: CPM ENET Version 0.2 on SCC1, 03:94:80:82:9f:f9
    NET4: Linux TCP/IP 1.0 for NET4.0
    IP Protocols: ICMP, UDP, TCP, IGMP
    IP: routing cache hash table of 512 buckets, 4Kbytes
    TCP: Hash tables configured (established 1024 bind 1024)
    Sending BOOTP requests........timeout
  5) eth0's MAC is different ???!! 
     and BOOTP timeout.
     
  

------------------------------
 guo zhenglin 
 E-mail: guo_zl9 at hotmail.com
 ------------------------------
