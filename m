Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14j7p5-0001sT-00
	for mtd-list@infradead.org; Fri, 30 Mar 2001 23:56:51 +0100
Received: from zeus.vortex.is ([193.4.145.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14j7p3-0001sN-00
	for mtd@infradead.org; Fri, 30 Mar 2001 23:56:50 +0100
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <mtd@infradead.org>; Fri, 30 Mar 2001 22:56:47 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <mtd@infradead.org>;
          Fri, 30 Mar 2001 22:56:47 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: partitions and erase regions
Date: Fri, 30 Mar 2001 22:56:46 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E310A9128@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



> -----Original Message-----
> From: Nicolas Pitre [mailto:nico@cam.org]
> Sent: 30. mars 2001 17:53
> To: K=E1ri Dav=ED=F0sson
> Cc: mtd@infradead.org
> Subject: RE: partitions and erase regions
>=20
>=20
>=20
>=20
> On Fri, 30 Mar 2001, K=E1ri Dav=ED=F0sson wrote:
>=20
> > Since there was no protest I just went ahead and commited=20
> the "virtual"
> > erase region
> > patch to mtdpart.
>=20
> Sorry, I apparently missed your original post.
>=20
> > > Hi,
> > >
> > > I am implementing a "virtual" erase regions for partitions.
> > > It looks to me that should be enough to create them in
> > > add_mtd_partition().
> > >
> > > This would make it easyer to manage partitions that cross=20
> erase region
> > > boundaries.

For my chip I have to fit bootrom in the first 0x20000 kb.
The first 0x10000 are 8 0x2000 sized sectors while the next 0x10000=20
is one sector of size 0x10000. Because of the "stupid" way of reporting
the chip with only one sectorsize (mtd.erasesize) I am  unable to erase
and otherwaise manage this part of the chip.
The natural solution to me is to make the first part of the chip a
partition
with two erase regions, i.e. the first with erase size 0x2000 and 8
sectors
and the next with erase size 0x10000 and 1 sector.

>=20
> Why do you want to have partitions that cross erase region in=20
> the first
> place?

Well for the reason above. I do not have much chance.

>=20
> The primary goal of partitions is to easily _preserve_ some=20
> parts of the
> flash while allowing free access to others.  If a writable,=20
> ence eraseable,

I am not giving that up.

> partition can start/end up in the middle of an erase region, you will
> potentially trash part of a contigous partition that was ment to be
> read-only.  Even if you preserve the erased content of the contigous
> partition to write it back afterwards, you still have the=20
> risk of a power
> failure at the right time that would rander your read-only partition
> corrupted.
>=20
>=20
> Nicolas

What I think people are misundrestanding something here.

I am not making up erase regions of arbitrary size, but rather make=20
the slave->mtd (in mtdpart.c) reflect what sectors and sizes are part
of the partition through erase regions. These "virtual" regions will
always have the same boundaries as the physical sectors and same=20
erase size as the physical erase regions but the number of sectors in
each erase region is different from the physical number.

Regards,

K.D.

>=20
>=20
>=20
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
>=20


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
