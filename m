Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Hng3-0007UV-00
	for mtd-list@infradead.org; Thu, 27 Jul 2000 14:26:19 +0100
Received: from morrison.matrox.com ([204.50.136.19])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13Hng1-0007UP-00
	for mtd@infradead.org; Thu, 27 Jul 2000 14:26:18 +0100
Message-ID: <398038AD.F763222@matrox.com>
Date: Thu, 27 Jul 2000 09:27:09 -0400
From: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
MIME-Version: 1.0
To: Simon Munton <Simon.Munton@m4data.co.uk>
CC: "JFFS (E-mail)" <jffs-dev@axis.com>, "MTD (E-mail)" <mtd@infradead.org>,
        Finn Hakansson <finn@axis.com>
Subject: Re: intrep.c update to handle gaps in the middle of the log.
References: <00B4D286538DD311BC6E005004E9EFC729B498@M4EXCH>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Simon Munton wrote:
>=20
> This update seems to bring about another problem.
>=20
> My flash image (size =3D 0x7e0000) looks like this:
>         0x000000 - 0x2c8cff:    valid nodes
>         0x2c8d00 - 0x75ffff:    all 0xff
>         0x760000 - 0x76049f:    all zero
>         0x7604a0 - 0x7dffff:    valid nodes
>=20
> With this update it results in the whole 0xff area being treated as dir=
ty.
> If I try and copy a file on to it, it reports that the file system is f=
ull.
>=20
> I think you need to restrict the amount of space treated as dirty to be=
 in a
> single erase sector. Also, if the end of the area is at an erase sector
> boundary, don't treat as dirty at all.
> Do you need to check if nodes have already been found? Won't you also g=
et
> the problem at the very start of the flash? (your original failure happ=
ened
> when you powered off mid update - but the sector being updated could ea=
sily
> have been the very first one).

Our original problem was a "hole" between two valid nodes (we forgot to
check if the data that followed was valid in the patch) but you're
right, it could happen to the first sector.  Maybe we should only check
if a free space ends in the middle of a sector.  In that case, treat the
beginning of that sector as dirty.  Would that do the trick?

If we have :

>         0x000000 - 0x2b0000:    valid nodes
>         0x2b0000 - 0x2b7000:    all 0xff	The error occured here
>         0x2b7000 - 0x2c0000:    all zero      We set this space as dirt=
y
>	  0x2c0000 - 0x2c8cff:    valid nodes
>         0x2c8d00 - 0x75ffff:    all 0xff
>         0x760000 - 0x76049f:    all zero
>         0x7604a0 - 0x7dffff:    valid nodes

(Suppose all dirty space and valid nodes starts on the beginning of a
sector, I didn't want to do the math)

Would the filesystem be mounted correctly or do we _have_ to set the
first free space (where the error occured) as dirty too ?=20

--=20
S=E9bastien C=F4t=E9


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
