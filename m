Received: from mail.utstar.com ([216.37.114.6])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BuglM-0000Ir-FA
	for linux-mtd@lists.infradead.org; Tue, 10 Aug 2004 20:14:42 -0400
Received: from njtckasturi (njtc-kasturi.nj.us.utstar.com [172.16.133.47])
	by mail.utstar.com (8.12.10/8.12.10) with SMTP id i7B0EXWM017272
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 Aug 2004 20:14:34 -0400 (EDT)
From: "Kasturi Raghunath" <kasturi@utstar.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 10 Aug 2004 20:14:34 -0400
Message-ID: <DJEELHNCJDICCAIMLCCCAEMKDPAA.kasturi@utstar.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: JFFS2 issue on flash on AMD flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi
  We are using AMD flash 29LV128 and flash type is Mirror Bit on our custom
board. The flash size is 32 M and bus width is 32 bit wide. I have ported
May 27 2004 snapshot of JFFS2 on my 2.4.7 timesys linux. When kernel boots
up JFFS2 prints lot of errors:

Linux/PPC load: wdt=1 console=ttyS0,9600 root=/dev/mtdblock/1 panic=1
mem=120M
Uncompressing Linux... done.
Now booting the kernel
pvr = 80822013 machine = 200000 HID0 = 8000c088
Total memory = 120MB; using 0kB for hash table (at 00000000)
Linux version 2.4.7-UTS-1.9 (root@localhost.localdomain) (gcc version 2.95.2
199
91024 (release)) #11 Thu Jul 22 20:53:14 EDT 2004
On node 0 totalpages: 30720
zone(0): 30720 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: wdt=1 console=ttyS0,9600 root=/dev/mtdblock/1 panic=1
mem=1
20M
Warning: real time clock seems stuck!
Memory: 118148k available (1492k kernel code, 528k data, 60k init, 0k
highmem)
Calibrating delay loop... 299.82 BogoMIPS
Dentry-cache hash table entries: 16384 (order: 5, 131072 bytes)
Inode-cache hash table entries: 8192 (order: 4, 65536 bytes)
Mount-cache hash table entries: 2048 (order: 2, 16384 bytes)
Buffer-cache hash table entries: 4096 (order: 2, 16384 bytes)
Page-cache hash table entries: 32768 (order: 5, 131072 bytes)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd v1.8
devfs: v0.107 (20010709) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x2
JFFS2 version 2.2. (C) 2001-2003 Red Hat, Inc.
CPM UART driver version 0.01
ttyS00 at 0x0000 is a SMC
pty: 256 Unix98 ptys configured
WDT driver initialization finishes.
block: queued sectors max/low 78034kB/26011kB, 256 slots per queue
RAMDISK driver initialized: 16 RAM disks of 16384K size 1024 blocksize
loop: loaded (max 8 devices)
PPP generic driver version 2.4.1
init_icm3_mtd: chip probing count 0
ICM3 Bank 0: Found 2 x16 devices at 0x0 in 32-bit mode
 Amd/Fujitsu Extended Query Table at 0x0040
