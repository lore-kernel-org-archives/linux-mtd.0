Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14d8Ek-0006oQ-00
	for mtd-list@infradead.org; Wed, 14 Mar 2001 10:10:34 +0000
Received: from zeus.vortex.is ([193.4.145.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14d8Ej-0006oK-00
	for mtd@infradead.org; Wed, 14 Mar 2001 10:10:33 +0000
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-60460U3500L350S0V35) with ESMTP id is
          for <mtd@infradead.org>; Wed, 14 Mar 2001 10:10:29 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <mtd@infradead.org>;
          Wed, 14 Mar 2001 10:10:28 +0000
content-class: urn:content-classes:message
Subject: RE: cfi_endian.h
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Mar 2001 10:10:28 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E3108AFCB@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Why is it not always CFI_HOST_ENDIAN?

K.D.

> -----Original Message-----
> From: Alice Hennessy [mailto:ahennessy@mvista.com]
> Sent: 14. mars 2001 01:50
> To: mtd@infradead.org
> Cc: ahennessy@mvista.com
> Subject: cfi_endian.h
>=20
>=20
> Hi,
>=20
> What do you think of the idea of making the choice
> of  CFI_LITTLE_ENDIAN, CFI_HOST_ENDIAN,
> CFI_BIG_ENDIAN and CFI_LART_ENDIAN configurable so
> that different boards can setup the driver via configuring physmap
> and not have to touch  the code at all (if they don't need to set vpp
> and
> just want a single device)?
>=20
> Alice
>=20
>=20
>=20
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
>=20


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
