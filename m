Received: from [208.190.191.184] (helo=sekhmet.ad.newisys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Ttpg-0002F0-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2002 00:03:04 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: MTD partitioning for AMD flash chips
Date: Thu, 24 Jan 2002 18:13:32 -0600
Message-ID: <D3A72C5007329A4F991C0DD87202259F096A38@sekhmet.ad.newisys.com>
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

I wanted to start off with the first option. I did not want to use
physmap.c and decided to create a file exactly similar to physmap.c and
created the necessary CONFIG options. I hardcoded the WINDOW_SIZE and
WINDOW_ADDR parameters in this file. Everything else is exactly similar
to the physmap file ( I looked at the example for the rpxlite board
support in the drivers/mtd directory). I started off without any
partitions. But when I did try booting the kernel, cfi_probe came back
without detecting the flash device.=20

If I use physmap directly, cfi_probe detects my flash without any
problem. What do I need to do to get the basic stuff working without
directly using the physmap file? I want to start off without partitions
and then start adding partitions to it.=20

Thanks a lot for ur input.

Navin Boppuri

-----Original Message-----
From: J=F6rn Engel [mailto:joern@wohnheim.fh-wedel.de]
Sent: Thursday, January 24, 2002 4:46 AM
To: Navin Boppuri
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD partitioning for AMD flash chips


Hi!

> I am new the MTD mailing lists. I have two AM29LV641D( 4M X 16) flash
> chips connected to a 32 bit bus.(sector size is 128k). I  would like
to
> partion this device so that I may mount a JFFS2 flash file system on
one
> of the partitions and use the rest of the device for raw data.  I do
see
> some examples to do this for some intel chips in drivers/mtd but I
dont
> see anything for the AMD chips. Is the interface similar for the AMD
> chips?

You have two options:
1. Writing your own driver for this flash type, hardcoding the
partitioning. Try physmap first and hardcode the flash size, mapping
and pertitioning, once it works.

2. Using an existing one (physmap ought to work) and using one of the
existing partition parsers. The ones in the stock kernel are all
specific to a certain bootloader, I wrote an independent one but there
is no good howto for it (yet). See
http://wh.fh-wedel.de/~joern/software/kernel/ if you are interested.

J=F6rn

--=20
Often, the most striking and innovative solutions come from realizing
that your concept of the problem was wrong.
-- Eric Raymond in "The cathedral and the bazaar"
