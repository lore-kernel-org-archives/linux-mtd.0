Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aw3Yw-0005Wn-MA
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2016 08:14:12 +0000
Date: Fri, 29 Apr 2016 10:13:48 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: [PULL] mtd: nand: changes for 4.7
Message-ID: <20160429101348.309d4784@bbrezillon>
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

Hi Brian,

This is my first PR for the NAND subsystem, so don't hesitate to tell me
if I did something wrong ;).

This pull request contains the following infrastructure changes:
* introduction of the ECC algo concept to extend the ECC mode one
* replacement of the nand_ecclayout infrastructure by something more
  future-proof.
* addition of an mtd-activity led trigger to replace the nand-activity
  one

And a bunch of specific NAND driver improvements/fixes. Here are the
changes that are worth mentioning:
* rework of the OMAP GPMC and NAND drivers
* prepare the sunxi NAND driver to receive DMA support
* handle bitflips in erased pages on GPMI revisions that do not support
  this in hardware.

Best Regards,

Boris

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git@github.com:linux-nand/linux.git tags/nand/for-4.7

for you to fetch changes up to 4ab41e74ae5df89b8bc9909ba35fc19bbd1d6221:

  mtd: brcmnand: respect ECC algorithm set by NAND subsystem (2016-04-27 09=
:51:43 +0200)

----------------------------------------------------------------
This tag contains all the NAND related changes for 4.7.

----------------------------------------------------------------
Boris Brezillon (85):
      Merge branch 'for-v4.7/gpmc-mtd-common' of github.com:rogerq/linux in=
to nand/next
      Merge branch 'mtd-nand-trigger' of git://git.kernel.org/.../j.anaszew=
ski/linux-leds into nand/next
      mtd: nand: atmel: correct bitflips in erased pages for pre-sama5d4 So=
Cs
      mtd: nand: document the NAND controller/NAND chip DT representation
      mtd: nand: remove unneeded of_mtd.h inclusions
      mtd: nand: omap2: rely on generic DT parsing done in nand_scan_ident()
      mtd: nand: brcm: rely on generic DT parsing done in nand_scan_ident()
      mtd: nand: atmel: rely on generic DT parsing done in nand_scan_ident()
      mtd: nand: pxa3xx: rely on generic DT parsing done in nand_scan_ident=
()
      mtd: nand: sunxi: fix call order in sunxi_nand_chip_init()
      mtd: nand: sunxi: fix clk rate calculation
      mtd: nand: sunxi: fix EDO mode selection
      mtd: nand: sunxi: adapt clk_rate to tWB, tADL, tWHR and tRHW timings
      mtd: nand: export default read/write oob functions
      mtd: nand: sunxi: implement ->read_oob()/->write_oob()
      mtd: nand: sunxi: implement ->read_subpage()
      mtd: nand: sunxi: improve ->cmd_ctrl() function
      mtd: nand: sunxi: let the NAND controller control the CE line
      mtd: nand: sunxi: fix the NFC_ECC_ERR_CNT() macro
      mtd: nand: sunxi: fix NFC_CTL setting
      mtd: nand: sunxi: disable clks on device removal
      mtd: nand: enable ECC pipelining
      mtd: nand: sunxi: fix ->dev_ready() implementation
      mtd: nand: sunxi: make use of readl_poll_timeout()
      mtd: nand: sunxi: poll for events instead of using interrupts
      mtd: nand: sunxi: move some ECC related operations to their own funct=
