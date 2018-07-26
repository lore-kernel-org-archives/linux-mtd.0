Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fipi8-0000w0-8V
 for linux-mtd@lists.infradead.org; Thu, 26 Jul 2018 23:30:21 +0000
Date: Fri, 27 Jul 2018 01:30:07 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 0/4] mtd: Remove gpio.h inclusions where we can
Message-ID: <20180727013007.23c5cf75@xps13>
In-Reply-To: <20180727012915.1ae33a3e@xps13>
References: <20180720095741.6313-1-boris.brezillon@bootlin.com>
 <20180727012915.1ae33a3e@xps13>
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

Hi Miquel,

Miquel Raynal <miquel.raynal@bootlin.com> wrote on Fri, 27 Jul 2018
01:29:15 +0200:

> Hi Boris,
>=20
> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Fri, 20 Jul 2018
> 11:57:37 +0200:
>=20
> > Hello,
> >=20
> > The fix I sent here [1] lead me to look at other places including gpio.h
> > in the MTD subsystem. While some inclusions are valid, some of them can
> > be removed of replaced by gpio/consumer.h.
> >=20
> > All these changes have been compile-tested.
> >=20
> > Regards,
> >=20
> > Boris
> >=20
> > [1]http://patchwork.ozlabs.org/patch/946614/
> >=20
> > Boris Brezillon (4):
> >   mtd: rawnand: sunxi: Remove gpio.h and of_gpio.h inclusions
> >   mtd: rawnand: atmel: Stop including gpio.h
> >   mtd: rawnand: au1550nd: Remove unneeded gpio.h inclusion
> >   mtd: spi-nor: atmel-qspi: Include gpio/consumer.h instead of gpio.h
> >=20
> >  drivers/mtd/nand/raw/atmel/nand-controller.c | 1 -
> >  drivers/mtd/nand/raw/au1550nd.c              | 1 -
> >  drivers/mtd/nand/raw/sunxi_nand.c            | 2 --
> >  drivers/mtd/spi-nor/atmel-quadspi.c          | 2 +-
> >  4 files changed, 1 insertion(+), 5 deletions(-)
> >=20
>=20
> Series applied to nand/next.

Of course I was speaking about patches 1,2,3 only.
=20
>=20
> Thanks,
> Miqu=C3=A8l



--=20
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
