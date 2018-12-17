Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYtld-0004DK-5e
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2018 14:21:12 +0000
Date: Mon, 17 Dec 2018 15:20:43 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: [GIT PULL] mtd: nand: Changes for 4.21
Message-ID: <20181217152043.1d2134ee@xps13>
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

Hello,

This is the NAND PR for 4.21.

Thanks,
Miqu=C3=A8l


The following changes since commit ccda4af0f4b92f7b4c308d3acc262f4a7e3affad:

  Linux 4.20-rc2 (2018-11-11 17:12:31 -0600)

are available in the Git repository at:

  git://git.infradead.org/linux-mtd.git tags/nand/for-4.21

for you to fetch changes up to 732774437ae01d9882e60314e303898e63c7f038:

  mtd: rawnand: sunxi: Write pageprog related opcodes to WCMD_SET (2018-12-=
17 14:06:26 +0100)

----------------------------------------------------------------
NAND core changes:
- kernel-doc miscellaneous fixes.
- Third batch of fixes/cleanup to the raw NAND core impacting various
  controller drivers (ams-delta, marvell, fsmc, denali, tegra, vf610):
  * Stopping to pass mtd_info objects to internal functions
  * Reorganizing code to avoid forward declarations
  * Dropping useless test in nand_legacy_set_defaults()
  * Moving nand_exec_op() to internal.h
  * Adding nand_[de]select_target() helpers
  * Passing the CS line to be selected in struct nand_operation
  * Making ->select_chip() optional when ->exec_op() is implemented
  * Deprecating the ->select_chip() hook
  * Moving the ->exec_op() method to nand_controller_ops
  * Moving ->setup_data_interface() to nand_controller_ops
  * Deprecating the dummy_controller field
  * Fixing JEDEC detection
  * Providing a helper for polling GPIO R/B pin

Raw NAND chip drivers changes:
- Macronix:
  * Flagging 1.8V AC chips with a broken GET_FEATURES(TIMINGS)

Raw NAND controllers drivers changes:
- Ams-delta:
  * Fixing the error path
  * SPDX tag added
  * May be compiled with COMPILE_TEST=3Dy
  * Conversion to ->exec_op() interface
  * Dropping .IOADDR_R/W use
  * Use GPIO API for data I/O
- Denali:
  * Removing denali_reset_banks()
  * Removing ->dev_ready() hook
  * Including <linux/bits.h> instead of <linux/bitops.h>
  * Changes to comply with the above fixes/cleanup done in the core.
- FSMC:
  * Adding an SPDX tag to replace the license text
  * Making conversion from chip to fsmc consistent
  * Fixing unchecked return value in fsmc_read_page_hwecc
  * Changes to comply with the above fixes/cleanup done in the core.
- Marvell:
  * Preventing timeouts on a loaded machine (fix)
  * Changes to comply with the above fixes/cleanup done in the core.
- OMAP2:
  * Pass the parent of pdev to dma_request_chan() (fix)
- R852:
  * Use generic DMA API
- sh_flctl:
  * Converting to SPDX identifiers
- Sunxi:
  * Write pageprog related opcodes to the right register: WCMD_SET (fix)
- Tegra:
  * Stop implementing ->select_chip()
- VF610:
  * Adding an SPDX tag to replace the license text
  * Changes to comply with the above fixes/cleanup done in the core.
- Various trivial/spelling/coding style fixes.

SPI-NAND drivers changes:
- Removing the depreacated mt29f_spinand driver from staging.
- Adding support for:
  * Toshiba TC58CVG2S0H
  * GigaDevice GD5FxGQ4xA
  * Winbond W25N01GV

----------------------------------------------------------------
Boris Brezillon (36):
      staging: Remove the mt29f_spinand driver
      mtd: rawnand: Stop passing mtd_info objects to internal functions
      mtd: rawnand: Reorganize code to avoid forward declarations
      mtd: rawnand: legacy: Drop useless test in nand_legacy_set_defaults()
      mtd: rawnand: Move nand_exec_op() to internal.h
      mtd: rawnand: Remove unused NAND_CONTROLLER_ALLOC flag
      mtd: rawnand: ams-delta: Allow this driver to be compiled when COMPIL=
E_TEST=3Dy
      mtd: rawnand: ams-delta: Add an SPDX tag to replace the license text
      mtd: rawnand: ams-delta: Fix various coding style issues
      mtd: rawnand: ams-delta: cleanup ams_delta_init() error path
      mtd: rawnand: ams-delta: Check mtd_device_register() return code
      mtd: rawnand: ams-delta: Explicitly inherit from nand_controller
      mtd: rawnand: Add nand_[de]select_target() helpers
      mtd: rawnand: Pass the CS line to be selected in struct nand_operation
      mtd: rawnand: Make ->select_chip() optional when ->exec_op() is imple=
