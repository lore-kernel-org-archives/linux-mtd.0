Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14mmni-0002q9-00
	for mtd-list@infradead.org; Tue, 10 Apr 2001 02:18:34 +0100
Received: from [63.229.30.68] (helo=seven.phocussystems.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14mmnh-0002q3-00
	for mtd@infradead.org; Tue, 10 Apr 2001 02:18:33 +0100
Subject: RE: DOC 2000 Boot Problem
MIME-Version: 1.0
Date: Mon, 9 Apr 2001 18:20:44 -0700
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-ID: <271FF2B6A3F203418C76438C8A5FDF878421@seven.phocussystems.com>
content-class: urn:content-classes:message
From: "Chris Robson" <robsonc@phocussystems.com>
To: "Ollie Lho" <ollie@sis.com.tw>
Cc: <mtd@infradead.org>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Can you give me an example of what that command line is.  I have a
root=3D/dev/nftla1 line in my lilo config file, is there something else =
I
need to do?

-- Chris


-----Original Message-----
From: Ollie Lho [mailto:ollie@sis.com.tw]
Sent: Monday, April 09, 2001 6:02 PM
To: Chris Robson
Cc: mtd@infradead.org
Subject: Re: DOC 2000 Boot Problem


Chris Robson wrote:
>=20
> Are there any issues w/ using a 8MB Disk on Chip 2000 (PN D2200-D08).
> I installed Kernel 2.4.3 w/ the MTD image from April 5.  And when the
> system boots from the DOC, I see two things:
>=20
>         During the detection of something at the very start of the
> kernel, there is garbage displayed on the       screen.
>=20
>         When the kernel is done booting, and it goes to mount root as
> /dev/nftla1 it says
>=20
>         "VFS: Cannot open root device "" or 03:05
>         Please append a correct "root=3D" boot option
>         Kernel panic:  VFS: Unable to mount root fs on 03:05
>=20

The kernel wants to mount root filesystem from /dev/hda1 rather
then /dev/nftla1. You have to issue kernel command line for
your lilo.

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
