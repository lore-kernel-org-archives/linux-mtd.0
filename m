Received: from mx10.radisys.com ([206.102.10.36])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AW5ka-0000YB-PH
	for linux-mtd@lists.infradead.org; Tue, 16 Dec 2003 03:19:56 +0000
To: linux-mtd@lists.infradead.org
Message-ID: <OF7F14D5F4.6B7E8674-ON88256DFE.00120E5B-88256DFE.00121ED2@radisys.com>
From: Arun.Kalluri@radisys.com
Date: Mon, 15 Dec 2003 19:17:53 -0800
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: Problems installing MTD for 64 bit bus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

So close....

I forgot to put image. sorry about the inconvenience.

thanks
Arun

----- Forwarded by Arun Kalluri/Radisys_Corporation/US on 12/15/2003 07:17
PM -----
                                                                                                                                       
                      Arun Kalluri                                                                                                     
                                               To:       linux-mtd@lists.infradead.org                                                 
                       12/15/2003 05:55        cc:                                                                                     
                      PM                       Subject:  Problems installing MTD for 64 bit bus                                        
                                                                                                                                       
                                                                                                                                       



Greetings-

I am having problems getting up a JFFS2 file system with linux kernel
2.4.17 on a 8260 processor with 64 bit bus. I had success in bringing up a
similar board with 32 bit bus without any problem.  I went through the
mailing archive and as advised applied the latest
mtd-snapshot-20031208.tar.bz2 on my kernel. I found there were a few
compiling problems I could resolve some, but the zlib.h and some other
files were causing problems, which I was not able to resolve. So, I decided
to go to a relatively older mtd snapshot and used mtd-snapshot-20020731,
which has 64 bit support and fewer changes. I was able to compile and
configure, but I am having problems installing JFFS2 on MTD. Could you
please tell me where I could be going wrong..

thanks
Arun

Relevant information about this problem is printed below:


## Booting image at 28100000 ...
   Image Name:   ABCD Version 0.030
   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
   Data Size:    636498 Bytes = 621.6 kB
   Load Address: 00000000
   Entry Point:  00000000
   Verifying Checksum ... OK
   Uncompressing Kernel Image ... OK
