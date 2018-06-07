Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQrhH-0002bN-PA
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2018 09:59:13 +0000
Date: Thu, 7 Jun 2018 11:58:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: boris.brezillon@bootlin.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org,
 mark.rutland@arm.com, thierry.reding@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, dev@lynxeye.de, richard@nod.at, marcel@ziswiler.com,
 krzk@kernel.org, digetx@gmail.com, benjamin.lindqvist@endian.se,
 jonathanh@nvidia.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com,
 mirza.krak@gmail.com, linux-mtd@lists.infradead.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 3/6] mtd: rawnand: add NVIDIA Tegra NAND Flash
 controller driver
Message-ID: <20180607115848.5ef08680@xps13>
In-Reply-To: <80eb6a514e96cdbd460c6a0937a9dff9@agner.ch>
References: <20180527215442.14760-4-stefan@agner.ch>
 <80eb6a514e96cdbd460c6a0937a9dff9@agner.ch>
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

Hi Stefan,

On Thu, 31 May 2018 11:37:41 +0200, Stefan Agner <stefan@agner.ch>
wrote:

> On 27.05.2018 23:54, Stefan Agner wrote:
> > Add support for the NAND flash controller found on NVIDIA
> > Tegra 2 SoCs. This implementation does not make use of the
> > command queue feature. Regular operations/data transfers are
> > done in PIO mode. Page read/writes with hardware ECC make
> > use of the DMA for data transfer.
> >=20
> > Signed-off-by: Lucas Stach <dev@lynxeye.de>
> > Signed-off-by: Stefan Agner <stefan@agner.ch>
> > ---
> >  MAINTAINERS                       |   7 +
> >  drivers/mtd/nand/raw/Kconfig      |   6 +
> >  drivers/mtd/nand/raw/Makefile     |   1 +
> >  drivers/mtd/nand/raw/tegra_nand.c | 999 ++++++++++++++++++++++++++++++
> >  4 files changed, 1013 insertions(+)
> >  create mode 100644 drivers/mtd/nand/raw/tegra_nand.c
> >  =20
> [...]
> > +
> > +	chip->ecc.read_page =3D tegra_nand_read_page_hwecc;
> > +	chip->ecc.write_page =3D tegra_nand_write_page_hwecc;
> > +	/* Not functional for unknown reason...
> > +	chip->ecc.read_page_raw =3D tegra_nand_read_page;
> > +	chip->ecc.write_page_raw =3D tegra_nand_write_page;
> > +	*/ =20
>=20
> I am giving up on these raw read/write_page functions. Using DMA without
> HW ECC just seems not to work.

[...]

> Note that the default implementations nand_(read|write)_page_raw which
> use exec_op do work fine! Unfortunately, the PIO mode only allows 4
> bytes in a read cycle, hence raw read/write is slow...
>=20

Well, if raw accessors work in PIO mode, I suppose it's not a big deal.

Thanks for trying anyway!
Miqu=C3=A8l
