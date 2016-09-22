Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bn11C-0002Aw-TU
 for linux-mtd@lists.infradead.org; Thu, 22 Sep 2016 10:14:19 +0000
Date: Thu, 22 Sep 2016 12:13:53 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Peter
 Pan <peterpansjtu@gmail.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>
Subject: Re: [RFC PATCH 0/7] mtd: nand: Abstract away the NAND interface type
Message-ID: <20160922121353.5e826d69@bbrezillon>
In-Reply-To: <1474539180-5863-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1474539180-5863-1-git-send-email-boris.brezillon@free-electrons.com>
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

On Thu, 22 Sep 2016 12:12:53 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi,
> 
> This series is aiming at providing a generic NAND layer to share code
> between different NAND based devices.
> 
> We currently have 3 different interfaces to interact with NANDs:
> - Raw NANDs
> - OneNANDs
> - SPI NANDs
> 
> Apart from the way these NAND devices are accessed they have a lot
> in common, like the way the memory is organized, or their constraints.
> This is usually a good sign that some work should be done to factorize
> the code.
> 
> This work has been started by Peter who wanted to re-use the BBT
> code for its SPI-NAND driver. But I think we can push it further
> other stuff (the software ECC implementation, or the way offsets are
> converted to block/page number).
> 
> Before I continue in this direction, I'd like to get some feedback
> from Peter and those who reviewed his initial submission (Brian,
> Ezequiel) [1], or anyone who is interested in this topic.

Forgot to mention that it's based on nand/next.

