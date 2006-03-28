Received: from mxs1.siemens.at ([194.138.12.131])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FOGDZ-0007MP-8w
	for linux-mtd@lists.infradead.org; Tue, 28 Mar 2006 10:34:56 -0500
Received: from vies1k7x.sie.siemens.at ([158.226.129.83])
	by mxs1.siemens.at  with ESMTP id k2SFYio8004819
	for <linux-mtd@lists.infradead.org>; Tue, 28 Mar 2006 17:34:44 +0200
Received: from nets138a.ww300.siemens.net ([158.226.129.98])
	by vies1k7x.sie.siemens.at (8.12.11.20060308/8.12.1) with ESMTP id
	k2SFYh6p025119
	for <linux-mtd@lists.infradead.org>; Tue, 28 Mar 2006 17:34:44 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Mar 2006 17:34:27 +0200
Message-ID: <38F58D7B92CB20438DF49D28B572CC6F13C4B9@budgw09a.ww300.siemens.net>
From: "Selmeci, Tamas" <tamas.selmeci@siemens.com>
To: <linux-mtd@lists.infradead.org>
Subject: JFFS2 on NAND (S3C2410)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Igor is trying to make a JFFS2 based root filesystem on his developer =
board - so do I at this time.

My idea (the one and only data/root partition is JFFS2) seems not to =
work yet. If I make a jffs2 image with=20

mkfs.jffs -U -l -e 16 KiB -o ../rootfs_jffs2

the kernel identifies as jffs, not jffs2. Attempts to mount, but can =
access nothing on that (obviously, this is a jffs2 and kernel mounts as =
jffs). As I saw, struct mtd_partition has a member called mask_flags. I =
suspect this value is a kind of "partition ID", in Vivi boot loader this =
indicates JFFS2.=20

I've attempted an other method too. I created a 5th partition (the 4th =
is still cramfs). The board successfully
booted into the cramfs. I made a jffs2 image from the partition with =
mkfs.jffs2, and then copied:

dd if=3D/tmp/jffs2_image of=3D/dev/mtd4

Mounted:

mount -t jffs2 /dev/mtdblock4 /tmp/mnt

Displays a few error messages (CLEANMARKER node found at xxx has totlen =
0xc !=3D normal 0x0), but after mounting,
the directory tree seems to be OK and I can run programs from jffs2 =
partition. However, if the kernel parameter
is root=3D/dev/mtdblock4, still can't mount it.

If I try this procedure for jffs filesystem, I can't copy because cp and =
dd complain: attempt to write=20
not page aligned data. mkfs.jffs has no option like mkfs.jffs2's -p to =
pad ...

ECC check is forced to be off in this kernel (2.6.15.5).

Any idea?

Bye
--
Tamas Selmeci
Siemens PSE HU
Tel.   : +36-1-471-3861
Email  : tamas.selmeci@siemens.com
Address: H-1143 Budapest, Gizella ut 51-59