ions
      mtd: nand: sunxi: make OOB retrieval optional
      mtd: nand: sunxi: make cur_off parameter optional in extra oob helpers
      mtd: add mtd_ooblayout_xxx() helper functions
      mtd: use mtd_ooblayout_xxx() helpers where appropriate
      mtd: nand: core: use mtd_ooblayout_xxx() helpers where appropriate
      mtd: nand: atmel: use mtd_ooblayout_xxx() helpers where appropriate
      mtd: nand: fsl_ifc: use mtd_ooblayout_xxx() helpers where appropriate
      mtd: nand: gpmi: use mtd_ooblayout_xxx() helpers where appropriate
      mtd: nand: lpc32xx: use mtd_ooblayout_xxx() helpers where appropriate
      mtd: nand: omap2: use mtd_ooblayout_xxx() helpers where appropriate
      mtd: nand: qcom: use mtd_ooblayout_xxx() helpers where appropriate
      mtd: onenand: use mtd_ooblayout_xxx() helpers where appropriate
      mtd: add mtd_set_ecclayout() helper function
      mtd: use mtd_set_ecclayout() where appropriate
      mtd: nand: use mtd_set_ecclayout() where appropriate
      mtd: onenand: use mtd_set_ecclayout() where appropriate
      mtd: docg3: use mtd_set_ecclayout() where appropriate
      mtd: create an mtd_ooblayout_ops struct to ease ECC layout definition
      mtd: docg3: switch to mtd_ooblayout_ops
      mtd: nand: implement the default mtd_ooblayout_ops
      mtd: nand: bch: switch to mtd_ooblayout_ops
      mtd: nand: sharpsl: switch to mtd_ooblayout_ops
      mtd: nand: jz4740: switch to mtd_ooblayout_ops
      mtd: nand: atmel: switch to mtd_ooblayout_ops
      mtd: nand: bf5xx: switch to mtd_ooblayout_ops
      mtd: nand: brcm: switch to mtd_ooblayout_ops
      mtd: nand: cafe: switch to mtd_ooblayout_ops
      mtd: nand: davinci: switch to mtd_ooblayout_ops
      mtd: nand: denali: switch to mtd_ooblayout_ops
      mtd: nand: diskonchip: switch to mtd_ooblayout_ops
      mtd: nand: docg4: switch to mtd_ooblayout_ops
      mtd: nand: fsl_elbc: switch to mtd_ooblayout_ops
      mtd: nand: fsl_ifc: switch to mtd_ooblayout_ops
      mtd: nand: fsmc: switch to mtd_ooblayout_ops
      mtd: nand: fsmc: get rid of the fsmc_nand_eccplace struct
      mtd: nand: gpmi: switch to mtd_ooblayout_ops
      mtd: nand: hisi504: switch to mtd_ooblayout_ops
      mtd: nand: jz4780: switch to mtd_ooblayout_ops
      mtd: nand: lpc32xx: switch to mtd_ooblayout_ops
      mtd: nand: mxc: switch to mtd_ooblayout_ops
      mtd: nand: omap2: switch to mtd_ooblayout_ops
      mtd: nand: pxa3xx: switch to mtd_ooblayout_ops
      mtd: nand: s3c2410: switch to mtd_ooblayout_ops
      mtd: nand: sh_flctl: switch to mtd_ooblayout_ops
      mtd: nand: sm_common: switch to mtd_ooblayout_ops
      mtd: nand: sunxi: switch to mtd_ooblayout_ops
      mtd: nand: vf610: switch to mtd_ooblayout_ops
      mtd: nand: qcom: switch to mtd_ooblayout_ops
      mtd: onenand: switch to mtd_ooblayout_ops
      staging: mt29f_spinand: switch to mtd_ooblayout_ops
      mtd: nand: kill the ecc->layout field
      mtd: kill the nand_ecclayout struct
      mtd: nand: gpmi: rely on generic DT parsing done in nand_scan_ident()
      mtd: nand: davinci: rely on generic DT parsing done in nand_scan_iden=
t()
      mtd: nand: hisi504: rely on generic DT parsing done in nand_scan_iden=
t()
      mtd: nand: lpc32xx: rely on generic DT parsing done in nand_scan_iden=
t()
      mtd: nand: mxc: rely on generic DT parsing done in nand_scan_ident()
      mtd: nand: sh_flctl: rely on generic DT parsing done in nand_scan_ide=