mented
      mtd: rawnand: fsmc: Stop implementing ->select_chip()
      mtd: rawnand: marvell: Stop implementing ->select_chip()
      mtd: rawnand: tegra: Stop implementing ->select_chip()
      mtd: rawnand: vf610: Stop implementing ->select_chip()
      mtd: rawnand: ams-delta: Stop implementing ->select_chip()
      mtd: rawnand: Deprecate the ->select_chip() hook
      mtd: rawnand: Move the ->exec_op() method to nand_controller_ops
      mtd: rawnand: Move ->setup_data_interface() to nand_controller_ops
      mtd: rawnand: fsmc: Stop passing mtd_info objects to internal functio=
ns
      mtd: rawnand: fsmc: Fix the fsmc_nand_data kernel-doc
      mtd: rawnand: fsmc: Make conversion from chip to fsmc consistent
      mtd: rawnand: fsmc: Stop using the dummy controller obj
      mtd: rawnand: fsmc: Add an SPDX tag to replace the license text
      mtd: rawnand: fsmc: Fix all coding style issues reported by checkpatch
      mtd: rawnand: vf610: Stop passing mtd_info to internal functions
      mtd: rawnand: vf610: Stop using the dummy controller obj
      mtd: rawnand: vf610: Add an SPDX tag to replace the license text
      mtd: rawnand: Deprecate the dummy_controller field
      mtd: rawnand: Fix JEDEC detection
      mtd: rawnand: omap2: Pass the parent of pdev to dma_request_chan()
      mtd: rawnand: sunxi: Write pageprog related opcodes to WCMD_SET

Christoph Hellwig (1):
      mtd: rawnand: r852: use generic DMA API

Chuanhong Guo (1):
      mtd: spinand: add support for GigaDevice GD5FxGQ4xA

Gustavo A. R. Silva (1):
      mtd: rawnand: fsmc: Fix unchecked return value in fsmc_read_page_hwecc

Janusz Krzysztofik (7):
      mtd: rawnand: Provide helper for polling GPIO R/B pin
      mtd: rawnand: ams-delta: Stop using legacy .IOADDR_R/W
      mtd: rawnand: ams-delta: Convert the driver to ->exec_op()
      ARM: OMAP1: ams-delta: Provide GPIO lookup table for NAND data port
      mtd: rawnand: ams-delta: Request data port GPIO resource
      mtd: rawnand: ams-delta: Use GPIO API for data I/O
      ARM: OMAP1: ams-delta: Drop obsolete NAND resources

Kuninori Morimoto (1):
      mtd: rawnand: sh_flctl: convert to SPDX identifiers

Masahiro Yamada (3):
      mtd: rawnand: denali: include <linux/bits.h> instead of <linux/bitops=
.h>
      mtd: rawnand: denali: remove ->dev_ready() hook
      mtd: rawnand: denali: remove denali_reset_banks()

Mason Yang (1):
      mtd: rawnand: Flag 1.8V AC chips with a broken GET_FEATURES(TIMINGS)

Mathieu Malaterre (1):
      mtd: rawnand: jz4780: annotate implicit fall throughs

Miquel Raynal (3):
      Merge tag 'v4.20-rc2' of git://git.kernel.org/.../torvalds/linux into=
 nand/next
      mtd: rawnand: marvell: fix spelling mistake in kernel doc
      mtd: rawnand: marvell: prevent timeouts on a loaded machine

Robert Marko (1):
      mtd: spinand: winbond: Add support for W25N01GV

Schrempf Frieder (1):
      mtd: spinand: Add initial support for Toshiba TC58CVG2S0H

 arch/arm/mach-omap1/board-ams-delta.c            |  22 ++--
 drivers/mtd/nand/raw/Kconfig                     |   2 +-
 drivers/mtd/nand/raw/ams-delta.c                 | 263 +++++++++++++++++++=
++++-------------------
 drivers/mtd/nand/raw/atmel/nand-controller.c     |   9 +-
 drivers/mtd/nand/raw/au1550nd.c                  |   2 +-
 drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c |   2 +-
 drivers/mtd/nand/raw/cafe_nand.c                 |   4 +-
 drivers/mtd/nand/raw/davinci_nand.c              |   4 +-
 drivers/mtd/nand/raw/denali.c                    |  59 +---------
 drivers/mtd/nand/raw/denali.h                    |   2 +-
 drivers/mtd/nand/raw/diskonchip.c                |   4 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c             |   2 +-
 drivers/mtd/nand/raw/fsl_ifc_nand.c              |   2 +-
 drivers/mtd/nand/raw/fsl_upm.c                   |   2 +-
 drivers/mtd/nand/raw/fsmc_nand.c                 | 303 +++++++++++++++++++=
