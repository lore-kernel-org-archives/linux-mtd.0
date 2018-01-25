Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eeeWW-0006Ia-Py
 for linux-mtd@lists.infradead.org; Thu, 25 Jan 2018 10:12:51 +0000
Date: Thu, 25 Jan 2018 11:12:27 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Marek Vasut <marex@denx.de>, David Woodhouse
 <dwmw2@infradead.org>
Subject: [GIT PULL v3] mtd: nand: Changes for 4.16
Message-ID: <20180125111227.5d8c7084@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Here is the NAND PR for 4.16. As can be seen in the diffstat, the NAND
subsystem has been quite active. That's mainly caused by the
introduction of the ->exec_op() hook and the rework of the Marvell
driver.

v3 contains 2 late fixes, and one of them is fixing a bug introduced by
the exec_op() rework, hence the need for a v3. Hopefully, this will be
the last version.

Regards,

Boris

Changes in v3:
- Fix a bug introduced by the exec_op() rework in the GPMI driver
- Fix a long standing bug in the sunxi driver

Changes in v2:
- Add a few fixes for the omap OneNAND and marvell NAND drivers

The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/nand/for-4.16

for you to fetch changes up to f4c6cd1a7f2275d5bc0e494b21fff26f8dde80f0:

  mtd: nand: sunxi: Fix ECC strength choice (2018-01-25 09:14:32 +0100)

----------------------------------------------------------------
Core changes:
* Fix NAND_CMD_NONE handling in nand_command[_lp]() hooks
* Introduce the ->exec_op() infrastructure
* Rework NAND buffers handling
* Fix ECC requirements for K9F4G08U0D
* Fix nand_do_read_oob() to return the number of bitflips
* Mark K9F1G08U0E as not supporting subpage writes

Driver changes:
* MTK: Rework the driver to support new IP versions
* OMAP OneNAND: Full rework to use new APIs (libgpio, dmaengine) and fix
  DT support
* Marvell: Add a new driver to replace the pxa3xx one

----------------------------------------------------------------
Arnd Bergmann (1):
      mtd: onenand: omap2: print resource using %pR format string

Boris Brezillon (7):
      mtd: nand: hynix: Don't wait after applying new read-retry params
      mtd: nand: provide several helpers to do common NAND operations
      mtd: nand: force drivers to explicitly send READ/PROG commands
      mtd: nand: denali: Avoid using ecc->code_buf as a temporary buffer
      mtd: nand: Only allocate ecc->{calc, code}_buf when actually needed
      Merge tag 'gpmc-omap-for-v4.16-immutable' of https://github.com/rogerq/linux into nand/next
      mtd: nand: gpmi: Fix subpage reads

Christophe JAILLET (5):
      mtd: onenand: samsung: use devm_ function to simplify code and fix some leaks
      mtd: onenand: samsung: return an error if 'mtd_device_parse_register()' fails
      mtd: onenand: samsung: Propagate the error returned by 'onenand_scan()'
      mtd: onenand: samsung: Remove a useless include
      mtd: onenand: samsung: remove incorrect __iomem annotation

Colin Ian King (2):
      mtd: nand: marvell: fix spelling mistake: "suceed"-> "succeed"
      mtd: nand: marvell: remove redundant variable 'oob_len'

Fabio Estevam (2):
      mtd: nand: brcmnand: Add a NULL check for devm_kasprintf()
      mtd: nand: qcom: Add a NULL check for devm_kasprintf()

Gustavo A. R. Silva (1):
      mtd: nand: gpmi: replace _manual_ swap with swap macro

Jagdish Gediya (1):
      mtd: nand: ifc: update bufnum mask for ver >= 2.0.0

Jesse Chan (1):
      mtd: nand: denali_pci: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE

Kamal Dasu (1):
      mtd: nand: brcmnand: Disable prefetch by default

