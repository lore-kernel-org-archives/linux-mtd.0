Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13BYAc-0007tz-00
	for mtd-list@infradead.org; Mon, 10 Jul 2000 08:40:02 +0100
Date: Mon, 10 Jul 2000 09:38:32 +0200 (CEST)
From: Simon Kagstrom <simonk@axis.com>
To: David Woodhouse <dwmw2@infradead.org>
cc: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@matrox.com>,
        Alexander Larsson <alex@cendio.se>, jffs-dev@axis.com,
        mtd@infradead.org
Subject: Re: jffs_erasable_size: offset = 0x0034b000 
In-Reply-To: <10755.963162663@cygnus.co.uk>
Message-ID: <Pine.LNX.4.21.0007100937140.21465-100000@bitwise.axis.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sun, 9 Jul 2000, David Woodhouse wrote:

>=20
> scote1@Matrox.COM said:
> > I don't think JFFS is ready to be included in the kernel.  It hasn't
> > been tested a lot (the 2.2 and 2.4 ports) and I'm sure we'll find man=
y
> > bugs (the invalidate_inode_pages bug is a good example of a huge bug
> > that we almost missed).  Just today, I untarred the source code of a
> > program on a JFFS partition, tried to compile it and got a read error
> > from jffs_readpage(). =20
>=20
> It wasn't really my intention to send it in - it was in the tarball I s=
ent=20
> to Linus out of habit because I've been doing it every time I've releas=
ed=20
> one for some time - I'm amazed that he actually took it.
>=20
> But now it's in, it does seem to have attracted some attention, and wit=
h it=20
> at least one bug fix so far - which can only really be a good thing.=20

What bug fix is that?
=20
// Simon K=E5gstr=F6m



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
