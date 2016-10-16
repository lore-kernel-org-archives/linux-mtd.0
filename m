Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bvmXX-0006Ud-GM
 for linux-mtd@lists.infradead.org; Sun, 16 Oct 2016 14:35:54 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Peter Pan <peterpansjtu@gmail.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] mtd: nand: Abstract away the NAND interface type
Date: Sun, 16 Oct 2016 16:35:11 +0200
Message-Id: <1476628518-20450-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This series is aiming at providing a generic NAND layer to share code
between different NAND based devices.

We currently have 3 different interfaces to interact with NANDs:
- Raw NANDs
- OneNANDs
- SPI NANDs

Apart from the way these NAND devices are accessed they have a lot
in common, like the way the memory is organized, or their constraints.
This is usually a good sign that some work should be done to factorize
the code.

This work has been started by Peter who wanted to re-use the BBT
code for its SPI-NAND driver. But I think we can push it further
other stuff (the software ECC implementation, or the way offsets are
converted to block/page number).

Peter, can you please review/test this version, and if possible, post
the code you've done to support SPI NANDs.

Thanks,

Boris

Changes since v1:
- use the 'raw' prefix instead of 'rawnand'
- fix a few coding style issues and typos

Boris Brezillon (7):
  mtd: nand: Rename nand.h into rawnand.h
  mtd: nand: move raw NAND related code to the raw/ subdir
  mtd: nand: add a nand.h file to expose basic NAND stuff
  mtd: nand: raw: prefix conflicting names with nandc instead of nand
  mtd: nand: raw: create struct rawnand_device
  mtd: nand: raw: make BBT code more generic
  mtd: nand: move BBT code to drivers/mtd/nand/

 Documentation/DocBook/mtdnand.tmpl                 |   12 +-
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
 arch/arm/mach-omap2/gpmc-nand.c                    |    2 +-
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
 drivers/mtd/nand/Kconfig                           |  572 +-------
 drivers/mtd/nand/Makefile                          |   63 +-
 drivers/mtd/nand/{nand_bbt.c => bbt.c}             |  616 ++++-----
 drivers/mtd/nand/raw/Kconfig                       |  573 ++++++++
 drivers/mtd/nand/raw/Makefile                      |   62 +
 drivers/mtd/nand/{ => raw}/ams-delta.c             |   10 +-
 drivers/mtd/nand/{ => raw}/atmel_nand.c            |   62 +-
 drivers/mtd/nand/{ => raw}/atmel_nand_ecc.h        |    0
 drivers/mtd/nand/{ => raw}/atmel_nand_nfc.h        |    0
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
 drivers/mtd/nand/{ => raw}/denali.c                |   12 +-
 drivers/mtd/nand/{ => raw}/denali.h                |    2 +-
 drivers/mtd/nand/{ => raw}/denali_dt.c             |    0
 drivers/mtd/nand/{ => raw}/denali_pci.c            |    0
 drivers/mtd/nand/{ => raw}/diskonchip.c            |   70 +-
 drivers/mtd/nand/{ => raw}/docg4.c                 |   38 +-
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
 drivers/mtd/nand/{ => raw}/nand_base.c             |  238 +++-
 drivers/mtd/nand/{ => raw}/nand_bch.c              |    8 +-
 drivers/mtd/nand/{ => raw}/nand_ecc.c              |    6 +-
 drivers/mtd/nand/{ => raw}/nand_ids.c              |    2 +-
 drivers/mtd/nand/{ => raw}/nand_timings.c          |    2 +-
 drivers/mtd/nand/{ => raw}/nandsim.c               |   24 +-
 drivers/mtd/nand/{ => raw}/ndfc.c                  |   20 +-
 drivers/mtd/nand/{ => raw}/nuc900_nand.c           |   10 +-
 drivers/mtd/nand/{ => raw}/omap2.c                 |   22 +-
 drivers/mtd/nand/{ => raw}/omap_elm.c              |    0
 drivers/mtd/nand/{ => raw}/orion_nand.c            |    8 +-
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
 drivers/mtd/nand/{ => raw}/tmio_nand.c             |   10 +-
 drivers/mtd/nand/{ => raw}/txx9ndfmc.c             |   16 +-
 drivers/mtd/nand/{ => raw}/vf610_nfc.c             |    6 +-
 drivers/mtd/nand/{ => raw}/xway_nand.c             |   12 +-
 drivers/mtd/nftlcore.c                             |    2 +-
 drivers/mtd/nftlmount.c                            |    2 +-
 drivers/mtd/sm_ftl.c                               |    2 +-
 drivers/mtd/ssfdc.c                                |    2 +-
 drivers/mtd/tests/nandbiterrs.c                    |    2 +-
 drivers/staging/mt29f_spinand/mt29f_spinand.c      |    8 +-
 fs/jffs2/wbuf.c                                    |    2 +-
 include/linux/mtd/nand-gpio.h                      |    2 +-
 include/linux/mtd/nand.h                           | 1424 +++++---------------
 include/linux/mtd/rawnand.h                        | 1200 +++++++++++++++++
 include/linux/mtd/sh_flctl.h                       |    4 +-
 include/linux/mtd/sharpsl.h                        |    2 +-
 include/linux/platform_data/atmel.h                |    2 +-
 include/linux/platform_data/mtd-davinci.h          |    2 +-
 152 files changed, 3316 insertions(+), 2746 deletions(-)
 rename drivers/mtd/nand/{nand_bbt.c => bbt.c} (72%)
 create mode 100644 drivers/mtd/nand/raw/Kconfig
 create mode 100644 drivers/mtd/nand/raw/Makefile
 rename drivers/mtd/nand/{ => raw}/ams-delta.c (97%)
 rename drivers/mtd/nand/{ => raw}/atmel_nand.c (97%)
 rename drivers/mtd/nand/{ => raw}/atmel_nand_ecc.h (100%)
 rename drivers/mtd/nand/{ => raw}/atmel_nand_nfc.h (100%)
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
 rename drivers/mtd/nand/{ => raw}/docg4.c (98%)
 rename drivers/mtd/nand/{ => raw}/fsl_elbc_nand.c (97%)
 rename drivers/mtd/nand/{ => raw}/fsl_ifc_nand.c (97%)
 rename drivers/mtd/nand/{ => raw}/fsl_upm.c (96%)
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
 rename drivers/mtd/nand/{ => raw}/mpc5121_nfc.c (97%)
 rename drivers/mtd/nand/{ => raw}/mtk_ecc.c (100%)
 rename drivers/mtd/nand/{ => raw}/mtk_ecc.h (100%)
 rename drivers/mtd/nand/{ => raw}/mtk_nand.c (97%)
 rename drivers/mtd/nand/{ => raw}/mxc_nand.c (97%)
 rename drivers/mtd/nand/{ => raw}/nand_base.c (95%)
 rename drivers/mtd/nand/{ => raw}/nand_bch.c (97%)
 rename drivers/mtd/nand/{ => raw}/nand_ecc.c (99%)
 rename drivers/mtd/nand/{ => raw}/nand_ids.c (99%)
 rename drivers/mtd/nand/{ => raw}/nand_timings.c (99%)
 rename drivers/mtd/nand/{ => raw}/nandsim.c (99%)
 rename drivers/mtd/nand/{ => raw}/ndfc.c (93%)
 rename drivers/mtd/nand/{ => raw}/nuc900_nand.c (96%)
 rename drivers/mtd/nand/{ => raw}/omap2.c (99%)
 rename drivers/mtd/nand/{ => raw}/omap_elm.c (100%)
 rename drivers/mtd/nand/{ => raw}/orion_nand.c (97%)
 rename drivers/mtd/nand/{ => raw}/pasemi_nand.c (95%)
 rename drivers/mtd/nand/{ => raw}/plat_nand.c (97%)
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
 rename drivers/mtd/nand/{ => raw}/tmio_nand.c (98%)
 rename drivers/mtd/nand/{ => raw}/txx9ndfmc.c (97%)
 rename drivers/mtd/nand/{ => raw}/vf610_nfc.c (99%)
 rename drivers/mtd/nand/{ => raw}/xway_nand.c (96%)
 create mode 100644 include/linux/mtd/rawnand.h

-- 
2.7.4
