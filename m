Received: from anchor-post-34.mail.demon.net ([194.217.242.92])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19SyG6-0004td-Fx
	for <linux-mtd@lists.infradead.org>; Thu, 19 Jun 2003 13:11:18 +0100
Date: Thu, 19 Jun 2003 13:11:13 +0100
Mime-Version: 1.0 (Apple Message framework v552)
To: linux-mtd@lists.infradead.org
From: Jasmine Strong <jasmine@regolith.co.uk>
Message-Id: <1EA30C8E-A24F-11D7-8BCC-000393AD6294@regolith.co.uk>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: quoted-printable
cc: =?KOI8-R?B?98zBxMnNydIg88/Sz8vJzg==?= <vavanchick38@mail.ru>
Subject: Fwd: None
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Once more, with feeling:

On Thursday, Jun 19, 2003, at 12:45 Europe/London, =F7=CC=C1=C4=C9=CD=C9=D2=
 =F3=CF=D2=CF=CB=C9=CE=20
wrote:
> How can I make whis two DiskOnChips work with M-System driver now? If=20=

> it possible of course.

It sounds like you have destroyed the DiskOnChip firmware.  This=20
firmware is required
for the DOS DFORMAT utility to write to the device.  Without the=20
firmware image in
the first portion of the Flash, the DoC2000 will not be recognized at=20
all, and the
Millennium will be recognized but will not work under DOS.

This happens if you do not skip the beginning of the device when you=20
erase it.  The
start of the DiskOnChip module has an IPL area in it which is used=20
under DOS to
hold the DOS driver for the device, and under Linux to hold the GRUB=20
bootloader or
similar.

You can use the Linux based doc_loadbios utility to write a new BIOS=20
image into the
device, if you have one in an appropriate format.  When you make a new=20=

filesystem
or NFTL on a DiskOnChip it's important to skip the first 64k or so, to=20=

avoid overwriting
the bootload area.  (I always leave 128kbytes free at the beginning, so=20=

as to leave
plenty of room for expanded firmware or GRUB menus and the like.)

-J.

(hope this one comes out right.)
