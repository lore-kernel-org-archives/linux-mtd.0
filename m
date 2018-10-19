Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDP6g-0001Gx-EN
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 07:22:06 +0000
Date: Fri, 19 Oct 2018 09:21:40 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard.weinberger@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: nand: Changes for 4.20
Message-ID: <20181019092140.78e6a3d6@bbrezillon>
In-Reply-To: <20181014191621.1ec457fd@xps13>
References: <20181014191621.1ec457fd@xps13>
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

On Sun, 14 Oct 2018 19:16:21 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hello,
>=20
> This is the NAND PR for 4.20.
>=20
> Thanks,
> Miqu=C3=A8l
>=20
> The following changes since commit
> 57361846b52bc686112da6ca5368d11210796804:
>=20
>   Linux 4.19-rc2 (2018-09-02 14:37:30 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.infradead.org/linux-mtd.git nand/for-4.20
>=20
> for you to fetch changes up to 53c83b59759c1ee213f5ffa194909daee8902a28:
>=20
>   mtd: rawnand: marvell: fix the IRQ handler complete() condition (2018-1=
0-08 10:00:10 +0200)

Merged in mtd/next.

Thanks,

Boris

>=20
> ----------------------------------------------------------------
> NAND core changes:
> - Two batchs of cleanups of the NAND API, including:
>   * Deprecating a lot of interfaces (now replaced by ->exec_op()).
>   * Moving code in separate drivers (JEDEC, ONFI), in private files
>     (internals), in platform drivers, etc.
>   * Functions/structures reordering.
>   * Exclusive use of the nand_chip structure instead of the MTD one
>     all across the subsystem.
> - Addition of the nand_wait_readrdy/rdy_op() helpers.
>=20
> Raw NAND controllers drivers changes:
> - Various coccinelle patches.
> - Marvell:
>   * Use regmap_update_bits() for syscon access.
>   * More documentation.
>   * BCH failure path rework.
>   * More layouts to be supported.
>   * IRQ handler complete() condition fixed.
> - Fsl_ifc:
>   * SRAM initialization fixed for newer controller versions.
> - Denali:
>   * Fix licenses mismatch and use a SPDX tag.
>   * Set SPARE_AREA_SKIP_BYTES register to 8 if unset.
> - Qualcomm:
>   * Do not include dma-direct.h.
> - Docg4:
>   * Removed.
> - Ams-delta:
>   * Use of a GPIO lookup table
>   * Internal machinery changes.
>=20
> Raw NAND chip drivers changes:
> - Toshiba:
>   * Add support for Toshiba memory BENAND
>   * Pass a single nand_chip object to the status helper.
> - ESMT:
>   * New driver to retrieve the ECC requirements from the 5th ID byte.
>=20
> ----------------------------------------------------------------
> Boris Brezillon (50):
>       mtd: rawnand: Add the nand_wait_readrdy() helper and use it
>       mtd: rawnand: Add the nand_wait_rdy_op() helper and use it
>       mtd: rawnand: Get rid of the ->read_word() hook
>       mtd: rawnand: plat_nand: Pass a nand_chip object to all platform_na=
nd_ctrl hooks
>       mtd: rawnand: Pass a nand_chip object to nand_scan()
>       mtd: rawnand: Pass a nand_chip object to nand_release()
>       mtd: rawnand: Pass a nand_chip object to nand_wait_ready()
>       mtd: rawnand: Pass a nand_chip object to ecc->hwctl()
>       mtd: rawnand: Pass a nand_chip object to ecc->calculate()
>       mtd: rawnand: Pass a nand_chip object to ecc->correct()
>       mtd: rawnand: Pass a nand_chip object to ecc->read_xxx() hooks
>       mtd: rawnand: Pass a nand_chip object to ecc->write_xxx() hooks
>       mtd: rawnand: Pass a nand_chip object to chip->read_xxx() hooks
>       mtd: rawnand: Pass a nand_chip object to chip->write_xxx() hooks
>       mtd: rawnand: Pass a nand_chip object to chip->select_chip()
>       mtd: rawnand: Pass a nand_chip object to chip->block_xxx() hooks
>       mtd: rawnand: Pass a nand_chip object to chip->cmd_ctrl()
>       mtd: rawnand: Pass a nand_chip object to chip->dev_ready()
>       mtd: rawnand: Pass a nand_chip object to chip->cmdfunc()
>       mtd: rawnand: Pass a nand_chip object to chip->waitfunc()
>       mtd: rawnand: Pass a nand_chip object to chip->erase()
>       mtd: rawnand: Pass a nand_chip object to chip->{get, set}_features()
>       mtd: rawnand: Pass a nand_chip object to chip->setup_read_retry()
>       mtd: rawnand: Pass a nand_chip object to chip->setup_data_interface=
()
>       mtd: rawnand: Pass a nand_chip object to all nand_xxx_bbt() helpers
>       mtd: rawnand: Pass a nand_chip object nand_erase_nand()
>       mtd: rawnand: Remove docg4
>       ARM: pxa: palmtreo: Drop docg4 specific init
>       mtd: rawnand: Make maxchips an unsigned int
>       mtd: rawnand: Do not treat !maxchips specially in nand_scan_with_id=
s()
>       mtd: rawnand: Leave chip->IO_ADDR_{R, W} to NULL when unused
>       mtd: rawnand: Create a legacy struct and move ->IO_ADDR_{R, W} there
>       mtd: rawnand: Deprecate ->{read, write}_{byte, buf}() hooks
>       mtd: rawnand: Deprecate ->cmd_ctrl() and ->cmdfunc()
>       mtd: rawnand: Deprecate ->dev_ready() and ->waitfunc()
>       mtd: rawnand: Deprecate ->block_{bad,markbad}() hooks
>       mtd: rawnand: Deprecate ->erase()
>       mtd: rawnand: Deprecate ->{set,get}_features() hooks
>       mtd: rawnand: Deprecate ->chip_delay
>       mtd: rawnand: Move function prototypes after struct declarations
>       mtd: rawnand: Get rid of nand_flash_dev forward declation
>       mtd: rawnand: Get rid of the duplicate nand_chip forward declaration
>       mtd: rawnand: Get rid of a few unused definitions
>       mtd: rawnand: Move platform_nand_xxx definitions out of rawnand.h
>       mtd: rawnand: Inline onfi_get_async_timing_mode()
>       mtd: rawnand: Keep all internal stuff private
>       mtd: rawnand: Move legacy code to nand_legacy.c
>       mtd: rawnand: Move ONFI code to nand_onfi.c
>       mtd: rawnand: Move JEDEC code to nand_jedec.c
>       mtd: rawnand: Allow selection of ECC byte ordering at runtime
>=20
> Christoph Hellwig (1):
>       mtd: rawnand: qcom: don't include dma-direct.h
>=20
> Colin Ian King (1):
>       mtd: rawnand: r852: fix spelling mistake "card_registred" -> "card_=
registered"
>=20
> Gustavo A. R. Silva (3):
>       mtd: rawnand: jz4780: use struct_size() in devm_kzalloc()
>       mtd: rawnand: atmel: use struct_size() in devm_kzalloc()
>       mtd: rawnand: atmel: Fix potential NULL pointer dereference
>=20
> Janusz Krzysztofik (4):
>       mtd: rawnand: ams-delta: use GPIO lookup table
>       mtd: rawnand: ams-delta: show parent device in sysfs
>       mtd: rawnand: ams-delta: Use private structure
>       mtd: rawnand: ams-delta: Set port direction when needed
>=20
> KOBAYASHI Yoshitake (1):
>       mtd: rawnand: toshiba: Add support for Toshiba Memory BENAND (Built=
-in ECC NAND)
>=20
> Konstantin Porotchkin (1):
>       mtd: rawnand: marvell: Add support for 8kiB pages NAND chips layout
>=20
> Kurt Kanzenbach (2):
>       mtd: rawnand: fsl_ifc: check result of SRAM initialization
>       mtd: rawnand: fsl_ifc: fixup SRAM init for newer ctrl versions
>=20
> Marcel Ziswiler (2):
>       mtd: rawnand: reorder NAND manufacturer IDs
>       mtd: rawnand: ESMT: retrieve ECC requirements from 5th id byte
>=20
> Masahiro Yamada (2):
>       mtd: rawnand: denali: use SPDX-License-Identifier and fix license m=
ismatch
>       mtd: rawnand: denali: set SPARE_AREA_SKIP_BYTES register to 8 if un=
set
>=20
> Miquel Raynal (6):
>       mtd: rawnand: marvell: document a bit more the driver
>       Documentation: mtd: remove stale pxa3xx NAND controller documentati=
on
>       mtd: rawnand: marvell: rework BCH engine failure path
>       mtd: rawnand: marvell: support 8b/512B strength for 2kiB pages layo=
ut
>       mtd: rawnand: toshiba: Pass a single nand_chip object to the status=
 helper
>       mtd: rawnand: marvell: fix the IRQ handler complete() condition
>=20
> Nathan Chancellor (1):
>       mtd: rawnand: sh_flctl: Use proper enum for flctl_dma_fifo0_transfer
>=20
> Rob Herring (1):
>       mtd: rawnand: Convert to using %pOFn instead of device_node.name
>=20
> Thomas Petazzoni (1):
>       mtd: rawnand: marvell: use regmap_update_bits() for syscon access
>=20
>  Documentation/driver-api/mtdnand.rst             |   34 +-
>  Documentation/mtd/nand/pxa3xx-nand.txt           |  113 --
>  arch/arm/mach-ep93xx/snappercl15.c               |   15 +-
>  arch/arm/mach-ep93xx/ts72xx.c                    |   16 +-
>  arch/arm/mach-imx/mach-qong.c                    |   17 +-
>  arch/arm/mach-ixp4xx/ixdp425-setup.c             |    6 +-
>  arch/arm/mach-omap1/board-fsample.c              |    5 +-
>  arch/arm/mach-omap1/board-h2.c                   |    5 +-
>  arch/arm/mach-omap1/board-h3.c                   |    4 +-
>  arch/arm/mach-omap1/board-nand.c                 |    5 +-
>  arch/arm/mach-omap1/board-perseus2.c             |    5 +-
>  arch/arm/mach-omap1/common.h                     |    4 +-
>  arch/arm/mach-orion5x/ts78xx-setup.c             |   27 +-
>  arch/arm/mach-pxa/balloon3.c                     |   13 +-
>  arch/arm/mach-pxa/em-x270.c                      |   14 +-
>  arch/arm/mach-pxa/palmtreo.c                     |   31 -
>  arch/arm/mach-pxa/palmtx.c                       |   10 +-
>  arch/mips/alchemy/devboards/db1200.c             |   14 +-
>  arch/mips/alchemy/devboards/db1300.c             |   14 +-
>  arch/mips/alchemy/devboards/db1550.c             |   14 +-
>  arch/mips/netlogic/xlr/platform-flash.c          |    7 +-
>  arch/mips/pnx833x/common/platform.c              |    8 +-
>  arch/mips/rb532/devices.c                        |   10 +-
>  arch/sh/boards/mach-migor/setup.c                |   14 +-
>  drivers/mtd/nand/raw/Kconfig                     |   20 -
>  drivers/mtd/nand/raw/Makefile                    |    6 +-
>  drivers/mtd/nand/raw/ams-delta.c                 |  249 ++--
>  drivers/mtd/nand/raw/atmel/nand-controller.c     |  111 +-
>  drivers/mtd/nand/raw/au1550nd.c                  |  124 +-
>  drivers/mtd/nand/raw/bcm47xxnflash/main.c        |    2 +-
>  drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c |   56 +-
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c         |   93 +-
>  drivers/mtd/nand/raw/cafe_nand.c                 |   74 +-
>  drivers/mtd/nand/raw/cmx270_nand.c               |   48 +-
>  drivers/mtd/nand/raw/cs553x_nand.c               |   75 +-
>  drivers/mtd/nand/raw/davinci_nand.c              |   93 +-
>  drivers/mtd/nand/raw/denali.c                    |  151 +-
>  drivers/mtd/nand/raw/denali.h                    |   10 +-
>  drivers/mtd/nand/raw/denali_dt.c                 |   12 +-
>  drivers/mtd/nand/raw/denali_pci.c                |   10 +-
>  drivers/mtd/nand/raw/diskonchip.c                |  156 +-
>  drivers/mtd/nand/raw/docg4.c                     | 1442 ----------------=
--
>  drivers/mtd/nand/raw/fsl_elbc_nand.c             |   70 +-
>  drivers/mtd/nand/raw/fsl_ifc_nand.c              |  106 +-
>  drivers/mtd/nand/raw/fsl_upm.c                   |   66 +-
>  drivers/mtd/nand/raw/fsmc_nand.c                 |   44 +-
>  drivers/mtd/nand/raw/gpio.c                      |   29 +-
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c        |    3 +-
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c       |  111 +-
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h       |    2 +-
>  drivers/mtd/nand/raw/hisi504_nand.c              |   68 +-
>  drivers/mtd/nand/raw/internals.h                 |  115 ++
>  drivers/mtd/nand/raw/jz4740_nand.c               |   53 +-
>  drivers/mtd/nand/raw/jz4780_nand.c               |   42 +-
>  drivers/mtd/nand/raw/lpc32xx_mlc.c               |   59 +-
>  drivers/mtd/nand/raw/lpc32xx_slc.c               |   83 +-
>  drivers/mtd/nand/raw/marvell_nand.c              |  271 ++--
>  drivers/mtd/nand/raw/mpc5121_nfc.c               |   65 +-
>  drivers/mtd/nand/raw/mtk_nand.c                  |   93 +-
>  drivers/mtd/nand/raw/mxc_nand.c                  |  114 +-
>  drivers/mtd/nand/raw/nand_amd.c                  |    2 +-
>  drivers/mtd/nand/raw/nand_base.c                 | 1721 +++++-----------=
------
>  drivers/mtd/nand/raw/nand_bbt.c                  |   24 +-
>  drivers/mtd/nand/raw/nand_bch.c                  |   10 +-
>  drivers/mtd/nand/raw/nand_ecc.c                  |   99 +-
>  drivers/mtd/nand/raw/nand_esmt.c                 |   47 +
>  drivers/mtd/nand/raw/nand_hynix.c                |   15 +-
>  drivers/mtd/nand/raw/nand_ids.c                  |   26 +-
>  drivers/mtd/nand/raw/nand_jedec.c                |  113 ++
>  drivers/mtd/nand/raw/nand_legacy.c               |  642 ++++++++
>  drivers/mtd/nand/raw/nand_macronix.c             |    2 +-
>  drivers/mtd/nand/raw/nand_micron.c               |   19 +-
>  drivers/mtd/nand/raw/nand_onfi.c                 |  305 ++++
>  drivers/mtd/nand/raw/nand_samsung.c              |    2 +-
>  drivers/mtd/nand/raw/nand_timings.c              |   18 +-
>  drivers/mtd/nand/raw/nand_toshiba.c              |   88 +-
>  drivers/mtd/nand/raw/nandsim.c                   |   50 +-
>  drivers/mtd/nand/raw/ndfc.c                      |   43 +-
>  drivers/mtd/nand/raw/nuc900_nand.c               |   47 +-
>  drivers/mtd/nand/raw/omap2.c                     |  200 +--
>  drivers/mtd/nand/raw/orion_nand.c                |   26 +-
>  drivers/mtd/nand/raw/oxnas_nand.c                |   29 +-
>  drivers/mtd/nand/raw/pasemi_nand.c               |   51 +-
>  drivers/mtd/nand/raw/plat_nand.c                 |   23 +-
>  drivers/mtd/nand/raw/qcom_nandc.c                |   92 +-
>  drivers/mtd/nand/raw/r852.c                      |   80 +-
>  drivers/mtd/nand/raw/r852.h                      |    2 +-
>  drivers/mtd/nand/raw/s3c2410.c                   |  106 +-
>  drivers/mtd/nand/raw/sh_flctl.c                  |   68 +-
>  drivers/mtd/nand/raw/sharpsl.c                   |   36 +-
>  drivers/mtd/nand/raw/sm_common.c                 |    7 +-
>  drivers/mtd/nand/raw/socrates_nand.c             |   60 +-
>  drivers/mtd/nand/raw/sunxi_nand.c                |   96 +-
>  drivers/mtd/nand/raw/tango_nand.c                |   77 +-
>  drivers/mtd/nand/raw/tegra_nand.c                |   36 +-
>  drivers/mtd/nand/raw/tmio_nand.c                 |   78 +-
>  drivers/mtd/nand/raw/txx9ndfmc.c                 |   53 +-
>  drivers/mtd/nand/raw/vf610_nfc.c                 |   43 +-
>  drivers/mtd/nand/raw/xway_nand.c                 |   39 +-
>  drivers/mtd/sm_ftl.c                             |   20 +-
>  drivers/mtd/tests/mtd_nandecctest.c              |   21 +-
>  drivers/staging/mt29f_spinand/mt29f_spinand.c    |   47 +-
>  include/linux/fsl_ifc.h                          |    2 +
>  include/linux/mtd/jedec.h                        |   91 ++
>  include/linux/mtd/nand_bch.h                     |   11 +-
>  include/linux/mtd/nand_ecc.h                     |   12 +-
>  include/linux/mtd/onfi.h                         |  178 +++
>  include/linux/mtd/platnand.h                     |   74 +
>  include/linux/mtd/rawnand.h                      |  635 ++------
>  109 files changed, 4303 insertions(+), 5794 deletions(-)
>  delete mode 100644 Documentation/mtd/nand/pxa3xx-nand.txt
>  delete mode 100644 drivers/mtd/nand/raw/docg4.c
>  create mode 100644 drivers/mtd/nand/raw/internals.h
>  create mode 100644 drivers/mtd/nand/raw/nand_esmt.c
>  create mode 100644 drivers/mtd/nand/raw/nand_jedec.c
>  create mode 100644 drivers/mtd/nand/raw/nand_legacy.c
>  create mode 100644 drivers/mtd/nand/raw/nand_onfi.c
>  create mode 100644 include/linux/mtd/jedec.h
>  create mode 100644 include/linux/mtd/onfi.h
>  create mode 100644 include/linux/mtd/platnand.h
>=20
>=20
