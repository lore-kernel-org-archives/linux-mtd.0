Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14ngQE-0006s3-00
	for mtd-list@infradead.org; Thu, 12 Apr 2001 13:42:02 +0100
Received: from zeus.vortex.is ([193.4.145.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14ngQD-0006rw-00
	for mtd@infradead.org; Thu, 12 Apr 2001 13:42:01 +0100
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <mtd@infradead.org>; Thu, 12 Apr 2001 12:41:55 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <mtd@infradead.org>;
          Thu, 12 Apr 2001 12:41:54 +0000
content-class: urn:content-classes:message
Subject: RE: CFI with 4 x8/x16 devices on a 32-bit bus 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Apr 2001 12:41:53 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E310A9134@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



> -----Original Message-----
> From: Joakim Tjernlund [mailto:joakim.tjernlund@lumentis.se]
> Sent: 11. apr=EDl 2001 15:05
> To: mtd@infradead.org
> Subject: RE: CFI with 4 x8/x16 devices on a 32-bit bus=20

<snip>
=20
3) 2 partitions( tried a few different sizes) - Not OK, here I get
81ff81ff81ff ... !

You get this behaviour for both partitions? Also one that has all
sectors of the same size?

<snip>

>=20
> Apparently this is chip with 2 erase sectors sizes. I suspect=20
> the different
> sector sizes
> is the cause to my problems, but I cant figure out where the=20
> problem is. I
> have
> tried with&whithout virtual regions.

Get it to work without the viertual regions. Then add the virtual
regions if you need them. Stricly speeking you anly need them if you
have a partition that you need to manage that crosses erase region
boundary. It is hightly experimental code
that has only be tested on my single 16bit wide Intel chip so it is
bound to fail
on more complex setups.

K.D.

<snip>


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
