Date: Fri, 27 Jul 2018 01:34:06 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wenyou Yang <wenyou.yang@microchip.com>, Josh Wu
 <rainyfeeling@outlook.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>, Xiaolei Li
 <xiaolei.li@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Mans Rullgard <mans@mansr.com>,
 Stefan Agner <stefan@agner.ch>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 00/35] Allow dynamic allocations during NAND chip
 identification phase
Message-ID: <20180727013406.7749cbfd@xps13>
In-Reply-To: <20180720151527.16038-1-miquel.raynal@bootlin.com>
References: <20180720151527.16038-1-miquel.raynal@bootlin.com>
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


Miquel Raynal <miquel.raynal@bootlin.com> wrote on Fri, 20 Jul 2018
17:14:52 +0200:

> Hello,
>=20
> This series make a quite deep change in the NAND framework. Until now,
> the NAND chip identification phase could be done in two manners from the
> controller driver perspective:
>=20
> 1/ Call nand_scan()
>=20
>   or
>=20
> 1/ Call nand_scan_ident()
> 2/ Do some controller-dependent configuration
> 3/ Call nand_scan_tail().
>=20
> The fact that the identifaction could be split in two operations
> involved that in the NAND framework, it was not possible to do any
> dynamic allocation without risking a memory leak. What if the core
> allocates a structure, then the driver between nand_scan_ident() and
> nand_scan_tail() decides it cannot handle the chip and errors out?
> The structure allocated by the core is lost: it is a memory leak. One
> solution could have been to add a nand_scan_ident_cleanup() function,
> but that would mean patching all the drivers anyway to make them call
> this function when something fails between nand_scan_ident() and
> nand_scan_tail().
>=20
> To avoid this situation, we migrate all drivers to use nand_scan() in
> conjuction with the recently added hooks ->attach_chip() and
> ->detach_chip() that are part of the nand_controller structure =20
> operations. Drivers that need to tweak their configuration after
> nand_scan_ident() should implement it. Any dynamically allocated space
> in ->attach_chip() must be freed in the second hook: ->detach_chip().
>=20
> The ->detach_chip() does not have to be called upon error in the
> controller driver probe function. The nand_cleanup() helper already
> exists for that and will do the call if needed. Of course, this helper
> must be called on error after a successful nand_scan(), just like
> before.
>=20
> Once all drivers not using nand_scan() are migrated, nand_scan_ident()
> and nand_scan_tail() are unexported and only available internally.
>=20
> A previous work [1] removed the ONFI/JEDEC parameter pages and instead
> allocated a nand_parameters structure in nand_chip, embedding both
> generic entries and ONFI-related ones. The deal was, once dynamic
> allocation possible, allocate in nand_scan_ident() the ONFI strcuture
> only if actually needed. This is done in the last patches.
>=20
> This series applies on top of nand/next.
>=20
> Thank you,
> Miqu=C3=A8l
>=20
> [1] http://lists.infradead.org/pipermail/linux-mtd/2018-March/079456.html
>=20
> Changes since v3:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * Constified all the nand_controller_ops structure definitions.
> * Fixed a build issue in fsl_elbc.
> * Added a patch in the core to prevent executing nand_scan_ident if
>   maxchips is NULL.
> * Fixed the regression around the model name.
> * Used kstrdup to allocate the model.
> * The migration from char model[] to const char *model is done in a
>   separate patch.
>=20
> Changes since v2:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * Rebased on top of nand/next.
> * Adapted all drivers to declare statically a nand_controller_ops
>   structure and assign it in the probe().
> * Added the migration of the tegra_nand.c driver.
> * Moved brcmnand controller ops affectation in the probe().
>=20
> Changes since v1:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * Rebased on top of nand/next.
> * Light rewording of the cover letter about the possibility to have a
>   nand_scan_ident_cleanup() function (just as example of how this series
>   could have been done differently).
> * Changed the hooks to reside in the nand_hw_ctrl structure instead of
>   being part of nand_ecc_ctrl as these hooks are more
>   controller-related.
>=20
>=20
> Miquel Raynal (35):
>   mtd: rawnand: brcmnand: convert driver to nand_scan()
>   mtd: rawnand: cafe: convert driver to nand_scan()
>   mtd: rawnand: davinci: convert driver to nand_scan()
>   mtd: rawnand: denali: convert to nand_scan()
>   mtd: rawnand: fsl_elbc: convert driver to nand_scan()
>   mtd: rawnand: fsl_ifc: convert driver to nand_scan()
>   mtd: rawnand: fsmc: convert driver to nand_scan()
>   mtd: rawnand: gpmi: convert driver to nand_scan()
>   mtd: rawnand: hisi504: convert driver to nand_scan()
>   mtd: rawnand: jz4780: convert driver to nand_scan()
>   mtd: rawnand: lpc32xx_mlc: convert driver to nand_scan()
>   mtd: rawnand: lpc32xx_slc: convert driver to nand_scan()
>   mtd: rawnand: marvell: convert driver to nand_scan()
>   mtd: rawnand: mtk: convert driver to nand_scan()
>   mtd: rawnand: mxc: convert driver to nand_scan()
>   mtd: rawnand: nandsim: convert driver to nand_scan()
>   mtd: rawnand: omap2: convert driver to nand_scan()
>   mtd: rawnand: s3c2410: convert driver to nand_scan()
>   mtd: rawnand: sh_flctl: move all NAND chip related setup in one
>     function
>   mtd: rawnand: sh_flctl: convert driver to nand_scan()
>   mtd: rawnand: sunxi: convert driver to nand_scan()
>   mtd: rawnand: tango: convert driver to nand_scan()
>   mtd: rawnand: txx9ndfmc: rename nand controller internal structure
>   mtd: rawnand: txx9ndfmc: convert driver to nand_scan()
>   mtd: rawnand: vf610: convert driver to nand_scan()
>   mtd: rawnand: atmel: convert driver to nand_scan()
>   mtd: rawnand: sm_common: convert driver to nand_scan_with_ids()
>   mtd: rawnand: allow exiting immediately nand_scan_ident()
>   mtd: rawnand: docg4: convert driver to nand_scan()
>   mtd: rawnand: qcom: convert driver to nand_scan()
>   mtd: rawnand: jz4740: convert driver to nand_scan()
>   mtd: rawnand: tegra: convert driver to nand_scan()
>   mtd: rawnand: do not export nand_scan_[ident|tail]() anymore
>   mtd: rawnand: allocate model parameter dynamically
>   mtd: rawnand: allocate dynamically ONFI parameters during detection
>=20
>  drivers/mtd/nand/raw/atmel/nand-controller.c |  83 ++---
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c     |  47 ++-
>  drivers/mtd/nand/raw/cafe_nand.c             | 130 ++++---
>  drivers/mtd/nand/raw/davinci_nand.c          | 195 +++++-----
>  drivers/mtd/nand/raw/denali.c                | 138 +++----
>  drivers/mtd/nand/raw/docg4.c                 |  55 +--
>  drivers/mtd/nand/raw/fsl_elbc_nand.c         |  19 +-
>  drivers/mtd/nand/raw/fsl_ifc_nand.c          |  19 +-
>  drivers/mtd/nand/raw/fsmc_nand.c             | 148 ++++----
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c   |  56 +--
>  drivers/mtd/nand/raw/hisi504_nand.c          |  78 ++--
>  drivers/mtd/nand/raw/jz4740_nand.c           |  46 ++-
>  drivers/mtd/nand/raw/jz4780_nand.c           |  34 +-
>  drivers/mtd/nand/raw/lpc32xx_mlc.c           | 109 +++---
>  drivers/mtd/nand/raw/lpc32xx_slc.c           |  77 ++--
>  drivers/mtd/nand/raw/marvell_nand.c          | 205 ++++++-----
>  drivers/mtd/nand/raw/mtk_nand.c              |  75 ++--
>  drivers/mtd/nand/raw/mxc_nand.c              | 136 +++----
>  drivers/mtd/nand/raw/nand_base.c             | 132 +++++--
>  drivers/mtd/nand/raw/nand_micron.c           |   6 +-
>  drivers/mtd/nand/raw/nand_timings.c          |  12 +-
>  drivers/mtd/nand/raw/nandsim.c               |  82 +++--
>  drivers/mtd/nand/raw/omap2.c                 | 521 +++++++++++++--------=
------
>  drivers/mtd/nand/raw/qcom_nandc.c            |  71 ++--
>  drivers/mtd/nand/raw/s3c2410.c               |  30 +-
>  drivers/mtd/nand/raw/sh_flctl.c              |  57 ++-
>  drivers/mtd/nand/raw/sm_common.c             |  39 +-
>  drivers/mtd/nand/raw/sunxi_nand.c            |  43 +--
>  drivers/mtd/nand/raw/tango_nand.c            |  40 +-
>  drivers/mtd/nand/raw/tegra_nand.c            | 162 +++++----
>  drivers/mtd/nand/raw/txx9ndfmc.c             |  35 +-
>  drivers/mtd/nand/raw/vf610_nfc.c             | 127 +++----
>  include/linux/mtd/rawnand.h                  |  17 +-
>  include/linux/mtd/sh_flctl.h                 |   1 +
>  34 files changed, 1612 insertions(+), 1413 deletions(-)
>=20

After doing the requested modifications applied to nand/next:
- 3-10, 12-16, 18-22, 25, 27, 30 from v4
- then the rest from v5.

Thanks,
Miqu=C3=A8l
