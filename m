Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14j7gG-0001nu-00
	for mtd-list@infradead.org; Fri, 30 Mar 2001 23:47:44 +0100
Received: from zeus.vortex.is ([193.4.145.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14j7gF-0001no-00
	for mtd@infradead.org; Fri, 30 Mar 2001 23:47:43 +0100
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <mtd@infradead.org>; Fri, 30 Mar 2001 22:47:29 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <mtd@infradead.org>;
          Fri, 30 Mar 2001 22:47:29 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: partitions and erase regions
Date: Fri, 30 Mar 2001 22:47:24 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E3108B013@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> -----Original Message-----
> From: Florian Schirmer / TayTron [mailto:schirmer@taytron.net]
> Sent: 30. mars 2001 18:00
> To: K=E1ri Dav=ED=F0sson; mtd@infradead.org
> Subject: AW: partitions and erase regions
>=20
>=20
> Hi!
>=20
> >Since there was no protest I just went ahead and commited=20
> the "virtual"
> >erase region
> >patch to mtdpart.
>=20
> Just a short question :-)
>=20
> Situation:
>=20
> 2 partitions not aligned to erase sectors. The first jffs and=20
> the second
> cramfs. What happens if jffs writes to the last sector (the=20
> shared one) and
> just in the second the block was erased the power fails. Data=20
> loss on the
> second partition?

Well partition boundaries have to be on mtd.erasesize boundaries so that
can not happen.

>=20
> If so please make virtual support a selectable option in=20
> kernel config. (If
> not already)

Will do.

>=20
> Thanks
>   Florian Schirmer

K.D.

>=20
>=20
>=20
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
>=20


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
