Received: from avg3.hkpc.org ([202.64.133.85])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SsIz-0002kK-00
	for <linux-mtd@lists.infradead.org>; Fri, 12 Jul 2002 05:45:21 +0100
Received: from smtp2.hkpc.org ([202.64.133.13])
 by avg3.hkpc.org (NAVGW 2.5.2.11) with SMTP id M2002071212444015740
 for <linux-mtd@lists.infradead.org>; Fri, 12 Jul 2002 12:44:40 +0800
Date: Fri, 12 Jul 2002 12:47:30 +0800 (HKT)
From: Clifford Loo <kfloo@hkpc.org>
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: JFFS2 fails CRC on reboot
Message-ID: <Pine.LNX.4.33.0207121226500.2108-100000@cliffordux.hkpc.org>
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

I am working on a Motorola MPC823e with 16MB SDRAM, 8MB of 32-bit flash
and 4MB of 16-bit flash (both using Fujitsu MBM29DL32xBD).  I've ported
the MTD driver and JFFS2 from the 2.4.18 kernel to my 2.4.4 kernel (from
which we started our development).  The system boots with a ramdisk and
then mounts the 16-bit flash as JFFS2 (on /dev/mtdblock0).  Everything
seems to work fine (read/write on the JFFS2) except that I cannot execute
files from the JFFS2 partition.  For example I copied the "ls" and "cp"
program from "/bin" to "/home" (my JFFS2 partition) and tried running
them:

--------------------------------------------------------------------------
bash# ls -l /bin
total 1078
-rwxr-xr-x   1 0        0           22520 Mar 28  1998 cat
-rwxr-xr-x   1 0        0           38564 Jan  2  2002 cp
-rwxr-xr-x   1 0        0           28560 Mar 28  1998 df
-rwxr-xr-x   1 0        0           54584 Sep  7  1998 ls
-rwxr-xr-x   1 0        0           21632 Mar 28  1998 mkdir
-rwsr-xr-x   1 0        0           47688 Mar 29  1998 mount
-rwxr-xr-x   1 0        0            7408 Jan  2  2002 reboot
-rwxr-xr-x   1 0        0           24148 Jan  2  2002 rm
-rwxr-xr-x   1 0        0          430508 Jan 10  2000 sash
-rwxr-xr-x   1 0        0          380392 Feb  6  2002 sh
-rwsr-xr-x   1 0        0           28536 Mar 29  1998 umount
bash# cp -p /bin/ls .
bash# cp -p /bin/cp .
bash# ls -l
total 92
-rwxr-xr-x   1 0        0           38564 Jan  2  2002 cp
-rwxr-xr-x   1 0        0           54584 Sep  7  1998 ls
bash# ./ls -l
Data CRC 21790e5f != calculated CRC 2d77b2c5 for node at 003f007c
sh: ./ls: I/O error
bash# ./cp /linuxrc .
Data CRC 924f21d0 != calculated CRC ef3ee543 for node at 003fa508
Data CRC 924f21d0 != calculated CRC ef3ee543 for node at 003fa508
Bus error
--------------------------------------------------------------------------

Another anomaly is, when I reboot and remount the JFFS2 I got CRC errors
(see below).  Despite this, the files I've previously created on the flash
seem to be intact, and I can read them back.  Could these problems be
related, as they both seem to complain about bad CRC?

