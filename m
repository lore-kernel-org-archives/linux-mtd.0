Received: from twister.bcentralhost.com ([205.158.155.24])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A1s5V-0003g3-22
	for <linux-mtd@lists.infradead.org>; Tue, 23 Sep 2003 19:40:37 +0100
Errors-To: <steve@str8line.com>
Message-ID: <01ba01c38202$644206a0$0800000a@qwest.net>
From: "Steve Brockway" <steve@str8line.com>
To: <linux-mtd@lists.infradead.org>
References: 
	<00a601c37ec3$46b95760$b670a8c0@laptoplukkino><03091911494401.08026@kilauea.iders.ca>
	<005201c381f9$25660a70$b670a8c0@laptoplukkino>
Date: Tue, 23 Sep 2003 11:42:06 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: mounting mtd device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello All, I am new to this type of mailing list.

I need help mounting a JFFS2. Not sure of the correct steps. The underlying
MTD structure is working.

Below is a part of a boot sequence and the the output of
cat /proc/mtd.

What is the next step to mount a JFFS2?

SteveB


 Amd/Fujitsu Extended Query Table v1.0 at 0x0040
SL8245 Bank 0: JEDEC Device ID is 0xC4. Assuming broken CFI table.
SL8245 Bank 0: Swapping erase regions for broken CFI table.
number of CFI chips: 1
SL8245 flash bank 0: Using static image partition definition
Creating 9 MTD partitions on "SL8245 Bank 0":
0x00000000-0x00640000 : "ramdisk"
0x00640000-0x00700000 : "kernel"
0x00700000-0x00740000 : "U-Boot"
0x00740000-0x00780000 : "data 1"
0x00780000-0x007c0000 : "data 2"
0x007c0000-0x007e0000 : "data 3"
0x007e0000-0x007e8000 : "data 4"
0x007e8000-0x007f0000 : "data 5"
0x007f0000-0x00800000 : "Environment"
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 2048 buckets, 16Kbytes
TCP: Hash tables configured (established 16384 bind 16384)
IP-Config: Guessing netmask 255.0.0.0
IP-Config: Complete:
      device=eth0, addr=10.0.0.5, mask=255.0.0.0, gw=255.255.255.255,
     host=sl8245, domain=, nis-domain=(none),
     bootserver=10.0.0.4, rootserver=10.0.0.4, rootpath=
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
RAMDISK: Compressed image found at block 0
eth0: network connection up using port A
    speed:           100
    autonegotiation: yes
    duplex mode:     full
    flowctrl:        symmetric
    scatter-gather:  enabled
Freeing initrd memory: 5862k freed
VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 88k init
INIT: version 2.78 booting
Checking all file systems...
Parallelizing fsck version 1.18 (11-Nov-1999)
Loading the saved-state of the serial devices...
not mounted anything
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces: done.
/etc/init.d/rcS: run-parts: command not found
INIT: Entering runlevel: 2
Starting system log daemon: syslogd klogd.
Starting internet superserver: inetd.

StraightLine iSCSI Single Board Computer  Str8line ttyS0

Str8line login:

Linux Str8line 2.4.20 #4 Tue Sep 23 08:52:51 PDT 2003 ppc unknown
Str8line:~# cd /
Str8line:/# cd proc
Str8line:/proc# ls
1    4   99       execdomains  kcore    modules     scsi      tty
106  5   bus      filesystems  kmsg     mounts      self      uptime
116  6   cmdline  fs           ksyms    mtd         slabinfo  version
120  7   cpuinfo  interrupts   loadavg  net         stat
122  8   devices  iomem        locks    partitions  swaps
2    9   dma      ioports      meminfo  pci         sys
3    97  driver   irq          misc     ppc_htab    sysvipc
Str8line:/proc# cat mtd
dev:    size   erasesize  name
mtd0: 00640000 00040000 "ramdisk"
mtd1: 000c0000 00040000 "kernel"
mtd2: 00040000 00040000 "U-Boot"
mtd3: 00040000 00040000 "data 1"
mtd4: 00040000 00040000 "data 2"
mtd5: 00020000 00020000 "data 3"
mtd6: 00008000 00008000 "data 4"
mtd7: 00008000 00008000 "data 5"
mtd8: 00010000 00010000 "Environment"
Str8line:/proc#

> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
