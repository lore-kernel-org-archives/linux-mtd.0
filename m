Received: from cmsout02.mbox.net ([165.212.64.32])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C1rrg-0002fi-Q5
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2004 15:30:57 -0400
Message-ID: <070101c48ec7$d61e69d0$fd0ba8c0@briantpc>
From: "Brian T" <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 30 Aug 2004 14:30:40 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: jffs2 file corruption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Trying to (still) update from 2.4.20 to 2.4.27 on an x86 embedded unit.
Made the kernel with CVS from 20040826 ( and added in the __ffs macro from
the previous thread ).

Running on a 486 with 16mb Intel flash, 128k size erase sectors.  To create
the file system I run :

mkfs.jffs2 -o romfs.img -U -n -p -e0x2000 -d romfs/

Bootup seems fine, but I get a lot of file anomalies. I have a 24MB RAMFS on
/mnt/ramfs and then a sym link /mnt/ramfs -> /tmp .  After bootup I get
wierd errors like :

[root@JBMgateway-60b /]# ls -al
drwxr-xr-x   15 root     root            0 Aug 30 09:10 .
drwxr-xr-x   15 root     root            0 Aug 30 09:10 ..
drwxr-xr-x    2 root     root            0 Feb 21  2003 bin
drwxr-xr-x    2 root     root            0 Aug 30 12:41 boot
drwxr-xr-x    4 root     root            0 Aug 30 13:38 dev
drwxr-xr-x   23 root     root            0 Aug 30 14:10 etc
drwxr-xr-x    4 root     root            0 Aug 30 13:38 home
drwxr-xr-x    3 root     root            0 Aug 30 09:10 lib
drwxr-xr-x    4 root     root            0 Aug 30 09:10 mnt
dr-xr-xr-x   24 root     root            0 Aug 30 09:09 proc
drwx------    3 root     root            0 Aug 30 14:13 root
drwxr-xr-x    2 root     root            0 Aug 30 13:39 sbin
lrwxrwxrwx    1 root     root           14 Aug 30 09:10 tmpls: ls:./tmp:
Input/output error

drwxr-xr-x    8 root     root            0 Aug 30 12:41 usr
drwxr-xr-x   11 root     root         1024 Aug 30 09:10 var
[root@JBMgateway-60b /]#

Modifying a simple test file seems fine, but then when rebootnig, here come
the CRC errors, and then the file system is unreadable.

