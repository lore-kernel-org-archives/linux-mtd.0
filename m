Received: from ntfw.echelon.com ([205.229.50.10])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HeMER-0002Vi-Qe
	for linux-mtd@lists.infradead.org; Wed, 18 Apr 2007 22:18:48 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Got Permission denied error message when issuing flash_eraseall
	onmtd1 partition
Date: Wed, 18 Apr 2007 19:18:46 -0700
Message-ID: <BFDC5D4D8B9FB544936B508A6B8F48AA01D0898B@monk.echelon.echcorp.com>
In-reply-to: <BFDC5D4D8B9FB544936B508A6B8F48AA01D08985@monk.echelon.echcorp.com>
From: "Ian Phan" <iphan@echelon.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I finally was able to get flash_eraseall to work on /dev/mtd1 after I =
changed the minor number for the mtd character devices to even number =
(0,2,4 and 6).

=A0
# ls -lLat /dev/mtd*
brw-rw-r--=A0=A0=A0 1 root=A0=A0=A0=A0 root=A0=A0=A0=A0=A0 31,=A0=A0 3 =
Apr 18=A0 2007 /dev/mtdblock3
brw-rw-r--=A0=A0=A0 1 root=A0=A0=A0=A0 root=A0=A0=A0=A0=A0 31,=A0=A0 2 =
Apr 18=A0 2007 /dev/mtdblock2
brw-rw-r--=A0=A0=A0 1 root=A0=A0=A0=A0 root=A0=A0=A0=A0=A0 31,=A0=A0 1 =
Apr 18=A0 2007 /dev/mtdblock1
brw-rw-r--=A0=A0=A0 1 root=A0=A0=A0=A0 root=A0=A0=A0=A0=A0 31,=A0=A0 0 =
Apr 18=A0 2007 /dev/mtdblock0
crw-rw-r--=A0=A0=A0 1 root=A0=A0=A0=A0 root=A0=A0=A0=A0=A0 90,=A0=A0 6 =
Apr 19=A0 2007 /dev/mtd3
crw-rw-r--=A0=A0=A0 1 root=A0=A0=A0=A0 root=A0=A0=A0=A0=A0 90,=A0=A0 4 =
Apr 19=A0 2007 /dev/mtd2
crw-rw-r--=A0=A0=A0 1 root=A0=A0=A0=A0 root=A0=A0=A0=A0=A0 90,=A0=A0 2 =
Apr 19=A0 2007 /dev/mtd1
crw-rw-r--=A0=A0=A0 1 root=A0=A0=A0=A0 root=A0=A0=A0=A0=A0 90,=A0=A0 0 =
Apr 19=A0 2007 /dev/mtd0 #
=A0
I was able to do flashcp fs_image.jffs2 /dev/mtd1.  However when I tried =
to mount the jffs2 filesystem, I got an error "No such device" as shown =
below:

# mkdir /mnt/jffs2_fs
# mount -t jffs2 /dev/mtdblock1 /mnt/jffs2_fs
mount: Mounting /dev/mtdblock1 on /mnt/jffs2_fs failed: No such device

It seems to think that the /dev/mtdblock1 device does not exist? Any =
idea why?

Thanks,
Ian
