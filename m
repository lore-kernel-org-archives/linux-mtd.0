Received: from avg3.hkpc.org ([202.64.133.85])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Ihdm-0003Ke-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 04:20:46 +0100
Received: from smtp2.hkpc.org ([202.64.133.13])
 by avg3.hkpc.org (NAVGW 2.5.2.11) with SMTP id M2002061411182111277
 for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 11:18:22 +0800
Date: Fri, 14 Jun 2002 11:20:34 +0800 (HKT)
From: Clifford Loo <kfloo@hkpc.org>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Problem putting JFFS on MTD
In-Reply-To: <001301c2134a$4bf3ed20$5501a8c0@synso.com.tw>
Message-ID: <Pine.LNX.4.33.0206141053220.8899-100000@cliffordux.hkpc.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi all,

I'm developing a disk-less embedded Linux system on the Motorola MPC823e,
with 16MB RAM, 8MB (32-bit data width) flash for holding the
boot/kernel/ramdisk images, and 4MB (16-bit) flash for JFFS.

I'm following the instructions on "mtd-jffs-HOWTO.txt" to set up MTD and
JFFS.  The system boots up fine and can even detect the 4MB flash, but
gives error when I try to mount the mtdblock device, or when I try to copy
a JFFS image file (created using mkfs.jffs) to the mtd char device.

