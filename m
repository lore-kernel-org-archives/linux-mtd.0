Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gH7lY-0001h4-6m
 for linux-mtd@lists.infradead.org; Mon, 29 Oct 2018 13:39:37 +0000
Date: Mon, 29 Oct 2018 14:39:24 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Han Xu
 <han.xu@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Harvey Hunt
 <harveyhuntnexus@gmail.com>, Xiaolei Li <xiaolei.li@mediatek.com>, Maxim
 Levitsky <maximlevitsky@gmail.com>, Marc Gonzalez
 <marc.w.gonzalez@free.fr>, Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH 06/15] mtd: rawnand: Add nand_[de]select_target() helpers
Message-ID: <20181029143924.7ed5dc4f@xps13>
In-Reply-To: <20181029143647.2efe60cb@xps13>
References: <20181023185011.3356-1-boris.brezillon@bootlin.com>
 <20181023185011.3356-7-boris.brezillon@bootlin.com>
 <20181029143647.2efe60cb@xps13>
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


Miquel Raynal <miquel.raynal@bootlin.com> wrote on Mon, 29 Oct 2018
14:36:47 +0100:

> Hi Boris,
>=20
> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue, 23 Oct 2018
> 20:50:02 +0200:
>=20
> > Add a wrapper to prevent drivers and core code from directly calling
> > the ->select_chip hook which we are about to deprecate.
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> >  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |  23 +++--
> >  drivers/mtd/nand/raw/jz4740_nand.c         |   4 +-
> >  drivers/mtd/nand/raw/nand_base.c           | 114 ++++++++++++++-------
> >  drivers/mtd/nand/raw/r852.c                |   4 +-
> >  include/linux/mtd/rawnand.h                |   4 +
> >  5 files changed, 98 insertions(+), 51 deletions(-)
> >  =20
>=20
> So far I am glad to see all these changes.
>=20
> About the ->select_chip() removal, I wonder if it would not be better
> to also change the local variables "chipnr" or "chip_number" (or
> even "i") that suggest that this ID selects a chip, while it
> actually selects a die in a chip (and it is possible to have multiple
> die on a chip, so multiple CS for one single NAND chip).
>=20
> Do you think it is worth the change ? If yes, would it fit in this patch
> or is it better to do this change elsewhere?
>=20

This request actually applies to the following patches as well. Maybe we
could even find a uniform way to name it, "die_nr" or something like
this?

Miqu=C3=A8l
