Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14oTJi-0001lK-00
	for mtd-list@infradead.org; Sat, 14 Apr 2001 17:54:34 +0100
Received: from zeus.vortex.is ([193.4.145.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14oTJg-0001lE-00
	for mtd@infradead.org; Sat, 14 Apr 2001 17:54:32 +0100
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <mtd@infradead.org>; Sat, 14 Apr 2001 16:54:13 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <mtd@infradead.org>;
          Sat, 14 Apr 2001 16:54:14 +0000
content-class: urn:content-classes:message
Subject: RE: CFI with 4 x8/x16 devices on a 32-bit bus 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Apr 2001 16:54:11 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E310A913A@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: <joakim.tjernlund@lumentis.se>,
	<mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

> -----Original Message-----
> From: Joakim Tjernlund [mailto:joakim.tjernlund@lumentis.se]
> Sent: 12. apr=EDl 2001 13:53
> To: K=E1ri Dav=ED=F0sson; mtd@infradead.org
> Subject: RE: CFI with 4 x8/x16 devices on a 32-bit bus=20
>=20
>=20
> Hi
>=20
> I been all the time wrong! I just discovered that hexl-mode i=20
> emacs is broken!
> Emacs in hexl-mode displays 81ff81ff81ff ... and od -x says=20
> fffffff ...
>=20
> Sorry about that.
>=20
> While I am at it perhaps someone can enlighten me somewhat ...
>=20
> I am a bit confused about how add_mtd_device() and=20
> add_mtd_partitions() work.
> Looking in nora.c it looks like you can partition a flash by doing=20
> a few calls to add_mtd_device() with different offsets, but=20
> if you can do
> that with add_mtd_device(), what's the point with=20
> add_mtd_partitions()?

To call a few calls to add_mtd_device() 8-)

>=20
> I am missing something here, can someone explain when and how=20
> you are supposed to
> use these two functions?

Well as you can see in add_mtd_partition() it is not a question of just
calling a couple of times to add_mtd_device(). You need set up the
correspding
device structeres etc, etc, add the virtual regions if you wan't to use
them etc,
etc....

I find it a good abstractation to add partitions to flash devices. After
you
add the partition you just access it like any other flash device, i.e.
you do not
have to know that you are accessing only part of a flash device
(partition)=20
rather than the whole device it self. It is all abstracted for you and
makes the
world a much nicer place 8-).

To summary: It is a good way to convert a simple partition description
structures
into device description structures so that the rest of the code does not
have to
know the difference of devices and partitions.

K.D.

>=20
>  Jocke


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
