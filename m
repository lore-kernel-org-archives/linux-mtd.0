Received: from nwd2mail2.analog.com ([137.71.25.51])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EJm0O-0000iK-9m
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 01:58:31 -0400
Received: from nwd2mhb2.analog.com (nwd2mhb2.analog.com [137.71.6.12])
	by nwd2mail2.analog.com (8.12.10/8.12.10) with ESMTP id j8Q5wSMY032493
	for <linux-mtd@lists.infradead.org>; Mon, 26 Sep 2005 01:58:28 -0400
Received: from nwd2exm3.ad.analog.com (nwd2exm3.ad.analog.com [10.64.51.19])
	by nwd2mhb2.analog.com (8.9.3 (PHNE_28810+JAGae91741)/8.9.3) with ESMTP
	id BAA22469 for <linux-mtd@lists.infradead.org>;
	Mon, 26 Sep 2005 01:58:22 -0400 (EDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Sep 2005 01:58:07 -0400
Message-ID: <D3664A3D9376A94BB603EE19E4AA246D512058@nwd2exm4.ad.analog.com>
From: "Li, Aubrey" <Aubrey.Li@analog.com>
To: <linux-mtd@lists.infradead.org>
Subject: Scheduling while atomic issue
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm uClinux user and when I enabled JFFS2 I got some error message
occasionally.
See below:
------------------------------------------------------------------------
---------------
scheduling while atomic: jffs2_gcd_mtd2/0x00000100/12
Stack from 03c4dbbc:<3>scheduling while atomic:
jffs2_gcd_mtd2/0x00000100/12
Stack from 03c4d998:<0>
       <0> 03Wait for 1 minutes before reboot.
c4d9e0<0> 000d69a2<0> 0011cba4<0> 03e0b200<0> 00000100<0> 0000000c<0>
00000cb5<0>
03e0b188<0>
       <0> 0011cba8<0> 00006b84<0> 03c4c000<0> 00100014<0> 0011cba4<0>
00000008<0>
00000cb5<0> 0000ffff<0>
       <0> fffffffe<0> 00006f52<0> 0000b137<0> 00000040<0> 00000000<0>
00000000<0>
00000000<0> 0023e630<0>
       <0> 0000b137<0> 0000b134<0> 0000003a<0> 02001065<0> 0009725e<0>
0006bdca<0>
0009725e<0> 0006bdae<0>
       <0> 00000000<0> 00000000<0> 00000000<0> 00000000<0> 00000000<0>
00000000<0>
00000000<0> 00000000<0>
       <0> 00000000<0> 00000000<0> 00000000<0> 00000000<0> 00000000<0>
00000000<0>
00000000<0> 00000000<0>
Call Trace:<0>
       <0> [<00008b93>]<0> [<0000ffff>]<0> [<0000b392>]<0>
[<0000ffff>]<0>
       <0> [<0000b392>]<0> [<0000ffff>]<0> [<0000b4f4>]<0>
[<00006b84>]<0>
       <0> [<000041ee>]<0> [<000042d6>]<0> [<00006b84>]<0>
[<00003c22>]<0>
       <0> [<000d69a2>]<0> [<00006b84>]<0> [<00006f52>]<0>
[<00097cf9>]<0>
       <0> [<00097cf9>]<0> [<00097d68>]<0> [<00007a8c>]<0>
[<0009725e>]<0>
       <0> [<0006bdca>]<0> [<0009725e>]<0> [<0006bdae>]<0>
[<0000ffff>]<0>
       <0> [<00007a8c>]<0> [<00007a8c>]<0> [<000972d6>]<0>
[<00023074>]<0>
       <0> [<00008d6c>]<0> [<00008d6c>]<0> [<0005d516>]<0>
[<00023074>]<0>
       <0> [<000972d6>]<0> [<000972e4>]<0> [<000081e4>]<0>
[<000093e0>]<0>
       <0> [<00003000>]<0> [<00001000>]<0> [<0005f154>]<0>
[<0005f0c0>]<0>
       <0> [<0005f66c>]<0> [<0000833e>]<0> [<00008ddc>]<0>
[<0000ffff>]<0>
       <0> [<0005d6f2>]<0> [<000634d0>]<0> [<000d6742>]<0>
[<00008ddc>]<0>
       <0> [<00008d6c>]<0> [<00008d6c>]<0> [<0006494e>]<0>
[<00064878>]<0>
       <0> [<0000197e>]<0>
------------------------------------------------------------------------
------------
Is there any patch of this issue?=20
Thanks for your suggestions.

Best Regards.
-Aubrey
