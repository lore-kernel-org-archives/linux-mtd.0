Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12qKpQ-0003XF-00
	for mtd-list@infradead.org; Fri, 12 May 2000 20:10:28 +0100
Received: from morrison.matrox.com ([204.50.136.19])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12qKpO-0003X9-00
	for mtd@infradead.org; Fri, 12 May 2000 20:10:27 +0100
Message-ID: <391C586F.1FCE77B@matrox.com>
Date: Fri, 12 May 2000 15:15:59 -0400
From: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
MIME-Version: 1.0
To: Alexander Larsson <alex@cendio.se>
CC: mtd@infradead.org
Subject: Re: ext2_lookup() and i_count
References: <Pine.LNX.3.96.1000511160915.11688A-100000@biffen.cendio.se>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Alexander Larsson a =E9crit :
>=20
> On Thu, 11 May 2000, David Woodhouse wrote:
>=20
> >
> First create your to be filesystem in a directory (call it e.g. img_dir=
),
> then run "mkfs.jffs img_dir > fs.jffs", this creates an image fs.jffs t=
hat
> you can copy to your flash (in the case of an mtdram flash, just do "ca=
t
> fs.jffs > /dev/mtd0". Then mount the flash "mount -t jffs /dev/mtdblock=
0
> /mnt/jffs".
>=20
> Then just go to /mnt/jffs and play around with the filesystem. Not
> everything works well right now, rename isn't implemented, and unlink
> seems to have some problems.

I tried this out today and encoutered some problems.  Most file
operations work well (cp, rm ln -s) but I have two problems. =20

First, big file don't get mounted on the filesystem (by big I mean a few
hundred Ks).  I tried to track the problem without luck.  Second, the
command df always reports dans the device is full.  Since
jffs_scan_flash()'s reports are ok, I'm wondering where df takes the
informations from?

Did you run into similar problems?

Thanks,

--=20
S=E9bastien C=F4t=E9


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