Memory BAT mapping: BAT2=256Mb, BAT3=0Mb, residual: 0Mb
Linux version 2.4.17 (ak001@build7) (gcc version 2.95.3 200103153On node 0
totalpages: 65536
zone(0): 65536 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: setenv bootargs root=/dev/mtdblock1 rw
ip=10.0.0.1:10.0.0.5Warning: real time clock seems stuck!
Calibrating delay loop... 197.83 BogoMIPS
Memory: 256044k available (1228k kernel code, 440k data, 60k init, 0k
highmem)
Dentry-cache hash table entries: 32768 (order: 6, 262144 bytes)
Inode-cache hash table entries: 16384 (order: 5, 131072 bytes)
Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
Buffer-cache hash table entries: 16384 (order: 4, 65536 bytes)
Page-cache hash table entries: 65536 (order: 6, 262144 bytes)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
Disabling the Out Of Memory Killer
JFFS2 version 2.1. (C) 2001, 2002 Red Hat, Inc., designed by Axis
Communication.i2c-core.o: i2c core module version 2.6.2 (20011118)
i2c-dev.o: i2c /dev entries driver module version 2.6.2 (20011118)
i2c-algo_8260.o: i2c MPC8260 module
 i2c-algo-8260.o: scanning bus m8260...
(64)(a4)(aa)
i2c-proc.o version 2.6.2 (20011118)
CPM UART driver version 0.01
ttyS0 on SMC1 at 0x0000, BRG1
ttyS1 on SMC2 at 0x0040, BRG2
pty: 256 Unix98 ptys configured
block: 128 slots per queue, batch=32
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
eth0: FCC ENET Version 0.3, 00:00:50:0c:30:c8
loop: loaded (max 8 devices)
physmap flash device: 8000000 at 28000000
Using buffer write method
the size of the flash is 8000000
Using partition definition
Creating 5 MTD partitions on "Physically mapped flash":
0x00300000-0x06000000 : "flash partition - JFFS2"
Registering the partition of size 5d00000
0x00200000-0x00300000 : "flash partition - Rollback Kernel"
Registering the partition of size 100000
0x00100000-0x00200000 : "flash partition - Main Kernel"
Registering the partition of size 100000
0x00000000-0x00100000 : "flash partition - PPCBoot and parameters"
Registering the partition of size 100000
0x06000000-0x08000000 : "flash partition - Not Used"
Registering the partition of size 2000000
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 2048 buckets, 16Kbytes
TCP: Hash tables configured (established 16384 bind 16384)
IP-Config: Complete:
      device=eth0, addr=10.0.0.1, mask=255.255.255.0, gw=255.255.255.255,
     host=desg, domain=, nis-domain=(none),
     bootserver=10.0.0.2, rootserver=10.0.0.2, rootpath=
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
jffs2: read_super for device 1f:01
the value of sector_size is 80000 and flash size is 5d00000
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000:
0xc90c id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004:
0x5ed5 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008:
0xd850 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000000c:
0xee71 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000010:
0x58bc id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000014:
0x4a41 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000018:
0x0a5e id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000001c:
0xf977 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020:
0x14ee id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024:
0x08b4 id
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080000:
0xc92e id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080004:
0xdec5 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080008:
0x5852 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0008000c:
0xde71 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080010:
0x58ba id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080014:
0x4a51 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080018:
0x0a5e id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0008001c:
0xd937 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080020:
0x54ee id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080024:
0x08b4 id
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00080000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100000:
0xc92e id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100004:
0x5ed5 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100008:
0x5850 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0010000c:
0xce21 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100010:
0x58be id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100014:
0x4a50 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100018:
0x025e id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0010001c:
0xf973 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100020:
0x54ee id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100024:
0x08b4 id
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00100000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00180000:
0xc81e id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00180004:
0x5ed5 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00180008:
0x5852 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0018000c:
0x4e70 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00180010:
0x58ba id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00180014:
0x4a50 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00180018:
0x0a5e id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0018001c:
0xd977 id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00180020:
0x54ee id
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00180024:
0x08b4 id
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00180000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04600000:
0xfaaa id
jffs2_scan_empty(): Empty block at 0x04600004 ends at 0x04600008 (with
0xeaabafy
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04600008:
0xeaab id
jffs2_scan_empty(): Empty block at 0x0460000c ends at 0x04600010 (with
0xeaaaaay
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04600010:
0xeaaa id
jffs2_scan_empty(): Empty block at 0x04600014 ends at 0x04600018 (with
0xaeaeaay
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04600018:
0xaeae id
jffs2_scan_empty(): Empty block at 0x0460001c ends at 0x04600020 (with
0xeaabeey
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x04600020:
0xeaab id
jffs2_scan_empty(): Empty block at 0x04600024 ends at 0x04600028 (with
0xbaafaay
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x04600000 is not formatted. It will be erased
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
Kernel panic: VFS: Unable to mount root fs on 1f:01
 <0>Rebooting in 180 seconds..









# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
# CONFIG_MTD_DEBUG is not set
CONFIG_MTD_PARTITIONS=y
CONFIG_MTD_CONCAT=y
# CONFIG_MTD_REDBOOT_PARTS is not set
CONFIG_MTD_CMDLINE_PARTS=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y
# CONFIG_FTL is not set
# CONFIG_NFTL is not set

#
# RAM/ROM/Flash chip drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
CONFIG_MTD_CFI_GEOMETRY=y
# CONFIG_MTD_CFI_B1 is not set
# CONFIG_MTD_CFI_B2 is not set
# CONFIG_MTD_CFI_B4 is not set
CONFIG_MTD_CFI_B8=y
# CONFIG_MTD_CFI_I1 is not set
# CONFIG_MTD_CFI_I2 is not set
CONFIG_MTD_CFI_I4=y
# CONFIG_MTD_CFI_I8 is not set
CONFIG_MTD_CFI_INTELEXT=y
# CONFIG_MTD_CFI_AMDSTD is not set
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
# CONFIG_MTD_ABSENT is not set
# CONFIG_MTD_OBSOLETE_CHIPS is not set
# CONFIG_MTD_AMDSTD is not set
# CONFIG_MTD_SHARP is not set
# CONFIG_MTD_JEDEC is not set

#
# Mapping drivers for chip access
#
CONFIG_MTD_PHYSMAP=y
CONFIG_MTD_PHYSMAP_START=28000000
CONFIG_MTD_PHYSMAP_LEN=08000000
CONFIG_MTD_PHYSMAP_BUSWIDTH=8
# CONFIG_MTD_TQM8XXL is not set
# CONFIG_MTD_RPXLITE is not set
# CONFIG_MTD_MBX860 is not set
# CONFIG_MTD_DBOX2 is not set
# CONFIG_MTD_CFI_FLAGADM is not set
# CONFIG_MTD_REDWOOD is not set
# CONFIG_MTD_PCI is not set

#
# Self-contained MTD device drivers
#
# CONFIG_MTD_PMC551 is not set
# CONFIG_MTD_SLRAM is not set
# CONFIG_MTD_MTDRAM is not set
# CONFIG_MTD_BLKMTD is not set
# CONFIG_MTD_DOC1000 is not set
# CONFIG_MTD_DOC2000 is not set
# CONFIG_MTD_DOC2001 is not set
# CONFIG_MTD_DOCPROBE is not set

#
# NAND Flash Device Drivers
#
# CONFIG_MTD_NAND is not set






 CONFIG_JBD_DEBUG is not set
# CONFIG_FAT_FS is not set
# CONFIG_MSDOS_FS is not set
# CONFIG_UMSDOS_FS is not set
# CONFIG_VFAT_FS is not set
# CONFIG_EFS_FS is not set
# CONFIG_JFFS_FS is not set
CONFIG_JFFS2_FS=y
CONFIG_JFFS2_FS_DEBUG=0
# CONFIG_CRAMFS is not set
