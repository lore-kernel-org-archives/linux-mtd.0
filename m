Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14g761-0003AY-00
	for mtd-list@infradead.org; Thu, 22 Mar 2001 15:33:53 +0000
Received: from zeus.vortex.is ([193.4.145.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14g760-0003AS-00
	for mtd@infradead.org; Thu, 22 Mar 2001 15:33:52 +0000
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <mtd@infradead.org>; Thu, 22 Mar 2001 15:33:37 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <mtd@infradead.org>;
          Thu, 22 Mar 2001 15:33:37 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: mtd_info_t.erasesize
Date: Thu, 22 Mar 2001 15:33:36 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E310A911C@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



> -----Original Message-----
> From: Alice Hennessy [mailto:ahennessy@mvista.com]
> Sent: 22. mars 2001 00:56
> To: K=E1ri Dav=ED=F0sson
> Cc: mtd@infradead.org; ahennessy@mvista.com
> Subject: Re: mtd_info_t.erasesize
>=20
> Well,
>=20
> I think you are the first one to use an Intel CFI chip that=20
> has different
> erasesizes.

o.k.

> The logic to handle different erase sizes is in the=20

Yes but I do not totally agree with that logic. It assumes that
the erasesize is the size of the biggest sector in the flashdevice.

I can only see two ways around that, either make the application aware
of
the diffrent erase_size region through the mtd_info_t structure or
make the ioctl(fd, MEMERASE,...) return where the last erase call ended,
e.g.

while(0 !=3D einfo.length){
	int erased;
	ioctl(fd, MEMERASE, &einfo, &erased);
	einfo.start+=3Derased;
	einfo.length-=3Derased;
}

> cfi_cmdset_0002.c file
> which handles
> the AMD chips but not in the cfi_cmdset_0001.c for Intel chips as yet.
> Does the Intel chip give the correct order of the erase regions in the
> query to match the order in the flash?  Special
> code had to be added for the AMD chips to figure out the=20
> correct order of
> the erase regions on the chip.

Well it seems to export the erase regions correctly. I have a small
patch that
I wan't to test better before I post it here to the cfi_cmdset_0001.c
that identifies
the erase regions correctly.

>=20
> Alice

K.D.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
