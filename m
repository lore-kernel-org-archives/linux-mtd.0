Received: from mail2.avocent.com ([216.180.3.249] helo=mail.avocent.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CZYeY-0008Ce-A9
	for linux-mtd@lists.infradead.org; Wed, 01 Dec 2004 12:52:36 -0500
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 1 Dec 2004 11:52:23 -0600
Message-ID: <1EF69AC43C5ABC49985E42B84575ADB702F485D6@hsv-email.corp.avocent.com>
From: "Fuller, Vernon" <Vernon.Fuller@avocent.com>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 as root - magic bitmask not found errors- bad superblock?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When I mount / on /dev/mtdblock2 I can mount but I get a lot of Magic
bitmask errors. Do I have a bad superblock?  Can I trust my file system?

Here is a dump, with some debug statements (VFS: ...)

Kernel command line: console=3DttyS0,115200 mem=3D32M init=3D/bin/init
root=3D/dev/mtdblock2 rootflags=3Dphysaddr=3D0x240000 rootfstype=3Djffs2
...
Creating 4 MTD partitions on "Avocent flash":
0x00000000-0x00080000 : "Bootloader"
0x00080000-0x001e0000 : "Kernel"
0x00240000-0x006c0000 : "Filesystem"
0x00700000-0x00800000 : "PersistentStore"
...
*******
VFS: test name =3D </dev/root>
VFS: fs_name =3D <jffs2>
VFS: root name <1f:00>
*******
...
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00240020:
0x0002 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00240024:
0x2818 instead
...
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0024:
0x201e instead
Further such events for this erase block will not be printed
Old JFFS2 bitmask found at 0x003f16c4
You cannot use older JFFS2 filesystems with newer kernels
JFFS2: Erase block at 0x003e0000 is not formatted. It will be erased
VFS: tried fs_name =3D <jffs2> err=3D 0
VFS: Mounted root (jffs2 filesystem) readonly.
Mounted devfs on /dev
Freeing init memory: 52K
request_irq(serial) setup_arm_irq, irq: 15
init: can't load library 'libc.so.0'
Kernel panic: Attempted to kill init!=20