jffs2_scan_inode_node(): CRC failed on node at 0x0085c83c: Read 0xffffffff,
calculated 0x3dd4adc1
jffs2_scan_dirent_node(): Node CRC failed on node at 0x0085c880: Read
0xffffffff, calculated 0x60506a80
jffs2_scan_inode_node(): CRC failed on node at 0x0085c8b0: Read 0xffffffff,
calculated 0x66cb4f63
jffs2_scan_dirent_node(): Node CRC failed on node at 0x0085c904: Read
0xffffffff, calculated 0x010d4523
jffs2_scan_inode_node(): CRC failed on node at 0x0085c930: Read 0xffffffff,
calculated 0xafde3a90
jffs2_scan_dirent_node(): Node CRC failed on node at 0x0085ca04: Read
0xffffffff, calculated 0x469dcd79
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0085ca7c: Read
0xffffffff, calculated 0xeb3e1d4d
Name for which CRC failed is (now) 'modules.generic_string', ino #1100
jffs2_scan_dirent_node(): Node CRC failed on node at 0x0085cb00: Read
0xffffffff, calculated 0x1e774b92
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0085cb7c: Read
0xffffffff, calculated 0xb7bf6d20
Name for which CRC failed is (now) 'modules.isapnpmap', ino #1102
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0085cbfc: Read
0xffffffff, calculated 0xcea9e734
Name for which CRC failed is (now) 'modules.usbmap', ino #1103
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0085cc78: Read
0x062b5a20, calculated 0x5ace6da0
Name for which CRC failed is (now) 'ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ', ino #1104
jffs2_scan_inode_node(): CRC failed on node at 0x0085ccb4: Read 0xffffffff,
calculated 0xf1cf28e5
jffs2_scan_inode_node(): CRC failed on node at 0x0085cea4: Read 0xe163b78c,
calculated 0x409744e1
jffs2_scan_inode_node(): CRC failed on node at 0x0085cf08: Read 0xf34fa9ec,
calculated 0x13bf9a28
jffs2_scan_inode_node(): CRC failed on node at 0x0085d098: Read 0xffffffff,
calculated 0x2da33634
jffs2_scan_inode_node(): CRC failed on node at 0x0085d15c: Read 0xffffffff,
calculated 0x6f47bf3e
jffs2_scan_inode_node(): CRC failed on node at 0x0085d21c: Read 0xffffffff,
calculated 0x54293253
jffs2_scan_inode_node(): CRC failed on node at 0x0085d280: Read 0xffffffff,
calculated 0x42184e2e
jffs2_scan_inode_node(): CRC failed on node at 0x0085d328: Read 0x5f9e29e9,
calculated 0xdd3e4daa
jffs2_scan_dirent_node(): Node CRC failed on node at 0x0085d36c: Read
0xffffffff, calculated 0x745f5ba5
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0085d3dc: Read
0xffffffff, calculated 0x622d0693
Name for which CRC failed is (now) 'ÿÿÿÿÿÿÿ', ino #1106
jffs2_scan_inode_node(): CRC failed on node at 0x0085d40c: Read 0xfa3e5fb3,
calculated 0x5a961571
jffs2_scan_dirent_node(): Node CRC failed on node at 0x0085d540: Read
0xffffffff, calculated 0xcb60985b
jffs2_scan_inode_node(): CRC failed on node at 0x0085d578: Read 0xffffffff,
calculated 0x33e0776a
jffs2_scan_inode_node(): CRC failed on node at 0x0085d6bc: Read 0xffffffff,
calculated 0xf154fbed
jffs2_scan_inode_node(): CRC failed on node at 0x0085d758: Read 0xffffffff,
calculated 0x6e3afbab
jffs2_scan_inode_node(): CRC failed on node at 0x0085d7e4: Read 0xffffffff,
calculated 0x95e5c90a
jffs2_scan_inode_node(): CRC failed on node at 0x0085df34: Read 0xf1b2e00a,
calculated 0x7b22602f
jffs2_scan_dirent_node(): Name CRC failed on node at 0x0085e21c: Read
0xffffffff, calculated 0x44660075
Name for which CRC failed is (now) 'ÿÿÿÿÿÿÿÿ', ino #1108
jffs2_scan_inode_node(): CRC failed on node at 0x0085e24c: Read 0x8cf894c6,
calculated 0xbe9398cf
jffs2_scan_inode_node(): CRC failed on node at 0x0085e354: Read 0x5b92cae1,
calculated 0xc23ffe4d
jffs2_scan_inode_node(): CRC failed on node at 0x0085e44c: Read 0xde01eb00,
calculated 0x42630983
jffs2_scan_inode_node(): CRC failed on node at 0x0085e548: Read 0x74e71294,
calculated 0xa3d47e39
jffs2_scan_inode_node(): CRC failed on node at 0x0085e64c: Read 0xc3fdc1fb,
calculated 0x16337947
jffs2_scan_inode_node(): CRC failed on node at 0x0085e74c: Read 0x4445f7a7,
calculated 0x3c1b4125
jffs2_scan_inode_node(): CRC failed on node at 0x0085e84c: Read 0xd0435f78,
calculated 0x60f32d5a
jffs2_scan_inode_node(): CRC failed on node at 0x0085e948: Read 0x8da40476,
calculated 0x81445ae0
jffs2_scan_inode_node(): CRC failed on node at 0x0085ea4c: Read 0x773f1cdd,
calculated 0x34a35d9e
jffs2_scan_inode_node(): CRC failed on node at 0x0085eb48: Read 0xf58d6700,
calculated 0xd5142a24
jffs2_scan_inode_node(): CRC failed on node at 0x0085ec40: Read 0xffffffff,
calculated 0x7c62fbb8
jffs2_scan_inode_node(): CRC failed on node at 0x0085ed38: Read 0xffffffff,
calculated 0x7113a596
jffs2_scan_inode_node(): CRC failed on node at 0x0085ee44: Read 0xffffffff,
calculated 0x3905c1db
jffs2_scan_inode_node(): CRC failed on node at 0x0085ef3c: Read 0xffffffff,
calculated 0x0fa51510
jffs2_scan_inode_node(): CRC failed on node at 0x0085f038: Read 0xffffffff,
calculated 0x5f49a4bf
jffs2_scan_inode_node(): CRC failed on node at 0x0085f13c: Read 0xffffffff,
calculated 0x9cb17bc1
jffs2_scan_inode_node(): CRC failed on node at 0x0085f23c: Read 0xffffffff,
calculated 0x0cb7be77
jffs2_scan_inode_node(): CRC failed on node at 0x0085f334: Read 0xa3c1242f,
calculated 0x5f301f3b
jffs2_scan_inode_node(): CRC failed on node at 0x0085f42c: Read 0xffffffff,
calculated 0x258b8b28
jffs2_scan_inode_node(): CRC failed on node at 0x0085f524: Read 0x3557473f,
calculated 0x025dc0cf
jffs2_scan_inode_node(): CRC failed on node at 0x0085f624: Read 0xffffffff,
calculated 0x7c258869
jffs2_scan_inode_node(): CRC failed on node at 0x0085f720: Read 0xffffffff,
calculated 0x840cddf2
jffs2_scan_inode_node(): CRC failed on node at 0x0085f820: Read 0xffffffff,
calculated 0x369a3c9d
jffs2_scan_inode_node(): CRC failed on node at 0x0085f944: Read 0xffffffff,
calculated 0x20cde416
jffs2_scan_inode_node(): CRC failed on node at 0x0085fa44: Read 0xffffffff,
calculated 0x5eb5acb0
jffs2_scan_inode_node(): CRC failed on node at 0x0085fb48: Read 0xffffffff,
calculated 0xd1424c7a
jffs2_scan_inode_node(): CRC failed on node at 0x0085fc4c: Read 0x52529d72,
calculated 0x9bae91ae
jffs2_scan_inode_node(): CRC failed on node at 0x00a0000c: Read 0x7bb3e2bb,
calculated 0xef0ad820
jffs2_scan_inode_node(): CRC failed on node at 0x00a00298: Read 0xffffffff,
calculated 0x7c8b1ae1
jffs2_scan_inode_node(): CRC failed on node at 0x00a00538: Read 0xffffffff,
calculated 0xb8ddaf93
jffs2_scan_inode_node(): CRC failed on node at 0x00a00630: Read 0x275a9e11,
calculated 0x1142c36c
jffs2_scan_inode_node(): CRC failed on node at 0x00a00728: Read 0x5b33633d,
calculated 0x4e248036
jffs2_scan_inode_node(): CRC failed on node at 0x00a00820: Read 0xffffffff,
calculated 0xc0f196c7
jffs2_scan_inode_node(): CRC failed on node at 0x00a00918: Read 0xffffffff,
calculated 0x45847470
jffs2_scan_inode_node(): CRC failed on node at 0x00a00a1c: Read 0xffffffff,
calculated 0xd6e1f52b
jffs2_scan_inode_node(): CRC failed on node at 0x00a00b10: Read 0x5d017b89,
calculated 0x66dc119c
jffs2_scan_inode_node(): CRC failed on node at 0x00a00c04: Read 0xffffffff,
calculated 0xf6651b0d
jffs2_scan_inode_node(): CRC failed on node at 0x00a00d00: Read 0xffffffff,
calculated 0xa31ffaff
Empty flash at 0x00a00df8 ends at 0x00a00e4c
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00e4c:
0xb5a6 instead
Empty flash at 0x00a00e50 ends at 0x00a00f80
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00f80:
0xa825 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00f84:
0x5ad2 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00f88:
0x736a instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00f8c:
0x0a64 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00f90:
0x6975 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00f94:
0x1b7b instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00f98:
0x3071 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00f9c:
0x8cf4 instead
Empty flash at 0x00a00fa0 ends at 0x00a00fe0
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00fe0:
0x1e97 instead
Further such events for this erase block will not be printed
jffs2_scan_inode_node(): CRC failed on node at 0x00a00fec: Read 0x7ebe65cf,
calculated 0x71f34219
jffs2_scan_inode_node(): CRC failed on node at 0x00a010e8: Read 0x1b0229b4,
calculated 0x904435a3
jffs2_scan_inode_node(): CRC failed on node at 0x00a011e4: Read 0xffffffff,
calculated 0x2805ae98
Empty flash at 0x00a012e0 ends at 0x00a0132c
Empty flash at 0x00a01330 ends at 0x00a014e4
Empty flash at 0x00a014e8 ends at 0x00a0151c
Empty flash at 0x00a01520 ends at 0x00a01530
Empty flash at 0x00a01540 ends at 0x00a01560
Empty flash at 0x00a01580 ends at 0x00a015c0
Empty flash at 0x00a015e0 ends at 0x00a01620
Empty flash at 0x00a01640 ends at 0x00a01680
Empty flash at 0x00a016a0 ends at 0x00a016e0
Empty flash at 0x00a01700 ends at 0x00a01740
Empty flash at 0x00a01760 ends at 0x00a017a0
Empty flash at 0x00a017c0 ends at 0x00a01800
Empty flash at 0x00a01820 ends at 0x00a01840
jffs2_scan_inode_node(): CRC failed on node at 0x00a01840: Read 0x945362e5,
calculated 0x371f4e2a
Empty flash at 0x00a01b98 ends at 0x00a01ca0
Empty flash at 0x00a01cc0 ends at 0x00a01d00
Empty flash at 0x00a01d20 ends at 0x00a01d40
Empty flash at 0x00a01d60 ends at 0x00a01da0
Empty flash at 0x00a01dc0 ends at 0x00a01e00
Empty flash at 0x00a01e20 ends at 0x00a01e60
Empty flash at 0x00a01e80 ends at 0x00a01ea0
Empty flash at 0x00a01ec0 ends at 0x00a01ee0
Empty flash at 0x00a01f00 ends at 0x00a01f08
jffs2_scan_inode_node(): CRC failed on node at 0x00a01f08: Read 0x728a5c77,
calculated 0x81340cd5
jffs2_scan_inode_node(): CRC failed on node at 0x00a0228c: Read 0x5578d44f,
calculated 0x34d30bab
jffs2_scan_inode_node(): CRC failed on node at 0x00a025e0: Read 0xffffffff,
calculated 0xf7d74c5e
jffs2_scan_inode_node(): CRC failed on node at 0x00a026e0: Read 0xffffffff,
calculated 0xc8fd7401
jffs2_scan_inode_node(): CRC failed on node at 0x00a027ec: Read 0x3e74c680,
calculated 0x3f495e15
JFFS2: Erase block at 0x00a00000 is not formatted. It will be erased
Eep. Child "ttyS0" (ino #204) of dir ino #4 doesn't exist!
Eep. Child "libncurses.so.5" (ino #1098) of dir ino #7 doesn't exist!
Eep. Child "rc.sysinit" (ino #442) of dir ino #286 doesn't exist!
VFS: Mounted root (jffs2 filesystem) readonly.
Freeing unused kernel memory: 68k freed
jffs2_do_read_inode() on nonexistent ino 204
init started:  BusyBox v0.60.5 (2004.08.30-17:24+0000) multi-call binary
Bad inittab entry: ttyS0::respawn:/bin/getty 9600 -
  -- Device '/dev/ttyS0' not present.
jffs2_do_read_inode() on nonexistent ino 442
/etc/rc.d/rc.sysinit: /etc/rc.d/rc.sysinit: Input/output error


What other info would be needed to figure out what's wrong with this
picture?

Thanks,

-Brian
