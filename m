Received: from [208.190.191.184] (helo=sekhmet.ad.newisys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16UCvD-0003W3-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2002 20:26:04 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: MTD partitioning for AMD flash chips
Date: Fri, 25 Jan 2002 14:36:37 -0600
Message-ID: <D3A72C5007329A4F991C0DD87202259F096A39@sekhmet.ad.newisys.com>
From: "Navin Boppuri" <navin.boppuri@newisys.com>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Cc: <linux-mtd@lists.infradead.org>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Figured out what the problem was. I was using simple readb and writeb
commands instead of the __raw_readb and __raw_writeb commands used by
the physmap.c file. I see that readb and writeb use inb and outb whereas
__raw_readb stuff do pointer access to memory. I guess it has to do
something with the big-endian stuff ( I am on a PowerPC). Well, I have
the partitions working and have a file system mounted.=20

Will keep posting if I get into some more trouble. Thanks a lot for all
the help.

Navin.

-----Original Message-----
From: J=F6rn Engel [mailto:joern@wohnheim.fh-wedel.de]
Sent: Friday, January 25, 2002 3:48 AM
To: Navin Boppuri
Subject: Re: MTD partitioning for AMD flash chips


Hi!

> I wanted to start off with the first option. I did not want to use
> physmap.c and decided to create a file exactly similar to physmap.c
and
> created the necessary CONFIG options. I hardcoded the WINDOW_SIZE and
> WINDOW_ADDR parameters in this file. Everything else is exactly
similar
> to the physmap file ( I looked at the example for the rpxlite board
> support in the drivers/mtd directory). I started off without any
> partitions. But when I did try booting the kernel, cfi_probe came back
> without detecting the flash device.=20
>=20
> If I use physmap directly, cfi_probe detects my flash without any
> problem. What do I need to do to get the basic stuff working without
> directly using the physmap file? I want to start off without
partitions
> and then start adding partitions to it.=20

Tough question. It worked with physmap but not with your modified and
renamed physmap. Either you screwed up some modifications, try diffing
both files and reading carefully. Or you didn't link your code with
the kernel, perhaps you forgot to adjust Config.in or Makefile.

In any case, you are the only one to answer that question. ;-)

J=F6rn

--=20
ticks =3D jiffies;
while (ticks =3D=3D jiffies);
ticks =3D jiffies;
-- /usr/src/linux/init/main.c