ICM3 Bank 0: CFI does not contain boot bank location. Assuming top.
number of CFI chips: 1
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
init_icm3_mtd: bank1, name:ICM3 Bank 0, size:33554432bytes
icm3 flash bank 0: Using static image partition definition
Creating 2 MTD partitions on "ICM3 Bank 0":
0x00000000-0x00100000 : "ppcboot"
0x00100000-0x02000000 : "jffs"
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 128 buckets, 3Kbytes
TCP: Hash tables configured (established 2048 bind 2730)
ip_conntrack (960 buckets, 7680 max)
ip_tables: (c)2000 Netfilter core team
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e0248:
0xffff in
stead
Empty flash at 0x005e024c ends at 0x005e0828
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e0828:
0xffff in
stead
Empty flash at 0x005e082c ends at 0x005e0c00
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e0c00:
0xffff in
stead
Empty flash at 0x005e0c04 ends at 0x005e0c08
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e0c08:
0xffff in
stead
Empty flash at 0x005e0c0c ends at 0x005e2424
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e2424:
0xfdff in
stead
Empty flash at 0x005e2428 ends at 0x005e30a8
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e30a8:
0xffff in
stead
Empty flash at 0x005e30ac ends at 0x005e3a24
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e3a24:
0xffff in
stead
Empty flash at 0x005e3a28 ends at 0x005e4040
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e4040:
0xffff in
stead
Empty flash at 0x005e4044 ends at 0x005e40a8
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e40a8:
0xffff in
stead
Empty flash at 0x005e40ac ends at 0x005e4624
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x005e4624:
0xffff in
stead
Further such events for this erase block will not be printed
Empty flash at 0x005e4628 ends at 0x005e5a04
Empty flash at 0x005e5a08 ends at 0x005e5c68
Empty flash at 0x005e5c6c ends at 0x005e5c74
Empty flash at 0x005e5c78 ends at 0x005e5e80
Empty flash at 0x005e5e84 ends at 0x005e6328
Empty flash at 0x005e632c ends at 0x005e6428
Empty flash at 0x005e642c ends at 0x005e7228
Empty flash at 0x005e722c ends at 0x005e7448
Empty flash at 0x005e744c ends at 0x005e7608
Empty flash at 0x005e760c ends at 0x005e7c04
Empty flash at 0x005e7c08 ends at 0x005e8028
Empty flash at 0x005e802c ends at 0x005e8228
Empty flash at 0x005e822c ends at 0x005e8828
Empty flash at 0x005e822c ends at 0x005e8828
Empty flash at 0x005e882c ends at 0x005e902c
Empty flash at 0x005e9030 ends at 0x005e903c
Empty flash at 0x005e9040 ends at 0x005e9840
Empty flash at 0x005e9844 ends at 0x005e9ea4
Empty flash at 0x005e9ea8 ends at 0x005e9f24
Empty flash at 0x005e9f28 ends at 0x005ea20c
Empty flash at 0x005ea210 ends at 0x005ea21c
Empty flash at 0x005ea220 ends at 0x005ea2e8
Empty flash at 0x005ea2ec ends at 0x005eac2c
Empty flash at 0x005eac30 ends at 0x005ec168
Empty flash at 0x005ec16c ends at 0x005edc40
Empty flash at 0x005edc44 ends at 0x005edc48
Empty flash at 0x005edc4c ends at 0x005edc60
Empty flash at 0x005edc64 ends at 0x005ee000
Empty flash at 0x005ee004 ends at 0x005eec28
Empty flash at 0x005eec2c ends at 0x005ef620
Empty flash at 0x005ef624 ends at 0x005efc00
Empty flash at 0x005efc04 ends at 0x005efc0c
Empty flash at 0x005efc14 ends at 0x005efc1c
Empty flash at 0x005efc20 ends at 0x005f3088
Empty flash at 0x005f308c ends at 0x005f3f68
Empty flash at 0x005f3f6c ends at 0x005f4320
Empty flash at 0x005f4324 ends at 0x005f4720
Empty flash at 0x005f4724 ends at 0x005f5808
Empty flash at 0x005f580c ends at 0x005f5ee8
Empty flash at 0x005f5eec ends at 0x005f6228
Empty flash at 0x005f622c ends at 0x005f6e20
Empty flash at 0x005f6e24 ends at 0x005f7224
Empty flash at 0x005f7228 ends at 0x005f76e0
Empty flash at 0x005f76e4 ends at 0x005f7c68
Empty flash at 0x005f7c6c ends at 0x005f8000
Empty flash at 0x005f8004 ends at 0x005f8220
Empty flash at 0x005f8224 ends at 0x005f8a08
Empty flash at 0x005f8a0c ends at 0x005f8ce0
Empty flash at 0x005f8ce4 ends at 0x005f920c
Empty flash at 0x005f9210 ends at 0x005fa400
Empty flash at 0x005fa404 ends at 0x005fba00
Empty flash at 0x005fba04 ends at 0x005fce40
Empty flash at 0x005fce44 ends at 0x005fd040
Empty flash at 0x005fd044 ends at 0x005fd82c
Empty flash at 0x005fd830 ends at 0x005fdc28
VFS: Mounted root (jffs2 filesystem) readonly.
Mounted devfs on /dev
Freeing unused kernel memory: 60k i.t
NIT: version 2.78 booting
Remounting the root filesystem read-write.
Creating ext2 filesystem in ramdisk with 1k blk
Creating tmp, log directories
.
Mounting local file systems...
not mounted anything
eth0: FCC ENET Version 0.2, 00:e0:8e:ab:30:84
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces: done.
Starting portmap daemon: portmap.
Initializing random number generator... done.
Exporting directories for NFS kernel daemon...done.
Starting nfsd:  done.
Starting rpc.mountd:  done.
Starting system logger: Done
Starting kernel logger: Done
Starting xinetd: Done

Any idea what could be the issue?. Thanks in advance.
