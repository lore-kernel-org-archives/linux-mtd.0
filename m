From: guo_zl9@hotmail.com (guo_zhenglin)
Date: Tue, 18 Mar 2003 17:40:16 +0800
Subject: How use FTP on serial port(COM1)?
References: <OE32DCOTSt39LktrLEz00001e01@hotmail.com> <20030317074641.GA9492@wohnheim.fh-wedel.de> <20030317100051.GB3930@wohnheim.fh-wedel.de>
Message-ID: <OE69AEbZsZPXSQahiOE00003606@hotmail.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

 I don't know how to config network (ftp) on MBX860 board,
please help me.

1) our finally product is ourself-design board.
the designer say  no Ethernet port,
and only has ONE serial port used to maintenance and update system.
this board has not manufactured.

2) Our company has a DEMO board , it is motorola's MBX860 board.
MBX860 board has a Ethernet port (SCC1).
now I can test something about network on MBX860 board.

3) firstly I want to use ftp on MBX860 board via ethernet port(SCC1).
    if this success,then
    secondly, I  TRY  to use ftp on MBX860 board via serial port (COM1).
    if  must need TWO serial ports ,
    I can advice the designer to add another serial port.
    lastly   ,I can use ftp on ourself-design board via serial port(COM1 or
COM2).

4) but  I don't know how to config network (ftp) on MBX860 board,
    counld you help me ?
    thank you very much.
     could  I need modify  "/etc/sysconfig/network-scripts" ,"/sbin/ifuup" ?

5) my linux kernel :2.4.4.
    CROSS_COMPILE: ppc_8xx-gcc (v2.95)

6) linux can boot from MBX860 board ,and show messages :
        NET4: Linux TCP/IP 1.0 for NET4.0
        IP Protocols: ICMP, UDP, TCP, IGMP
        IP: routing cache hash table of 512 buckets, 4Kbytes
        TCP: Hash tables configured (established 1024 bind 1024)
        Sending BOOTP requests.... OK
        IP-Config: Got BOOTP answer from 192.168.1.252, my address is
192.168.1.1
        NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.




 ------------------------------
 guo zhenglin
E-mail: guo_zl9 at hotmail.com
 ------------------------------
