Received: from web52704.mail.yahoo.com ([206.190.39.155])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CUDIF-0002t6-7J
	for linux-mtd@lists.infradead.org; Tue, 16 Nov 2004 19:03:36 -0500
Message-ID: <20041117000303.60699.qmail@web52704.mail.yahoo.com>
Date: Tue, 16 Nov 2004 16:03:03 -0800 (PST)
From: Michael <xemc@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Child dir appears to be a hard link
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.
I'm getting some strange errors.
Has anyone seen these, or could they comment on it?

...
drivers/usb/input/usbmouse.c: v1.6:USB HID Boot Protocol mouse
driver
RAMDISK: Couldn't find valid RAM disk image starting at 0.
jffs2_scan_eraseblock(): Node at 0x001185f8 {0x1985, 0xe001,
0x0000002c) has invalid CRC 0xffffffff (calculated 0xe0f1565f)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at
0x001185fc: 0x002c instead
jffs2_scan_inode_node(): CRC failed on node at 0x002079e0: Read
0xffffffff, calculated 0x0c51258b
Empty flash at 0x00207a2c ends at 0x00207c00
jffs2_scan_dirent_node(): Node CRC failed on node at 0x0022fde0:
Read 0xffffffff, calculated 0x06fef39c
jffs2_scan_dirent_node(): Node CRC failed on node at 0x0054a5f0:
Read 0xffffffff, calculated 0x9de56616
Empty flash at 0x0054a61c ends at 0x0054a800
Child dir "bin" (ino #4) of dir ino #2 appears to be a hard link
Child dir "etc" (ino #84) of dir ino #2 appears to be a hard link
Child dir "lib" (ino #90) of dir ino #2 appears to be a hard link
Child dir "mnt" (ino #112) of dir ino #2 appears to be a hard link
Child dir "usr" (ino #135) of dir ino #2 appears to be a hard link
Child dir "proc" (ino #118) of dir ino #2 appears to be a hard link
Child dir "sbin" (ino #120) of dir ino #2 appears to be a hard link
Child dir "root" (ino #119) of dir ino #2 appears to be a hard link
Child dir "devfs" (ino #83) of dir ino #2 appears to be a hard link
Child dir "lost+found" (ino #3) of dir ino #2 appears to be a hard
link
Inode #2 was a directory with children - removing those too...
VFS: Mounted root (jffs2 filesystem).
Freeing init memory: 60K
init started:  BusyBox v1.00-pre10 (2004.07.23-21:50+0000)
multi-call binary

...


I searched the archives, and they refer to using different versions
of mkfs.jffs2.  I don't use this utility, I just mount the
partition and copy the files to it directly.

Does anyone have any ideas?

Thanks a bunch,
Mike
