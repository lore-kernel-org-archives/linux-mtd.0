Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBJLo-0005tl-HR
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2016 10:39:59 +0000
Date: Mon, 28 Nov 2016 11:39:34 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek
 Vasut <marex@denx.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PULL] mtd: nand: 4.10 materials
Message-ID: <20161128113934.53058563@bbrezillon>
In-Reply-To: <20161127154416.6ce36b76@bbrezillon>
References: <20161127154416.6ce36b76@bbrezillon>
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

On Sun, 27 Nov 2016 15:44:16 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi Brian,
>=20
> Here is my PR for 4.10.
> As usual, don't hesitate to tell me if there's anything wrong, or fix
> things after pulling the changes if you think it does not require a new=20
> PR.
>=20

I realized I forgot to Cc the MTD ML.

> Thanks,
>=20
> Boris
>=20
> The following changes since commit 1001354ca34179f3db924eb66672442a173147=
dc:
>=20
>   Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)
>=20
> are available in the git repository at:
>=20
>   git@github.com:linux-nand/linux.git tags/nand/for-4.10
>=20
> for you to fetch changes up to 8fcfba072420518fda4b2fe00a3f3c9c3e2774e2:
>=20
>   mtd: nand: tango: Use nand_to_mtd() instead of directly accessing chip-=
>mtd (2016-11-21 11:55:59 +0100)
>=20
> ----------------------------------------------------------------
> This pull request contains the following notable changes:
> - new tango NAND controller driver
> - new ox820 NAND controller driver
> - addition of a new full-ID entry in the nand_ids table
> - rework of the s3c240 driver to support DT
> - extension of the nand_sdr_timings to expose tCCS, tPROG and tR
> - addition of a new flag to ask the core to wait for tCCS when sending
>   a RNDIN/RNDOUT command
> - addition of a new flag to ask the core to let the controller driver
>   send the READ/PROGPAGE command
>=20
> This pull request also contains minor fixes/cleanup/cosmetic changes:
> - properly support 512 ECC step size in the sunxi driver
> - improve the error messages in the pxa probe path
> - fix module autoload in the omap2 driver
> - cleanup of several nand drivers to return nand_scan{_tail}() error
>   code instead of returning -EIO
> - various cleanups in the denali driver
> - cleanups in the ooblayout handling (MTD core)
> - fix an error check in nandsim
>=20
> ----------------------------------------------------------------
> Boris Brezillon (5):
>       mtd: nand: sunxi: fix support for 512bytes ECC chunks
>       mtd: nand: add support for the TC58NVG2S0H chip
>       mtd: nand: Add a few more timings to nand_sdr_timings
>       mtd: nand: Wait tCCS after a column change
>       mtd: nand: tango: Use nand_to_mtd() instead of directly accessing c=
hip->mtd
>=20
> Javier Martinez Canillas (1):
>       mtd: nand: omap2: Fix module autoload
>=20
> Marc Gonzalez (5):
>       mtd: nand: add tango NFC dt bindings doc
>       mtd: nand: add tango NAND flash controller support
>       mtd: nand: Support controllers with custom page
>       mtd: nand: tango: Enable custom page accessors
>       mtd: nand: tango: Cleanup raw_write and raw_read
>=20
> Masahiro Yamada (38):
>       mtd: nand: denali_dt: replace clk_disable() with clk_disable_unprep=
are()
>       mtd: nand: change return type of nand_get_flash_type() to int
>       mtd: nand: ams-delta: return error code of nand_scan() on error
>       mtd: nand: cmx270: return error code of nand_scan() on error
>       mtd: nand: cs553x: return error code of nand_scan() on error
>       mtd: nand: gpio: return error code of nand_scan() on error
>       mtd: nand: mpc5121: return error code of nand_scan() on error
>       mtd: nand: tmio: return error code of nand_scan() on error
>       mtd: nand: orion: return error code of nand_scan() on error
>       mtd: nand: pasemi: return error code of nand_scan() on error
>       mtd: nand: plat_nand: return error code of nand_scan() on error
>       mtd: nand: atmel: return error code of nand_scan_ident/tail() on er=
ror
>       mtd: nand: brcmnand: return error code of nand_scan_ident/tail() on=
 error