nt()
      mtd: nand: move of_get_nand_xxx() helpers into nand_base.c

Brian Norris (1):
      mtd: brcmnand: respect ECC algorithm set by NAND subsystem

Cooper Jr., Franklin (2):
      mtd: nand: omap2: Start dma request before enabling prefetch
      mtd: nand: omap2: Fix high memory dma prefetch transfer

Ezequiel Garcia (5):
      leds: trigger: Introduce a kernel panic LED trigger
      mtd: Uninline mtd_write_oob and move it to mtdcore.c
      leds: trigger: Introduce a MTD (NAND/NOR) trigger
      mtd: nand: Remove the "nand-disk" LED trigger
      mtd: Hook I/O activity to the MTD LED trigger

Ezequiel Garc=C3=ADa (1):
      mtd: nand: Remove BUG() abuse in nand_scan_tail

Florian Fainelli (1):
      mtd: brcmnand: Add support for v6.2 controllers

Han Xu (1):
      mtd: gpmi: fix raw_buffer pointer double free issue

Jorge Ramirez-Ortiz (1):
      mtd: nand: jz4780: fixup, device structure assigned at probe

Julia Lawall (2):
      mtd: nand: omap2: fix compare_const_fl.cocci warnings
      mtd: nandsim: add __init attribute

Maarten ter Huurne (1):
      mtd: nand: jz4740: Remove unused local variable

Markus Pargmann (1):
      gpmi-nand: Handle ECC Errors in erased pages

Rafa=C5=82 Mi=C5=82ecki (34):
      mtd: nand: add new enum for storing ECC algorithm
      of: mtd: prepare helper reading NAND ECC algo from DT
      mtd: nand: set ECC algorithm in nand_dt_init
      mtd: nand: nandsim: set ECC algorithm explicitly
      mtd: nand: ams-delta: set ECC algorithm explicitly
      mtd: nand: gpio: set ECC algorithm explicitly
      mtd: nand: mxc: set ECC algorithm explicitly
      mtd: nand: nuc900: set ECC algorithm explicitly
      mtd: nand: orion: set ECC algorithm explicitly
      mtd: nand: pasemi: set ECC algorithm explicitly
      mtd: nand: plat: set ECC algorithm explicitly
      mtd: nand: socrates: set ECC algorithm explicitly
      mtd: nand: pasemi: switch to dev_* printing functions
      mtd: nand: omap2: set ECC algorithm explicitly
      mtd: nand: s3c2410: set ECC algorithm explicitly
      mtd: nand: sh_flctl: set ECC algorithm explicitly
      mtd: nand: au1550nd: set ECC algorithm explicitly
      mtd: nand: mpc5121_nfc: set ECC algorithm explicitly
      mtd: nand: cmx270: set ECC algorithm explicitly
      mtd: nand: fsl_upm: set ECC algorithm explicitly
      mtd: nand: fsl_ifc: set ECC algorithm explicitly
      mtd: nand: fsl_elbc: set ECC algorithm explicitly
      mtd: nand: bf5xx: set ECC algorithm explicitly
      mtd: nand: davinci: set ECC algorithm explicitly
      mtd: nand: atmel: set ECC algorithm explicitly
      CRIS v32: nand: set ECC algorithm explicitly
      staging: mt29f_spinand: set ECC algorithm explicitly
      mtd: nand: set ECC algorithm to Hamming on fallback
      mtd: nand: fsmc: validate ECC setup by checking algorithm directly
      mtd: nand: read ECC algorithm from the new field
      mtd: drop support for NAND_ECC_SOFT_BCH as "soft_bch" mapping
      mtd: mtd: drop NAND_ECC_SOFT_BCH enum value
      mtd: nand: add support for "nand-ecc-algo" DT property
      Documentation: devicetree: deprecate "soft_bch" nand-ecc-mode value

