Received: from webmail.abac.com ([216.55.191.200])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cd8zl-0005cP-0y
	for linux-mtd@lists.infradead.org; Sat, 11 Dec 2004 10:17:20 -0500
Message-ID: <61863.81.72.55.167.1102777897.squirrel@81.72.55.167>
Date: Sat, 11 Dec 2004 16:11:37 +0100 (CET)
From: "Pedro Aguilar" <paguilar@junkerhq.net>
To: jffs-dev@axis.com
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Kernel freezing when booting with jffs2 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a MPC859T based board with a 4MB AMD flash memory. I want to use it
with linux and jffs2. I compiled the kernel (2.4.25 from DENX) with MTD
and jffs2 support without any problems. Using u-boot I downloaded to the
flash memory the jffs2 image at a position that is the same that the one
used when configuring the MTD partition (0x00100000).
Then I downloaded the kernel (I just have serial access to the board) via
u-boot and boot it.

The problem is that when mounting the jffs2 filesystem it says read-only
(I'm not giving it any read-only flag in the MTD partition) and then shows
the msg 'Warning: unable to open an initial console'

Could you tell me where can I find some related mtd-jffs2 info or how can
I solve this problem?

Thanks in advance!

Here's the complete kernel output at boot time (mtd and jffs2 debug flags
activated):
Linux version 2.4.25 (pedro@develop) (gcc versio 3.3.3 (DENX ELDK 3.1
3.3.3-8)) #43 Sat Dec 11 16:48:21 CET 2004
On node 0 totalpages: 4096
zone(0): 4096 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: root=/dev/mtdblock1
Decrementer Frequency = 187500000/60
Calibrating delay loop... 49.76 BogoMIPS
Memory: 14844k available (964k kernel code, 324k data, 44k init, 0k highmem)
Dentry cache hash table entries:2048 (order: 2, 16384 bytes)
Inode cache hash table entres: 1024 (order: 1, 8192 bytes)
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 4096 (order16384 bytes)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Starting kswapd
JFFS2 version 2.2. (C) 2001-2003 Red Hat
CPM UART driver version 0.04
pty: 256 Unix98 ptys configured
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
physmap flash device: 400000 at 40000000
map bus width: 1
phys_mapped_flash: Found 1 x16 devices at 0x0 in 8-bit mode
 Amd/Fujitsu Extended Query Table at 0x0040
number of CFI chips: 1
Using word write method
RedBoot partition parsing not available-program due to code brokenness.
mtd: Giving out device 0 to phys_mapped_flash
map bus width: 1
TQM8xxL0: Found 1 x16 devices at 0x0 in 8-bit mode
 Amd/Fujitsu Extendery Table at 0x0040
number of CFI chips: 1
Using word e method
cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
TQM flash bank 0: Using static image partition definition
Creating 1 MTD partitions on "TQM8xxL0":
0x00100000-0x00400000 : "jffs"
mtd: Giving out device 1 to jffs
NET4: Linux TCP/IP 1.0 NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 1024 bind 2048)
NET4: Unix domain sock0/SMP for Linux NET4.0.
mtdblock_open
ok
mtdblock: read on "jffs" at 0x400, size 0x200
mtdblock: read on "jffs" at 0x600, size 0x200
mtdblock_release
ok
mtdblock_open
ok
VFS: Mounted root (jffs2 filesystem) readonly.
Freeing unused kernel memory: 44k init
Warning: unable to open an initial console.

---

Thanks.

Pedro
