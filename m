Received: from 61-218-84-70.hinet-ip.hinet.net ([61.218.84.70]
	helo=ex2k3.SouthPro.com.tw)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CRRMm-000796-JQ
	for linux-mtd@lists.infradead.org; Tue, 09 Nov 2004 03:28:42 -0500
Message-ID: <4190F0A5.80609@southpro.com.tw>
Date: Tue, 09 Nov 2004 16:30:29 +0000
From: sam <sam.hsu@southpro.com.tw>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=Big5
Content-Transfer-Encoding: 7bit
Subject: jffs2 root filesystem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi

I try to port linux-2.4.19-rmk1 to a pxa255 board
i am success to use MTD partition and can mount it
But when i try to use MTD as root filesystem (root=/dev/mtdblock/3
console=ttyS0,38400)
kernel boot message show:

.......
physmap flash device: 2000000 at 0
cfi_cmdset_0001: Erase suspend on write enabled
Using buffer write method
mtd: Giving out device 0 to Physically mapped flash
MTD partition setup...
partition num: 4
Using physmap partition definition
Creating 4 MTD partitions on "Physically mapped flash":
0x00000000-0x00040000 : "U-boot"
mtd: Giving out device 1 to U-boot
0x00040000-0x00340000 : "zImage"
mtd: Giving out device 2 to zImage
0x00340000-0x00a00000 : "ramdisk"
mtd: Giving out device 3 to ramdisk
0x00a00000-0x02000000 : "User system"
mtd: Giving out device 4 to User system
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 2048 bind 4096)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
NetWinder Floating Point Emulator V0.97 (double precision)
mtdblock_open
ok
mtdblock: read on "Physically mapped flash" at 0x400, size 0x400
mtdblock_release
ok
mtdblock_open
ok
mtdblock: read on "Physically mapped flash" at 0x0, size 0x200
FAT: bogus logical sector size 5349
mtdblock_release
ok
mtdblock_open
ok
mtdblock: read on "Physically mapped flash" at 0x0, size 0x200
FAT: bogus logical sector size 5349
mtdblock_release
ok
mtdblock_open
ok
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000:
0x0016 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004:
0xf014 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008:
0xf014 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000000c:
0xf014 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000010:
0xf014 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000014:
0xf014 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000018:
0xf014 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000001c:
0xf014 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020:
0x0160 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024:
0x01c0 instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
VFS: Mounted root (jffs2 filesystem) readonly.
Freeing init memory: 64K
Warning: unable to open an initial console.
Kernel panic: No init found. Try passing init= option to kernel.
..................

why can't i use mtd as my root disk

Sam