The errors are, respectively:
mount: /dev/mtdblock0 has wrong device number or fs type jffs not supported
and
cp: cannot create regular file `/dev/mtd0': No such device

The following is a transcript:

--------------------------------------------------------------------------
PPCBoot 1.1.0 (Jun 11 2002 - 14:14:36)

CPU:   PPC823EZTnnB2 at 50 MHz: 16 kB I-Cache 8 kB D-Cache
Board: E-BOOK By HKPC. Ver1
DRAM:  16 MB
FLASH:  8 MB
In:    serial
Out:   serial
Err:   serial
Hit any key to stop autoboot:  0
## Booting image at 02840000 ...
   Image Name:   2.4.4 for E-BOOK(HKPC) ALPS
   Created:      2002-06-13   2:58:35 UTC
   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
   Data Size:    524166 Bytes = 511 kB = 0 MB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... OK
## Loading RAMDisk Image at 02940000 ...
   Image Name:   Simple Ramdisk Image
   Created:      2002-06-13   1:57:49 UTC
   Image Type:   PowerPC Linux RAMDisk Image (gzip compressed)
   Data Size:    2104177 Bytes = 2054 kB = 2 MB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
   Loading Ramdisk to 00dad000, end 00faeb71 ... OK
Linux version 2.4.4 (kfloo@cliffordux.hkpc.org) (gcc version 2.95.2
19991024 (release)) #26 Thu Jun 13 10:57:01 HKT 2002
MPC823 LCD memory at C016C000
On node 0 totalpages: 4096
zone(0): 4096 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/nfs rw nfsroot=: ip=::::::off
Decrementer Frequency: 3125000
Console: colour dummy device 640x480
Calibrating delay loop... 49.86 BogoMIPS
Memory: 11692k available (956k kernel code, 408k data, 64k init, 0k
highmem)
Dentry-cache hash table entries: 2048 (order: 2, 16384 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 4096 (order: 2, 16384 bytes)
Inode-cache hash table entries: 1024 (order: 1, 8192 bytes)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Starting kswapd v1.8
Console: switching to colour frame buffer device 80x30
fb0:  MPC823 LCD frame buffer device
CPM UART driver version 0.03
ttyS0 on SMC1 at 0x0280, BRG1
pty: 256 Unix98 ptys configured
spp succeeded
reloc, spi_rpbase=440
spp = ff002440
initialized the parameter ram
spi_init succeeded
Ebook(HKPC) TPANEL v.1.0 driver installed
Found 2x16bit 8MByte CFI flash device of type AMD/Fujitsu standard at
2800000
Registered flash device /dev/flasha (minor 0, 3 partitions)
block: queued sectors max/low 7648kB/2549kB, 64 slots per queue
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
RAMDISK: Compressed image found at block 0
Freeing initrd memory: 4194302k freed
JFFS version 1.0, (C) 1999, 2000  Axis Communications AB
[HKPC] init_mtd() called
[HKPC] create_proc_entry() returned 0xc0d93f20
physmap flash device: 400000 at 3800000
Physically mapped flash: Found a CFI device at 0x0 in 16 bit mode
Primary Vendor Command Set: 0002 (AMD/Fujitsu Standard)
Primary Algorithm Table at 0040
Alternative Vendor Command Set: 0000 (None)
No Alternate Algorithm Table
Vcc Minimum: 2.7 V
Vcc Maximum: 3.6 V
No Vpp line
Typical byte/word write timeout: 16 5s
Maximum byte/word write timeout: 512 5s
Full buffer write not supported
Typical block erase timeout: 1024 5s
Maximum block erase timeout: 16384 5s
Chip erase not supported
Device size: 0x400000 bytes (4 Mb)
Flash Device Interface description: 0x0002
  - supports x8 and x16 via BYTE# with asynchronous interface
Max. bytes in buffer write: 0x1
Number of Erase Block Regions: 2
  Erase Region #0: BlockSize 0x2000 bytes, 8 blocks
  Erase Region #1: BlockSize 0x10000 bytes, 63 blocks

 Amd/Fujitsu Extended Query Table at 0x0040
number of CFI chips: 1
mtd: Giving out device 0 to Physically mapped flash
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 1024 bind 1024)
IP-Config: No network devices available.
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
EXT2-fs warning: checktime reached, running e2fsck is recommended
VFS: Mounted root (ext2 filesystem).

### Initial RAM disk starting interactive shell ###
bash# cp jffs.image /dev/mtd0
cp: cannot create regular file `/dev/mtd0': No such device
bash# mount -t jffs /dev/mtdblock0 /mnt/jffs
mount: /dev/mtdblock0 has wrong device number or fs type jffs not
supported
bash# ls -l
total 26
drwxr-xr-x   2 0        0            1024 Jun 11  2002 bin
drwxr-xr-x   2 0        0            9216 Jun 11  2002 dev
drwxr-xr-x   2 0        0            1024 Mar  5  2002 etc
drwxr-xr-x   2 0        0            1024 May 29  2002 home
-rw-r--r--   1 500      100          5480 Jun 13  2002 jffs.image
drwxr-xr-x   2 0        0            1024 Feb 18  2002 lib
-rwxr-xr-x   1 0        0             136 Jan 11  1999 linuxrc
drwxr-xr-x   3 0        0            1024 Jun 11  2002 mnt
drwxr-xr-x   4 0        0            1024 Mar  5  2002 mw
drwxr-xr-x   2 0        0            1024 Jan 18  2002 proc
drwxr-xr-x   2 0        0            1024 Jun 11  2002 sbin
drwxr-xr-x   2 0        0            1024 Feb 23  2002 tmp
drwxr-xr-x   4 0        0            1024 Feb 27  2002 usr
bash# ls -l /dev/mtd*
crw-r--r--   1 0        0         90,   0 Jun 11  2002 /dev/mtd0
crw-r--r--   1 0        0         90,   2 Jun 11  2002 /dev/mtd1
crw-r--r--   1 0        0         90,   4 Jun 11  2002 /dev/mtd2
crw-r--r--   1 0        0         90,   6 Jun 11  2002 /dev/mtd3
crw-r--r--   1 0        0         90,   8 Jun 11  2002 /dev/mtd4
crw-r--r--   1 0        0         90,  10 Jun 11  2002 /dev/mtd5
brw-r--r--   1 0        0         31,   1 Jun 11  2002 /dev/mtdblock1
brw-r--r--   1 0        0         31,   2 Jun 11  2002 /dev/mtdblock2
brw-r--r--   1 0        0         31,   3 Jun 11  2002 /dev/mtdblock3
brw-r--r--   1 0        0         31,   4 Jun 11  2002 /dev/mtdblock4
brw-r--r--   1 0        0         31,   5 Jun 11  2002 /dev/mtdblock5
brw-r--r--   1 0        0         31,   6 Jun 11  2002 /dev/mtdblock6
bash# ls -la /proc
total 2
drwxr-xr-x   2 0        0            1024 Jan 18  2002 .
drwxr-xr-x  13 0        0            1024 Jun 13  2002 ..
bash#
--------------------------------------------------------------------------

One peculiar thing I notice is that, even though the mtd device number (0)
has been assigned, the "/proc" directory remains empty---I'm not able to
see the registered chip(s) by looking at "/proc/mtd".  Could that be
indicative of the cause of the problem?  Any help/insights will be much
appreciated.

--
Clifford