Ladislav Michl (15):
      memory: omap-gpmc: Make 'bank-width' property optional
      mtd: onenand: Remove obsolete url from Kconfig help
      mtd: nand: samsung: Disable subpage writes on E-die NAND
      dt-bindings: mtd: gpmc-onenand: Update properties description
      ARM: dts: OMAP2+: Add compatible property to onenand node
      ARM: dts: omap3-igep: Update onenand node timings
      mtd: onenand: omap2: Remove regulator support
      mtd: onenand: omap2: Remove skip initial unlocking support
      mtd: onenand: omap2: Remove partitioning support from platform data
      mtd: onenand: omap2: Account waiting time as waiting on IO
      mtd: onenand: omap2: Unify OMAP2 and OMAP3 DMA implementation
      mtd: onenand: omap2: Do not make delay for GPIO OMAP3 specific
      mtd: onenand: omap2: Decouple DMA enabling from INT pin availability
      mtd: onenand: omap2: Configure driver from DT
      ARM: OMAP2+: Remove gpmc-onenand

Masahiro Yamada (6):
      mtd: nand: remove unnecessary extern from driver headers
      mtd: nand: denali: rename misleading dma_buf to tmp_buf
      mtd: nand: cafe: remove use of NAND_OWN_BUFFERS
      mtd: nand: remove unused NAND_OWN_BUFFERS flag
      mtd: nand: squash struct nand_buffers into struct nand_chip
      mtd: nand: cafe: clean up DMA address setup

Miquel Raynal (16):
      mtd: nand: fix interpretation of NAND_CMD_NONE in nand_command[_lp]()
      mtd: nand: use usual return values for the ->erase() hook
      mtd: nand: provide valid ->data_interface during NAND detection
      mtd: nand: samsung: add ECC requirements for K9F4G08U0D
      mtd: nand: add ->exec_op() implementation
      mtd: nand: Fix unfinished comment in nand_init_data_interface()
      mtd: mtd_oobtest: Handle bitflips during reads
      mtd: nand: Fix nand_do_read_oob() return value
      dt-bindings: mtd: document new nand-rb property
      dt-bindings: mtd: add Marvell NAND controller documentation
      mtd: nand: add reworked Marvell NAND controller driver
      mtd: nand: use reworked NAND controller driver with Marvell EBU SoCs
      MAINTAINERS: Add entry for Marvell NAND controller driver
      mtd: nand: marvell: Fix missing memory allocation modifier
      mtd: nand: Fix build issues due to an anonymous union
      mtd: nand: sunxi: Fix ECC strength choice

Nicolas Ferre (1):
      MAINTAINERS: mtd/nand: update Microchip nand entry

Peter Ujfalusi (2):
      mtd: onenand: omap2: Simplify the DMA setup for various paths
      mtd: onenand: omap2: Convert to use dmaengine for memcpy

RogerCC Lin (3):
      mtd: nand: mtk: update DT bindings
      mtd: nand: mtk: Support different MTK NAND flash controller IP
      mtd: nand: mtk: Support MT7622 NAND flash controller.

Sascha Hauer (2):
      mtd: nand: gpmi-nand: Remove wrong Kconfig help text
      mtd: tests: nandbiterrs: Fix read_page return value

Wei Yongjun (1):
      mtd: onenand: omap2: Remove redundant dev_err call in omap2_onenand_probe()

