From: vdoukhan@cbnco.com (Vladimir Doukhanine)
Date: Wed, 12 Mar 2003 11:57:12 -0500
Subject: How to fix JFFS2 with some kind of repair tool or manually?
Message-ID: <oprlxldmqr7bj7b7@cbnsitar.cbnco.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi,
I???m just looking for an advice. My JFFS2 FS has some errors and I???d like to 
find a way to fix them.
An image of the JFFS2 was created on some other platform, which is not 
accessible anymore. Also I have no more devices to create another FS except 
RAM and almost no free space on the JFFS2. How to fix JFFS2 with some kind 
of repair tool or manually?

Thanks,
Vlad

NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
jffs2_scan_inode_node(): CRC failed on node at 0x00047c18: Read 0xe423cf57, 
calculated 0x4640389b
jffs2_scan_inode_node(): CRC failed on node at 0x00077210: Read 0x3abfa661, 
calculated 0x32e8414c
jffs2_scan_inode_node(): CRC failed on node at 0x000ede90: Read 0x3c9570f6, 
calculated 0x34c297db
jffs2_scan_eraseblock(): Node at 0x001464b0 {0x1985, 0xe002, 0xffff0046) 
has invalid CRC 0x32fe3396 (calculated 0x8cd82169)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001464b4: 
0x0046 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001464b8: 
0x3396 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001464bc: 
0x2406 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001464c0: 
0x0001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001464c4: 
0x2180 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001464d0: 
0xa27e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001464d4: 
0xa27e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001464d8: 
0xa27e instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001464e0: 
0x0002 instead
Further such events for this erase block will not be printed
jffs2_scan_dirent_node(): Node CRC failed on node at 0x0017a9c8: Read 
0xcb43e738, calculated 0x428507d7
Eep. Child "hdd7" (ino #499) of dir ino #3 doesn't exist!
Eep. Child "sdao15" (ino #2127) of dir ino #3 doesn't exist!
Eep. Child "hdcr15" (ino #6194) of dir ino #781 doesn't exist!
Eep. Child "mouse2" (ino #9222) of dir ino #787 doesn't exist!
Eep. Child "mouse2" (ino #9222) of dir ino #787 doesn't exist!
VFS: Mounted root (jffs2 filesystem) readonly.
