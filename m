Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14t640-0000bg-00
	for mtd-list@infradead.org; Fri, 27 Apr 2001 12:05:28 +0100
Received: from zeus.vortex.is ([193.4.145.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14t63z-0000ba-00
	for mtd@infradead.org; Fri, 27 Apr 2001 12:05:27 +0100
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <mtd@infradead.org>; Fri, 27 Apr 2001 11:05:21 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <mtd@infradead.org>;
          Fri, 27 Apr 2001 11:05:20 +0000
Subject: FW: partitions and erase regions 
Date: Fri, 27 Apr 2001 11:05:20 -0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Message-ID: <EADB10BAC266A14A85ECBF8686A73E31459120@kolkrabbi.flaga.is>
content-class: urn:content-classes:message
From: =?iso-8859-15?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Should also have gone on the list...

-----Original Message-----
From: K=E1ri Dav=ED=F0sson=20
Sent: 27. apr=EDl 2001 11:03
To: 'David Woodhouse'
Subject: RE: partitions and erase regions=20


But how can that work?
If you call erase at offset 0x0 for 8*8K + 15*64K only the first sector
i.e. first 8K is erased not all 8 sectors.

K.D.

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: 27. apr=EDl 2001 10:59
> To: K=E1ri Dav=ED=F0sson
> Cc: mtd@infradead.org; nico@cam.org
> Subject: Re: partitions and erase regions=20
>=20
>=20
>=20
> kd@flaga.is said:
> >  How does JFFS[2] deal with the whole flash chip today? If it just
> > deals with 'major' erase size then it shurely must simply ingore the
> > first/last part (with 'minor' erase sizes) of the chip.=20
>=20
> It just ignores the fact that it has minor erase sizes. If=20
> you have 8*8K +=20
> 15*64K, then JFFS2 will just treat all the 8 minor blocks as a single=20
> normal-sized block, and will only ever ask the flash driver=20
> to erase them=20
> all together.
>=20
> --
> dwmw2
>=20
>=20
>=20


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