Xiaolei Li (1):
      mtd: nand: mtk: use nand_reset() to reset NAND devices in resume function

 Documentation/devicetree/bindings/mtd/gpmc-onenand.txt |    6 +-
 Documentation/devicetree/bindings/mtd/marvell-nand.txt |  123 +++++++
 Documentation/devicetree/bindings/mtd/mtk-nand.txt     |   11 +-
 Documentation/devicetree/bindings/mtd/nand.txt         |    1 +
 MAINTAINERS                                            |   22 +-
 arch/arm/boot/dts/omap2420-n8x0-common.dtsi            |    1 +
 arch/arm/boot/dts/omap3-igep.dtsi                      |   30 +-
 arch/arm/boot/dts/omap3-n900.dts                       |    1 +
 arch/arm/boot/dts/omap3-n950-n9.dtsi                   |    1 +
 arch/arm/boot/dts/omap3430-sdp.dts                     |    1 +
 arch/arm/configs/mvebu_v7_defconfig                    |    2 +-
 arch/arm/mach-omap2/Makefile                           |    3 -
 arch/arm/mach-omap2/gpmc-onenand.c                     |  409 ---------------------
 arch/arm64/configs/defconfig                           |    2 +-
 drivers/memory/omap-gpmc.c                             |  163 ++++++---
 drivers/mtd/nand/Kconfig                               |   17 +-
 drivers/mtd/nand/Makefile                              |    1 +
 drivers/mtd/nand/atmel/nand-controller.c               |    9 +-
 drivers/mtd/nand/bf5xx_nand.c                          |    6 +-
 drivers/mtd/nand/brcmnand/brcmnand.c                   |   38 +-
 drivers/mtd/nand/cafe_nand.c                           |   52 +--
 drivers/mtd/nand/denali.c                              |   84 ++---
 drivers/mtd/nand/denali.h                              |    4 +-
 drivers/mtd/nand/denali_pci.c                          |    4 +
 drivers/mtd/nand/diskonchip.c                          |    4 +-
 drivers/mtd/nand/docg4.c                               |   21 +-
 drivers/mtd/nand/fsl_elbc_nand.c                       |   10 +-
 drivers/mtd/nand/fsl_ifc_nand.c                        |   13 +-
 drivers/mtd/nand/fsmc_nand.c                           |    9 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c                 |  111 +++---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h                 |   46 +--
 drivers/mtd/nand/hisi504_nand.c                        |    9 +-
 drivers/mtd/nand/jz4740_nand.c                         |   16 +-
 drivers/mtd/nand/lpc32xx_mlc.c                         |    7 +-
 drivers/mtd/nand/lpc32xx_slc.c                         |   33 +-
 drivers/mtd/nand/marvell_nand.c                        | 2896 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/mtk_ecc.c                             |  126 +++++--
 drivers/mtd/nand/mtk_ecc.h                             |    3 +-
 drivers/mtd/nand/mtk_nand.c                            |   76 ++--
 drivers/mtd/nand/nand_base.c                           | 2230 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------
 drivers/mtd/nand/nand_bbt.c                            |    2 +-
 drivers/mtd/nand/nand_hynix.c                          |  129 ++++---
 drivers/mtd/nand/nand_micron.c                         |   83 ++---
 drivers/mtd/nand/nand_samsung.c                        |   19 +
 drivers/mtd/nand/nand_timings.c                        |   21 +-
 drivers/mtd/nand/omap2.c                               |   28 +-
 drivers/mtd/nand/pxa3xx_nand.c                         |   14 +-
 drivers/mtd/nand/qcom_nandc.c                          |   30 +-
 drivers/mtd/nand/r852.c                                |   11 +-
 drivers/mtd/nand/sh_flctl.c                            |    6 +-
 drivers/mtd/nand/sm_common.h                           |    2 +-
 drivers/mtd/nand/sunxi_nand.c                          |  111 +++---
 drivers/mtd/nand/tango_nand.c                          |   27 +-
 drivers/mtd/nand/tmio_nand.c                           |    5 +-
 drivers/mtd/nand/vf610_nfc.c                           |    6 +-
 drivers/mtd/onenand/Kconfig                            |    7 +-
 drivers/mtd/onenand/omap2.c                            |  577 +++++++++++-------------------
 drivers/mtd/onenand/samsung.c                          |  185 +++-------
 drivers/mtd/tests/nandbiterrs.c                        |    2 +-
 drivers/mtd/tests/oobtest.c                            |   21 ++
 drivers/staging/mt29f_spinand/mt29f_spinand.c          |    5 +-
 include/linux/mtd/rawnand.h                            |  443 +++++++++++++++++++++--
 include/linux/omap-gpmc.h                              |   28 ++
 include/linux/platform_data/mtd-onenand-omap2.h        |   34 --
 64 files changed, 6473 insertions(+), 1924 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
 delete mode 100644 arch/arm/mach-omap2/gpmc-onenand.c
 create mode 100644 drivers/mtd/nand/marvell_nand.c
 delete mode 100644 include/linux/platform_data/mtd-onenand-omap2.h
