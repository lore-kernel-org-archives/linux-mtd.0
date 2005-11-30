Received: from [213.151.107.2] (helo=aplicaciones)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EhONV-00016P-GE
	for linux-mtd@lists.infradead.org; Wed, 30 Nov 2005 04:35:57 -0500
Received: from aplicaciones (localhost [127.0.0.1])
	by aplicaciones (Postfix) with SMTP id 0413F2E29A9
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Nov 2005 10:09:02 +0100 (CET)
Received: from davizin (unknown [213.151.107.2])
	by aplicaciones (Postfix) with SMTP id EB54A2E29A6
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Nov 2005 10:09:01 +0100 (CET)
Message-ID: <001e01c5f58d$544a5a80$1401a8c0@davizin>
From: "David Huelves" <david.huelves@negone.com>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 30 Nov 2005 10:06:20 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 8bit
Subject: mounting jffs2 image on nand.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

NégoneDear,
    We are trying to build a jffs2 image to mount it on a /dev/mtdblock?
partition using kernel 2.6.10, we have compile kernel to support it, the
boot params are:
 "console=ttyS0,115200 root=/dev/mtdblock0 rootfstype=jffs2", we have create
the image using mkfs.jffs2 on a i386 host computer (mkfs.jffs2 -d
<root_dir> -e 16384 <image file>) our target is PXA255 and ST NAND512W3A. We
have write it to the device using U-Boot in this way: "nand write.jffs2
<source addr> <dest address of device> <size of image>". We have use nand
write.jffs2 to avoid bad blocks (but in this mtdblock partition there is no
one).
    When we reboot it complains with "Kernel PANIC" trying to mount the
device.
    If we do such with an ext3 everything works fine.
We have also record the image from inside another NAND partition using
mtd-utils crosscompiled for arm and it has also failed.

any help would be apreciated.

regards