Raghav Dogra (1):
      mtd/ifc: Add support for IFC controller version 2.0

Roger Quadros (17):
      ARM: OMAP2+: gpmc: Add platform data
      ARM: OMAP2+: gpmc: Add gpmc timings and settings to platform data
      memory: omap-gpmc: Introduce GPMC to NAND interface
      memory: omap-gpmc: Add GPMC-NAND ops to get writebufferempty status
      memory: omap-gpmc: Implement IRQ domain for NAND IRQs
      mtd: nand: omap: Use gpmc_omap_get_nand_ops() to get NAND registers
      mtd: nand: omap: Switch to using GPMC-NAND ops for writebuffer empty =
check
      mtd: nand: omap: Copy platform data parameters to omap_nand_info data
      mtd: nand: omap: Clean up device tree support
      mtd: nand: omap: Update DT binding documentation
      memory: omap-gpmc: Prevent mapping into 1st 16MB
      memory: omap-gpmc: Move device tree binding to correct location
      memory: omap-gpmc: Support general purpose input for WAITPINs
      memory: omap-gpmc: Reserve WAITPIN if needed for WAIT monitoring
      memory: omap-gpmc: Support WAIT pin edge interrupts
      memory: omap-gpmc: Prevent GPMC_STATUS from being accessed via gpmc_r=
egs
      mtd: nand: omap2: Implement NAND ready using gpiolib

Zhaoxiu Zeng (1):
      mtd: nand: s3c2410: fix bug in s3c2410_nand_correct_data()

 .../omap-gpmc.txt}                                 |  17 +
 .../devicetree/bindings/mtd/brcm,brcmnand.txt      |   1 +
 .../devicetree/bindings/mtd/gpmc-nand.txt          |  19 +-
 Documentation/devicetree/bindings/mtd/nand.txt     |  45 +-
 arch/arm/mach-omap2/gpmc-nand.c                    |   7 +-
 arch/arm/mach-pxa/spitz.c                          |  55 +-
 arch/cris/arch-v32/drivers/mach-a3/nandflash.c     |   1 +
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c     |   1 +
 arch/mips/include/asm/mach-jz4740/jz4740_nand.h    |   2 +-
 arch/mips/jz4740/board-qi_lb60.c                   |  87 +--
 drivers/leds/trigger/Kconfig                       |  15 +
 drivers/leds/trigger/Makefile                      |   2 +
 drivers/leds/trigger/ledtrig-mtd.c                 |  45 ++
 drivers/leds/trigger/ledtrig-panic.c               |  30 +
 drivers/memory/Kconfig                             |   1 +
 drivers/memory/fsl_ifc.c                           |  36 +-
 drivers/memory/omap-gpmc.c                         | 657 +++++++++++++----=
----
 drivers/mtd/devices/docg3.c                        |  46 +-
 drivers/mtd/mtdchar.c                              | 123 +++-
 drivers/mtd/mtdconcat.c                            |   2 +-
 drivers/mtd/mtdcore.c                              | 379 ++++++++++++
 drivers/mtd/mtdpart.c                              |  23 +-
 drivers/mtd/nand/ams-delta.c                       |   1 +
 drivers/mtd/nand/atmel_nand.c                      | 315 +++++-----
 drivers/mtd/nand/au1550nd.c                        |   1 +
 drivers/mtd/nand/bf5xx_nand.c                      |  52 +-
 drivers/mtd/nand/brcmnand/brcmnand.c               | 290 +++++----
 drivers/mtd/nand/cafe_nand.c                       |  44 +-
 drivers/mtd/nand/cmx270_nand.c                     |   1 +
 drivers/mtd/nand/davinci_nand.c                    | 210 +++----
 drivers/mtd/nand/denali.c                          |  50 +-
 drivers/mtd/nand/diskonchip.c                      |  60 +-
 drivers/mtd/nand/docg4.c                           |  33 +-
 drivers/mtd/nand/fsl_elbc_nand.c                   |  84 +--
 drivers/mtd/nand/fsl_ifc_nand.c                    | 317 ++++------
 drivers/mtd/nand/fsl_upm.c                         |   1 +
 drivers/mtd/nand/fsmc_nand.c                       | 332 +++--------
 drivers/mtd/nand/gpio.c                            |   1 +
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             | 161 ++++-
 drivers/mtd/nand/hisi504_nand.c                    |  40 +-
 drivers/mtd/nand/jz4740_nand.c                     |   3 +-
 drivers/mtd/nand/jz4780_bch.c                      |   1 -
 drivers/mtd/nand/jz4780_nand.c                     |  21 +-
 drivers/mtd/nand/lpc32xx_mlc.c                     |  51 +-
 drivers/mtd/nand/lpc32xx_slc.c                     |  83 ++-
 drivers/mtd/nand/mpc5121_nfc.c                     |   1 +
 drivers/mtd/nand/mxc_nand.c                        | 257 ++++----
 drivers/mtd/nand/nand_base.c                       | 650 ++++++++++++-----=
