Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14s050-0005uR-00
	for mtd-list@infradead.org; Tue, 24 Apr 2001 11:29:58 +0100
content-class: urn:content-classes:message
Subject: RE: partitions and erase regions 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Apr 2001 10:29:48 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E310A9148@kolkrabbi.flaga.is>
From: =?iso-8859-15?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>,
	<nico@cam.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: 23. apr=EDl 2001 14:11
> To: K=E1ri Dav=ED=F0sson
> Cc: mtd@infradead.org; nico@cam.org
> Subject: Re: partitions and erase regions=20
>=20
> How about the following rules/behaviour for MTD partitions:
>=20
>  1. For a partition to be writable, there must be a number=20
> usable as 'major'
> 	erasesize (mtd->erasesize), such that a na=EFve user of=20
> MTD can get=20
> 	erases at offsets such that offset % erasesize =3D=3D 0 to work.
>  2. If a partition covers regions of the master which have differing=20
> 	erasesizes, the information about the exact erase regions should
> 	be made available in the slave.

It sounds reasonable to me. Although I have a problem with the "major"
erazesize in
general. The erase regions are in the flash for a reason, i.e. the chip
is not
of one "major" erase size but of many erase sizes, although most of it
(untill now, who knows what AMD, Intel and others might do in the future
8-))
is of one erase size. I think it should be a long term goal to remove
the
member "mtd->erasize". It might be irresponsible of me to say that since
it seems
that a lot of the code using mtd structure depend heavily on that
member.
It might also complicate the code a lot to always go through the erase
region
structures for every erase/[un]lock and slow down e.g. filesystems that
live on
the device. Modulo division is simple and fast no one can deny that 8-)
But on the other hand it also complicates the code to have two ways of
getting to a=20
sector, i.e. mtd->erasesize and erase regions.....

>=20
> So... given a master device with 'major' erasesize 64K, which=20
> is actually=20
> 8*8K, 15*64K, this would be the result of some example partitions...
>=20
>  Partition range   Erase size(s)      Writable?
>=20
>  000000 - 020000  64K (8*8K, 1*16K)	Yes
>  020000 - 100000  64K			Yes
>=20
>  000000 - 008000  8K			Yes
>  008000 - 100000  -			No (no usable 'major'=20
> erasesize)=20
>=20
>  000000 - 010000  8K			Yes
>  010000 - 100000  64K			Yes
>=20
>  008000 - 010000  8K			Yes
>=20
> K=E1ri, if this is acceptable for your purposes (and I think it=20
> is), then we=20
> should just implement this behaviour and not have any=20
> conditional code at=20
> all.

Yes, I will try to get to it this week.


K.D.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
