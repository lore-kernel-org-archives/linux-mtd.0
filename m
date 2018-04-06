Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f4LKX-0003bg-3s
 for linux-mtd@lists.infradead.org; Fri, 06 Apr 2018 06:58:40 +0000
Date: Fri, 6 Apr 2018 08:58:24 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: Marek Vasut <marex@denx.de>, Richard Weinberger <richard@nod.at>, Brian
 Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [GIT PULL] mtd: nand: Changes for 4.17
Message-ID: <20180406085824.20d6c2b1@bbrezillon>
In-Reply-To: <20180329221036.72a48b0b@bbrezillon>
References: <20180329221036.72a48b0b@bbrezillon>
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

On Thu, 29 Mar 2018 22:10:36 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> Hello,
> 
> Here his the NAND PR for 4.17. Quite a lot of changes in this one. The
> most notable one if the move of the nand and onenand code base in
> subdirectories of drivers/mtd/nand/ and the addition of a generic NAND
> lib which will hopefully allow us to share more code between those
> different layers.
> The first user of this new generic layer will be SPI NAND which I hope
> to get merged in 4.18 if the spi-mem stuff are accepted.
> 
> Other than that, I'm happy to have 2 NAND drivers converted to
> ->exec_op() (FSMC and VF610), a nice rework of the MXC driver and a new  
> driver implementing ->setup_data_interface() instead of open-coding the
> timing configuration.
> 
> Last but not least, Miquel managed to get rid of the ONFI/JEDEC param
> pages embedded in nand_chip, which should significantly reduce the size
> of nand_chip objects, and we also now have a way for NAND chip drivers
> to flag certain GET/SET FEATURES command as supported/unsupported even
> if the param page says otherwise (we had such a bug one Macronix chip)
> or when the NAND is not ONFI or JEDEC compliant.
> 
> Regards,
> 
> Boris
> 
> The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:
> 
>   Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)
> 
> are available in the git repository at:
> 
>   git://git.infradead.org/linux-mtd.git tags/nand/for-4.17
> 
> for you to fetch changes up to 097ccca726ffedb277c104aba45c59d075969e51:
> 
>   mtd: nand: Fix some function description mismatches in core.c (2018-03-29 19:41:57 +0200)
> 
> ----------------------------------------------------------------
> Core changes:
> * Prepare arrival of the SPI NAND subsystem by implementing a generic
>   (interface-agnostic) layer to ease manipulation of NAND devices
> * Move onenand code base to the drivers/mtd/nand/ dir
> * Rework timing mode selection
> * Provide a generic way for NAND chip drivers to flag a specific
>   GET/SET FEATURE operation as supported/unsupported
> * Stop embedding ONFI/JEDEC param page in nand_chip
> 
> Driver changes:
> * Rework/cleanup of the mxc driver
> * Various cleanups in the vf610 driver
> * Migrate the fsmc and vf610 to ->exec_op()
> * Get rid of the pxa driver (replaced by marvell_nand)
> * Support ->setup_data_interface() in the GPMI driver
> * Fix probe error path in several drivers
> * Remove support for unused hw_syndrome mode in sunxi_nand
> * Various minor improvements

Merged in mtd/next.

