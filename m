Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 121dHn-0008MT-00
	for mtd-list@infradead.org; Fri, 24 Dec 1999 22:34:11 +0000
Received: from out4.prserv.net ([165.87.194.239] helo=prserv.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 121dHj-0008MN-00
	for mtd@infradead.org; Fri, 24 Dec 1999 22:34:10 +0000
From: "Dvir Oren" <dviro@lucidvon.com>
To: MTD <mtd@infradead.org>
Date: Sat, 25 Dec 1999 00:35:09 +0200
MIME-Version: 1.0
Content-type: Multipart/Mixed; boundary=Message-Boundary-818
Subject: MTD in 2.2 kernel, and geometry error
CC: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E121dHj-0008MN-00@infradead.org>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


--Message-Boundary-818
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

After fixing the geometry problem, it now says that it reduces the 
size from 7cf0 to 7ce0.  Any ideas why this happens?  
Appearantly, it happens only if I format the DOC using M-Systems 
format.  If I use the MTD format, it doesn't say this (I'm not entirely 
sure about this).  I'm not using the flash under Windows or DOS, 
so I can't give you any information from there.

I still have the kernel problem.  I'm attaching the output of 
/proc/mtd, and the entire output of dmesg.  It seems like nftl 
initializes, but still I can't reach it.


---------
Dvir Oren <dvir@lucidvon.com>
Lucid VON Ltd. <http://www.lucidvon.com>
Twin Towers 2,     Suite 406,     P.O.Box 159
35 Jabotinsky street, Ramat-Gan 52511, ISRAEL
Tel:+972 3 6137214         Fax:+972 3 6137215


--Message-Boundary-818
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Text from file 'Dmesg.txt'

Linux version 2.2.14pre14 (root@DvirComp) (gcc version 2.7.2.3) #7 Sat Dec 18 21:41:05 IST 1999
Detected 167051145 Hz processor.
Console: colour VGA+ 80x25
Calibrating delay loop... 66.56 BogoMIPS
Memory: 10700k/12224k available (732k kernel code, 444k reserved, 312k data, 36k init)
Dentry hash table entries: 2048 (order 2, 16k)
Buffer cache hash table entries: 16384 (order 4, 64k)
Page cache hash table entries: 4096 (order 2, 16k)
VFS: Diskquotas version dquot_6.4.0 initialized
CPU: Intel Pentium 75 - 200 stepping 0c
Checking 386/387 coupling... OK, FPU using exception 16 error reporting.
Checking 'hlt' instruction... OK.
Intel Pentium with F0 0F bug - workaround enabled.
POSIX conformance testing by UNIFIX
PCI: PCI BIOS revision 2.10 entry at 0xfb2c0
PCI: Using configuration type 1
PCI: Probing PCI hardware
Linux NET4.0 for Linux 2.2
Based upon Swansea University Computer Society NET3.039
NET4: Unix domain sockets 1.0 for Linux NET4.0.
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
TCP: Hash tables configured (ehash 16384 bhash 16384)
Linux IP multicast router 0.06 plus PIM-SM
Initializing RT netlink socket
Starting kswapd v 1.5 
Serial driver version 4.27 with no serial options enabled
ttyS00 at 0x03f8 (irq = 4) is a 16550A
ttyS01 at 0x02f8 (irq = 3) is a 16550A
ttyS02 at 0x03e8 (irq = 4) is a 16550A
ttyS03 at 0x02e8 (irq = 3) is a 16550A
pty: 256 Unix98 ptys configured
RAM disk driver initialized:  16 RAM disks of 4096K size
loop: registered device at major 7
hda: WDC AC280, ATA DISK drive
ide2: ports already in use, skipping probe
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
hda: WDC AC280, 81MB w/31kB Cache, CHS=980/10/17
Floppy drive(s): fd0 is 1.44M
FDC 0 is a post-1991 82077
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
DiskOnChip 2000 found at address 0xDC000
2 flash chips found. Total DiskOnChip size: 16 Mb
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
Found new NFTL nftla at offset c000
NFTL capacity reduced for geometry reasons from 7ce0 to 7ce0 sectors
Virtual Unit #0: 8
Virtual Unit #1: 9
Virtual Unit #2: 10
Virtual Unit #3: 11
Virtual Unit #4: 12
Virtual Unit #5: 13
Virtual Unit #6: Not present
Virtual Unit #7: Not present
Virtual Unit #8: Not present
Virtual Unit #9: Not present
Partition check:
 nftla: nftla1
 hda: hda1 hda2 hda3
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 36k freed
rtl8139.c:v1.07 5/6/99 Donald Becker http://cesdis.gsfc.nasa.gov/linux/drivers/rtl8139.html
eth0: RealTek RTL8139 Fast Ethernet at 0xec00, IRQ 5, 00:60:ef:10:04:90.
EXT2-fs warning: mounting unchecked fs, running e2fsck is recommended

--Message-Boundary-818
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Text from file 'Proc.txt'

mtd0: 01000000 "DiskOnChip 2000"

--Message-Boundary-818--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
