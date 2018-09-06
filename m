Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fy0dg-0004x2-8R
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2018 20:12:30 +0000
Date: Thu, 6 Sep 2018 22:12:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Mike
 Dunn <mikedunn@newsguy.com>, Sergey Larin <cerg2010cerg2010@mail.ru>
Subject: Re: [PATCH v2 1/4] mtd: rawnand: Remove docg4
Message-ID: <20180906221215.230382cd@xps13>
In-Reply-To: <20180804205923.25298-1-boris.brezillon@bootlin.com>
References: <20180804205923.25298-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Sat,  4 Aug 2018
22:59:20 +0200:

> The diskonchip G4 driver does not fit very well in the raw/parallel
> NAND framework simply because such chips have an internal controller
> translating DoC-specific commands into NAND ones.
>=20
> Keeping such a driver in the raw NAND framework is a real burden for
> NAND maintainers.
>=20
> Not to mention that some parts of this driver are a bit worrisome:
>=20
> - writes are done by subpages, even though we're interfacing with an MLC
>   chip which are known to not support subpage writes very well (it might
>   be that the FTL handles the complexity for us though)
>=20
> - some part of the code are simply ignoring return codes of function that
>   can fail in a few occasions
>=20
> - there's a hack to support OOB writes when no data is provided. This
>   operation is not supported by the chip and should have been rejected,
>   and nandwrite and other userspace tools should have been patched to
>   deal with such devices
>=20
> - the driver is apparently broken when ignore_badblocks module param
>   is not set to 1 and nobody noticed that (don't know since when this
>   is the case, but it's not a recent change)
>   http://lists.infradead.org/pipermail/linux-mtd/2018-July/082472.html
>=20
> Add to that the fact that we already have a docg3 driver in
> drivers/mtd/devices/docg3.c and, looking at the code (and regs), it
> seems docg3 and docg4 have a lot in common (even the author of this
> driver seemed to have realized that interfacing with the raw NAND
> framework might have been a bad idea
> http://lists.infradead.org/pipermail/linux-mtd/2012-January/039517.html).
>=20
> For all these reasons, I'm proposing to remove this driver. If anyone
> ever wants to add support for this chip back, I'd suggest extending
> the docg3 driver instead of adding a completely new driver.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> Cc: Mike Dunn <mikedunn@newsguy.com>
> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> Cc: Sergey Larin <cerg2010cerg2010@mail.ru>
> ---
> Changes in v2:
> - none
> ---
>  drivers/mtd/nand/raw/Kconfig  |   20 -
>  drivers/mtd/nand/raw/Makefile |    1 -
>  drivers/mtd/nand/raw/docg4.c  | 1442 -----------------------------------=
------
>  3 files changed, 1463 deletions(-)
>  delete mode 100644 drivers/mtd/nand/raw/docg4.c

Series applied to nand/next.

Thanks,
Miqu=C3=A8l