--------------------------------------------------------------------------
bash# mount -t jffs2 /dev/mtdblock0 /home
mtdblock_open
ok
jffs2_scan_eraseblock(): Node at 0x00000000 {0x1985, 0x2083, 0x0000000c)
has invalid CRC 0xf060dc98 (calculated 0x41866c0a)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008:
0xf060 instead
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00010000 {0x1985, 0x2083, 0x0000000c)
has invalid CRC 0xf060dc98 (calculated 0x41866c0a)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00010008:
0xf060 instead
JFFS2: Erase block at 0x00010000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020000:
0x5987 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020004:
0x0080 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020008:
0xf060 instead
JFFS2: Erase block at 0x00020000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00040000 {0x1985, 0x2083, 0x0000000c)
has invalid CRC 0xf060dc98 (calculated 0x41866c0a)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040008:
0xf060 instead
JFFS2: Erase block at 0x00040000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00050000:
0x5987 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00050008:
0xf060 instead
JFFS2: Erase block at 0x00050000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00060000 {0x1985, 0x2083, 0x0000000c)
has invalid CRC 0xf060dc98 (calculated 0x41866c0a)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060008:
0xf060 instead
JFFS2: Erase block at 0x00060000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00080000 {0x1985, 0x2083, 0x0000000c)
has invalid CRC 0xf060dc98 (calculated 0x41866c0a)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080008:
0xf060 instead
JFFS2: Erase block at 0x00080000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00090000:
0x5987 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00090008:
0xf060 instead
JFFS2: Erase block at 0x00090000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a0000:
0x1987 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a0008:
0xf060 instead
JFFS2: Erase block at 0x000a0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x000c0000 {0x1985, 0x2083, 0x0000000c)
has invalid CRC 0xf060dc98 (calculated 0x41866c0a)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0008:
0xf060 instead
JFFS2: Erase block at 0x000c0000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00100000 {0x1985, 0x2083, 0x0000000c)
has invalid CRC 0xf060dc98 (calculated 0x41866c0a)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100004:
0x0080 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100008:
0xf060 instead
JFFS2: Erase block at 0x00100000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00110000 {0x1985, 0x2083, 0x0000000c)
has invalid CRC 0xf060dc98 (calculated 0x41866c0a)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00110008:
0xf060 instead
JFFS2: Erase block at 0x00110000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00120000 {0x1985, 0x2083, 0x0000000c)
has invalid CRC 0xf060dc98 (calculated 0x41866c0a)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00120008:
0xf060 instead
JFFS2: Erase block at 0x00120000 is not formatted. It will be erased
jffs2_scan_eraseblock(): Node at 0x00140000 {0x1985, 0x2083, 0x0000000c)
has invalid CRC 0xf060dc98 (calculated 0x41866c0a)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00140008:
0xf060 instead
JFFS2: Erase block at 0x00140000 is not formatted. It will be erased
jffs2_scan_inode_node(): Data CRC failed on node at 0x003f007c: Read
0x21790e5f, calculated 0x2d77b2c5
jffs2_scan_inode_node(): Data CRC failed on node at 0x003f2020: Read
0x36da1adf, calculated 0x32ab5db5
jffs2_scan_inode_node(): Data CRC failed on node at 0x003f28dc: Read
0x43bb9ff2, calculated 0x444a8f0b
jffs2_scan_inode_node(): Data CRC failed on node at 0x003f3130: Read
0xd82864e8, calculated 0xde258d50
jffs2_scan_inode_node(): Data CRC failed on node at 0x003f3998: Read
0x29e7110f, calculated 0xfe907161
jffs2_scan_inode_node(): Data CRC failed on node at 0x003f528c: Read
0x1904f78a, calculated 0x987236df
jffs2_scan_inode_node(): Data CRC failed on node at 0x003f5a18: Read
0x08ab79d6, calculated 0x0f2d3958
jffs2_scan_inode_node(): Data CRC failed on node at 0x003f61a8: Read
0xab6d67dc, calculated 0x7a7559c5
jffs2_scan_inode_node(): Data CRC failed on node at 0x003f8cb4: Read
0xfbfee214, calculated 0xcae62197
jffs2_scan_inode_node(): Data CRC failed on node at 0x003f9de0: Read
0x44b142a2, calculated 0x36f39558
jffs2_scan_inode_node(): Data CRC failed on node at 0x003fa508: Read
0x924f21d0, calculated 0xef3ee543


-- 
Clifford
