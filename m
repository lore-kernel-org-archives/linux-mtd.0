Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12rHjO-0007HC-00
	for mtd-list@infradead.org; Mon, 15 May 2000 11:04:10 +0100
Received: from brie.cendio.se ([193.180.23.29] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12rHjM-0007H6-00
	for mtd@infradead.org; Mon, 15 May 2000 11:04:08 +0100
Date: Mon, 15 May 2000 12:04:06 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
Reply-To: Alexander Larsson <alex@cendio.se>
To: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@matrox.com>
cc: mtd@infradead.org
Subject: Re: ext2_lookup() and i_count
In-Reply-To: <391C586F.1FCE77B@matrox.com>
Message-ID: <Pine.LNX.3.96.1000515120001.25053A-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



On Fri, 12 May 2000, S=E9bastien C=F4t=E9 wrote:

> Alexander Larsson a =E9crit :
> >=20
> > On Thu, 11 May 2000, David Woodhouse wrote:
> >=20
> > >
> > First create your to be filesystem in a directory (call it e.g. img_d=
ir),
> > then run "mkfs.jffs img_dir > fs.jffs", this creates an image fs.jffs=
 that
> > you can copy to your flash (in the case of an mtdram flash, just do "=
cat
> > fs.jffs > /dev/mtd0". Then mount the flash "mount -t jffs /dev/mtdblo=
ck0
> > /mnt/jffs".
> >=20
> > Then just go to /mnt/jffs and play around with the filesystem. Not
> > everything works well right now, rename isn't implemented, and unlink
> > seems to have some problems.
>=20
> I tried this out today and encoutered some problems.  Most file
> operations work well (cp, rm ln -s) but I have two problems. =20

I have huge problems with rm (unlink). If i unlink a file i've recently
read i get a BUG() in clear_inode() in fs/inode.c. See my posting to
linux-kernel for more info.
Otherwise i haven't done much testing, I've mainly done separate testing
of each function as I've implemented them.
=20
> First, big file don't get mounted on the filesystem (by big I mean a fe=
w
> hundred Ks).  I tried to track the problem without luck.  Second, the
> command df always reports dans the device is full.  Since
> jffs_scan_flash()'s reports are ok, I'm wondering where df takes the
> informations from?
>=20
> Did you run into similar problems?

I haven't tried any big filesystems yet.
df probably uses jffs_statfs() (the statfs system call) to get its info.
I haven't tested this yet.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
