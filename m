From: hno@marasystems.com (Henrik Nordstrom)
Date: 18 Mar 2003 10:56:59 +0100
Subject: How use FTP on serial port(COM1)?
In-Reply-To: <OE69AEbZsZPXSQahiOE00003606@hotmail.com>
References: <OE32DCOTSt39LktrLEz00001e01@hotmail.com>
 <20030317074641.GA9492@wohnheim.fh-wedel.de>
 <20030317100051.GB3930@wohnheim.fh-wedel.de>
 <OE69AEbZsZPXSQahiOE00003606@hotmail.com>
Message-ID: <1047981419.29454.18.camel@henrik.marasystems.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

tis 2003-03-18 klockan 10.40 skrev guo_zhenglin:
>  I don't know how to config network (ftp) on MBX860 board,
> please help me.
> 
> 1) our finally product is ourself-design board.
> the designer say  no Ethernet port,
> and only has ONE serial port used to maintenance and update system.
> this board has not manufactured.

Then you should probably use a serial file transfer protocol such as
Z-Modem. This would allow you to use the same serial port as both
console and to transfer upgrades.

> 2) Our company has a DEMO board , it is motorola's MBX860 board.
> MBX860 board has a Ethernet port (SCC1).
> now I can test something about network on MBX860 board.

The you need to figure our what kind of chipset is used for the ethernet
port, and load the corresponding kernel driver. When this is done
configure the interface with the ifconfig command or the ip command.

> 6) linux can boot from MBX860 board ,and show messages :
>         NET4: Linux TCP/IP 1.0 for NET4.0
>         IP Protocols: ICMP, UDP, TCP, IGMP
>         IP: routing cache hash table of 512 buckets, 4Kbytes
>         TCP: Hash tables configured (established 1024 bind 1024)
>         Sending BOOTP requests.... OK
>         IP-Config: Got BOOTP answer from 192.168.1.252, my address is
> 192.168.1.1
>         NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.

Then it seems your network driver is already configured on the board and
you have set it up to use automatic IP configuration via BOOTP which was
successful. All you need now is to talk to it over the network, and to
start the needed network daemons on the board if you want to be able to
connect to the board from your network.. (connecting from the board to
your network should already work).

-- 
Henrik Nordstrom <hno@marasystems.com>
MARA Systems AB
