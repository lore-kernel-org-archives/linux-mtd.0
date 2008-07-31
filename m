Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KOTAw-0004w5-P4
	for linux-mtd@lists.infradead.org; Thu, 31 Jul 2008 08:06:19 +0000
Subject: Re: [patch 02/13] jffs2 summary allocation: don't use vmalloc()
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200807302356.29835.david-b@pacbell.net>
References: <200807301934.m6UJYvtA012276@imap1.linux-foundation.org>
	<20080730223924.3C51136129C@adsl-69-226-248-13.dsl.pltn13.pacbell.net>
	<1217481315.9048.64.camel@sauron>
	<200807302356.29835.david-b@pacbell.net>
Content-Type: text/plain; charset=utf-8
Date: Thu, 31 Jul 2008 11:00:58 +0300
Message-Id: <1217491258.9432.20.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, trimarchimichael@yahoo.it, jwboyer@gmail.com,
	dwmw2@infradead.org, akpm@linux-foundation.org, rmk@arm.linux.org.uk
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-07-30 at 23:56 -0700, David Brownell wrote:
> > So this is not just JFFS2. Using=20
> > kmalloc() for this does not seem to be a good idea for me, because
> > indeed the buffer size may be up to 512KiB, and may even grow at some
> > point to 1MiB.
>=20
> Yeah, nobody's saying kmalloc() is the right answer.  The questions
> include who's going to change what, given that this part of the MTD
> driver interface has previously been unspecified.=20
>=20
> (DataFlash support has been around since 2003 or so; only *this year*
> did anyone suggest that buffers handed to it wouldn't work with the
> standard DMA mapping operations, and that came up in the context of
> a newish JFFS2 "summary" feature ...)

I've just glanced to JFFS2, and this sum_buf does not have to be of
eraseblock size. It should be something like a couple of NAND pages in
size, or, say, 5-10% of eraseblock size. So I would say, in this
particular case JFFS2 may be fixed an kmalloc() may be used.

The idea of this summary stuff is to speed up mount time. JFFS2, while
writing to an EB, remembers information about written nodes in
c->summary->sum_list_head. Then, when the eraseblock is close to be
full, it creates a summary node, which contains an array of information
about each node in this EB. And this summary node is written to the end
of the eraseblock. And, when JFFS2 is mounted it reads this summary node
from the end of EB, instead of scanning whole EB, which speeds up
mounting.

Obviously, JFFS2 does not need eraseblock size buffer for the summary
node. This can be fixed and the problem may be "forgotten" for some
period of time :-)


> Another perspective comes from looking at it bottom up, starting with
> what the various kinds of flash do.
>=20
>  - NOR (which I'll assume for discussion is all CFI) hasn't previously
>    considered DMA ... although the drivers/dma stuff might handle its
>    memcpy on some platforms.  (I measured it on a few systems and saw
>    no performance wins however; IMO the interface overheads hurt it.)
>=20
>  - NAND only does reads/writes of smallish pages ... in conjunction
>    with hardware ECC, DMA can help (*) but that only uses small buffers.
Yeah, of NAND page size which is 4KiB at max. now AFAIK. But it may grow
at some point.

>    Some NAND drivers *do* use DMA ... Blackfin looks like it assumes
>    the buffers are always in adjacent pages, fwiw, and PXA3 looks like
>    it always uses a bounce buffer (not very speedy).
>=20
>  - SPI (two drivers) often does writes of smaller pages than NAND, but
>    can read out the entire flash chip in a single operation.  (Which
> is
>    handy for bootstrapping and suchlike.)

Yeah, it seems that if we just fix this sum_buf in JFFS2 then anyone is
going to be happy. And we may hope that someone soon would change mtd
interfaces as well.

> Midlayers *could* use drivers/dma to shrink cpu memcpy costs, if
> they wanted.  Not sure I'd advise it just now though ... just
> saying that more than the lowest levels could do DMA.

Yeah, you are right, I did not think about this. For UBIFS that could be
a good optimization, because profiling shows it substantial amount of
time in memcpy().

> I suppose I'd rather see some mid-layer utilities offloading the
> DMA from the lower level drivers.  It seems wrong to expect two
> drivers to do the same kind of virtual-buffer to physical-pages
> mappings.  There's probably even a utility to do that, leaving
> just the task of using it when the lowest level driver (the one
> called by MTD-over-SPI drivers like m25p80/dataflash) does DMA.

Hmm, interesting idea. Is something like this is used somewhere in the
kernel?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
