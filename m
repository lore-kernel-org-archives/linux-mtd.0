Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14sLjH-0007Yp-00
	for mtd-list@infradead.org; Wed, 25 Apr 2001 10:36:59 +0100
content-class: urn:content-classes:message
Subject: RE: partitions and erase regions 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Apr 2001 09:36:46 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E310A914A@kolkrabbi.flaga.is>
From: =?iso-8859-15?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>,
	<nico@cam.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: 24. apr=EDl 2001 17:41
> To: K=E1ri Dav=ED=F0sson
> Cc: mtd@infradead.org; nico@cam.org
> Subject: Re: partitions and erase regions=20
>=20
>=20
>=20
> kd@flaga.is said:
> > It sounds reasonable to me. Although I have a problem with=20
> the "major"
> > erazesize in general. The erase regions are in the flash=20
> for a reason,
> > i.e. the chip is not of one "major" erase size but of many erase
> > sizes, although most of it (untill now, who knows what AMD,=20
> Intel and
> > others might do in the future 8-)) is of one erase size.
>=20
> I have a strong suspicion that we'll never see chips without=20
> a 'major'=20

Yes you are probably right.

> erasesize. Making all clients (such as JFFS2) deal with=20
> variable erase=20
> sizes is possible, but IMHO suboptimal. If we can avoid that=20
> complexity, it=20
> would be nice.

Of course, but I was kind of arguing that maybe it might even be
simpler (code wise) to have one access mechanism to the sector
boundaries
rather than two. And we can not get away with the simple offset %
mtd->erasesize=20
because of the 'minor' erase sizes.

I have not checked the client codes or where the mtd->erasesize is used,
but I
have an image in my head that is something like,

erase_regions * er;

//Used instead of offset % mtd->erasesize =3D=3D 0
//returns 0 if on sector boundary
//nonzero otherwise
int mtd_er_isonboundary(er, offset);

//returns the size from offset to next sector boundary
int mtd_er_sizeleft(er, offfset);

There might be couple of other methods necessary, depeneding on how the
mtd->erasesize member is used.

How does JFFS[2] deal with the whole flash chip today?
If it just deals with 'major' erase size then it shurely must
simply ingore the first/last part (with 'minor' erase sizes) of the
chip.

>=20
> Perhaps, however, we should provide a way for clients which=20
> _do_ know about=20
> variable erase regions to write to partitions which don't=20
> have a 'major'=20
> erasesize.

Yes, that was my thinking of the "virtual erase region" code.

>=20
> --
> dwmw2

K.D.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
