Received: from bay10-f13.bay10.hotmail.com ([64.4.37.13] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B6rkJ-00079x-SW
	for linux-mtd@lists.infradead.org; Fri, 26 Mar 2004 13:51:40 +0000
From: "Luke Fimmerzane" <lukefimmerzane@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 26 Mar 2004 13:51:34 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <BAY10-F13brzvsTDWWc00016884@hotmail.com>
Subject: Mapping driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I'm new to MTD an jffs2.
I have some very basic questions...
My target is ARM sc32410. It contains AMD 1Mbyte and Strata flash 32 Mbytes. 
I've looked at the directory drivers/mtd/maps and there is no mapping 
driver.  My kernel is configured to take mtdparts command line information. 
My question is do I still need a mapping driver or does using mtdparts 
provide the same functionality.

Also the only information I get from the kernel about jffs2 and mtd is:

Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
CPU clock = 200.000 Mhz, HCLK = 100.000 Mhz, PCLK = 50.000 Mhz
Starting kswapd
devfs: v1.10 (20020120) Richard Gooch (rgooch@atnf.csiro.au)
devfs: devfs_debug: 0x0
devfs: boot_options: 0x1
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis Communications 
AB.
ttyS%d0 at I/O 0x50000000 (irq = 52) is a S3C2410
ttyS%d1 at I/O 0x50004000 (irq = 55) is a S3C2410
ttyS%d2 at I/O 0x50008000 (irq = 58) is a S3C2410
Console: switching to colour frame buffer device 30x40
Installed S3C2410 frame buffer
pty: 256 Unix98 ptys configured
s3c2410-ts initialized
S3C2410 Real Time Clock Driver v0.1
block: 128 slots per queue, batch=32
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
eth0: cs8900 rev J(3.3 Volts) found at 0xd0000300
cs89x0 media RJ-45, IRQ 37
physmap flash device: 2000000 at 8000000
Using buffer write method
mtd: Giving out device 0 to Physically mapped flash
No NAND device found!!!
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 4096)

Then when I do a cat I get
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 02000000 00040000 "Physically mapped flash"

when I do a ls -al I get ..
# ls -al /dev/mtd/0
/dev/mtd/0      /dev/mtd/0ro

I presume ro is read only but why would it be so? Whats the difference 
between the two entries? I've seen /dev/mtd0 and /dev/mtd/0. Which is 
correct?

What messages should the kernel emit if everything MTD related is going ok?

Sorry if my questions are very basic! I'm 'slavishly' following a book by 
Karim Yaghmor called " Building Embedded Linux systems" . I'm also slowly 
working my way back through the mtd archives for a similar problem. Is there 
an easier way of searching the archives than by going through them year by 
year?


Thanks for any help,
Very much appeciated

Luke

_________________________________________________________________
Express yourself with cool emoticons - download MSN Messenger today! 
http://www.msn.co.uk/messenger