>       mtd: nand: fsmc: return error code of nand_scan_ident/tail() on err=
or
>       mtd: nand: lpc32xx: return error code of nand_scan_ident/tail() on =
error
>       mtd: nand: mediatek: return error code of nand_scan_ident/tail() on=
 error
>       mtd: nand: mxc: return error code of nand_scan_ident/tail() on error
>       mtd: nand: omap2: return error code of nand_scan_ident/tail() on er=
ror
>       mtd: nand: vf610: return error code of nand_scan_ident/tail() on er=
ror
>       mtd: nand: cafe: return error code of nand_scan_ident() on error
>       mtd: nand: hisi504: return error code of nand_scan_ident() on error
>       mtd: nand: pxa3xx: return error code of nand_scan_ident() on error
>       mtd: nand: nandsim: remove unneeded checks for nand_scan_ident/tail=
()
>       mtd: nand: socrates: use nand_scan() for nand_scan_ident/tail() com=
bo
>       mtd: nand: denali: remove unneeded <linux/slab.h> includes
>       mtd: nand: denali: remove unused struct member denali_nand_info::idx
>       mtd: nand: denali: remove bogus comment about interrupt handler set=
up
>       mtd: nand: denali: remove detect_partition_feature()
>       mtd: nand: denali: remove "Spectra:" prefix from printk strings
>       mtd: nand: denali: remove unused struct member totalblks, blksperch=
ip
>       mtd: nand: denali: use managed devm_irq_request()
>       mtd: nand: denali: return error code from devm_request_irq() on err=
or
>       mtd: nand: denali: return error code from nand_scan_ident/tail on e=
rror
>       mtd: nand: denali: remove unneeded parentheses
>       mtd: nand: denali: remove debug lines of __FILE__, __LINE__, __func=
__
>       mtd: remove unneeded initializer in mtd_ooblayout_{get, set}_bytes()
>       mtd: use min_t() to refactor mtd_ooblayout_{get, set}_bytes()
>       mtd: remove unneeded initializer in mtd_ooblayout_count_bytes()
>=20
> Neil Armstrong (1):
>       mtd: nand: Add OX820 NAND Support
>=20
> Sergio Prado (3):
>       mtd: s3c2410: make ecc mode configurable via platform data
>       dt-bindings: mtd: add DT binding for s3c2410 flash controller
>       mtd: s3c2410: parse the device configuration from OF node
>=20
> Sudip Mukherjee (1):
>       mtd: nand: nandsim: fix error check
>=20
> Uwe Kleine-K=C3=B6nig (1):
>       mtd: nand: pxa3xx_nand: write exactly one message on probe failure
>=20
>  .../devicetree/bindings/mtd/oxnas-nand.txt         |  41 ++
>  .../devicetree/bindings/mtd/samsung-s3c2410.txt    |  56 ++
>  .../devicetree/bindings/mtd/tango-nand.txt         |  38 ++
>  arch/arm/mach-s3c24xx/common-smdk.c                |   1 +
>  arch/arm/mach-s3c24xx/mach-anubis.c                |   1 +
>  arch/arm/mach-s3c24xx/mach-at2440evb.c             |   1 +
>  arch/arm/mach-s3c24xx/mach-bast.c                  |   1 +
>  arch/arm/mach-s3c24xx/mach-gta02.c                 |   1 +
>  arch/arm/mach-s3c24xx/mach-jive.c                  |   1 +
>  arch/arm/mach-s3c24xx/mach-mini2440.c              |   1 +
>  arch/arm/mach-s3c24xx/mach-osiris.c                |   1 +
>  arch/arm/mach-s3c24xx/mach-qt2410.c                |   1 +
>  arch/arm/mach-s3c24xx/mach-rx1950.c                |   1 +
>  arch/arm/mach-s3c24xx/mach-rx3715.c                |   1 +
>  arch/arm/mach-s3c24xx/mach-vstms.c                 |   1 +
>  arch/arm/mach-s3c64xx/mach-hmt.c                   |   1 +
>  arch/arm/mach-s3c64xx/mach-mini6410.c              |   1 +
>  arch/arm/mach-s3c64xx/mach-real6410.c              |   1 +
>  drivers/mtd/mtdcore.c                              |  14 +-
>  drivers/mtd/nand/Kconfig                           |  21 +-
>  drivers/mtd/nand/Makefile                          |   2 +
>  drivers/mtd/nand/ams-delta.c                       |   5 +-
>  drivers/mtd/nand/atmel_nand.c                      |  10 +-
>  drivers/mtd/nand/brcmnand/brcmnand.c               |  10 +-
>  drivers/mtd/nand/cafe_nand.c                       |   5 +-
>  drivers/mtd/nand/cmx270_nand.c                     |   4 +-
>  drivers/mtd/nand/cs553x_nand.c                     |   5 +-
>  drivers/mtd/nand/denali.c                          | 101 +---
>  drivers/mtd/nand/denali.h                          |  12 -
>  drivers/mtd/nand/denali_dt.c                       |   3 +-
>  drivers/mtd/nand/denali_pci.c                      |   1 -
>  drivers/mtd/nand/fsmc_nand.c                       |   9 +-
>  drivers/mtd/nand/gpio.c                            |   5 +-
>  drivers/mtd/nand/hisi504_nand.c                    |   4 +-
>  drivers/mtd/nand/lpc32xx_mlc.c                     |  10 +-
>  drivers/mtd/nand/lpc32xx_slc.c                     |  10 +-
>  drivers/mtd/nand/mpc5121_nfc.c                     |   4 +-
>  drivers/mtd/nand/mtk_nand.c                        |   4 +-
>  drivers/mtd/nand/mxc_nand.c                        |  10 +-
>  drivers/mtd/nand/nand_base.c                       |  84 ++-
>  drivers/mtd/nand/nand_ids.c                        |   3 +
>  drivers/mtd/nand/nand_timings.c                    |  26 +-
>  drivers/mtd/nand/nandsim.c                         |  19 +-
>  drivers/mtd/nand/omap2.c                           |  10 +-
>  drivers/mtd/nand/orion_nand.c                      |   5 +-
>  drivers/mtd/nand/oxnas_nand.c                      | 195 ++++++
>  drivers/mtd/nand/pasemi_nand.c                     |   5 +-
>  drivers/mtd/nand/plat_nand.c                       |   5 +-
>  drivers/mtd/nand/pxa3xx_nand.c                     |  22 +-
>  drivers/mtd/nand/s3c2410.c                         | 286 ++++++---
>  drivers/mtd/nand/socrates_nand.c                   |  12 +-
>  drivers/mtd/nand/sunxi_nand.c                      |   4 +
>  drivers/mtd/nand/tango_nand.c                      | 668 +++++++++++++++=
++++++
>  drivers/mtd/nand/tmio_nand.c                       |   6 +-
>  drivers/mtd/nand/vf610_nfc.c                       |  10 +-
>  include/linux/mtd/nand.h                           |  30 +
>  include/linux/platform_data/mtd-nand-s3c2410.h     |   7 +-
>  57 files changed, 1477 insertions(+), 319 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/oxnas-nand.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/samsung-s3c2410=
.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/tango-nand.txt
>  create mode 100644 drivers/mtd/nand/oxnas_nand.c
>  create mode 100644 drivers/mtd/nand/tango_nand.c
