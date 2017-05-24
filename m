Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDQHQ-0007bs-8c
 for linux-mtd@lists.infradead.org; Wed, 24 May 2017 07:00:27 +0000
From: Peter Pan <peterpandong@micron.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <arnaud.mouiche@gmail.com>,
 <thomas.petazzoni@free-electrons.com>, <marex@denx.de>,
 <cyrille.pitchen@wedev4u.fr>, <linux-mtd@lists.infradead.org>
CC: <peterpandong@micron.com>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: [PATCH v6 00/15] A SPI NAND framework under generic NAND framework
Date: Wed, 24 May 2017 15:06:56 +0800
Message-ID: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

First of all, thank Boris and Marek for your priceless comments
on v5 and thank everyone reviewed and tested on my previous series.
I can never be here without your help. This series comes to v6
and it becomes much better with your help.

SPI NAND is a new NAND family device with SPI protocol as
its interface. And its command set is totally different
with parallel NAND.

Our first attempt to SPI NAND was more than 2 years ago[1].
At that time, I didn't make BBT shareable and there were
too many duplicate code with parallel NAND, so that serie
stoped. But the discussion never stops. Now Boris has a plan
to make a generic NAND framework which can be shared with
both parallel and SPI NAND. Now the first step of the
new generic NAND framework is finished. And it is waiting
for a user. After discussion with Boris. We both think it's
time to rebuild SPI NAND framework based on the new NAND
framework and send out for reviewing.

This series includes two part. The first part (patch 1 to 9)
is a new generic NAND framework from Boris Brezillon, which
is from Biris's nand/generic branch[2]. The second part
(patch 10 to 15) introductes a SPI NAND framework based on
the new generic NAND framework.

This series only supports basic SPI NAND features and uses
generic spi controller for data transfer. ECC support is removed
since it's not in a good structure and more important, it should
be shared between different NAND devices, which means it should
be in new NAND core. Support different types of ECC and advanced
SPI NAND features is the next step.

This series is based on nand/next branch and is tested on
Xilinx Zedboard with Micron MT29F2G01ABAGDSF SPI NAND chip.


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


[1]http://lists.infradead.org/pipermail/linux-mtd/2015-January/057223.html
[2]https://github.com/bbrezillon/linux-0day/tree/nand/generic
[3]https://github.com/peterpansjtu/linux/tree/nand/spinand


Boris Brezillon (8):
  mtd: nand: Rename nand.h into rawnand.h
  mtd: nand: move raw NAND related code to the raw/ subdir
  mtd: nand: add a nand.h file to expose basic NAND stuff
  mtd: nand: raw: prefix conflicting names with nandcchip instead of
    nand
  mtd: nand: raw: create struct rawnand_device
  mtd: nand: raw: make BBT code more generic
  mtd: nand: move BBT code to drivers/mtd/nand/
  mtd: nand: Add the page iterator concept

