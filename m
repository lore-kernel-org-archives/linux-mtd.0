Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14hp9e-0008Jc-00
	for mtd-list@infradead.org; Tue, 27 Mar 2001 09:48:42 +0100
Received: from zeus.vortex.is ([193.4.145.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14hp9c-0008JU-00
	for mtd@infradead.org; Tue, 27 Mar 2001 09:48:41 +0100
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <mtd@infradead.org>; Tue, 27 Mar 2001 08:48:27 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <mtd@infradead.org>;
          Tue, 27 Mar 2001 08:48:26 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: jffs in flash?
Date: Tue, 27 Mar 2001 08:48:26 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E3108B002@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Yes, I was pointed there yesterday, i.e. to the "map" drivers.
Wrote one and commited and now I am mounting my flash partitions all
over the place...... 8-)

Thanks,

K.D.
> -----Original Message-----
> From: Xavier DEBREUIL [mailto:xde@inventel.fr]
> Sent: 27. mars 2001 08:16
> To: K=E1ri Dav=ED=F0sson
> Cc: mtd@infradead.org
> Subject: Re: jffs in flash?
>=20
>=20
> correct me if I am wrong : in sa1100-flash.c, there are=20
> several examples where
> a flash is divided into several partitions ;
>=20
> for example : I have a 16Mbit flash and I have divided it=20
> into two partitions of
> 8Mbit each
>=20
> static struct mtd_partition is_blue00_partitions[] =3D {
>    { name : "boot partition",
>     offset : 0,
>     size : 0x00200000 },
>    { name : "cramfs partition",
>     offset : 0x00200000,
>     size : 0x00200000 }
> };
>=20
>=20
>=20
> K=E1ri Dav=ED=F0sson wrote:
> >=20
> > Hi,
> >=20
> > I have one flash chip (4MB) that i want to use parts of as=20
> a disk, e.g.
> > with jffs or jffs2.
> > It seems to me that the jffs wants to use the whole chip=20
> under the fs.
> > Is this correct?
> > If not how can I tell jffs to start using the flash at some offset?
> >=20
> > Thanks,
> >=20
> > K.D.
> >=20
> > To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
>=20


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
