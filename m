Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13AYwd-0001Mp-00
	for mtd-list@infradead.org; Fri, 07 Jul 2000 15:17:31 +0100
Message-ID: <3965E670.79F93BEB@matrox.com>
Date: Fri, 07 Jul 2000 10:17:20 -0400
From: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
MIME-Version: 1.0
To: Alexander Larsson <alex@cendio.se>
CC: David Woodhouse <dwmw2@infradead.org>, Bjorn Wesen <bjorn.wesen@axis.com>,
        jffs-dev@axis.com, mtd@infradead.org
Subject: Re: jffs_erasable_size: offset = 0x0034b000
References: <Pine.LNX.3.96.1000706153526.15928A-100000@biffen.cendio.se>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Alexander Larsson wrote:
>=20
> On Thu, 6 Jul 2000, David Woodhouse wrote:
>=20
> >
> > bjorn.wesen@axis.com said:
> > >  We'll probably leave the 2.0 as it is, and when we switch to 2.4
> > > we'll either use mtd or just keep going with our own little flash.c
> > > (which works fine :)
> >
> > It looks like 2.4 will have the MTD code in it already - Linus includ=
ed
> > Tuesday's snapshot in 2.4.0-test3-pre4.
>=20
> Ouch, it's got jffs too. The invalidate_inode_pages(inode) patch should
> really be applied to it. I haven't had time to test it, but it's almost
> certainly correct, and it is broken without it.
>=20

I don't think JFFS is ready to be included in the kernel.  It hasn't
been tested a lot (the 2.2 and 2.4 ports) and I'm sure we'll find many
bugs (the invalidate_inode_pages bug is a good example of a huge bug
that we almost missed).  Just today, I untarred the source code of a
program on a JFFS partition, tried to compile it and got a read error
from jffs_readpage(). =20

I'm not sure if Linus plans on releasing 2.4 soon but I wouldn't want
JFFS to be released in the kernel is it's full of bugs.

--=20
S=E9bastien C=F4t=E9


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
