Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 132ucJ-0002wi-00
	for mtd-list@infradead.org; Fri, 16 Jun 2000 12:48:55 +0100
Date: Fri, 16 Jun 2000 13:49:20 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org,
        =?iso-8859-1?Q?S=E9bastien_C=F4t=E9?= <scote1@matrox.com>
Subject: Re: MTD CVS update: 'mtd/fs/jffs inode-v22.c Makefile inode.c' 
In-Reply-To: <18478.961156011@cygnus.co.uk>
Message-ID: <Pine.LNX.4.10.10006161347310.32189-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Fri, 16 Jun 2000, David Woodhouse wrote:

>=20
> alex@cendio.se said:
> >  Hmmm. There is quite a lot of 'spurious' differences in the 2.2
> > version and the 2.3 version. They could be merged to be much more
> > alike.
>=20
> I know. I've imported S=E9bastien's version as-is for now, and I'm abou=
t to=20
> look at little details like making it compile :)
>=20
> After that, some of the spurious differences can be eliminated. We may =
even=20
> be able to have an 'inode-common.c' and make the v22 and v23 versions e=
ven=20
> smaller - we'll see.

A lot of it is whitespace changes. Some are optimizations, fixes and
changes I've seem to have done after S=E9bastien branched his version.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