---
 drivers/mtd/nand/nand_bch.c                        |  37 +-
 drivers/mtd/nand/nandsim.c                         |  10 +-
 drivers/mtd/nand/nuc900_nand.c                     |   1 +
 drivers/mtd/nand/omap2.c                           | 448 +++++++++-----
 drivers/mtd/nand/orion_nand.c                      |   1 +
 drivers/mtd/nand/pasemi_nand.c                     |  16 +-
 drivers/mtd/nand/plat_nand.c                       |   1 +
 drivers/mtd/nand/pxa3xx_nand.c                     | 132 +++--
 drivers/mtd/nand/qcom_nandc.c                      |  88 ++-
 drivers/mtd/nand/s3c2410.c                         |  36 +-
 drivers/mtd/nand/sh_flctl.c                        | 115 ++--
 drivers/mtd/nand/sharpsl.c                         |   2 +-
 drivers/mtd/nand/sm_common.c                       |  93 ++-
 drivers/mtd/nand/socrates_nand.c                   |   1 +
 drivers/mtd/nand/sunxi_nand.c                      | 600 ++++++++++++-----=
--
 drivers/mtd/nand/vf610_nfc.c                       |  35 +-
 drivers/mtd/onenand/onenand_base.c                 | 235 ++++----
 drivers/of/Makefile                                |   1 -
 drivers/of/of_mtd.c                                | 119 ----
 drivers/staging/mt29f_spinand/mt29f_spinand.c      |  49 +-
 include/linux/fsl_ifc.h                            |  45 +-
 include/linux/leds.h                               |   6 +
 include/linux/mtd/fsmc.h                           |  18 -
 include/linux/mtd/mtd.h                            |  75 ++-
 include/linux/mtd/nand.h                           |  28 +-
 include/linux/mtd/onenand.h                        |   2 -
 include/linux/mtd/sharpsl.h                        |   2 +-
 include/linux/of_mtd.h                             |  50 --
 include/linux/omap-gpmc.h                          | 172 +-----
 include/linux/platform_data/gpmc-omap.h            | 172 ++++++
 include/linux/platform_data/mtd-nand-omap2.h       |  12 +-
 include/uapi/mtd/mtd-abi.h                         |   2 +-
 80 files changed, 4371 insertions(+), 2887 deletions(-)
 rename Documentation/devicetree/bindings/{bus/ti-gpmc.txt =3D> memory-cont=
rollers/omap-gpmc.txt} (89%)
 create mode 100644 drivers/leds/trigger/ledtrig-mtd.c
 create mode 100644 drivers/leds/trigger/ledtrig-panic.c
 delete mode 100644 drivers/of/of_mtd.c
 delete mode 100644 include/linux/of_mtd.h
 create mode 100644 include/linux/platform_data/gpmc-omap.h
