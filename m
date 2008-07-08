Received: from gateout01.mbox.net ([165.212.64.21])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KG1qL-0000MW-FJ
	for linux-mtd@lists.infradead.org; Tue, 08 Jul 2008 01:18:10 +0000
Received: from gwsin01.mbox.net (gwsin01.mbox.net [165.212.64.13])
	by gateout01.mbox.net (Postfix) with ESMTP id 3FF2CCD385
	for <linux-mtd@lists.infradead.org>;
	Tue,  8 Jul 2008 01:13:01 +0000 (GMT)
Received: from gwsfilter01.mbox.net (cf01-lo [127.0.0.1])
	by localhost (Postfix) with SMTP id BCDBCD798E
	for <linux-mtd@lists.infradead.org>;
	Tue,  8 Jul 2008 01:12:59 +0000 (GMT)
Received: from gateout01 (gateout01.mbox.net [165.212.64.21])
	by gwsfilter01.mbox.net (Postfix) with ESMTP id 99DDCD798D
	for <linux-mtd@lists.infradead.org>;
	Tue,  8 Jul 2008 01:12:59 +0000 (GMT)
MIME-Version: 1.0
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: bad block in jffs2 partition
Date: Mon, 7 Jul 2008 19:12:37 -0600
Message-ID: <F23ABFFDB8261D40A6F6D30EA014882511CEEC97@VS6.EXCHPROD.USA.NET>
From: "Jeffrey Hall" <jhall@healthhero.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello folks,

I have an embedded device with a NAND flash partition that contains a
single bad block that was marked bad by the NAND flash manufacturer
(Samsung) during their QA process. As long as the number of bad blocks
doesn't exceed some threshold, the part is still good.=20


So, if I use:
# flash_eraseall -j /dev/mtd4
Erasing 16 Kibyte @ d3c000 -- 88 % complete. Cleanmarker written at
d3c000.
Skipping bad block at 0x00d40000
Erasing 16 Kibyte @ efc000 -- 99 % complete. Cleanmarker written at
efc000.

You can see the bad block at offset 0x00d40000.

Ok, so far so good. If I understand jffs2, it's able to handle bad
blocks, so this shouldn't be a problem.=20

But, when I mount the partition, I get:

# mount /dev/mtdblock4
mount: Mounting /dev/mtdblock4 on /usr/local failed: Input/output error

Examining the kernel log I see:

Cowardly refusing to erase blocks on filesystem with no valid JFFS2
nodes
empty_blocks 0, bad_blocks 0, c->nr_blocks 960

This looks fishy to me. So the question is: Shouldn't flash_eraseall
leave the partition in a blank, but ready to go state for the mount
command, even if the partition has a bad block in it? Any hints on what
might be happening here would be very much appreciated.

Trying this same thing on a flash part with no bad blocks in the
partition yields the correct result - the partition is mounted and
working.

Here's something else you might want to see=20
# cat /etc/fstab:

# /etc/fstab: static file system information.
#
# <file system> <mount pt>     <type>   <options>         <dump> <pass>
/dev/root       /              ext2     rw,noauto         0      1
proc            /proc          proc     defaults          0      0
devpts          /dev/pts       devpts   defaults,gid=3D5,mode=3D620   0
0
tmpfs           /tmp           tmpfs    defaults          0      0
usbfs           /proc/bus/usb  usbfs    defaults          0      0
sysfs           /sys           sysfs    defaults          0      0

/dev/sda1       /mnt/usbstick vfat
codepage=3D437,iocharset=3Diso8859-1,noauto,umask=3D0 0 0

/dev/mtdblock4  /usr/local      jffs2   rw                0       0
/dev/mtdblock5  /usr/hb         jffs2   rw                0       0
/dev/mtdblock6  /var/hbdata     jffs2   rw,noauto         0       0
/dev/mtdblock7  /var/hbdata/box jffs2   rw,noauto         0       0

Thanks,
-Jeff-
