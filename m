From: btuch@usa.net (Brian T.)
Date: Tue, 11 Mar 2003 13:30:50 -0600
Subject: Unable to open console /start init - more info (jffs2)
References: <003901c2e7ef$6ef75c60$150a0ac0@jbmsoft.com>
Message-ID: <008d01c2e804$b981cd00$150a0ac0@jbmsoft.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On bootup, with MTD debugging and JFFS2 debugging on,  the 2.2.18 kernel
give me this:

SNAPGEAR: Intel flash device size = 16384K
Creating 6 MTD partitions on "SnapGear Intel":
0x00000000-0x00080000 : "JBM kernel"
mtd: Giving out device 0 to JBM kernel
0x000a0000-0x00fe0000 : "JBM filesystem"
mtd: Giving out device 1 to JBM filesystem
0x00080000-0x000a0000 : "JBM config"
mtd: Giving out device 2 to JBM config
0x00000000-0x01000000 : "JBM Intel"
mtd: Giving out device 3 to JBM Intel
0x00fe0000-0x01000000 : "JBM BIOS Config"
mtd: Giving out device 4 to JBM BIOS Config
0x00fe0000-0x01000000 : "JBM BIOS"
mtd: Giving out device 5 to JBM BIOS
JBMgw137 Battery Backed RAM device: 1f000 at 18021000
Creating 1 MTD partitions on "JBMgw137 Battery Backed RAM":
0x00000000-0x0001f000 : "JBM-Battery-Backed RAM"
mtd: Giving out device 6 to JBM-Battery-Backed RAM
JFFS2 version 2.1. (C) 2001 Red Hat, Inc., designed by Axis Communications
AB.
mtdblock_open
ok
mtdblock: read on "JBM filesystem" at 0x400, size 0x400
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0051661c:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00516620:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00516624:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00516628:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0051662c:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00516630:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00516634:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00516638:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0051663c:
0x1a1a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00516640:
0x1a1a instead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00520000 is not formatted. It will be erased
JFFS2: Erase block at 0x00540000 is not formatted. It will be erased
   ...snipped out lines in between....
JFFS2: Erase block at 0x00f20000 is not formatted. It will be erased
VFS: Mounted root (jffs2 filesystem) readonly.
Freeing unused kernel memory: 36k freed


But I don't see any JFFS2 output (formatting the blocks...etc...) on the
2.4.20 kernel I'm trying to get running:

SNAPGEAR: Intel flash device size = 16384K
Creating 6 MTD partitions on "SnapGear Intel":
0x00000000-0x000e0000 : "JBM kernel"
mtd: Giving out device 0 to JBM kernel
0x00100000-0x00fe0000 : "JBM filesystem"
mtd: Giving out device 1 to JBM filesystem
0x000e0000-0x00100000 : "JBM config"
mtd: Giving out device 2 to JBM config
0x00000000-0x01000000 : "JBM Intel"
mtd: Giving out device 3 to JBM Intel
0x00fe0000-0x01000000 : "JBM BIOS Config"
mtd: Giving out device 4 to JBM BIOS Config
0x00fe0000-0x01000000 : "JBM BIOS"
mtd: Giving out device 5 to JBM BIOS
JBMgw137 Battery Backed RAM device: 1f000 at 18021000
kmod: failed to exec /sbin/modprobe -s -k ram, errno = 2
kmod: failed to exec /sbin/modprobe -s -k rom, errno = 2
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 2048 bind 2048)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
mtdblock_open
ok
mtdblock: read on "JBM filesystem" at 0x400, size 0x400
mtdblock_release
ok
mtdblock_open
ok
VFS: Mounted root (jffs2 filesystem) readonly.
Freeing unused kernel memory: 60k freed
Warning: unable to open an initial console.

Is it possible that the JFFS2 MTD partition isn't being mounted, and
therefore that is why the console, and INIT aren't starting?

-Brian
