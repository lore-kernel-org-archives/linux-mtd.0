Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13HoOs-0007fv-00
	for mtd-list@infradead.org; Thu, 27 Jul 2000 15:12:38 +0100
Received: from morrison.matrox.com ([204.50.136.19])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13HoOr-0007fp-00
	for mtd@infradead.org; Thu, 27 Jul 2000 15:12:37 +0100
Message-ID: <3980437F.E174E66F@matrox.com>
Date: Thu, 27 Jul 2000 10:13:19 -0400
From: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
MIME-Version: 1.0
To: Simon Munton <Simon.Munton@m4data.co.uk>
CC: "JFFS (E-mail)" <jffs-dev@axis.com>, "MTD (E-mail)" <mtd@infradead.org>,
        Finn Hakansson <finn@axis.com>
Subject: Re: intrep.c update to handle gaps in the middle of the log.
References: <00B4D286538DD311BC6E005004E9EFC729B4A6@M4EXCH>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Simon Munton wrote:
> >
> > If we have :
> >
> > >         0x000000 - 0x2b0000:    valid nodes
> > >         0x2b0000 - 0x2b7000:    all 0xff    The error occured here
> > >         0x2b7000 - 0x2c0000:    all zero      We set this
> > space as dirty
> > >       0x2c0000 - 0x2c8cff:    valid nodes
> > >         0x2c8d00 - 0x75ffff:    all 0xff
> > >         0x760000 - 0x76049f:    all zero
> > >         0x7604a0 - 0x7dffff:    valid nodes
> >
> In this case, how does JFFS decide where the end of the log is? Is it a=
t the
> start of the first free space, or the second? My gut reaction would be =
to
> set all but the largest of the free spaces to be dirty.

That seems correct to me, if you also set dirty the free space at the
beginning of the corrupted sector.

--=20
S=E9bastien C=F4t=E9


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
