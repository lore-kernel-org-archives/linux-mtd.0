Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13HoAJ-0007cB-00
	for mtd-list@infradead.org; Thu, 27 Jul 2000 14:57:35 +0100
Received: from mx0.i-way.net.uk ([212.49.192.2] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13HoAI-0007c5-00
	for mtd@infradead.org; Thu, 27 Jul 2000 14:57:34 +0100
Message-ID: <00B4D286538DD311BC6E005004E9EFC729B4A6@M4EXCH>
From: Simon Munton <Simon.Munton@m4data.co.uk>
To: =?iso-8859-1?Q?S=E9bastien_C=F4t=E9?= <scote1@Matrox.COM>
Cc: "JFFS (E-mail)" <jffs-dev@axis.com>, "MTD (E-mail)"
	 <mtd@infradead.org>,
        Finn Hakansson <finn@axis.com>
Subject: RE: intrep.c update to handle gaps in the middle of the log.
Date: Thu, 27 Jul 2000 14:57:27 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> -----Original Message-----
> From: S=E9bastien C=F4t=E9 [mailto:scote1@Matrox.COM]
> Sent: 27 July 2000 02:27 pm
>=20
>=20
> Our original problem was a "hole" between two valid nodes (we=20
> forgot to
> check if the data that followed was valid in the patch) but you're
> right, it could happen to the first sector.  Maybe we should=20
> only check
> if a free space ends in the middle of a sector.  In that=20
> case, treat the
> beginning of that sector as dirty.  Would that do the trick?

Yes, I think it would.

>=20
> If we have :
>=20
> >         0x000000 - 0x2b0000:    valid nodes
> >         0x2b0000 - 0x2b7000:    all 0xff	The error occured here
> >         0x2b7000 - 0x2c0000:    all zero      We set this=20
> space as dirty
> >	  0x2c0000 - 0x2c8cff:    valid nodes
> >         0x2c8d00 - 0x75ffff:    all 0xff
> >         0x760000 - 0x76049f:    all zero
> >         0x7604a0 - 0x7dffff:    valid nodes
>=20
> (Suppose all dirty space and valid nodes starts on the beginning of a
> sector, I didn't want to do the math)
>=20
> Would the filesystem be mounted correctly or do we _have_ to set the
> first free space (where the error occured) as dirty too ?=20

In this case, how does JFFS decide where the end of the log is? Is it =
at the
start of the first free space, or the second? My gut reaction would be =
to
set all but the largest of the free spaces to be dirty.

Simon
=20


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