> 
> Thanks,
> 
> Boris
> 
> [1]http://lists.infradead.org/pipermail/linux-mtd/2015-September/062084.html
> 
> Boris Brezillon (7):
>   mtd: nand: Rename nand.h into rawnand.h
>   mtd: nand: move code to rawnand/ subdir
>   mtd: nand: add a nand.h file to expose basic NAND stuff
>   mtd: nand: rawnand: prefix conflicting names with nandc instead of
>     nand
>   mtd: nand: rawnand: create struct rawnand_device
>   mtd: nand: rawnand: make BBT code more generic
>   mtd: nand: rawnand: move BBT code to drivers/mtd/nand/
> 
>  Documentation/DocBook/mtdnand.tmpl                 |   12 +-
>  arch/arm/mach-davinci/board-da850-evm.c            |    2 +-
>  arch/arm/mach-davinci/board-dm355-evm.c            |    2 +-
>  arch/arm/mach-davinci/board-dm355-leopard.c        |    2 +-
>  arch/arm/mach-davinci/board-dm365-evm.c            |    2 +-
>  arch/arm/mach-davinci/board-dm644x-evm.c           |    2 +-
>  arch/arm/mach-davinci/board-dm646x-evm.c           |    2 +-
>  arch/arm/mach-davinci/board-sffsdr.c               |    2 +-
>  arch/arm/mach-dove/dove-db-setup.c                 |    2 +-
>  arch/arm/mach-ep93xx/snappercl15.c                 |    6 +-
>  arch/arm/mach-ep93xx/ts72xx.c                      |    6 +-
>  arch/arm/mach-imx/mach-qong.c                      |    4 +-
>  arch/arm/mach-ixp4xx/ixdp425-setup.c               |    4 +-
>  arch/arm/mach-mmp/aspenite.c                       |    2 +-
>  arch/arm/mach-omap1/board-fsample.c                |    2 +-
>  arch/arm/mach-omap1/board-h2.c                     |    2 +-
>  arch/arm/mach-omap1/board-h3.c                     |    2 +-
>  arch/arm/mach-omap1/board-nand.c                   |    4 +-
>  arch/arm/mach-omap1/board-perseus2.c               |    2 +-
>  arch/arm/mach-omap2/gpmc-nand.c                    |    2 +-
>  arch/arm/mach-orion5x/db88f5281-setup.c            |    2 +-
>  arch/arm/mach-orion5x/kurobox_pro-setup.c          |    2 +-
>  arch/arm/mach-orion5x/ts209-setup.c                |    2 +-
>  arch/arm/mach-orion5x/ts78xx-setup.c               |    8 +-
>  arch/arm/mach-pxa/balloon3.c                       |    4 +-
>  arch/arm/mach-pxa/em-x270.c                        |    4 +-
>  arch/arm/mach-pxa/eseries.c                        |    2 +-
>  arch/arm/mach-pxa/palmtx.c                         |    4 +-
>  arch/arm/mach-pxa/tosa.c                           |    2 +-
>  arch/arm/mach-s3c24xx/common-smdk.c                |    2 +-
>  arch/arm/mach-s3c24xx/mach-anubis.c                |    2 +-
>  arch/arm/mach-s3c24xx/mach-at2440evb.c             |    2 +-
>  arch/arm/mach-s3c24xx/mach-bast.c                  |    2 +-
>  arch/arm/mach-s3c24xx/mach-gta02.c                 |    2 +-
>  arch/arm/mach-s3c24xx/mach-jive.c                  |    2 +-
>  arch/arm/mach-s3c24xx/mach-mini2440.c              |    2 +-
>  arch/arm/mach-s3c24xx/mach-osiris.c                |    2 +-
>  arch/arm/mach-s3c24xx/mach-qt2410.c                |    2 +-
>  arch/arm/mach-s3c24xx/mach-rx3715.c                |    2 +-
>  arch/arm/mach-s3c24xx/mach-vstms.c                 |    2 +-
>  arch/blackfin/mach-bf537/boards/dnp5370.c          |    2 +-
>  arch/blackfin/mach-bf537/boards/stamp.c            |    4 +-
>  arch/blackfin/mach-bf561/boards/acvilon.c          |    4 +-
>  arch/cris/arch-v32/drivers/mach-a3/nandflash.c     |    6 +-
>  arch/cris/arch-v32/drivers/mach-fs/nandflash.c     |    6 +-
>  arch/mips/alchemy/devboards/db1200.c               |    4 +-
>  arch/mips/alchemy/devboards/db1300.c               |    4 +-
>  arch/mips/alchemy/devboards/db1550.c               |    4 +-
>  arch/mips/include/asm/mach-jz4740/jz4740_nand.h    |    2 +-
>  arch/mips/jz4740/board-qi_lb60.c                   |    2 +-
>  arch/mips/netlogic/xlr/platform-flash.c            |    2 +-
>  arch/mips/pnx833x/common/platform.c                |    4 +-
>  arch/mips/rb532/devices.c                          |    4 +-
>  arch/sh/boards/mach-migor/setup.c                  |    4 +-
>  drivers/mtd/inftlcore.c                            |    2 +-
>  drivers/mtd/nand/Kconfig                           |  572 +--
>  drivers/mtd/nand/Makefile                          |   63 +-
>  drivers/mtd/nand/ams-delta.c                       |  291 --
>  drivers/mtd/nand/atmel_nand.c                      | 2481 ----------
>  drivers/mtd/nand/atmel_nand_ecc.h                  |  163 -
>  drivers/mtd/nand/atmel_nand_nfc.h                  |  103 -
>  drivers/mtd/nand/au1550nd.c                        |  518 --
>  drivers/mtd/nand/bbt.c                             | 1410 ++++++
>  drivers/mtd/nand/bcm47xxnflash/Makefile            |    4 -
>  drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h     |   25 -
>  drivers/mtd/nand/bcm47xxnflash/main.c              |   81 -
>  drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c       |  454 --
>  drivers/mtd/nand/bf5xx_nand.c                      |  860 ----
>  drivers/mtd/nand/brcmnand/Makefile                 |    7 -
>  drivers/mtd/nand/brcmnand/bcm63138_nand.c          |  109 -
>  drivers/mtd/nand/brcmnand/bcm6368_nand.c           |  142 -
>  drivers/mtd/nand/brcmnand/brcmnand.c               | 2561 ----------
>  drivers/mtd/nand/brcmnand/brcmnand.h               |   74 -
>  drivers/mtd/nand/brcmnand/brcmstb_nand.c           |   44 -
>  drivers/mtd/nand/brcmnand/iproc_nand.c             |  160 -
>  drivers/mtd/nand/cafe_nand.c                       |  898 ----
>  drivers/mtd/nand/cmx270_nand.c                     |  246 -
>  drivers/mtd/nand/cs553x_nand.c                     |  358 --
>  drivers/mtd/nand/davinci_nand.c                    |  862 ----
>  drivers/mtd/nand/denali.c                          | 1663 -------
>  drivers/mtd/nand/denali.h                          |  484 --
>  drivers/mtd/nand/denali_dt.c                       |  131 -
>  drivers/mtd/nand/denali_pci.c                      |  121 -
>  drivers/mtd/nand/diskonchip.c                      | 1712 -------
>  drivers/mtd/nand/docg4.c                           | 1410 ------
>  drivers/mtd/nand/fsl_elbc_nand.c                   |  977 ----
>  drivers/mtd/nand/fsl_ifc_nand.c                    | 1095 -----
>  drivers/mtd/nand/fsl_upm.c                         |  363 --
>  drivers/mtd/nand/fsmc_nand.c                       | 1100 -----
>  drivers/mtd/nand/gpio.c                            |  322 --
>  drivers/mtd/nand/gpmi-nand/Makefile                |    3 -
>  drivers/mtd/nand/gpmi-nand/bch-regs.h              |  128 -
>  drivers/mtd/nand/gpmi-nand/gpmi-lib.c              | 1508 ------
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c             | 2193 ---------
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.h             |  310 --
>  drivers/mtd/nand/gpmi-nand/gpmi-regs.h             |  187 -
>  drivers/mtd/nand/hisi504_nand.c                    |  898 ----
>  drivers/mtd/nand/jz4740_nand.c                     |  557 ---
>  drivers/mtd/nand/jz4780_bch.c                      |  380 --
>  drivers/mtd/nand/jz4780_bch.h                      |   43 -
>  drivers/mtd/nand/jz4780_nand.c                     |  416 --
>  drivers/mtd/nand/lpc32xx_mlc.c                     |  902 ----
>  drivers/mtd/nand/lpc32xx_slc.c                     | 1041 ----
>  drivers/mtd/nand/mpc5121_nfc.c                     |  855 ----
>  drivers/mtd/nand/mtk_ecc.c                         |  530 ---
>  drivers/mtd/nand/mtk_ecc.h                         |   50 -
>  drivers/mtd/nand/mtk_nand.c                        | 1526 ------
>  drivers/mtd/nand/mxc_nand.c                        | 1857 --------
>  drivers/mtd/nand/nand_base.c                       | 4840 -------------------
>  drivers/mtd/nand/nand_bbt.c                        | 1452 ------
>  drivers/mtd/nand/nand_bch.c                        |  234 -
>  drivers/mtd/nand/nand_ecc.c                        |  533 ---
>  drivers/mtd/nand/nand_ids.c                        |  193 -
>  drivers/mtd/nand/nand_timings.c                    |  311 --
>  drivers/mtd/nand/nandsim.c                         | 2431 ----------
>  drivers/mtd/nand/ndfc.c                            |  286 --
>  drivers/mtd/nand/nuc900_nand.c                     |  306 --
>  drivers/mtd/nand/omap2.c                           | 2214 ---------
>  drivers/mtd/nand/omap_elm.c                        |  578 ---
>  drivers/mtd/nand/orion_nand.c                      |  218 -
>  drivers/mtd/nand/pasemi_nand.c                     |  233 -
>  drivers/mtd/nand/plat_nand.c                       |  145 -
>  drivers/mtd/nand/pxa3xx_nand.c                     | 2067 --------
>  drivers/mtd/nand/qcom_nandc.c                      | 2208 ---------
>  drivers/mtd/nand/r852.c                            | 1082 -----
>  drivers/mtd/nand/r852.h                            |  160 -
>  drivers/mtd/nand/rawnand/Kconfig                   |  573 +++
>  drivers/mtd/nand/rawnand/Makefile                  |   62 +
>  drivers/mtd/nand/rawnand/ams-delta.c               |  291 ++
>  drivers/mtd/nand/rawnand/atmel_nand.c              | 2481 ++++++++++
>  drivers/mtd/nand/rawnand/atmel_nand_ecc.h          |  163 +
>  drivers/mtd/nand/rawnand/atmel_nand_nfc.h          |  103 +
>  drivers/mtd/nand/rawnand/au1550nd.c                |  518 ++
>  drivers/mtd/nand/rawnand/bcm47xxnflash/Makefile    |    4 +
>  .../mtd/nand/rawnand/bcm47xxnflash/bcm47xxnflash.h |   25 +
>  drivers/mtd/nand/rawnand/bcm47xxnflash/main.c      |   81 +
>  .../mtd/nand/rawnand/bcm47xxnflash/ops_bcm4706.c   |  454 ++
>  drivers/mtd/nand/rawnand/bf5xx_nand.c              |  860 ++++
>  drivers/mtd/nand/rawnand/brcmnand/Makefile         |    7 +
>  drivers/mtd/nand/rawnand/brcmnand/bcm63138_nand.c  |  109 +
>  drivers/mtd/nand/rawnand/brcmnand/bcm6368_nand.c   |  142 +
>  drivers/mtd/nand/rawnand/brcmnand/brcmnand.c       | 2561 ++++++++++
>  drivers/mtd/nand/rawnand/brcmnand/brcmnand.h       |   74 +
>  drivers/mtd/nand/rawnand/brcmnand/brcmstb_nand.c   |   44 +
>  drivers/mtd/nand/rawnand/brcmnand/iproc_nand.c     |  160 +
>  drivers/mtd/nand/rawnand/cafe_nand.c               |  898 ++++
>  drivers/mtd/nand/rawnand/cmx270_nand.c             |  246 +
>  drivers/mtd/nand/rawnand/cs553x_nand.c             |  358 ++
>  drivers/mtd/nand/rawnand/davinci_nand.c            |  862 ++++
>  drivers/mtd/nand/rawnand/denali.c                  | 1663 +++++++
>  drivers/mtd/nand/rawnand/denali.h                  |  484 ++
>  drivers/mtd/nand/rawnand/denali_dt.c               |  131 +
>  drivers/mtd/nand/rawnand/denali_pci.c              |  121 +
>  drivers/mtd/nand/rawnand/diskonchip.c              | 1712 +++++++
>  drivers/mtd/nand/rawnand/docg4.c                   | 1410 ++++++
>  drivers/mtd/nand/rawnand/fsl_elbc_nand.c           |  977 ++++
>  drivers/mtd/nand/rawnand/fsl_ifc_nand.c            | 1095 +++++
>  drivers/mtd/nand/rawnand/fsl_upm.c                 |  363 ++
>  drivers/mtd/nand/rawnand/fsmc_nand.c               | 1100 +++++
>  drivers/mtd/nand/rawnand/gpio.c                    |  322 ++
>  drivers/mtd/nand/rawnand/gpmi-nand/Makefile        |    3 +
>  drivers/mtd/nand/rawnand/gpmi-nand/bch-regs.h      |  128 +
>  drivers/mtd/nand/rawnand/gpmi-nand/gpmi-lib.c      | 1508 ++++++
>  drivers/mtd/nand/rawnand/gpmi-nand/gpmi-nand.c     | 2193 +++++++++
>  drivers/mtd/nand/rawnand/gpmi-nand/gpmi-nand.h     |  310 ++
>  drivers/mtd/nand/rawnand/gpmi-nand/gpmi-regs.h     |  187 +
>  drivers/mtd/nand/rawnand/hisi504_nand.c            |  898 ++++
>  drivers/mtd/nand/rawnand/jz4740_nand.c             |  557 +++
>  drivers/mtd/nand/rawnand/jz4780_bch.c              |  380 ++
>  drivers/mtd/nand/rawnand/jz4780_bch.h              |   43 +
>  drivers/mtd/nand/rawnand/jz4780_nand.c             |  416 ++
>  drivers/mtd/nand/rawnand/lpc32xx_mlc.c             |  902 ++++
>  drivers/mtd/nand/rawnand/lpc32xx_slc.c             | 1041 ++++
>  drivers/mtd/nand/rawnand/mpc5121_nfc.c             |  855 ++++
>  drivers/mtd/nand/rawnand/mtk_ecc.c                 |  530 +++
>  drivers/mtd/nand/rawnand/mtk_ecc.h                 |   50 +
>  drivers/mtd/nand/rawnand/mtk_nand.c                | 1526 ++++++
>  drivers/mtd/nand/rawnand/mxc_nand.c                | 1857 ++++++++
>  drivers/mtd/nand/rawnand/nand_base.c               | 4946 ++++++++++++++++++++
>  drivers/mtd/nand/rawnand/nand_bch.c                |  234 +
>  drivers/mtd/nand/rawnand/nand_ecc.c                |  533 +++
>  drivers/mtd/nand/rawnand/nand_ids.c                |  193 +
>  drivers/mtd/nand/rawnand/nand_timings.c            |  311 ++
>  drivers/mtd/nand/rawnand/nandsim.c                 | 2431 ++++++++++
>  drivers/mtd/nand/rawnand/ndfc.c                    |  286 ++
>  drivers/mtd/nand/rawnand/nuc900_nand.c             |  306 ++
>  drivers/mtd/nand/rawnand/omap2.c                   | 2214 +++++++++
>  drivers/mtd/nand/rawnand/omap_elm.c                |  578 +++
>  drivers/mtd/nand/rawnand/orion_nand.c              |  218 +
>  drivers/mtd/nand/rawnand/pasemi_nand.c             |  233 +
>  drivers/mtd/nand/rawnand/plat_nand.c               |  145 +
>  drivers/mtd/nand/rawnand/pxa3xx_nand.c             | 2067 ++++++++
>  drivers/mtd/nand/rawnand/qcom_nandc.c              | 2208 +++++++++
>  drivers/mtd/nand/rawnand/r852.c                    | 1082 +++++
>  drivers/mtd/nand/rawnand/r852.h                    |  160 +
>  drivers/mtd/nand/rawnand/s3c2410.c                 | 1165 +++++
>  drivers/mtd/nand/rawnand/sh_flctl.c                | 1251 +++++
>  drivers/mtd/nand/rawnand/sharpsl.c                 |  235 +
>  drivers/mtd/nand/rawnand/sm_common.c               |  202 +
>  drivers/mtd/nand/rawnand/sm_common.h               |   61 +
>  drivers/mtd/nand/rawnand/socrates_nand.c           |  251 +
>  drivers/mtd/nand/rawnand/sunxi_nand.c              | 2291 +++++++++
>  drivers/mtd/nand/rawnand/tmio_nand.c               |  510 ++
>  drivers/mtd/nand/rawnand/txx9ndfmc.c               |  423 ++
>  drivers/mtd/nand/rawnand/vf610_nfc.c               |  846 ++++
>  drivers/mtd/nand/rawnand/xway_nand.c               |  248 +
>  drivers/mtd/nand/s3c2410.c                         | 1165 -----
>  drivers/mtd/nand/sh_flctl.c                        | 1251 -----
>  drivers/mtd/nand/sharpsl.c                         |  235 -
>  drivers/mtd/nand/sm_common.c                       |  202 -
>  drivers/mtd/nand/sm_common.h                       |   61 -
>  drivers/mtd/nand/socrates_nand.c                   |  251 -
>  drivers/mtd/nand/sunxi_nand.c                      | 2291 ---------
>  drivers/mtd/nand/tmio_nand.c                       |  510 --
>  drivers/mtd/nand/txx9ndfmc.c                       |  423 --
>  drivers/mtd/nand/vf610_nfc.c                       |  846 ----
>  drivers/mtd/nand/xway_nand.c                       |  248 -
>  drivers/mtd/nftlcore.c                             |    2 +-
>  drivers/mtd/nftlmount.c                            |    2 +-
>  drivers/mtd/sm_ftl.c                               |    2 +-
>  drivers/mtd/ssfdc.c                                |    2 +-
>  drivers/mtd/tests/nandbiterrs.c                    |    2 +-
>  drivers/staging/mt29f_spinand/mt29f_spinand.c      |    8 +-
>  fs/jffs2/wbuf.c                                    |    2 +-
>  include/linux/mtd/nand-gpio.h                      |    2 +-
>  include/linux/mtd/nand.h                           | 1424 ++----
>  include/linux/mtd/rawnand.h                        | 1200 +++++
>  include/linux/mtd/sh_flctl.h                       |    4 +-
>  include/linux/mtd/sharpsl.h                        |    2 +-
>  include/linux/platform_data/atmel.h                |    2 +-
>  include/linux/platform_data/mtd-davinci.h          |    2 +-
>  231 files changed, 62543 insertions(+), 61971 deletions(-)
>  delete mode 100644 drivers/mtd/nand/ams-delta.c
>  delete mode 100644 drivers/mtd/nand/atmel_nand.c
>  delete mode 100644 drivers/mtd/nand/atmel_nand_ecc.h
>  delete mode 100644 drivers/mtd/nand/atmel_nand_nfc.h
>  delete mode 100644 drivers/mtd/nand/au1550nd.c
>  create mode 100644 drivers/mtd/nand/bbt.c
>  delete mode 100644 drivers/mtd/nand/bcm47xxnflash/Makefile
>  delete mode 100644 drivers/mtd/nand/bcm47xxnflash/bcm47xxnflash.h
>  delete mode 100644 drivers/mtd/nand/bcm47xxnflash/main.c
>  delete mode 100644 drivers/mtd/nand/bcm47xxnflash/ops_bcm4706.c
>  delete mode 100644 drivers/mtd/nand/bf5xx_nand.c
>  delete mode 100644 drivers/mtd/nand/brcmnand/Makefile
>  delete mode 100644 drivers/mtd/nand/brcmnand/bcm63138_nand.c
>  delete mode 100644 drivers/mtd/nand/brcmnand/bcm6368_nand.c
>  delete mode 100644 drivers/mtd/nand/brcmnand/brcmnand.c
>  delete mode 100644 drivers/mtd/nand/brcmnand/brcmnand.h
>  delete mode 100644 drivers/mtd/nand/brcmnand/brcmstb_nand.c
>  delete mode 100644 drivers/mtd/nand/brcmnand/iproc_nand.c
>  delete mode 100644 drivers/mtd/nand/cafe_nand.c
>  delete mode 100644 drivers/mtd/nand/cmx270_nand.c
>  delete mode 100644 drivers/mtd/nand/cs553x_nand.c
>  delete mode 100644 drivers/mtd/nand/davinci_nand.c
>  delete mode 100644 drivers/mtd/nand/denali.c
>  delete mode 100644 drivers/mtd/nand/denali.h
>  delete mode 100644 drivers/mtd/nand/denali_dt.c
>  delete mode 100644 drivers/mtd/nand/denali_pci.c
>  delete mode 100644 drivers/mtd/nand/diskonchip.c
>  delete mode 100644 drivers/mtd/nand/docg4.c
>  delete mode 100644 drivers/mtd/nand/fsl_elbc_nand.c
>  delete mode 100644 drivers/mtd/nand/fsl_ifc_nand.c
>  delete mode 100644 drivers/mtd/nand/fsl_upm.c
>  delete mode 100644 drivers/mtd/nand/fsmc_nand.c
>  delete mode 100644 drivers/mtd/nand/gpio.c
>  delete mode 100644 drivers/mtd/nand/gpmi-nand/Makefile
>  delete mode 100644 drivers/mtd/nand/gpmi-nand/bch-regs.h
>  delete mode 100644 drivers/mtd/nand/gpmi-nand/gpmi-lib.c
>  delete mode 100644 drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>  delete mode 100644 drivers/mtd/nand/gpmi-nand/gpmi-nand.h
>  delete mode 100644 drivers/mtd/nand/gpmi-nand/gpmi-regs.h
>  delete mode 100644 drivers/mtd/nand/hisi504_nand.c
>  delete mode 100644 drivers/mtd/nand/jz4740_nand.c
>  delete mode 100644 drivers/mtd/nand/jz4780_bch.c
>  delete mode 100644 drivers/mtd/nand/jz4780_bch.h
>  delete mode 100644 drivers/mtd/nand/jz4780_nand.c
>  delete mode 100644 drivers/mtd/nand/lpc32xx_mlc.c
>  delete mode 100644 drivers/mtd/nand/lpc32xx_slc.c
>  delete mode 100644 drivers/mtd/nand/mpc5121_nfc.c
>  delete mode 100644 drivers/mtd/nand/mtk_ecc.c
>  delete mode 100644 drivers/mtd/nand/mtk_ecc.h
>  delete mode 100644 drivers/mtd/nand/mtk_nand.c
>  delete mode 100644 drivers/mtd/nand/mxc_nand.c
>  delete mode 100644 drivers/mtd/nand/nand_base.c
>  delete mode 100644 drivers/mtd/nand/nand_bbt.c
>  delete mode 100644 drivers/mtd/nand/nand_bch.c
>  delete mode 100644 drivers/mtd/nand/nand_ecc.c
>  delete mode 100644 drivers/mtd/nand/nand_ids.c
>  delete mode 100644 drivers/mtd/nand/nand_timings.c
>  delete mode 100644 drivers/mtd/nand/nandsim.c
>  delete mode 100644 drivers/mtd/nand/ndfc.c
>  delete mode 100644 drivers/mtd/nand/nuc900_nand.c
>  delete mode 100644 drivers/mtd/nand/omap2.c
>  delete mode 100644 drivers/mtd/nand/omap_elm.c
>  delete mode 100644 drivers/mtd/nand/orion_nand.c
>  delete mode 100644 drivers/mtd/nand/pasemi_nand.c
>  delete mode 100644 drivers/mtd/nand/plat_nand.c
>  delete mode 100644 drivers/mtd/nand/pxa3xx_nand.c
>  delete mode 100644 drivers/mtd/nand/qcom_nandc.c
>  delete mode 100644 drivers/mtd/nand/r852.c
>  delete mode 100644 drivers/mtd/nand/r852.h
>  create mode 100644 drivers/mtd/nand/rawnand/Kconfig
>  create mode 100644 drivers/mtd/nand/rawnand/Makefile
>  create mode 100644 drivers/mtd/nand/rawnand/ams-delta.c
>  create mode 100644 drivers/mtd/nand/rawnand/atmel_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/atmel_nand_ecc.h
>  create mode 100644 drivers/mtd/nand/rawnand/atmel_nand_nfc.h
>  create mode 100644 drivers/mtd/nand/rawnand/au1550nd.c
>  create mode 100644 drivers/mtd/nand/rawnand/bcm47xxnflash/Makefile
>  create mode 100644 drivers/mtd/nand/rawnand/bcm47xxnflash/bcm47xxnflash.h
>  create mode 100644 drivers/mtd/nand/rawnand/bcm47xxnflash/main.c
>  create mode 100644 drivers/mtd/nand/rawnand/bcm47xxnflash/ops_bcm4706.c
>  create mode 100644 drivers/mtd/nand/rawnand/bf5xx_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/brcmnand/Makefile
>  create mode 100644 drivers/mtd/nand/rawnand/brcmnand/bcm63138_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/brcmnand/bcm6368_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/brcmnand/brcmnand.c
>  create mode 100644 drivers/mtd/nand/rawnand/brcmnand/brcmnand.h
>  create mode 100644 drivers/mtd/nand/rawnand/brcmnand/brcmstb_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/brcmnand/iproc_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/cafe_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/cmx270_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/cs553x_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/davinci_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/denali.c
>  create mode 100644 drivers/mtd/nand/rawnand/denali.h
>  create mode 100644 drivers/mtd/nand/rawnand/denali_dt.c
>  create mode 100644 drivers/mtd/nand/rawnand/denali_pci.c
>  create mode 100644 drivers/mtd/nand/rawnand/diskonchip.c
>  create mode 100644 drivers/mtd/nand/rawnand/docg4.c
>  create mode 100644 drivers/mtd/nand/rawnand/fsl_elbc_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/fsl_ifc_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/fsl_upm.c
>  create mode 100644 drivers/mtd/nand/rawnand/fsmc_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/gpio.c
>  create mode 100644 drivers/mtd/nand/rawnand/gpmi-nand/Makefile
>  create mode 100644 drivers/mtd/nand/rawnand/gpmi-nand/bch-regs.h
>  create mode 100644 drivers/mtd/nand/rawnand/gpmi-nand/gpmi-lib.c
>  create mode 100644 drivers/mtd/nand/rawnand/gpmi-nand/gpmi-nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/gpmi-nand/gpmi-nand.h
>  create mode 100644 drivers/mtd/nand/rawnand/gpmi-nand/gpmi-regs.h
>  create mode 100644 drivers/mtd/nand/rawnand/hisi504_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/jz4740_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/jz4780_bch.c
>  create mode 100644 drivers/mtd/nand/rawnand/jz4780_bch.h
>  create mode 100644 drivers/mtd/nand/rawnand/jz4780_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/lpc32xx_mlc.c
>  create mode 100644 drivers/mtd/nand/rawnand/lpc32xx_slc.c
>  create mode 100644 drivers/mtd/nand/rawnand/mpc5121_nfc.c
>  create mode 100644 drivers/mtd/nand/rawnand/mtk_ecc.c
>  create mode 100644 drivers/mtd/nand/rawnand/mtk_ecc.h
>  create mode 100644 drivers/mtd/nand/rawnand/mtk_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/mxc_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/nand_base.c
>  create mode 100644 drivers/mtd/nand/rawnand/nand_bch.c
>  create mode 100644 drivers/mtd/nand/rawnand/nand_ecc.c
>  create mode 100644 drivers/mtd/nand/rawnand/nand_ids.c
>  create mode 100644 drivers/mtd/nand/rawnand/nand_timings.c
>  create mode 100644 drivers/mtd/nand/rawnand/nandsim.c
>  create mode 100644 drivers/mtd/nand/rawnand/ndfc.c
>  create mode 100644 drivers/mtd/nand/rawnand/nuc900_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/omap2.c
>  create mode 100644 drivers/mtd/nand/rawnand/omap_elm.c
>  create mode 100644 drivers/mtd/nand/rawnand/orion_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/pasemi_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/plat_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/pxa3xx_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/qcom_nandc.c
>  create mode 100644 drivers/mtd/nand/rawnand/r852.c
>  create mode 100644 drivers/mtd/nand/rawnand/r852.h
>  create mode 100644 drivers/mtd/nand/rawnand/s3c2410.c
>  create mode 100644 drivers/mtd/nand/rawnand/sh_flctl.c
>  create mode 100644 drivers/mtd/nand/rawnand/sharpsl.c
>  create mode 100644 drivers/mtd/nand/rawnand/sm_common.c
>  create mode 100644 drivers/mtd/nand/rawnand/sm_common.h
>  create mode 100644 drivers/mtd/nand/rawnand/socrates_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/sunxi_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/tmio_nand.c
>  create mode 100644 drivers/mtd/nand/rawnand/txx9ndfmc.c
>  create mode 100644 drivers/mtd/nand/rawnand/vf610_nfc.c
>  create mode 100644 drivers/mtd/nand/rawnand/xway_nand.c
>  delete mode 100644 drivers/mtd/nand/s3c2410.c
>  delete mode 100644 drivers/mtd/nand/sh_flctl.c
>  delete mode 100644 drivers/mtd/nand/sharpsl.c
>  delete mode 100644 drivers/mtd/nand/sm_common.c
>  delete mode 100644 drivers/mtd/nand/sm_common.h
>  delete mode 100644 drivers/mtd/nand/socrates_nand.c
>  delete mode 100644 drivers/mtd/nand/sunxi_nand.c
>  delete mode 100644 drivers/mtd/nand/tmio_nand.c
>  delete mode 100644 drivers/mtd/nand/txx9ndfmc.c
>  delete mode 100644 drivers/mtd/nand/vf610_nfc.c
>  delete mode 100644 drivers/mtd/nand/xway_nand.c
>  create mode 100644 include/linux/mtd/rawnand.h
> 
