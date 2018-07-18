Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffgfI-0000Gu-GQ
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 07:14:25 +0000
Date: Wed, 18 Jul 2018 09:13:32 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-wireless@vger.kernel.org, Arnd
 Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 00/24] mtd: rawnand: Improve compile-test coverage
Message-ID: <20180718091332.53da4898@xps13>
In-Reply-To: <20180709200945.30116-1-boris.brezillon@bootlin.com>
References: <20180709200945.30116-1-boris.brezillon@bootlin.com>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Mon,  9 Jul 2018
22:09:21 +0200:

> Hello,
>=20
> This is an attempt at adding "depends || COMPILE_TEST" to all NAND
> drivers that have no compile-time dependencies on arch
> features/headers.
>=20
> This will hopefully help us (NAND/MTD maintainers) in detecting build
> issues earlier. Unfortunately we still have a few drivers that can't
> easily be modified to be arch independent.
>=20
> I tried to put all patches that only touch the NAND subsystem first,
> so that they can be applied even if other patches are being discussed.
>=20
> Don't hesitate to point any missing dependencies when compiled with
> COMPILE_TEST. I didn't have any problem when compiling, but that might
> be because the dependencies were already selected.
>=20
> In this v2, I tried to fix all warnings/errors reported by kbuild/0day
> robots. The only remaining ones are those in omap_elm.c which seems to
> do some weird cpu_to_be32() conversions. I guess I could replace those
> by iowrite32be() calls (or just add (__force __u32)), but I don't want
> to risk a regression on this driver, so I'm just leaving it for someone
> else to fix :P.
>=20
> Regards,
>=20
> Boris
>=20
> Changes in v2:
> - Fix a few problems reported by kbuild robots and Stephen Rothwell
>=20
> Boris Brezillon (24):
>   mtd: rawnand: atmel: Use uintptr_t casts instead of unsigned int
>   mtd: rawnand: atmel: Add an __iomem cast on gen_pool_dma_alloc() call
>   mtd: rawnand: atmel: Allow selection of this driver when
>     COMPILE_TEST=3Dy
>   mtd: rawnand: s3c2410: Allow selection of this driver when
>     COMPILE_TEST=3Dy
>   mtd: rawnand: orion: Avoid direct inclusion of asm headers
>   mtd: rawnand: orion: Allow selection of this driver when
>     COMPILE_TEST=3Dy
>   mtd: rawnand: davinci: Stop doing iomem pointer <-> u32 conversions
>   mtd: rawnand: davinci: Use uintptr_t casts instead of unsigned ones
>   mtd: rawnand: davinci: Allow selection of this driver when
>     COMPILE_TEST=3Dy
>   mtd: rawnand: sunxi: Add an U suffix to NFC_PAGE_OP definition
>   mtd: rawnand: sunxi: Make sure ret is initialized in
>     sunxi_nfc_read_byte()
>   mtd: rawnand: sunxi: Allow selection of this driver when
>     COMPILE_TEST=3Dy
>   mtd: rawnand: fscm: Avoid collision on PC def when compiling for MIPS
>   mtd: rawnand: fsmc: Use uintptr_t casts instead of unsigned ones
>   mtd: rawnand: fsmc: Allow selection of this driver when COMPILE_TEST=3Dy
>   memory: fsl_ifc: Allow selection of this driver when COMPILE_TEST=3Dy
>   mtd: rawnand: fsl_ifc: Add an __iomem specifier on eccstat_regs
>   mtd: rawnand: fsl_ifc: Allow selection of this driver when
>     COMPILE_TEST=3Dy
>   MIPS: txx9: Move the ndfc.h header to include/linux/platform_data/txx9
>   mtd: rawnand: txx9ndfmc: Allow selection of this driver when
>     COMPILE_TEST=3Dy
>   MIPS: jz4740: Move jz4740_nand.h header to
>     include/linux/platform_data/jz4740
>   mtd: rawnand: jz4740: Allow selection of this driver when
>     COMPILE_TEST=3Dy
>   mtd: rawnand: jz4780: Drop the dependency on MACH_JZ4780
>   memory: jz4780-nemc: Allow selection of this driver when
>     COMPILE_TEST=3Dy
>=20
>  arch/mips/jz4740/board-qi_lb60.c                   |  3 +-
>  arch/mips/txx9/generic/setup.c                     |  2 +-
>  arch/mips/txx9/generic/setup_tx4938.c              |  2 +-
>  arch/mips/txx9/generic/setup_tx4939.c              |  2 +-
>  drivers/memory/Kconfig                             |  6 ++--
>  drivers/mtd/nand/raw/Kconfig                       | 33 ++++++++++++++--=
------
>  drivers/mtd/nand/raw/atmel/nand-controller.c       |  8 +++---
>  drivers/mtd/nand/raw/davinci_nand.c                | 33 ++++++++++------=
------
>  drivers/mtd/nand/raw/fsl_ifc_nand.c                |  2 +-
>  drivers/mtd/nand/raw/fsmc_nand.c                   | 33 +++++++++++-----=
------
>  drivers/mtd/nand/raw/jz4740_nand.c                 |  2 +-
>  drivers/mtd/nand/raw/orion_nand.c                  |  2 +-
>  drivers/mtd/nand/raw/sunxi_nand.c                  |  4 +--
>  drivers/mtd/nand/raw/txx9ndfmc.c                   |  2 +-
>  .../linux/platform_data/jz4740}/jz4740_nand.h      |  4 +--
>  .../linux/platform_data}/txx9/ndfmc.h              |  6 ++--
>  16 files changed, 77 insertions(+), 67 deletions(-)
>  rename {arch/mips/include/asm/mach-jz4740 =3D> include/linux/platform_da=
ta/jz4740}/jz4740_nand.h (91%)
>  rename {arch/mips/include/asm =3D> include/linux/platform_data}/txx9/ndf=
mc.h (91%)
>=20

Series applied with some typo fixes in the commit log as well as a
proper indentation forced in drivers/mtd/nand/raw/Kconfig.

Thanks,
Miqu=C3=A8l
