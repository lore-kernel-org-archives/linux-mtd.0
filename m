Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12puJD-0008Fg-00
	for mtd-list@infradead.org; Thu, 11 May 2000 15:51:27 +0100
Received: from brie.cendio.se ([193.180.23.29] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12puJC-0008FZ-00
	for mtd@infradead.org; Thu, 11 May 2000 15:51:26 +0100
Date: Thu, 11 May 2000 16:57:01 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
cc: mtd@infradead.org
Subject: Re: ext2_lookup() and i_count
In-Reply-To: <391AC3AB.F92C72CD@matrox.com>
Message-ID: <Pine.LNX.3.96.1000511165631.13012A-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 11 May 2000, S=E9bastien C=F4t=E9 wrote:

> Alexander Larsson wrote :
>=20
> > First create your to be filesystem in a directory (call it e.g. img_d=
ir),
> > then run "mkfs.jffs img_dir > fs.jffs", this creates an image fs.jffs=
 that
> > you can copy to your flash (in the case of an mtdram flash, just do "=
cat
> > fs.jffs > /dev/mtd0". Then mount the flash "mount -t jffs /dev/mtdblo=
ck0
> > /mnt/jffs".
>=20
> How can I create these devices??  MAKEDEV doesn't know about them and
> mknod needs major/minor numbers that aren't mentionned anywhere...
>=20
> ./MAKEDEV: don't know what "mtd" is

 There is a MAKEDEV script in the utils dir that creates them.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
