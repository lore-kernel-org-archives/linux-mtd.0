From: robert.chiodini-1@ksc.nasa.gov (Bob Chiodini)
Date: 21 Mar 2003 06:18:28 -0500
Subject: help: network cannot startup from FLASH
In-Reply-To: <OE64iIWMzRsft83wxnG00000add@hotmail.com>
References: <OE64iIWMzRsft83wxnG00000add@hotmail.com>
Message-ID: <1048245508.1717.21.camel@tweedy.ksc.nasa.gov>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Thu, 2003-03-20 at 03:01, guo_zhenglin wrote:

>   4) then I put linux's kernel file in MBX860 FLASH,
>       boot it from FLASH,
>     BOOTP is NOT success . detail messages following: 
>     
>     ....
>     eth0: CPM ENET Version 0.2 on SCC1, 03:94:80:82:9f:f9
>     NET4: Linux TCP/IP 1.0 for NET4.0
>     IP Protocols: ICMP, UDP, TCP, IGMP
>     IP: routing cache hash table of 512 buckets, 4Kbytes
>     TCP: Hash tables configured (established 1024 bind 1024)
>     Sending BOOTP requests........timeout
>   5) eth0's MAC is different ???!! 
>      and BOOTP timeout.

A non-MTD related thought:  Is the network switch upstream from the
MBX860 configured with any kind of MAC layer security?  If so, maybe the
change in MAC address is stopping you.  Also, some Cisco equipment may
take a minute or two to renegotiate speed and duplex mode.

One other thing:  Is your bootpd/dhcpd configured fro the correct MAC?

Bob...
---
Bob Chiodini
Senior Engineer
ASRC Aerospace
M/S ASRC-18
Kennedy Space Center, FL 32899
321-867-6313 (voice)
321-867-6300 (fax)
bob.chiodini at ksc.nasa.gov
