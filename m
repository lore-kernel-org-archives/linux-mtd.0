Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13ECvj-0007Ky-00
	for mtd-list@infradead.org; Mon, 17 Jul 2000 16:35:39 +0100
Received: from morrison.matrox.com ([204.50.136.19])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13ECvg-0007Ks-00
	for mtd@infradead.org; Mon, 17 Jul 2000 16:35:37 +0100
Message-ID: <397327EA.DAA91382@matrox.com>
Date: Mon, 17 Jul 2000 11:36:10 -0400
From: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
MIME-Version: 1.0
To: mark.langsdorf@amd.com
CC: mtd@infradead.org
Subject: Re: Compiling MTD in the kernel
References: <0FA1031B65A9D111960900805F9FA8E103B9EFD6@txexmta8.amd.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

mark.langsdorf@amd.com wrote:
>=20
> > If I try to mount a partition using jffs (even though this partition
> > isn't jffs), I get: mount: fs type jffs not supported by kernel
>=20
>         Are you using the 2.2.16 patch of the 2000/07/04 build?  I am
> having a similar problem, and it looks like the patch does not set up
> the make files properly to handle the jffs stuff.  At least, the jffs
> is not an option with 'make menuconfig' even though the other MTD
> stuff is.

That patch worked fine for me, at least with xconfig.  It's located at
the bottom of the filesystem submenu and it's marked experimental so you
have to enable the option "Prompt for development and/or incomplete
code/drivers".  Maybe that's why you don't see it with menuconfig.
--=20
S=E9bastien C=F4t=E9


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
