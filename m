Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14j1QP-0008VC-00
	for mtd-list@infradead.org; Fri, 30 Mar 2001 17:06:57 +0100
Received: from zeus.vortex.is ([193.4.145.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14j1QO-0008V6-00
	for mtd@infradead.org; Fri, 30 Mar 2001 17:06:56 +0100
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <mtd@infradead.org>; Fri, 30 Mar 2001 16:06:09 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <mtd@infradead.org>;
          Fri, 30 Mar 2001 16:06:08 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: partitions and erase regions
Date: Fri, 30 Mar 2001 16:06:08 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E3108B012@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Since there was no protest I just went ahead and commited the "virtual"
erase region
patch to mtdpart.

K.D.

> -----Original Message-----
> From: K=E1ri Dav=ED=F0sson=20
> Sent: 29. mars 2001 17:04
> To: mtd@infradead.org
> Subject: partitions and erase regions
>=20
>=20
> Hi,
>=20
> I am implementing a "virtual" erase regions for partitions.
> It looks to me that should be enough to create them in
> add_mtd_partition().
>=20
> This would make it easyer to manage partitions that cross erase region
> boundaries.
>=20
> Are there any reasons that this should not be done?
>=20
> K.D.
>=20
>=20
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
>=20


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
