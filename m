Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13AZDa-0001On-00
	for mtd-list@infradead.org; Fri, 07 Jul 2000 15:35:02 +0100
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13AZDX-0001Oh-00
	for mtd@infradead.org; Fri, 07 Jul 2000 15:35:00 +0100
Date: Fri, 7 Jul 2000 16:33:31 +0200 (CEST)
From: Simon Kagstrom <simonk@axis.com>
To: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@matrox.com>
cc: jffs-dev@axis.com, mtd@infradead.org
Subject: Re: jffs_erasable_size: offset = 0x0034b000
In-Reply-To: <3965E670.79F93BEB@matrox.com>
Message-ID: <Pine.LNX.4.21.0007071631110.16224-100000@bitwise.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Fri, 7 Jul 2000, S=E9bastien C=F4t=E9 wrote:

> Alexander Larsson wrote:
> >=20
> > On Thu, 6 Jul 2000, David Woodhouse wrote:
> >=20
> > >
> > > bjorn.wesen@axis.com said:
> > > >  We'll probably leave the 2.0 as it is, and when we switch to 2.4
> > > > we'll either use mtd or just keep going with our own little flash=
.c
> > > > (which works fine :)
> > >
> > > It looks like 2.4 will have the MTD code in it already - Linus incl=
uded
> > > Tuesday's snapshot in 2.4.0-test3-pre4.
> >=20
> > Ouch, it's got jffs too. The invalidate_inode_pages(inode) patch shou=
ld
> > really be applied to it. I haven't had time to test it, but it's almo=
st
> > certainly correct, and it is broken without it.
> >=20
>=20
> I don't think JFFS is ready to be included in the kernel.  It hasn't
> been tested a lot (the 2.2 and 2.4 ports) and I'm sure we'll find many
> bugs (the invalidate_inode_pages bug is a good example of a huge bug
> that we almost missed).  Just today, I untarred the source code of a
> program on a JFFS partition, tried to compile it and got a read error
> from jffs_readpage(). =20

Doing write()'s with the O_APPEND flag is not working correctly in jffs. =
Some
strange read errors might occur because of that.

// Simon K=E5gstr=F6m



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
