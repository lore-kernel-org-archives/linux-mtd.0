Received: from mx0.gmx.net ([213.165.64.100])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZXKM-0004a8-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2002 14:46:18 +0100
Date: Tue, 30 Jul 2002 15:45:46 +0200 (MEST)
From: Frank Oltmanns <frank.oltmanns.ml@gmx.de>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
References: <Pine.LNX.4.44.0207291211590.20751-100000@server.superbt.com>
Subject: Re: Compiling Grub for DOC2000
Message-ID: <25812.1028036746@www34.gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> You may need to specify a multiple of 16 KiB as a start of NFTL layer in
> case your erase block size is 16 KiB.  Make sure the /dev/nftl* drivers
> weren't activated or were unloaded when running nftl_format.
My erase block size is 8KB (I'm using a 8MB DiskOnChip 2000), so this
should be no problem. I also tried an offset of 98304 anyway, but this
didn't change anything.

> >       fdisk /dev/nftla  (created 1 partition)
> 
> I believe it is required to reload the MTD NFTL driver between nftl_format
> and any subsequent actions against /dev/nftl*.  Since my kernel has MTD
> NFTL driver compiled in, I need to reboot.
Sorry, I forgot to write, that I did reboot my system.

> Check out 
> 
>     http://lists.infradead.org/pipermail/linux-mtd/2002-June/005240.html
> 
> for detailed instructions.
This is a nice Howto! I wish I had found this earlier. It could have saved
several hours. I did everything as described in this howto, but I still
can't
boot from DoC.
As I already wrote, the kernel is loaded from DoC (using GRub) but I
can't use the root-filesystem, which I have copied there. I CAN use
root-FS on NFS or FDD. I also do have acces to my DoC when I boot
with root-NFS.
I absolutely don't know what to do. Here is what is "dmesg" said after I
booted from NFS. Perhaps someone can tell me, what went wrong.

Linux version 2.4.18-w4l-rtl3.1 (root@franksrechner) (gcc version 2.95.2
19991024 (release)) #18 Tue Jul 30 11:55:09 CEST 2002
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 00000000000a0000 (usable)
 BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 0000000002000000 (usable)
 BIOS-e820: 00000000ffff0000 - 0000000100000000 (reserved)
On node 0 totalpages: 8192
zone(0): 4096 pages.
zone(1): 4096 pages.
zone(2): 0 pages.
Kernel command line: rw root=/dev/nfs ip=dhcp mem=32768K
Initializing CPU#0
Console: colour VGA+ 80x25
Calibrating delay loop... 66.56 BogoMIPS
Memory: 30344k/32768k available (956k kernel code, 2036k reserved, 255k
data, 60k init, 0k highmem)
Checking if this processor honours the WP bit even in supervisor mode... Ok.
Dentry-cache hash table entries: 4096 (order: 3, 32768 bytes)
Inode-cache hash table entries: 2048 (order: 2, 16384 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 8192 (order: 3, 32768 bytes)
CPU: Before vendor init, caps: 00000001 00000000 00000000, vendor = 2
CPU: After vendor init, caps: 00000001 00000000 00000000 00000000
CPU:     After generic, caps: 00000001 00000000 00000000 00000000
CPU:             Common caps: 00000001 00000000 00000000 00000000
CPU: AMD Am5x86-WB stepping 04
Checking 'hlt' instruction... OK.
Checking for popad bug... OK.
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with no serial options enabled
block: 64 slots per queue, batch=16
Uniform Multi-Platform E-IDE driver Revision: 6.31
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx
Floppy drive(s): fd0 is 1.44M
FDC 0 is an 8272A
ne.c:v1.10 9/23/94 Donald Becker (becker@scyld.com)
Last modified Nov 1, 2000 by Paul Gortmaker
NE*000 ethercard probe at 0x300: 00 c0 6c 74 09 30
eth0: NE2000 found at 0x300, using IRQ 5.
loop: loaded (max 8 devices)
Possible DiskOnChip with unknown ChipID FF found at 0xc8000
Possible DiskOnChip with unknown ChipID FF found at 0xca000
Possible DiskOnChip with unknown ChipID 00 found at 0xcc000
Possible DiskOnChip with unknown ChipID 00 found at 0xce000
DiskOnChip 2000 found at address 0xD0000
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba TC58V64AFT/DC)
1 flash chips found. Total DiskOnChip size: 8 MiB
mtd: Giving out device 0 to DiskOnChip 2000
Ignoring DiskOnChip 2000 at 0xD2000 - already configured
Possible DiskOnChip with unknown ChipID FF found at 0xd4000
Possible DiskOnChip with unknown ChipID FF found at 0xd6000
Possible DiskOnChip with unknown ChipID FF found at 0xd8000
Possible DiskOnChip with unknown ChipID FF found at 0xda000
Possible DiskOnChip with unknown ChipID FF found at 0xdc000
Possible DiskOnChip with unknown ChipID FF found at 0xde000
Possible DiskOnChip with unknown ChipID FF found at 0xe0000
Possible DiskOnChip with unknown ChipID FF found at 0xe2000
Possible DiskOnChip with unknown ChipID FF found at 0xe4000
Possible DiskOnChip with unknown ChipID FF found at 0xe6000
Possible DiskOnChip with unknown ChipID FF found at 0xe8000
Possible DiskOnChip with unknown ChipID FF found at 0xea000
Possible DiskOnChip with unknown ChipID FF found at 0xec000
Possible DiskOnChip with unknown ChipID FF found at 0xee000
NFTL driver: nftlcore.c $Revision: 1.82 $, nftlmount.c $Revision: 1.25 $
NFTL_notify_add for DiskOnChip 2000
mtd->read = c01a20e8, size = 8388608, erasesize = 8192
NFTL_setup
Partition check:
 nftla:<6>NFTL_request
NFTL Read  request, from sector 0x0000 for 0x0002 sectors
Waiting for mutex
Got mutex
NFTL read request of 0x2 sectors @ 0 (req->nr_sectors == 8)
NFTL read request completed OK
end_request(1)
NFTL_request
NFTL Read  request, from sector 0x0002 for 0x0002 sectors
Waiting for mutex
Got mutex
NFTL read request of 0x2 sectors @ 2 (req->nr_sectors == 6)
NFTL read request completed OK
end_request(1)
NFTL_request
NFTL Read  request, from sector 0x0004 for 0x0002 sectors
Waiting for mutex
Got mutex
NFTL read request of 0x2 sectors @ 4 (req->nr_sectors == 4)
NFTL read request completed OK
end_request(1)
NFTL_request
NFTL Read  request, from sector 0x0006 for 0x0002 sectors
Waiting for mutex
Got mutex
NFTL read request of 0x2 sectors @ 6 (req->nr_sectors == 2)
NFTL read request completed OK
end_request(1)
 nftla1
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 2048 bind 2048)
Sending DHCP requests ., OK
IP-Config: Got DHCP answer from 192.168.1.99, my address is 192.168.1.101
IP-Config: Complete:
      device=eth0, addr=192.168.1.101, mask=255.255.255.0,
gw=255.255.255.255,
     host=node01, domain=experimentiernetz, nis-domain=(none),
     bootserver=192.168.1.99, rootserver=192.168.1.99, rootpath=
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
######################################
# I get this far when I use DoC as the root-fs  #
######################################
Looking up port of RPC 100003/2 on 192.168.1.99
Looking up port of RPC 100005/1 on 192.168.1.99
VFS: Mounted root (nfs filesystem).
Freeing unused kernel memory: 60k freed

-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net
