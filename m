Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZuCO-0003FT-00
	for mtd-list@infradead.org; Tue, 28 Mar 2000 12:30:16 +0100
Date: Tue, 28 Mar 2000 13:30:20 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: More comments 
In-Reply-To: <18073.954238703@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.1000328132847.17777A-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Tue, 28 Mar 2000, David Woodhouse wrote:
> alex@cendio.se said:
> > On Mon, 13 Mar 2000, David Woodhouse wrote:
> > > This has to be done somewhere. Where's best - in _every_ device dri=
ver
> > > or in only those front ends which attempt non-block-aligned access?
>=20
> > I don't know. You seem to think that it's better to have it in the
> > front-ends, and I can accept that. I think the "_every_ driver" part
> > is a bit of an overstatement though, as I would think many drivers ar=
e
> > for fully memory-mapped flashes where this wouldn't be necessary
> > (where, in fact, looping in the frontend is unnecessary overhead).
> > =20
>=20
> OK. How about this:
>=20
> You don't have to check the return from the mtd->write() function, it m=
ust=20
> always write the complete buffer or return failure.
>=20
> _BUT_ you may never make a write request which crosses a block boundary.
>=20
> So you still have to possibly issue more than one write request in the =
jffs=20
> code, but at least you can know beforehand and code accordingly, rather=
 than=20
> having a na=EFve loop.
>=20
>  (s/write/read/ throughout also applies, obviously.)
=20
Yes, this seems like a very good compromise. The jffs case is a bit
excpetional in this case.
=20
> I'm putting together some documentation.=20
>=20
> 	www.linux-mtd.infradead.org/tech/API.html
> 					/mtd_info.html
> 					/core.html
> 					/erase.html
>=20
> This will contain some changes to what's currently implemented - most n=
otably=20
> the notifier stuff will no longer have the horrible race conditions tha=
t it=20
> currently does.

 I'll read it later tonigh. Review meetings all day...

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
