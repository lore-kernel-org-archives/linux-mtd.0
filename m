Received: from mail.valcom.com ([151.199.82.35])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GkN6R-0007BK-Sz
	for linux-mtd@lists.infradead.org; Wed, 15 Nov 2006 10:55:19 -0500
Message-ID: <455B3857.50405@valcom.com>
Date: Wed, 15 Nov 2006 10:55:03 -0500
From: Glen Johnson <gjohnson@valcom.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: 2.6 Kernel not mounting JFFS2 partition.
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear linux-mtd,

I have a target system which works fine using MTD and JFFS2 with
the uClinux 2.4.22 kernel. I am attempting to bring up the uClinux
2.6.17 kernel now and am having some problems with mounting the JFFS2 
partition.  I have tried both recommended procedures for mounting a 
JFFS2 partition.

First attempt, I created a JFFS2 image on the target platform,
erased the partition, and then copied the image to the partition.  
All seemed well until "mount -t jffs2 /dev/mtdblock2 /mnt" and I
received +3500 lines of error messages.

Second attempt, I created a JFFS2 image on a separate computer, 
tftp-ed the image to the target, erased the JFFS2 partition and copied 
in the jffs2 image to the partition.  What resulted was the same +3500 
lines of error messages.  

By the way toward the bottom of the list of errors it says "You cannot
use older JFFS2 file systems with newer kernels", so I tried down
loading Red Hats cvs server and used the latest and greatest version
of mkfs.jffs2.  Still gave me the same error messages as before.

Can anyone give any recommendations on what I am doing wrong?  I know
I'm close to getting it working but I can't seem to find the right
flag to set or whatever it is.  Any and all help is greatly appreciated.

Directly below is an abbreviated listing of the errors and just after
this I supplied a boot log to provide context to the target system.

ERROR MESSAGE:
- ----------------------
 mount -t jffs2 /dev/mtdblock2 /mnt
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000:
0x9b9a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004:
0x2a04 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008:
0x1ca7 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000000c:
0x2a03 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000010:
0x1c2a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000014:
0x0022 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000018:
0x0415 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000001c:
0x08a2 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020:
0x1d04 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024:
0x2b10 instead
Further such events for this erase block will not be printed
Empty flash at 0x00005014 ends at 0x00005018
Empty flash at 0x00009008 ends at 0x0000900c
Empty flash at 0x00009028 ends at 0x0000902c
- --------8<------------------------8<--------
    In the interest of time and space I removed the other
    3500 lines like the ones above and below this.
- --------8<------------------------8<--------
Empty flash at 0x001e6384 ends at 0x001e6388
Empty flash at 0x001e6590 ends at 0x001e6594
Empty flash at 0x001efd80 ends at 0x001efdf0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001f0000:
0x246f instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001f0004:
0x4a8a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001f0008:
0x202a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001f000c:
0xb0aa instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001f0010:
0x6422 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001f0014:
0x0004 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001f0018:
0xd1ea instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001f001c:
0x4280 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001f0020:
0x0008 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001f0024:
0x2541 instead
Further such events for this erase block will not be printed
Empty flash at 0x001f2820 ends at 0x001f2824
Empty flash at 0x001f2864 ends at 0x001f2868
Empty flash at 0x001f2878 ends at 0x001f287c
Empty flash at 0x001f2884 ends at 0x001f2888
Empty flash at 0x001f2a90 ends at 0x001f2a94
Empty flash at 0x001f3000 ends at 0x001f3010
Empty flash at 0x001f3024 ends at 0x001f3028
Empty flash at 0x001f3060 ends at 0x001f3064
Empty flash at 0x001f3f7c ends at 0x001f3fe0
Empty flash at 0x001f3fe4 ends at 0x001f4000
Empty flash at 0x001f8528 ends at 0x001f852c
Old JFFS2 bitmask found at 0x001f91ec
You cannot use older JFFS2 filesystems with newer kernels
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
empty_blocks 0, bad_blocks 0, c->nr_blocks 32
mount: Mounting /dev/mtdblock2 on /mnt failed: Input/output error


BOOT LOG:
---------------
U-Boot 1.1.2 (Jul 11 2005 - 11:28:55)

CPU:   MOTOROLA MCF5272 (Mask:1)
Board: Valcom VIP8XX
DRAM:  16 MB
FLASH:  4 MB
In:    serial
Out:   serial
Err:   serial
Enter password to stop autoboot:  2  1  0

TFTP from server 192.168.11.111; our IP address is 192.168.11.112
Filename 'vcisc-1.03.pkg'.
Load address: 0x200000
Loading:
*#################################################################
     #################################################################
     ###################################################
done
Bytes transferred = 921780 (e10b4 hex)
Automatic boot of image at addr 0x00200000 ...
## Booting image at 00200000 ...
   Image Name:  
   Image Type:   M68K Linux Kernel Image (gzip compressed)
   Data Size:    921716 Bytes = 900.1 kB
   Load Address: 00020000
   Entry Point:  00020000
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... OK

Starting kernel ...

Linux version 2.6.17-uc1 (glen at ekul
<http://lists.infradead.org/mailman/listinfo/linux-mtd>) (gcc version
4.1.1) #7 Thu Nov 9
14:17:03 EST 2006


uClinux/COLDFIRE(m5272)
COLDFIRE port done by Greg Ungerer, gerg at snapgear.com
<http://lists.infradead.org/mailman/listinfo/linux-mtd>
Flat model support (C) 1998,1999 Kenneth Albanowski, D. Jeff Dionne
Built 1 zonelists
Kernel command line: rootfstype=romfs
PID hash table entries: 64 (order: 6, 256 bytes)
Dentry cache hash table entries: 1024 (order: 0, 4096 bytes)
Inode-cache hash table entries: 1024 (order: 0, 4096 bytes)
Memory available: 6036k/8192k RAM, (1011k kernel code, 148k data)
Mount-cache hash table entries: 512
NET: Registered protocol family 16
NET: Registered protocol family 2
IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
TCP established hash table entries: 1024 (order: 0, 4096 bytes)
TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
TCP reno registered
JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
io scheduler noop registered
io scheduler cfq registered (default)
ColdFire internal UART serial driver version 1.00
ttyS0 at 0x10000100 (irq = 73) is a builtin ColdFire UART
ttyS1 at 0x10000140 (irq = 74) is a builtin ColdFire UART
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
FEC ENET Version 0.2
fec: PHY @ 0x0, ID 0x001378e2 -- LXT971
eth0: ethernet 00:00:00:00:00:00
SnapGear flash probe(0xffc00000,4194304,1): 400000 at ffc00000
Flash: Found 1 x16 devices at 0x0 in 8-bit bank
 Amd/Fujitsu Extended Query Table at 0x0040
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
Creating 3 MTD partitions on "Flash":
0x00000000-0x00080000 : "Das U-Boot"
0x00080000-0x00200000 : "Kernel"
0x00200000-0x00400000 : "JFFS2"
SnapGear ram probe(0x141fac,798720,4): c3000 at 141fac
Creating 1 MTD partitions on "RAM":
0x00000000-0x000c3000 : "Romfs"
TCP bic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
VFS: Mounted root (romfs filesystem) readonly.
Freeing unused kernel memory: 48k freed (0x127000 - 0x132000)
init: Failed to open /etc/inittab.#


Thanks,
Glen Johnson