+++++------------------------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c       |  29 +++--
 drivers/mtd/nand/raw/hisi504_nand.c              |   4 +-
 drivers/mtd/nand/raw/internals.h                 |  33 ++++++
 drivers/mtd/nand/raw/jz4740_nand.c               |   8 +-
 drivers/mtd/nand/raw/jz4780_bch.c                |   2 +
 drivers/mtd/nand/raw/jz4780_nand.c               |   2 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c               |   2 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c               |   2 +-
 drivers/mtd/nand/raw/marvell_nand.c              |  51 +++++---
 drivers/mtd/nand/raw/mpc5121_nfc.c               |   4 +-
 drivers/mtd/nand/raw/mtk_nand.c                  |   4 +-
 drivers/mtd/nand/raw/mxc_nand.c                  |  16 ++-
 drivers/mtd/nand/raw/nand_base.c                 | 773 +++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++-----------------------------=
---------------------------
 drivers/mtd/nand/raw/nand_bbt.c                  | 285 +++++++++++++++++++=
+++-----------------------
 drivers/mtd/nand/raw/nand_hynix.c                |   8 +-
 drivers/mtd/nand/raw/nand_jedec.c                |   2 +
 drivers/mtd/nand/raw/nand_legacy.c               |  35 +++---
 drivers/mtd/nand/raw/nand_macronix.c             |   7 ++
 drivers/mtd/nand/raw/nandsim.c                   |   2 +-
 drivers/mtd/nand/raw/ndfc.c                      |   2 +-
 drivers/mtd/nand/raw/omap2.c                     |   2 +-
 drivers/mtd/nand/raw/plat_nand.c                 |   2 +-
 drivers/mtd/nand/raw/qcom_nandc.c                |   2 +-
 drivers/mtd/nand/raw/r852.c                      |  30 ++---
 drivers/mtd/nand/raw/s3c2410.c                   |   7 +-
 drivers/mtd/nand/raw/sh_flctl.c                  |  21 +---
 drivers/mtd/nand/raw/sm_common.c                 |   2 +-
 drivers/mtd/nand/raw/sunxi_nand.c                |   6 +-
 drivers/mtd/nand/raw/tango_nand.c                |   4 +-
 drivers/mtd/nand/raw/tegra_nand.c                |  32 +++--
 drivers/mtd/nand/raw/vf610_nfc.c                 |  98 ++++++++--------
 drivers/mtd/nand/raw/xway_nand.c                 |   2 +-
 drivers/mtd/nand/spi/Makefile                    |   2 +-
 drivers/mtd/nand/spi/core.c                      |   2 +
 drivers/mtd/nand/spi/gigadevice.c                | 148 +++++++++++++++++++=
+++++
 drivers/mtd/nand/spi/toshiba.c                   | 137 +++++++++++++++++++=
+++
 drivers/mtd/nand/spi/winbond.c                   |   8 ++
 drivers/staging/Kconfig                          |   2 -
 drivers/staging/Makefile                         |   1 -
 drivers/staging/mt29f_spinand/Kconfig            |  16 ---
 drivers/staging/mt29f_spinand/Makefile           |   1 -
 drivers/staging/mt29f_spinand/TODO               |  13 ---
 drivers/staging/mt29f_spinand/mt29f_spinand.c    | 980 -------------------=
---------------------------------------------------------------------------=
------------------------------------------------------------
 drivers/staging/mt29f_spinand/mt29f_spinand.h    | 106 -----------------
 include/linux/mtd/rawnand.h                      | 158 +++++++++++++------=
------
 include/linux/mtd/sh_flctl.h                     |  16 +--
 include/linux/mtd/spinand.h                      |   2 +
 62 files changed, 1515 insertions(+), 2238 deletions(-)
 create mode 100644 drivers/mtd/nand/spi/gigadevice.c
 create mode 100644 drivers/mtd/nand/spi/toshiba.c
 delete mode 100644 drivers/staging/mt29f_spinand/Kconfig
 delete mode 100644 drivers/staging/mt29f_spinand/Makefile
 delete mode 100644 drivers/staging/mt29f_spinand/TODO
 delete mode 100644 drivers/staging/mt29f_spinand/mt29f_spinand.c
 delete mode 100644 drivers/staging/mt29f_spinand/mt29f_spinand.h