> 
> ----------------------------------------------------------------
> Alexey Khoroshilov (3):
>       mtd: nand: vf610: remove the unnecessary of_node_put()
>       mtd: nand: vf610: improve readability of error label
>       mtd: nand: vf610: check mtd_device_register() return code
> 
> Arnd Bergmann (1):
>       mtd: rawnand: remove bf5xx_nand driver
> 
> Boris Brezillon (13):
>       mtd: nand: Get rid of comments giving the file path inside the file itself
>       mtd: nand: Stop using full path when referring to files placed in the same dir
>       mtd: nand: ams-delta: Fix path to toto.c source file
>       mtd: nand: State when references to other drivers are no longer valid
>       mtd: nand: Add missing copyright information
>       mtd: nand: move raw NAND related code to the raw/ subdir
>       mtd: nand: Add core infrastructure to deal with NAND devices
>       Update Boris Brezillon email address
>       Merge tag 'nand/pxa3xx-removal' of git://git.infradead.org/linux-mtd into nand/next
>       mtd: onenand: Get rid of comments giving the file path inside the file itself
>       mtd: Move onenand code base to drivers/mtd/nand/onenand
>       mtd: rawnand: sunxi: Stop supporting ECC_HW_SYNDROME mode
>       mtd: rawnand: marvell: Rename ->ecc_clk into ->core_clk
> 
> Gregory CLEMENT (1):
>       mtd: rawnand: marvell: Fix clock resource by adding a register clock
> 
> KOBAYASHI Yoshitake (1):
>       mtd: nand: toshiba: Retrieve ECC requirements from extended ID
> 
> Masahiro Yamada (1):
>       mtd: rawnand: remove STANDALONE compile mode of nand_ecc
> 
> Miquel Raynal (36):
>       mtd: nand: add ->setup_data_interface() support for Marvell NFCv1
>       mtd: nand: fsmc: get rid of IO_ADDR_[R|W]
>       mtd: nand: fsmc: use ->exec_op()
>       MAINTAINERS: Update email address for Miquel Raynal
>       mtd: nand: use Marvell reworked NAND controller driver with all platforms
>       mtd: nand: remove deprecated pxa3xx_nand driver
>       mtd: nand: remove useless fields from pxa3xx NAND platform data
>       dt-bindings: mtd: remove pxa3xx NAND controller documentation
>       arm: dts: pxa: use reworked NAND controller driver
>       MAINTAINERS: remove entry for deleted pxa3xx_nand driver
>       mtd: rawnand: makes the Kconfig entry clear when it comes to raw NANDs
>       mtd: rawnand: rename default ->onfi_get/set_features() implementations
>       mtd: rawnand: rename SET/GET FEATURES related functions
>       mtd: rawnand: use wrappers to call onfi GET/SET_FEATURES
>       mtd: rawnand: handle differently chip/controller errors about timings
>       mtd: rawnand: mxc: remove useless checks in GET/SET_FEATURES functions
>       mtd: rawnand: move calls to ->select_chip() in nand_setup_data_interface()
>       mtd: rawnand: check ONFI timings have been acked by the chip
>       mtd: rawnand: avoid setting again the timings to mode 0 after a reset
>       mtd: rawnand: prepare the removal of ONFI/JEDEC parameter pages
>       mtd: rawnand: prepare the removal of the ONFI parameter page
>       mtd: rawnand: allow vendors to declare (un)supported features
>       mtd: rawnand: macronix: nack the support of changing timings for one chip
>       mtd: rawnand: get rid of the JEDEC parameter page in nand_chip
>       mtd: rawnand: get rid of the ONFI parameter page in nand_chip
>       mtd: rawnand: gpmi: support ->setup_data_interface()
>       mtd: rawnand: gpmi: use core timings instead of an empirical derivation
>       mtd: rawnand: brcmnand: fix probe function error path
>       mtd: rawnand: cafe: fix probe function error path
>       mtd: rawnand: davinci: fix probe function error path
>       mtd: rawnand: denali: fix probe function error path
>       mtd: rawnand: mxc: fix probe function error path
>       mtd: rawnand: omap2: fix the probe function error path
>       mtd: rawnand: sh_flctl: fix the probe function error path
>       mtd: rawnand: tango: fix probe function error path
>       mtd: rawnand: s3c2410: enhance the probe function error path
> 
> Sascha Hauer (8):
>       mtd: nand: mxc: reorder functions to avoid forward declarations
>       mtd: nand: mxc: Add function to control hardware ECC
>       mtd: nand: mxc: Add buffer argument to copy_spare
>       mtd: nand: mxc: Fix failed/corrected values for v2/v3 controllers
>       mtd: nand: mxc: Fix failed/corrected values for v1 controllers
>       mtd: nand: mxc: Add own write_page
>       mtd: nand: mxc: Drop now unnecessary functions
>       mtd: nand: mxc: remove now unused code
> 
> Shreeya Patel (1):
>       mtd: rawnand: Replace printk() with appropriate pr_*() macro
> 
> Stefan Agner (4):
>       mtd: nand: vf610_nfc: remove unused function
>       mtd: rawnand: vf610_nfc: make use of ->exec_op()
>       mtd: rawnand: vf610_nfc: remove old hooks
>       mtd: rawnand: vf610_nfc: support ONFI SET/GET_FEATURES commands
> 
> Xiaolei Li (1):
>       mtd: nand: Fix some function description mismatches in core.c
> 
>  .mailmap                                                 |    7 +-
>  Documentation/arm/Samsung-S3C24XX/S3C2412.txt            |    2 +-
>  Documentation/devicetree/bindings/mtd/marvell-nand.txt   |    5 +-
>  Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt    |   50 -
>  Documentation/devicetree/bindings/mtd/sunxi-nand.txt     |    4 +-
>  Documentation/driver-api/mtdnand.rst                     |    8 +-
>  Documentation/gpio/drivers-on-gpio.txt                   |    4 +-
>  MAINTAINERS                                              |   40 +-
>  arch/arm/boot/dts/pxa3xx.dtsi                            |    6 +-
>  arch/arm/configs/cm_x300_defconfig                       |    2 +-
>  arch/arm/configs/pxa3xx_defconfig                        |    3 +-
>  arch/arm/configs/pxa_defconfig                           |    2 +-
>  arch/arm/configs/raumfeld_defconfig                      |    2 +-
>  arch/arm/mach-mmp/aspenite.c                             |    6 +-
>  arch/arm/mach-mmp/ttc_dkb.c                              |    9 +-
>  arch/arm/mach-pxa/cm-x300.c                              |    8 +-
>  arch/arm/mach-pxa/colibri-pxa3xx.c                       |    8 +-
>  arch/arm/mach-pxa/colibri.h                              |    2 +-
>  arch/arm/mach-pxa/littleton.c                            |   10 +-
>  arch/arm/mach-pxa/mxm8x10.c                              |   10 +-
>  arch/arm/mach-pxa/raumfeld.c                             |    6 +-
>  arch/arm/mach-pxa/zylonite.c                             |   10 +-
>  arch/cris/arch-v32/drivers/mach-a3/nandflash.c           |    2 +-
>  arch/cris/arch-v32/drivers/mach-fs/nandflash.c           |    2 +-
>  drivers/mtd/Kconfig                                      |    2 -
>  drivers/mtd/Makefile                                     |    2 +-
>  drivers/mtd/nand/Kconfig                                 |  580 +----------
>  drivers/mtd/nand/Makefile                                |   72 +-
>  drivers/mtd/nand/bbt.c                                   |  130 +++
>  drivers/mtd/nand/bf5xx_nand.c                            |  862 ----------------
>  drivers/mtd/nand/core.c                                  |  244 +++++
>  drivers/mtd/{ => nand}/onenand/Kconfig                   |    0
>  drivers/mtd/{ => nand}/onenand/Makefile                  |    0
>  drivers/mtd/{ => nand}/onenand/generic.c                 |    2 -
>  drivers/mtd/{ => nand}/onenand/omap2.c                   |    2 -
>  drivers/mtd/{ => nand}/onenand/onenand_base.c            |    2 -
>  drivers/mtd/{ => nand}/onenand/onenand_bbt.c             |    2 -
>  drivers/mtd/{ => nand}/onenand/samsung.c                 |    0
>  drivers/mtd/{ => nand}/onenand/samsung.h                 |    0
>  drivers/mtd/nand/pxa3xx_nand.c                           | 2105 --------------------------------------
>  drivers/mtd/nand/raw/Kconfig                             |  537 ++++++++++
>  drivers/mtd/nand/raw/Makefile                            |   66 ++
>  drivers/mtd/nand/{ => raw}/ams-delta.c                   |   13 +-
>  drivers/mtd/nand/{ => raw}/atmel/Makefile                |    0
>  drivers/mtd/nand/{ => raw}/atmel/nand-controller.c       |    4 +-
>  drivers/mtd/nand/{ => raw}/atmel/pmecc.c                 |    4 +-
>  drivers/mtd/nand/{ => raw}/atmel/pmecc.h                 |    4 +-
>  drivers/mtd/nand/{ => raw}/au1550nd.c                    |    2 -
>  drivers/mtd/nand/{ => raw}/bcm47xxnflash/Makefile        |    0
>  drivers/mtd/nand/{ => raw}/bcm47xxnflash/bcm47xxnflash.h |    0
>  drivers/mtd/nand/{ => raw}/bcm47xxnflash/main.c          |    0
>  drivers/mtd/nand/{ => raw}/bcm47xxnflash/ops_bcm4706.c   |    4 +-
>  drivers/mtd/nand/{ => raw}/brcmnand/Makefile             |    0
>  drivers/mtd/nand/{ => raw}/brcmnand/bcm63138_nand.c      |    0
>  drivers/mtd/nand/{ => raw}/brcmnand/bcm6368_nand.c       |    0
>  drivers/mtd/nand/{ => raw}/brcmnand/brcmnand.c           |    6 +-
>  drivers/mtd/nand/{ => raw}/brcmnand/brcmnand.h           |    0
>  drivers/mtd/nand/{ => raw}/brcmnand/brcmstb_nand.c       |    0
>  drivers/mtd/nand/{ => raw}/brcmnand/iproc_nand.c         |    0
>  drivers/mtd/nand/{ => raw}/cafe_nand.c                   |   14 +-
>  drivers/mtd/nand/{ => raw}/cmx270_nand.c                 |    4 +-
>  drivers/mtd/nand/{ => raw}/cs553x_nand.c                 |   11 +-
>  drivers/mtd/nand/{ => raw}/davinci_nand.c                |    5 +-
>  drivers/mtd/nand/{ => raw}/denali.c                      |    4 +-
>  drivers/mtd/nand/{ => raw}/denali.h                      |    0
>  drivers/mtd/nand/{ => raw}/denali_dt.c                   |    0
>  drivers/mtd/nand/{ => raw}/denali_pci.c                  |    0
>  drivers/mtd/nand/{ => raw}/diskonchip.c                  |   78 +-
>  drivers/mtd/nand/{ => raw}/docg4.c                       |    4 +-
>  drivers/mtd/nand/{ => raw}/fsl_elbc_nand.c               |    8 +-
>  drivers/mtd/nand/{ => raw}/fsl_ifc_nand.c                |    6 +-
>  drivers/mtd/nand/{ => raw}/fsl_upm.c                     |    0
>  drivers/mtd/nand/{ => raw}/fsmc_nand.c                   |  252 +++--
>  drivers/mtd/nand/{ => raw}/gpio.c                        |    2 -
>  drivers/mtd/nand/{ => raw}/gpmi-nand/Makefile            |    0
>  drivers/mtd/nand/{ => raw}/gpmi-nand/bch-regs.h          |    0
>  drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-lib.c          |  793 ++------------
>  drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-nand.c         |   82 +-
>  drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-nand.h         |  131 +--
>  drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-regs.h         |    5 +
>  drivers/mtd/nand/{ => raw}/hisi504_nand.c                |    4 +-
>  drivers/mtd/nand/{ => raw}/jz4740_nand.c                 |    0
>  drivers/mtd/nand/{ => raw}/jz4780_bch.c                  |    0
>  drivers/mtd/nand/{ => raw}/jz4780_bch.h                  |    0
>  drivers/mtd/nand/{ => raw}/jz4780_nand.c                 |    0
>  drivers/mtd/nand/{ => raw}/lpc32xx_mlc.c                 |    0
>  drivers/mtd/nand/{ => raw}/lpc32xx_slc.c                 |    0
>  drivers/mtd/nand/{ => raw}/marvell_nand.c                |   92 +-
>  drivers/mtd/nand/{ => raw}/mpc5121_nfc.c                 |    9 +-
>  drivers/mtd/nand/{ => raw}/mtk_ecc.c                     |    0
>  drivers/mtd/nand/{ => raw}/mtk_ecc.h                     |    0
>  drivers/mtd/nand/{ => raw}/mtk_nand.c                    |    0
>  drivers/mtd/nand/{ => raw}/mxc_nand.c                    |  544 ++++++----
>  drivers/mtd/nand/{ => raw}/nand_amd.c                    |    0
>  drivers/mtd/nand/{ => raw}/nand_base.c                   |  318 ++++--
>  drivers/mtd/nand/{ => raw}/nand_bbt.c                    |    0
>  drivers/mtd/nand/{ => raw}/nand_bch.c                    |   12 +-
>  drivers/mtd/nand/{ => raw}/nand_ecc.c                    |   22 -
>  drivers/mtd/nand/{ => raw}/nand_hynix.c                  |    0
>  drivers/mtd/nand/{ => raw}/nand_ids.c                    |    0
>  drivers/mtd/nand/{ => raw}/nand_macronix.c               |   13 +
>  drivers/mtd/nand/{ => raw}/nand_micron.c                 |   41 +-
>  drivers/mtd/nand/{ => raw}/nand_samsung.c                |    0
>  drivers/mtd/nand/{ => raw}/nand_timings.c                |   12 +-
>  drivers/mtd/nand/{ => raw}/nand_toshiba.c                |   26 +
>  drivers/mtd/nand/{ => raw}/nandsim.c                     |   15 +-
>  drivers/mtd/nand/{ => raw}/ndfc.c                        |    0
>  drivers/mtd/nand/{ => raw}/nuc900_nand.c                 |    0
>  drivers/mtd/nand/{ => raw}/omap2.c                       |    5 +-
>  drivers/mtd/nand/{ => raw}/omap_elm.c                    |    0
>  drivers/mtd/nand/{ => raw}/orion_nand.c                  |    2 -
>  drivers/mtd/nand/{ => raw}/oxnas_nand.c                  |    0
>  drivers/mtd/nand/{ => raw}/pasemi_nand.c                 |    0
>  drivers/mtd/nand/{ => raw}/plat_nand.c                   |    0
>  drivers/mtd/nand/{ => raw}/qcom_nandc.c                  |    4 +-
>  drivers/mtd/nand/{ => raw}/r852.c                        |    5 +-
>  drivers/mtd/nand/{ => raw}/r852.h                        |    9 +-
>  drivers/mtd/nand/{ => raw}/s3c2410.c                     |   27 +-
>  drivers/mtd/nand/{ => raw}/sh_flctl.c                    |   10 +-
>  drivers/mtd/nand/{ => raw}/sharpsl.c                     |    2 -
>  drivers/mtd/nand/{ => raw}/sm_common.c                   |    5 +-
>  drivers/mtd/nand/{ => raw}/sm_common.h                   |    0
>  drivers/mtd/nand/{ => raw}/socrates_nand.c               |    2 -
>  drivers/mtd/nand/{ => raw}/sunxi_nand.c                  |  155 +--
>  drivers/mtd/nand/{ => raw}/tango_nand.c                  |    4 +-
>  drivers/mtd/nand/{ => raw}/tmio_nand.c                   |    0
>  drivers/mtd/nand/{ => raw}/txx9ndfmc.c                   |    0
>  drivers/mtd/nand/{ => raw}/vf610_nfc.c                   |  677 +++++++-----
>  drivers/mtd/nand/{ => raw}/xway_nand.c                   |    0
>  drivers/mtd/sm_ftl.c                                     |    2 +-
>  drivers/staging/mt29f_spinand/mt29f_spinand.c            |    4 +-
>  include/linux/mtd/bbm.h                                  |    2 -
>  include/linux/mtd/nand.h                                 |  731 +++++++++++++
>  include/linux/mtd/nand_ecc.h                             |    2 -
>  include/linux/mtd/ndfc.h                                 |    2 -
>  include/linux/mtd/rawnand.h                              |  106 +-
>  include/linux/platform_data/mtd-nand-pxa3xx.h            |   43 +-
>  137 files changed, 3419 insertions(+), 5740 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/pxa3xx-nand.txt
>  create mode 100644 drivers/mtd/nand/bbt.c
>  delete mode 100644 drivers/mtd/nand/bf5xx_nand.c
>  create mode 100644 drivers/mtd/nand/core.c
>  rename drivers/mtd/{ => nand}/onenand/Kconfig (100%)
>  rename drivers/mtd/{ => nand}/onenand/Makefile (100%)
>  rename drivers/mtd/{ => nand}/onenand/generic.c (98%)
>  rename drivers/mtd/{ => nand}/onenand/omap2.c (99%)
>  rename drivers/mtd/{ => nand}/onenand/onenand_base.c (99%)
>  rename drivers/mtd/{ => nand}/onenand/onenand_bbt.c (99%)
>  rename drivers/mtd/{ => nand}/onenand/samsung.c (100%)
>  rename drivers/mtd/{ => nand}/onenand/samsung.h (100%)
>  delete mode 100644 drivers/mtd/nand/pxa3xx_nand.c
>  create mode 100644 drivers/mtd/nand/raw/Kconfig
>  create mode 100644 drivers/mtd/nand/raw/Makefile
>  rename drivers/mtd/nand/{ => raw}/ams-delta.c (95%)
>  rename drivers/mtd/nand/{ => raw}/atmel/Makefile (100%)
>  rename drivers/mtd/nand/{ => raw}/atmel/nand-controller.c (99%)
>  rename drivers/mtd/nand/{ => raw}/atmel/pmecc.c (99%)
>  rename drivers/mtd/nand/{ => raw}/atmel/pmecc.h (94%)
>  rename drivers/mtd/nand/{ => raw}/au1550nd.c (99%)
>  rename drivers/mtd/nand/{ => raw}/bcm47xxnflash/Makefile (100%)
>  rename drivers/mtd/nand/{ => raw}/bcm47xxnflash/bcm47xxnflash.h (100%)
>  rename drivers/mtd/nand/{ => raw}/bcm47xxnflash/main.c (100%)
>  rename drivers/mtd/nand/{ => raw}/bcm47xxnflash/ops_bcm4706.c (98%)
>  rename drivers/mtd/nand/{ => raw}/brcmnand/Makefile (100%)
>  rename drivers/mtd/nand/{ => raw}/brcmnand/bcm63138_nand.c (100%)
>  rename drivers/mtd/nand/{ => raw}/brcmnand/bcm6368_nand.c (100%)
>  rename drivers/mtd/nand/{ => raw}/brcmnand/brcmnand.c (99%)
>  rename drivers/mtd/nand/{ => raw}/brcmnand/brcmnand.h (100%)
>  rename drivers/mtd/nand/{ => raw}/brcmnand/brcmstb_nand.c (100%)
>  rename drivers/mtd/nand/{ => raw}/brcmnand/iproc_nand.c (100%)
>  rename drivers/mtd/nand/{ => raw}/cafe_nand.c (98%)
>  rename drivers/mtd/nand/{ => raw}/cmx270_nand.c (98%)
>  rename drivers/mtd/nand/{ => raw}/cs553x_nand.c (95%)
>  rename drivers/mtd/nand/{ => raw}/davinci_nand.c (99%)
>  rename drivers/mtd/nand/{ => raw}/denali.c (99%)
>  rename drivers/mtd/nand/{ => raw}/denali.h (100%)
>  rename drivers/mtd/nand/{ => raw}/denali_dt.c (100%)
>  rename drivers/mtd/nand/{ => raw}/denali_pci.c (100%)
>  rename drivers/mtd/nand/{ => raw}/diskonchip.c (95%)
>  rename drivers/mtd/nand/{ => raw}/docg4.c (99%)
>  rename drivers/mtd/nand/{ => raw}/fsl_elbc_nand.c (99%)
>  rename drivers/mtd/nand/{ => raw}/fsl_ifc_nand.c (99%)
>  rename drivers/mtd/nand/{ => raw}/fsl_upm.c (100%)
>  rename drivers/mtd/nand/{ => raw}/fsmc_nand.c (86%)
>  rename drivers/mtd/nand/{ => raw}/gpio.c (99%)
>  rename drivers/mtd/nand/{ => raw}/gpmi-nand/Makefile (100%)
>  rename drivers/mtd/nand/{ => raw}/gpmi-nand/bch-regs.h (100%)
>  rename drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-lib.c (51%)
>  rename drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-nand.c (98%)
>  rename drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-nand.h (57%)
>  rename drivers/mtd/nand/{ => raw}/gpmi-nand/gpmi-regs.h (97%)
>  rename drivers/mtd/nand/{ => raw}/hisi504_nand.c (99%)
>  rename drivers/mtd/nand/{ => raw}/jz4740_nand.c (100%)
>  rename drivers/mtd/nand/{ => raw}/jz4780_bch.c (100%)
>  rename drivers/mtd/nand/{ => raw}/jz4780_bch.h (100%)
>  rename drivers/mtd/nand/{ => raw}/jz4780_nand.c (100%)
>  rename drivers/mtd/nand/{ => raw}/lpc32xx_mlc.c (100%)
>  rename drivers/mtd/nand/{ => raw}/lpc32xx_slc.c (100%)
>  rename drivers/mtd/nand/{ => raw}/marvell_nand.c (97%)
>  rename drivers/mtd/nand/{ => raw}/mpc5121_nfc.c (98%)
>  rename drivers/mtd/nand/{ => raw}/mtk_ecc.c (100%)
>  rename drivers/mtd/nand/{ => raw}/mtk_ecc.h (100%)
>  rename drivers/mtd/nand/{ => raw}/mtk_nand.c (100%)
>  rename drivers/mtd/nand/{ => raw}/mxc_nand.c (87%)
>  rename drivers/mtd/nand/{ => raw}/nand_amd.c (100%)
>  rename drivers/mtd/nand/{ => raw}/nand_base.c (96%)
>  rename drivers/mtd/nand/{ => raw}/nand_bbt.c (100%)
>  rename drivers/mtd/nand/{ => raw}/nand_bch.c (95%)
>  rename drivers/mtd/nand/{ => raw}/nand_ecc.c (95%)
>  rename drivers/mtd/nand/{ => raw}/nand_hynix.c (100%)
>  rename drivers/mtd/nand/{ => raw}/nand_ids.c (100%)
>  rename drivers/mtd/nand/{ => raw}/nand_macronix.c (64%)
>  rename drivers/mtd/nand/{ => raw}/nand_micron.c (88%)
>  rename drivers/mtd/nand/{ => raw}/nand_samsung.c (100%)
>  rename drivers/mtd/nand/{ => raw}/nand_timings.c (95%)
>  rename drivers/mtd/nand/{ => raw}/nand_toshiba.c (71%)
>  rename drivers/mtd/nand/{ => raw}/nandsim.c (99%)
>  rename drivers/mtd/nand/{ => raw}/ndfc.c (100%)
>  rename drivers/mtd/nand/{ => raw}/nuc900_nand.c (100%)
>  rename drivers/mtd/nand/{ => raw}/omap2.c (99%)
>  rename drivers/mtd/nand/{ => raw}/omap_elm.c (100%)
>  rename drivers/mtd/nand/{ => raw}/orion_nand.c (99%)
>  rename drivers/mtd/nand/{ => raw}/oxnas_nand.c (100%)
>  rename drivers/mtd/nand/{ => raw}/pasemi_nand.c (100%)
>  rename drivers/mtd/nand/{ => raw}/plat_nand.c (100%)
>  rename drivers/mtd/nand/{ => raw}/qcom_nandc.c (99%)
>  rename drivers/mtd/nand/{ => raw}/r852.c (99%)
>  rename drivers/mtd/nand/{ => raw}/r852.h (95%)
>  rename drivers/mtd/nand/{ => raw}/s3c2410.c (98%)
>  rename drivers/mtd/nand/{ => raw}/sh_flctl.c (99%)
>  rename drivers/mtd/nand/{ => raw}/sharpsl.c (99%)
>  rename drivers/mtd/nand/{ => raw}/sm_common.c (98%)
>  rename drivers/mtd/nand/{ => raw}/sm_common.h (100%)
>  rename drivers/mtd/nand/{ => raw}/socrates_nand.c (99%)
>  rename drivers/mtd/nand/{ => raw}/sunxi_nand.c (94%)
>  rename drivers/mtd/nand/{ => raw}/tango_nand.c (99%)
>  rename drivers/mtd/nand/{ => raw}/tmio_nand.c (100%)
>  rename drivers/mtd/nand/{ => raw}/txx9ndfmc.c (100%)
>  rename drivers/mtd/nand/{ => raw}/vf610_nfc.c (54%)
>  rename drivers/mtd/nand/{ => raw}/xway_nand.c (100%)
>  create mode 100644 include/linux/mtd/nand.h
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
