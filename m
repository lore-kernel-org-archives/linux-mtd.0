Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eioqT-0008V0-EV
 for linux-mtd@lists.infradead.org; Mon, 05 Feb 2018 22:02:43 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
Cc: Peter Pan <peterpansjtu@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [PATCH v7 0/7] mtd: nand: Prepare things for SPI NAND support
Date: Mon,  5 Feb 2018 23:01:58 +0100
Message-Id: <20180205220205.3528-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I'm finally posting a v7 of the SPI NAND preparation patches. That's on
my TODO list for quite some time, and I finally take the time to submit
things that are pending in my development branch and are ready for
submission (at least, that's my opinion :)).

Patches adding SPI NAND support have been ommited because I'm still not
entirely happy with the SPI memories (NOR/NAND/SRAM) / QSPI controllers
situation, and, despite what I said earlier, I think it's worth
addressing the problem now.

What made me change my mind is the rework of the FSL QSPI driver
initiated by Frieder to support NANDs. Looks like all other QSPI
drivers will have to implement the same kind of hack to support both
SPI NORs and SPI NANDs with a single driver, which implies a lot of
duplicated code.

So, instead of making the situation worse by adding yet another level
of complexity, I'd like to see if we can expose all QSPI NOR
controllers as regular SPI controllers. Well, not exactly regular SPI
controllers, in that they would not be able to do random SPI transfers,
but instead high-level operations (an operation being a
CMD[+ADDRS][+DUMMY][+DATA] sequence).

The idea is to extend the SPI framework to provide high-level APIs to
execute such SPI operations. Then, each SPI controller would be able
to implement the high-level interface directly (likely the chosen
approach for advanced SPI controllers) or rely on the default
implementation which creates regular SPI messages to do the operation.

Note that this high-level spi-mem interface would replace the
spi_flash_read() APIs and handle optimizations of both read/write
paths.

I'm currently working on a PoC to validate the feasability of this
approach (I pushed my work here [1], but it's not yet in a clean
state), but this will be part of a separate RFC.

Back to the initial topic. The patch series contains
mechanical/straightforward changes to move existing NAND code to
the raw subdir (patches 1 to 6) and a patch adding the generic NAND
layer that is meant to be used by the SPI NAND framework, and at
some point, by the raw NAND and OneNAND framework.

Regards,

Boris

[1]https://github.com/bbrezillon/linux/tree/spi-mem

Changes in v7:
- Almost everything has changed in the NAND generic layer to make it
  easier to use from various NAND sub-layers
- Extra patches have been added to fix absolute references to NAND
  driver source files before moving source files to
  drivers/mtd/nand/raw/

v6 changes:
- includes generic NAND framework patches in series
- rebase on nand/next (commit 6076fd1e9d879521f7082a5e22185b71e480b777)
- remove on-die ECC support
- remove devm_free() since everything allocated by devm_kmalloc() will be
  automatically freed when device is released
- add comment header for structs in spinand.h
- remove spinand_register()/unregister(), call spinand_detect() in
  spinand_init() and only expose spinand_init()/cleanup()
- add nand_release_bbt() in bbt.c and use it in nand_cleanup() and
  spinand_cleanup()
- use BIT(n) instead (1 << n) in macro of spinand.h
- rename spinand_alloc() to devm_spinand_alloc()
- name lables in better way
- fix some typos
- add empty lines between code blocks

v5 changes:
- rebase patch on nand/next with Boris's generic NAND framework patches[3]
- replace pr_xxx() with dev_xxx()
- replace kzalloc()i/kfree() with devm_kzalloc()/devm_kfree()
- rename spinand_op_init() to spinand_init_op() for consistency
- remove command opcode in function comments
- use BIT(n) instead (1 << n) in macro
- remove manufactures.c and put spinand_manufacturers table in core.c
- change spinand_write_reg() u8 *buf argument to u8 value,
  since the length is always 1
- remove spinand_manufacture->detect() check, since it is always != NULL
- alloc spinand_ecc_engine struct in vendor.c when using on-die ECC
  (for hardware ECC, it should be in controllers/*.c)
- add comment header for struct spinand_op
- fix timeout bug in spinand_wait(), thanks for Arnaud's debug
- make spinand_manufacturers const
- add ecc_engine_ops pointer in struct micron_spinand_info
- make controller->cap assignment right with SPI_TX/RX_QUAD/DUAL flag

v4 changes:
- initialize struct mtd_oob_ops to 0 in bbt.c
- rename new added helper in nand.h to nand_check_xxxx()
- add struct mtd_oob_ops consistency check in nand_check_oob_ops()
- add dataleft in struct nand_page_iter instead of offs
- remove spinand_manufacturers->ops->detect() check since it is mandatory
- remove spinand_set_manufacturer_ops() and do the job in
  spinand_manufacturer_detect()
- move .priv out of struct spinand_controller
- add spinand_alloc/free/register/unregister() and make
  spinand_detect/init() static
- make BBT be configured by device tree
- chip->id.data stores raw ID directly
- refine device info print message after detect success
- add struct mtd_layout_ops pointer in struct micron_spinand_info
- remove micron_spinand_init() and do its job in micron_spinand_detect()
- fix BBT block cannot be erased bug

v3 changes:
- rebase patch on 4.11-rc1[2]
- change read ID method. read 4 bytes ID out then let ->detect() of each
  manufacutre driver to decode ID and detect the device.
- make SPI NAND id table private to each manufacutre driver
- fix coding style to make checkpatch.pl happy
- update the MAINTAINERS file for spi nand code
- add nand_size() helper in nand.h
- use nand_for_each_page() helper in spinand_do_read/write_ops()
- create helper to check boundaries in generic NAND code and use it
  in SPI NAND core
- rename spinand_base.c to core.c
- manufactures' drivers expose spinand_manufacturer struct instead of
  spinand_manufacturer_ops struct to keep Manufacture ID macro in
  manufactures' drivers and rename spinand_ids.c to manufacture.c
- rename spinand_micron.c to micron.c
- rename chips/ directory to controllers/
- rename generic_spi.c to generic-spi.c
- replace ->build_column_addr() and ->get_dummy() hooks with ->prepare_op() in
  spinand_manufacturer_ops struct
- rename __spinand_erase() to spinand_erase()
- rename spinand_erase() to spinand_erase_skip_bbt()
- rename spinand_scan_ident() to spinand_detect()
- rename spinand_scan_tail() to spinand_init()
- move non detect related code from spinand_detect() to spinand_init()
- remove spinand_fill_nandd, assign nand->ops in spinand_detect()
- merge v2 patch 3(bad block support) and patch 4(BBT support)
- drop getchip parameter, remove spinand_get/remove_device(), take the lock
  by caller directly
- fix function comment headers
- use nand_bbt_is_initialized() helper
- replace spinand_ecc_engine and spinand_controller object in spinand_device
  struct with pointer
- replace struct spinand_manufacturer_ops pointer in spinand_device struct
  with spinand_manufacturer struct

v2 changes:
- replace "spi_nand" with "spinand".
- rename spi nand related structs for better understanding.
- introduce spi nand controller, manufacturer and ecc_engine struct.
- add spi nand manufacturer initialization function refer to Boris's
  manuf-init branch.
- remove NAND_SKIP_BBTSCAN from series. Add it later when enabling HW ECC.
- reorganize series according to Boris's suggestion.

Boris Brezillon (7):
  mtd: nand: Get rid of comments giving the file path inside the file
    itself
  mtd: nand: Stop using full path when referring to files placed in the
    same dir
  mtd: nand: ams-delta: Fix path to toto.c source file
  mtd: nand: State when references to other drivers are no longer valid
  mtd: nand: Add missing copyright information
  mtd: nand: move raw NAND related code to the raw/ subdir
  mtd: nand: Add core infrastructure to deal with NAND devices

 Documentation/arm/Samsung-S3C24XX/S3C2412.txt      |   2 +-
 Documentation/driver-api/mtdnand.rst               |   8 +-
 Documentation/gpio/drivers-on-gpio.txt             |   4 +-
 MAINTAINERS                                        |  22 +-
 arch/cris/arch-v32/drivers/mach-a3/nandflash.c     |   2 +-
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c     |   2 +-
 drivers/mtd/nand/Kconfig                           | 580 +---------------
 drivers/mtd/nand/Makefile                          |  71 +-
 drivers/mtd/nand/bbt.c                             | 130 ++++
 drivers/mtd/nand/core.c                            | 244 +++++++
 drivers/mtd/nand/raw/Kconfig                       | 580 ++++++++++++++++
 drivers/mtd/nand/raw/Makefile                      |  68 ++
 drivers/mtd/nand/{ => raw}/ams-delta.c             |   9 +-
 drivers/mtd/nand/{ => raw}/atmel/Makefile          |   0
 drivers/mtd/nand/{ => raw}/atmel/nand-controller.c |   4 +-
 drivers/mtd/nand/{ => raw}/atmel/pmecc.c           |   4 +-
 drivers/mtd/nand/{ => raw}/atmel/pmecc.h           |   4 +-
 drivers/mtd/nand/{ => raw}/au1550nd.c              |   2 -
 drivers/mtd/nand/{ => raw}/bcm47xxnflash/Makefile  |   0
 .../nand/{ => raw}/bcm47xxnflash/bcm47xxnflash.h   |   0
 drivers/mtd/nand/{ => raw}/bcm47xxnflash/main.c    |   0
 .../mtd/nand/{ => raw}/bcm47xxnflash/ops_bcm4706.c |   0
 drivers/mtd/nand/{ => raw}/bf5xx_nand.c            |   7 +-
 drivers/mtd/nand/{ => raw}/brcmnand/Makefile       |   0
 .../mtd/nand/{ => raw}/brcmnand/bcm63138_nand.c    |   0
 drivers/mtd/nand/{ => raw}/brcmnand/bcm6368_nand.c |   0
 drivers/mtd/nand/{ => raw}/brcmnand/brcmnand.c     |   0
 drivers/mtd/nand/{ => raw}/brcmnand/brcmnand.h     |   0
 drivers/mtd/nand/{ => raw}/brcmnand/brcmstb_nand.c |   0
 drivers/mtd/nand/{ => raw}/brcmnand/iproc_nand.c   |   0
 drivers/mtd/nand/{ => raw}/cafe_nand.c             |   0
 drivers/mtd/nand/{ => raw}/cmx270_nand.c           |   4 +-
 drivers/mtd/nand/{ => raw}/cs553x_nand.c           |   2 -
 drivers/mtd/nand/{ => raw}/davinci_nand.c          |   0
 drivers/mtd/nand/{ => raw}/denali.c                |   0
 drivers/mtd/nand/{ => raw}/denali.h                |   0
 drivers/mtd/nand/{ => raw}/denali_dt.c             |   0
 drivers/mtd/nand/{ => raw}/denali_pci.c            |   0
 drivers/mtd/nand/{ => raw}/diskonchip.c            |   2 -
 drivers/mtd/nand/{ => raw}/docg4.c                 |   0
 drivers/mtd/nand/{ => raw}/fsl_elbc_nand.c         |   0
 drivers/mtd/nand/{ => raw}/fsl_ifc_nand.c          |   0
 drivers/mtd/nand/{ => raw}/fsl_upm.c               |   0
 drivers/mtd/nand/{ => raw}/fsmc_nand.c             |   6 +-
 drivers/mtd/nand/{ => raw}/gpio.c                  |   2 -
 drivers/mtd/nand/{ => raw}/gpmi-nand/Makefile      |   0
 drivers/mtd/nand/{ => raw}/gpmi-nand/bch-regs.h    |   0
 drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-lib.c    |   0
 drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-nand.c   |   0
 drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-nand.h   |   0
 drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-regs.h   |   0
 drivers/mtd/nand/{ => raw}/hisi504_nand.c          |   0
 drivers/mtd/nand/{ => raw}/jz4740_nand.c           |   0
 drivers/mtd/nand/{ => raw}/jz4780_bch.c            |   0
 drivers/mtd/nand/{ => raw}/jz4780_bch.h            |   0
 drivers/mtd/nand/{ => raw}/jz4780_nand.c           |   0
 drivers/mtd/nand/{ => raw}/lpc32xx_mlc.c           |   0
 drivers/mtd/nand/{ => raw}/lpc32xx_slc.c           |   0
 drivers/mtd/nand/{ => raw}/marvell_nand.c          |   0
 drivers/mtd/nand/{ => raw}/mpc5121_nfc.c           |   5 +-
 drivers/mtd/nand/{ => raw}/mtk_ecc.c               |   0
 drivers/mtd/nand/{ => raw}/mtk_ecc.h               |   0
 drivers/mtd/nand/{ => raw}/mtk_nand.c              |   0
 drivers/mtd/nand/{ => raw}/mxc_nand.c              |   0
 drivers/mtd/nand/{ => raw}/nand_amd.c              |   0
 drivers/mtd/nand/{ => raw}/nand_base.c             |   0
 drivers/mtd/nand/{ => raw}/nand_bbt.c              |   0
 drivers/mtd/nand/{ => raw}/nand_bch.c              |   0
 drivers/mtd/nand/{ => raw}/nand_ecc.c              |   2 -
 drivers/mtd/nand/{ => raw}/nand_hynix.c            |   0
 drivers/mtd/nand/{ => raw}/nand_ids.c              |   0
 drivers/mtd/nand/{ => raw}/nand_macronix.c         |   0
 drivers/mtd/nand/{ => raw}/nand_micron.c           |   0
 drivers/mtd/nand/{ => raw}/nand_samsung.c          |   0
 drivers/mtd/nand/{ => raw}/nand_timings.c          |   0
 drivers/mtd/nand/{ => raw}/nand_toshiba.c          |   0
 drivers/mtd/nand/{ => raw}/nandsim.c               |   0
 drivers/mtd/nand/{ => raw}/ndfc.c                  |   0
 drivers/mtd/nand/{ => raw}/nuc900_nand.c           |   0
 drivers/mtd/nand/{ => raw}/omap2.c                 |   0
 drivers/mtd/nand/{ => raw}/omap_elm.c              |   0
 drivers/mtd/nand/{ => raw}/orion_nand.c            |   2 -
 drivers/mtd/nand/{ => raw}/oxnas_nand.c            |   0
 drivers/mtd/nand/{ => raw}/pasemi_nand.c           |   0
 drivers/mtd/nand/{ => raw}/plat_nand.c             |   0
 drivers/mtd/nand/{ => raw}/pxa3xx_nand.c           |   2 -
 drivers/mtd/nand/{ => raw}/qcom_nandc.c            |   0
 drivers/mtd/nand/{ => raw}/r852.c                  |   0
 drivers/mtd/nand/{ => raw}/r852.h                  |   0
 drivers/mtd/nand/{ => raw}/s3c2410.c               |   3 +-
 drivers/mtd/nand/{ => raw}/sh_flctl.c              |   0
 drivers/mtd/nand/{ => raw}/sharpsl.c               |   2 -
 drivers/mtd/nand/{ => raw}/sm_common.c             |   0
 drivers/mtd/nand/{ => raw}/sm_common.h             |   0
 drivers/mtd/nand/{ => raw}/socrates_nand.c         |   2 -
 drivers/mtd/nand/{ => raw}/sunxi_nand.c            |   0
 drivers/mtd/nand/{ => raw}/tango_nand.c            |   0
 drivers/mtd/nand/{ => raw}/tmio_nand.c             |   0
 drivers/mtd/nand/{ => raw}/txx9ndfmc.c             |   0
 drivers/mtd/nand/{ => raw}/vf610_nfc.c             |   0
 drivers/mtd/nand/{ => raw}/xway_nand.c             |   0
 drivers/mtd/sm_ftl.c                               |   2 +-
 include/linux/mtd/bbm.h                            |   2 -
 include/linux/mtd/nand.h                           | 731 +++++++++++++++++++++
 include/linux/mtd/nand_ecc.h                       |   2 -
 include/linux/mtd/ndfc.h                           |   2 -
 106 files changed, 1800 insertions(+), 716 deletions(-)
 create mode 100644 drivers/mtd/nand/bbt.c
 create mode 100644 drivers/mtd/nand/core.c
 create mode 100644 drivers/mtd/nand/raw/Kconfig
 create mode 100644 drivers/mtd/nand/raw/Makefile
 rename drivers/mtd/nand/{ => raw}/ams-delta.c (97%)
 rename drivers/mtd/nand/{ => raw}/atmel/Makefile (100%)
 rename drivers/mtd/nand/{ => raw}/atmel/nand-controller.c (99%)
 rename drivers/mtd/nand/{ => raw}/atmel/pmecc.c (99%)
 rename drivers/mtd/nand/{ => raw}/atmel/pmecc.h (94%)
 rename drivers/mtd/nand/{ => raw}/au1550nd.c (99%)
 rename drivers/mtd/nand/{ => raw}/bcm47xxnflash/Makefile (100%)
 rename drivers/mtd/nand/{ => raw}/bcm47xxnflash/bcm47xxnflash.h (100%)
 rename drivers/mtd/nand/{ => raw}/bcm47xxnflash/main.c (100%)
 rename drivers/mtd/nand/{ => raw}/bcm47xxnflash/ops_bcm4706.c (100%)
 rename drivers/mtd/nand/{ => raw}/bf5xx_nand.c (99%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/Makefile (100%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/bcm63138_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/bcm6368_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/brcmnand.c (100%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/brcmnand.h (100%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/brcmstb_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/iproc_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/cafe_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/cmx270_nand.c (98%)
 rename drivers/mtd/nand/{ => raw}/cs553x_nand.c (99%)
 rename drivers/mtd/nand/{ => raw}/davinci_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/denali.c (100%)
 rename drivers/mtd/nand/{ => raw}/denali.h (100%)
 rename drivers/mtd/nand/{ => raw}/denali_dt.c (100%)
 rename drivers/mtd/nand/{ => raw}/denali_pci.c (100%)
 rename drivers/mtd/nand/{ => raw}/diskonchip.c (99%)
 rename drivers/mtd/nand/{ => raw}/docg4.c (100%)
 rename drivers/mtd/nand/{ => raw}/fsl_elbc_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/fsl_ifc_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/fsl_upm.c (100%)
 rename drivers/mtd/nand/{ => raw}/fsmc_nand.c (99%)
 rename drivers/mtd/nand/{ => raw}/gpio.c (99%)
 rename drivers/mtd/nand/{ => raw}/gpmi-nand/Makefile (100%)
 rename drivers/mtd/nand/{ => raw}/gpmi-nand/bch-regs.h (100%)
 rename drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-lib.c (100%)
 rename drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-nand.h (100%)
 rename drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-regs.h (100%)
 rename drivers/mtd/nand/{ => raw}/hisi504_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/jz4740_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/jz4780_bch.c (100%)
 rename drivers/mtd/nand/{ => raw}/jz4780_bch.h (100%)
 rename drivers/mtd/nand/{ => raw}/jz4780_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/lpc32xx_mlc.c (100%)
 rename drivers/mtd/nand/{ => raw}/lpc32xx_slc.c (100%)
 rename drivers/mtd/nand/{ => raw}/marvell_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/mpc5121_nfc.c (99%)
 rename drivers/mtd/nand/{ => raw}/mtk_ecc.c (100%)
 rename drivers/mtd/nand/{ => raw}/mtk_ecc.h (100%)
 rename drivers/mtd/nand/{ => raw}/mtk_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/mxc_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_amd.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_base.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_bbt.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_bch.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_ecc.c (99%)
 rename drivers/mtd/nand/{ => raw}/nand_hynix.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_ids.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_macronix.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_micron.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_samsung.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_timings.c (100%)
 rename drivers/mtd/nand/{ => raw}/nand_toshiba.c (100%)
 rename drivers/mtd/nand/{ => raw}/nandsim.c (100%)
 rename drivers/mtd/nand/{ => raw}/ndfc.c (100%)
 rename drivers/mtd/nand/{ => raw}/nuc900_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/omap2.c (100%)
 rename drivers/mtd/nand/{ => raw}/omap_elm.c (100%)
 rename drivers/mtd/nand/{ => raw}/orion_nand.c (99%)
 rename drivers/mtd/nand/{ => raw}/oxnas_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/pasemi_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/plat_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/pxa3xx_nand.c (99%)
 rename drivers/mtd/nand/{ => raw}/qcom_nandc.c (100%)
 rename drivers/mtd/nand/{ => raw}/r852.c (100%)
 rename drivers/mtd/nand/{ => raw}/r852.h (100%)
 rename drivers/mtd/nand/{ => raw}/s3c2410.c (99%)
 rename drivers/mtd/nand/{ => raw}/sh_flctl.c (100%)
 rename drivers/mtd/nand/{ => raw}/sharpsl.c (99%)
 rename drivers/mtd/nand/{ => raw}/sm_common.c (100%)
 rename drivers/mtd/nand/{ => raw}/sm_common.h (100%)
 rename drivers/mtd/nand/{ => raw}/socrates_nand.c (99%)
 rename drivers/mtd/nand/{ => raw}/sunxi_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/tango_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/tmio_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/txx9ndfmc.c (100%)
 rename drivers/mtd/nand/{ => raw}/vf610_nfc.c (100%)
 rename drivers/mtd/nand/{ => raw}/xway_nand.c (100%)
 create mode 100644 include/linux/mtd/nand.h

-- 
2.14.1