Peter Pan (7):
  mtd: nand: make sure mtd_oob_ops consistent in bbt
  nand: spi: add basic blocks for infrastructure
  nand: spi: add basic operations support
  nand: spi: Add bad block support
  nand: spi: add Micron spi nand support
  nand: spi: Add generic SPI controller support
  MAINTAINERS: Add SPI NAND entry

 Documentation/DocBook/mtdnand.tmpl                 |   12 +-
 MAINTAINERS                                        |   29 +-
 arch/arm/mach-davinci/board-da850-evm.c            |    2 +-
 arch/arm/mach-davinci/board-dm355-evm.c            |    2 +-
 arch/arm/mach-davinci/board-dm355-leopard.c        |    2 +-
 arch/arm/mach-davinci/board-dm365-evm.c            |    2 +-
 arch/arm/mach-davinci/board-dm644x-evm.c           |    2 +-
 arch/arm/mach-davinci/board-dm646x-evm.c           |    2 +-
 arch/arm/mach-davinci/board-sffsdr.c               |    2 +-
 arch/arm/mach-dove/dove-db-setup.c                 |    2 +-
 arch/arm/mach-ep93xx/snappercl15.c                 |    6 +-
 arch/arm/mach-ep93xx/ts72xx.c                      |    6 +-
 arch/arm/mach-imx/mach-qong.c                      |    4 +-
 arch/arm/mach-ixp4xx/ixdp425-setup.c               |    4 +-
 arch/arm/mach-mmp/aspenite.c                       |    2 +-
 arch/arm/mach-omap1/board-fsample.c                |    2 +-
 arch/arm/mach-omap1/board-h2.c                     |    2 +-
 arch/arm/mach-omap1/board-h3.c                     |    2 +-
 arch/arm/mach-omap1/board-nand.c                   |    4 +-
 arch/arm/mach-omap1/board-perseus2.c               |    2 +-
 arch/arm/mach-orion5x/db88f5281-setup.c            |    2 +-
 arch/arm/mach-orion5x/kurobox_pro-setup.c          |    2 +-
 arch/arm/mach-orion5x/ts209-setup.c                |    2 +-
 arch/arm/mach-orion5x/ts78xx-setup.c               |    8 +-
 arch/arm/mach-pxa/balloon3.c                       |    4 +-
 arch/arm/mach-pxa/em-x270.c                        |    4 +-
 arch/arm/mach-pxa/eseries.c                        |    2 +-
 arch/arm/mach-pxa/palmtx.c                         |    4 +-
 arch/arm/mach-pxa/tosa.c                           |    2 +-
 arch/arm/mach-s3c24xx/common-smdk.c                |    2 +-
 arch/arm/mach-s3c24xx/mach-anubis.c                |    2 +-
 arch/arm/mach-s3c24xx/mach-at2440evb.c             |    2 +-
 arch/arm/mach-s3c24xx/mach-bast.c                  |    2 +-
 arch/arm/mach-s3c24xx/mach-gta02.c                 |    2 +-
 arch/arm/mach-s3c24xx/mach-jive.c                  |    2 +-
 arch/arm/mach-s3c24xx/mach-mini2440.c              |    2 +-
 arch/arm/mach-s3c24xx/mach-osiris.c                |    2 +-
 arch/arm/mach-s3c24xx/mach-qt2410.c                |    2 +-
 arch/arm/mach-s3c24xx/mach-rx3715.c                |    2 +-
 arch/arm/mach-s3c24xx/mach-vstms.c                 |    2 +-
 arch/blackfin/mach-bf537/boards/dnp5370.c          |    2 +-
 arch/blackfin/mach-bf537/boards/stamp.c            |    4 +-
 arch/blackfin/mach-bf561/boards/acvilon.c          |    4 +-
 arch/cris/arch-v32/drivers/mach-a3/nandflash.c     |    6 +-
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c     |    6 +-
 arch/mips/alchemy/devboards/db1200.c               |    4 +-
 arch/mips/alchemy/devboards/db1300.c               |    4 +-
 arch/mips/alchemy/devboards/db1550.c               |    4 +-
 arch/mips/include/asm/mach-jz4740/jz4740_nand.h    |    2 +-
 arch/mips/jz4740/board-qi_lb60.c                   |    2 +-
 arch/mips/netlogic/xlr/platform-flash.c            |    2 +-
 arch/mips/pnx833x/common/platform.c                |    4 +-
 arch/mips/rb532/devices.c                          |    4 +-
 arch/sh/boards/mach-migor/setup.c                  |    4 +-
 drivers/mtd/inftlcore.c                            |    2 +-
 drivers/mtd/nand/Kconfig                           |  566 +------
 drivers/mtd/nand/Makefile                          |   71 +-
 drivers/mtd/nand/{nand_bbt.c => bbt.c}             |  697 ++++----
 drivers/mtd/nand/raw/Kconfig                       |  566 +++++++
 drivers/mtd/nand/raw/Makefile                      |   69 +
 drivers/mtd/nand/{ => raw}/ams-delta.c             |   10 +-
 drivers/mtd/nand/{ => raw}/atmel/Makefile          |    0
 drivers/mtd/nand/{ => raw}/atmel/nand-controller.c |   52 +-
 drivers/mtd/nand/{ => raw}/atmel/pmecc.c           |    2 +-
 drivers/mtd/nand/{ => raw}/atmel/pmecc.h           |    0
 drivers/mtd/nand/{ => raw}/au1550nd.c              |   28 +-
 drivers/mtd/nand/{ => raw}/bcm47xxnflash/Makefile  |    0
 .../nand/{ => raw}/bcm47xxnflash/bcm47xxnflash.h   |    2 +-
 drivers/mtd/nand/{ => raw}/bcm47xxnflash/main.c    |    4 +-
 .../mtd/nand/{ => raw}/bcm47xxnflash/ops_bcm4706.c |   18 +-
 drivers/mtd/nand/{ => raw}/bf5xx_nand.c            |   34 +-
 drivers/mtd/nand/{ => raw}/brcmnand/Makefile       |    0
 .../mtd/nand/{ => raw}/brcmnand/bcm63138_nand.c    |    0
 drivers/mtd/nand/{ => raw}/brcmnand/bcm6368_nand.c |    0
 drivers/mtd/nand/{ => raw}/brcmnand/brcmnand.c     |   34 +-
 drivers/mtd/nand/{ => raw}/brcmnand/brcmnand.h     |    0
 drivers/mtd/nand/{ => raw}/brcmnand/brcmstb_nand.c |    0
 drivers/mtd/nand/{ => raw}/brcmnand/iproc_nand.c   |    0
 drivers/mtd/nand/{ => raw}/cafe_nand.c             |   26 +-
 drivers/mtd/nand/{ => raw}/cmx270_nand.c           |   14 +-
 drivers/mtd/nand/{ => raw}/cs553x_nand.c           |   22 +-
 drivers/mtd/nand/{ => raw}/davinci_nand.c          |   16 +-
 drivers/mtd/nand/{ => raw}/denali.c                |   14 +-
 drivers/mtd/nand/{ => raw}/denali.h                |    2 +-
 drivers/mtd/nand/{ => raw}/denali_dt.c             |    0
 drivers/mtd/nand/{ => raw}/denali_pci.c            |    0
 drivers/mtd/nand/{ => raw}/diskonchip.c            |   70 +-
 drivers/mtd/nand/{ => raw}/docg4.c                 |   45 +-
 drivers/mtd/nand/{ => raw}/fsl_elbc_nand.c         |   28 +-
 drivers/mtd/nand/{ => raw}/fsl_ifc_nand.c          |   30 +-
 drivers/mtd/nand/{ => raw}/fsl_upm.c               |   14 +-
 drivers/mtd/nand/{ => raw}/fsmc_nand.c             |   26 +-
 drivers/mtd/nand/{ => raw}/gpio.c                  |    8 +-
 drivers/mtd/nand/{ => raw}/gpmi-nand/Makefile      |    0
 drivers/mtd/nand/{ => raw}/gpmi-nand/bch-regs.h    |    0
 drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-lib.c    |    2 +-
 drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-nand.c   |   38 +-
 drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-nand.h   |    2 +-
 drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-regs.h   |    0
 drivers/mtd/nand/{ => raw}/hisi504_nand.c          |   26 +-
 drivers/mtd/nand/{ => raw}/jz4740_nand.c           |   14 +-
 drivers/mtd/nand/{ => raw}/jz4780_bch.c            |    0
 drivers/mtd/nand/{ => raw}/jz4780_bch.h            |    0
 drivers/mtd/nand/{ => raw}/jz4780_nand.c           |   10 +-
 drivers/mtd/nand/{ => raw}/lpc32xx_mlc.c           |   18 +-
 drivers/mtd/nand/{ => raw}/lpc32xx_slc.c           |   22 +-
 drivers/mtd/nand/{ => raw}/mpc5121_nfc.c           |   28 +-
 drivers/mtd/nand/{ => raw}/mtk_ecc.c               |    0
 drivers/mtd/nand/{ => raw}/mtk_ecc.h               |    0
 drivers/mtd/nand/{ => raw}/mtk_nand.c              |   40 +-
 drivers/mtd/nand/{ => raw}/mxc_nand.c              |   54 +-
 drivers/mtd/nand/{ => raw}/nand_amd.c              |    4 +-
 drivers/mtd/nand/{ => raw}/nand_base.c             |  272 +++-
 drivers/mtd/nand/{ => raw}/nand_bch.c              |    8 +-
 drivers/mtd/nand/{ => raw}/nand_ecc.c              |    6 +-
 drivers/mtd/nand/{ => raw}/nand_hynix.c            |   12 +-
 drivers/mtd/nand/{ => raw}/nand_ids.c              |    2 +-
 drivers/mtd/nand/{ => raw}/nand_macronix.c         |    2 +-
 drivers/mtd/nand/{ => raw}/nand_micron.c           |   12 +-
 drivers/mtd/nand/{ => raw}/nand_samsung.c          |    6 +-
 drivers/mtd/nand/{ => raw}/nand_timings.c          |    2 +-
 drivers/mtd/nand/{ => raw}/nand_toshiba.c          |    4 +-
 drivers/mtd/nand/{ => raw}/nandsim.c               |   24 +-
 drivers/mtd/nand/{ => raw}/ndfc.c                  |   20 +-
 drivers/mtd/nand/{ => raw}/nuc900_nand.c           |   10 +-
 drivers/mtd/nand/{ => raw}/omap2.c                 |   22 +-
 drivers/mtd/nand/{ => raw}/omap_elm.c              |    0
 drivers/mtd/nand/{ => raw}/orion_nand.c            |   10 +-
 drivers/mtd/nand/{ => raw}/oxnas_nand.c            |   14 +-
 drivers/mtd/nand/{ => raw}/pasemi_nand.c           |   12 +-
 drivers/mtd/nand/{ => raw}/plat_nand.c             |    6 +-
 drivers/mtd/nand/{ => raw}/pxa3xx_nand.c           |   38 +-
 drivers/mtd/nand/{ => raw}/qcom_nandc.c            |   30 +-
 drivers/mtd/nand/{ => raw}/r852.c                  |    8 +-
 drivers/mtd/nand/{ => raw}/r852.h                  |    2 +-
 drivers/mtd/nand/{ => raw}/s3c2410.c               |   18 +-
 drivers/mtd/nand/{ => raw}/sh_flctl.c              |   12 +-
 drivers/mtd/nand/{ => raw}/sharpsl.c               |   10 +-
 drivers/mtd/nand/{ => raw}/sm_common.c             |    4 +-
 drivers/mtd/nand/{ => raw}/sm_common.h             |    0
 drivers/mtd/nand/{ => raw}/socrates_nand.c         |   14 +-
 drivers/mtd/nand/{ => raw}/sunxi_nand.c            |   60 +-
 drivers/mtd/nand/{ => raw}/tango_nand.c            |   32 +-
 drivers/mtd/nand/{ => raw}/tmio_nand.c             |   10 +-
 drivers/mtd/nand/{ => raw}/txx9ndfmc.c             |   16 +-
 drivers/mtd/nand/{ => raw}/vf610_nfc.c             |    6 +-
 drivers/mtd/nand/{ => raw}/xway_nand.c             |   12 +-
 drivers/mtd/nand/spi/Kconfig                       |    7 +
 drivers/mtd/nand/spi/Makefile                      |    3 +
 drivers/mtd/nand/spi/controllers/Kconfig           |    5 +
 drivers/mtd/nand/spi/controllers/Makefile          |    1 +
 drivers/mtd/nand/spi/controllers/generic-spi.c     |  162 ++
 drivers/mtd/nand/spi/core.c                        | 1381 ++++++++++++++++
 drivers/mtd/nand/spi/micron.c                      |  157 ++
 drivers/mtd/nftlcore.c                             |    2 +-
 drivers/mtd/nftlmount.c                            |    2 +-
 drivers/mtd/sm_ftl.c                               |    2 +-
 drivers/mtd/ssfdc.c                                |    2 +-
 drivers/mtd/tests/nandbiterrs.c                    |    2 +-
 drivers/staging/mt29f_spinand/mt29f_spinand.c      |    8 +-
 fs/jffs2/wbuf.c                                    |    2 +-
 include/linux/mtd/nand-gpio.h                      |    2 +-
 include/linux/mtd/nand.h                           | 1667 +++++++-------------
 include/linux/mtd/rawnand.h                        | 1286 +++++++++++++++
 include/linux/mtd/sh_flctl.h                       |    4 +-
 include/linux/mtd/sharpsl.h                        |    2 +-
 include/linux/mtd/spinand.h                        |  272 ++++
 include/linux/platform_data/atmel.h                |    2 +-
 include/linux/platform_data/mtd-davinci.h          |    2 +-
 include/linux/platform_data/mtd-nand-s3c2410.h     |    2 +-
 170 files changed, 5708 insertions(+), 2906 deletions(-)
 rename drivers/mtd/nand/{nand_bbt.c => bbt.c} (69%)
 create mode 100644 drivers/mtd/nand/raw/Kconfig
 create mode 100644 drivers/mtd/nand/raw/Makefile
 rename drivers/mtd/nand/{ => raw}/ams-delta.c (97%)
 rename drivers/mtd/nand/{ => raw}/atmel/Makefile (100%)
 rename drivers/mtd/nand/{ => raw}/atmel/nand-controller.c (97%)
 rename drivers/mtd/nand/{ => raw}/atmel/pmecc.c (99%)
 rename drivers/mtd/nand/{ => raw}/atmel/pmecc.h (100%)
 rename drivers/mtd/nand/{ => raw}/au1550nd.c (95%)
 rename drivers/mtd/nand/{ => raw}/bcm47xxnflash/Makefile (100%)
 rename drivers/mtd/nand/{ => raw}/bcm47xxnflash/bcm47xxnflash.h (92%)
 rename drivers/mtd/nand/{ => raw}/bcm47xxnflash/main.c (95%)
 rename drivers/mtd/nand/{ => raw}/bcm47xxnflash/ops_bcm4706.c (96%)
 rename drivers/mtd/nand/{ => raw}/bf5xx_nand.c (95%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/Makefile (100%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/bcm63138_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/bcm6368_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/brcmnand.c (98%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/brcmnand.h (100%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/brcmstb_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/brcmnand/iproc_nand.c (100%)
 rename drivers/mtd/nand/{ => raw}/cafe_nand.c (97%)
 rename drivers/mtd/nand/{ => raw}/cmx270_nand.c (94%)
 rename drivers/mtd/nand/{ => raw}/cs553x_nand.c (95%)
 rename drivers/mtd/nand/{ => raw}/davinci_nand.c (98%)
 rename drivers/mtd/nand/{ => raw}/denali.c (99%)
 rename drivers/mtd/nand/{ => raw}/denali.h (99%)
 rename drivers/mtd/nand/{ => raw}/denali_dt.c (100%)
 rename drivers/mtd/nand/{ => raw}/denali_pci.c (100%)
 rename drivers/mtd/nand/{ => raw}/diskonchip.c (96%)
 rename drivers/mtd/nand/{ => raw}/docg4.c (97%)
 rename drivers/mtd/nand/{ => raw}/fsl_elbc_nand.c (97%)
 rename drivers/mtd/nand/{ => raw}/fsl_ifc_nand.c (97%)
 rename drivers/mtd/nand/{ => raw}/fsl_upm.c (95%)
 rename drivers/mtd/nand/{ => raw}/fsmc_nand.c (97%)
 rename drivers/mtd/nand/{ => raw}/gpio.c (97%)
 rename drivers/mtd/nand/{ => raw}/gpmi-nand/Makefile (100%)
 rename drivers/mtd/nand/{ => raw}/gpmi-nand/bch-regs.h (100%)
 rename drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-lib.c (99%)
 rename drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-nand.c (98%)
 rename drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-nand.h (99%)
 rename drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-regs.h (100%)
 rename drivers/mtd/nand/{ => raw}/hisi504_nand.c (97%)
 rename drivers/mtd/nand/{ => raw}/jz4740_nand.c (97%)
 rename drivers/mtd/nand/{ => raw}/jz4780_bch.c (100%)
 rename drivers/mtd/nand/{ => raw}/jz4780_bch.h (100%)
 rename drivers/mtd/nand/{ => raw}/jz4780_nand.c (97%)
 rename drivers/mtd/nand/{ => raw}/lpc32xx_mlc.c (98%)
 rename drivers/mtd/nand/{ => raw}/lpc32xx_slc.c (98%)
 rename drivers/mtd/nand/{ => raw}/mpc5121_nfc.c (96%)
 rename drivers/mtd/nand/{ => raw}/mtk_ecc.c (100%)
 rename drivers/mtd/nand/{ => raw}/mtk_ecc.h (100%)
 rename drivers/mtd/nand/{ => raw}/mtk_nand.c (97%)
 rename drivers/mtd/nand/{ => raw}/mxc_nand.c (97%)
 rename drivers/mtd/nand/{ => raw}/nand_amd.c (94%)
 rename drivers/mtd/nand/{ => raw}/nand_base.c (94%)
 rename drivers/mtd/nand/{ => raw}/nand_bch.c (97%)
 rename drivers/mtd/nand/{ => raw}/nand_ecc.c (99%)
 rename drivers/mtd/nand/{ => raw}/nand_hynix.c (98%)
 rename drivers/mtd/nand/{ => raw}/nand_ids.c (99%)
 rename drivers/mtd/nand/{ => raw}/nand_macronix.c (96%)
 rename drivers/mtd/nand/{ => raw}/nand_micron.c (96%)
 rename drivers/mtd/nand/{ => raw}/nand_samsung.c (95%)
 rename drivers/mtd/nand/{ => raw}/nand_timings.c (99%)
 rename drivers/mtd/nand/{ => raw}/nand_toshiba.c (95%)
 rename drivers/mtd/nand/{ => raw}/nandsim.c (99%)
 rename drivers/mtd/nand/{ => raw}/ndfc.c (93%)
 rename drivers/mtd/nand/{ => raw}/nuc900_nand.c (96%)
 rename drivers/mtd/nand/{ => raw}/omap2.c (99%)
 rename drivers/mtd/nand/{ => raw}/omap_elm.c (100%)
 rename drivers/mtd/nand/{ => raw}/orion_nand.c (96%)
 rename drivers/mtd/nand/{ => raw}/oxnas_nand.c (93%)
 rename drivers/mtd/nand/{ => raw}/pasemi_nand.c (95%)
 rename drivers/mtd/nand/{ => raw}/plat_nand.c (96%)
 rename drivers/mtd/nand/{ => raw}/pxa3xx_nand.c (98%)
 rename drivers/mtd/nand/{ => raw}/qcom_nandc.c (98%)
 rename drivers/mtd/nand/{ => raw}/r852.c (99%)
 rename drivers/mtd/nand/{ => raw}/r852.h (99%)
 rename drivers/mtd/nand/{ => raw}/s3c2410.c (98%)
 rename drivers/mtd/nand/{ => raw}/sh_flctl.c (99%)
 rename drivers/mtd/nand/{ => raw}/sharpsl.c (96%)
 rename drivers/mtd/nand/{ => raw}/sm_common.c (98%)
 rename drivers/mtd/nand/{ => raw}/sm_common.h (100%)
 rename drivers/mtd/nand/{ => raw}/socrates_nand.c (94%)
 rename drivers/mtd/nand/{ => raw}/sunxi_nand.c (97%)
 rename drivers/mtd/nand/{ => raw}/tango_nand.c (95%)
 rename drivers/mtd/nand/{ => raw}/tmio_nand.c (98%)
 rename drivers/mtd/nand/{ => raw}/txx9ndfmc.c (97%)
 rename drivers/mtd/nand/{ => raw}/vf610_nfc.c (99%)
 rename drivers/mtd/nand/{ => raw}/xway_nand.c (96%)
 create mode 100644 drivers/mtd/nand/spi/Kconfig
 create mode 100644 drivers/mtd/nand/spi/Makefile
 create mode 100644 drivers/mtd/nand/spi/controllers/Kconfig
 create mode 100644 drivers/mtd/nand/spi/controllers/Makefile
 create mode 100644 drivers/mtd/nand/spi/controllers/generic-spi.c
 create mode 100644 drivers/mtd/nand/spi/core.c
 create mode 100644 drivers/mtd/nand/spi/micron.c
 create mode 100644 include/linux/mtd/rawnand.h
 create mode 100644 include/linux/mtd/spinand.h

-- 
1.9.1
