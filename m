Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QS9FH-00074e-6c
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 14:51:37 +0000
Received: by wwb39 with SMTP id 39so758005wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 07:51:31 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [RFC PATCH 000/104] mtd: cleanup partition parsing interface
Date: Thu,  2 Jun 2011 18:51:13 +0400
Message-Id: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This is an RFC for a huge serie of patches converting most mtd drivers to use
single instance of code for managing mtd partitions parsing and handling.

Currently each driver responsible for partitions implements this part of code
on it's own, resulting in memory leaks, possible frees of non-allocated memory,
etc. As the patch serie is huge, I'm posting only patches I consider
"interesting", i. e. from the subserie doing the same cleanup for different
drivers I post only first patch. Rest are available through the gitweb.

Only one driver still uses parse_mtd_partitions after this serie (edb7312),
as it registers both parsed partitions and the whole mtd device and I ain't
sure how to behave at this case.

If the idea seems find to be commited, I'll post the whole serie for full
review.

The following changes since commit 55922c9d1b84b89cb946c777fddccb3247e7df2c:

  Linux 3.0-rc1 (2011-05-29 17:43:36 -0700)

are available in the git repository at:
  ssh://master.kernel.org/pub/scm/linux/kernel/git/lumag/mtd-cleanup.git mtd-cleanup

Dmitry Eremin-Solenikov (104):
      ATMEL, AVR32: inline nand partition table access
      clps711x/ceiva: port to use physmap flash
      mtd: drop ceiva map driver
      mtd: drop physmap_configure
      mtd: cafe_nand: drop reference to CONFIG_MTD_CMDLINE_PARTS
      mtdpart: default to cmdlinepart, NULL partitions probing
      mtd: m25p80 don't specify default parsing options
      mtd: mtd_dataflash don't specify default parsing options
      mtd: sst25l don't specify default parsing options
      mtd: h720x-flash don't specify default parsing options
      mtd: impa7 don't specify default parsing options
      mtd: intel_vr_nor don't specify default parsing options
      mtd: rbtx4939-flash don't specify default parsing options
      mtd: atmel_nand don't specify default parsing options
      mtd: bcm_umi_nand don't specify default parsing options
      mtd: cmx270_nand don't specify default parsing options
      mtd: cs553x_nand don't specify default parsing options
      mtd: davinci_nand don't specify default parsing options
      mtd: edb7312 don't specify default parsing options
      mtd: fsl_upm don't specify default parsing options
      mtd: fsmc_nand don't specify default parsing options
      mtd: h1910 don't specify default parsing options
      mtd: jz4740_nand don't specify default parsing options
      mtd: lantiq-flash don't specify default parsing options
      mtd: latch-addr-flash don't specify default parsing options
      mtd: mpc5121_nfc don't specify default parsing options
      mtd: ndfc don't specify default parsing options
      mtd: omap2 don't specify default parsing options
      mtd: orion_nand don't specify default parsing options
      mtd: ppchameleonevb don't specify default parsing options
      mtd: pxa3xx_nand don't specify default parsing options
      mtd: s3c2410 don't specify default parsing options
      mtd: sharpsl don't specify default parsing options
      mtd: socrates_nand don't specify default parsing options
      mtd: tmio_nand don't specify default parsing options
      mtd: txx9ndfmc don't specify default parsing options
      mtd: onenand/generic don't specify default parsing options
      mtd: onenand/omap2 don't specify default parsing options
      mtd: samsung/onenand don't specify default parsing options
      mtd: drop mtd_has_cmdlinepart()
      mtd: prepare to convert of_mtd_parse_partitions to partition parser
      mtd: m25p80: use ofpart through generic parsing
      mtd: physmap_of: use ofpart through generic parsing
      mtd: fsl_elbc_nand: use ofpart through generic parsing
      mtd: fsl_upm: use ofpart through generic parsing
      mtd: mpc5121_nfc: use ofpart through generic parsing
      mtd: ndfc: use ofpart through generic parsing
      mtd: socrates_nand: use ofpart through generic parsing
      mtd: drop of_mtd_parse_partitions()
      physmap_of: separate parse_obsolete_partitions to separate parser
      mtd: add a flags for partitions which should just leave smth. after them
      ts72xx: use MTDPART_OFS_RETAIN for mtd partitioning
      mtd: plat-nand: drop unused fields from platform_nand_data
      mtd: add new API for handling MTD registration
      mtd: lart.c: use mtd_device_parse_register
      mtd: m25p80.c: use mtd_device_parse_register
      mtd: mtd_dataflash.c: use mtd_device_parse_register
      mtd: sst25l.c: use mtd_device_parse_register
      mtd: bfin-async-flash.c: use mtd_device_parse_register
      mtd: dc21285.c: use mtd_device_parse_register
      mtd: gpio-addr-flash.c: use mtd_device_parse_register
      mtd: h720x-flash.c: use mtd_device_parse_register
      mtd: impa7.c: use mtd_device_parse_register
      mtd: intel_vr_nor.c: use mtd_device_parse_register
      mtd: ixp2000.c: use mtd_device_parse_register
      mtd: ixp4xx.c: use mtd_device_parse_register
      mtd: lantiq-flash.c: use mtd_device_parse_register
      mtd: latch-addr-flash.c: use mtd_device_parse_register
      mtd: physmap.c: use mtd_device_parse_register
      mtd: physmap_of.c: use mtd_device_parse_register
      mtd: plat-ram.c: use mtd_device_parse_register
      mtd: pxa2xx-flash.c: use mtd_device_parse_register
      mtd: rbtx4939-flash.c: use mtd_device_parse_register
      mtd: sa1100-flash.c: use mtd_device_parse_register
      mtd: solutionengine.c: use mtd_device_parse_register
      mtd: wr_sbc82xx_flash.c: use mtd_device_parse_register
      mtd: atmel_nand.c: use mtd_device_parse_register
      mtd: bcm_umi_nand.c: use mtd_device_parse_register
      mtd: cafe_nand.c: use mtd_device_parse_register
      mtd: cmx270_nand.c: use mtd_device_parse_register
      mtd: cs553x_nand.c: use mtd_device_parse_register
      mtd: davinci_nand.c: use mtd_device_parse_register
      mtd: edb7312.c: use mtd_device_parse_register
      mtd: fsl_elbc_nand.c: use mtd_device_parse_register
      mtd: fsl_upm.c: use mtd_device_parse_register
      mtd: fsmc_nand.c: use mtd_device_parse_register
      mtd: h1910.c: use mtd_device_parse_register
      mtd: jz4740_nand.c: use mtd_device_parse_register
      mtd: mpc5121_nfc.c: use mtd_device_parse_register
      mtd: mxc_nand.c: use mtd_device_parse_register
      mtd: ndfc.c: use mtd_device_parse_register
      mtd: omap2.c: use mtd_device_parse_register
      mtd: orion_nand.c: use mtd_device_parse_register
      mtd: plat_nand.c: use mtd_device_parse_register
      mtd: ppchameleonevb.c: use mtd_device_parse_register
      mtd: pxa3xx_nand.c: use mtd_device_parse_register
      mtd: s3c2410.c: use mtd_device_parse_register
      mtd: sharpsl.c: use mtd_device_parse_register
      mtd: socrates_nand.c: use mtd_device_parse_register
      mtd: tmio_nand.c: use mtd_device_parse_register
      mtd: txx9ndfmc.c: use mtd_device_parse_register
      mtd: onenand/generic.c: use mtd_device_parse_register
      mtd: onenand/omap2.c: use mtd_device_parse_register
      mtd: onenand/samsung.c: use mtd_device_parse_register

 arch/arm/mach-at91/board-afeb-9260v1.c      |    9 +-
 arch/arm/mach-at91/board-cam60.c            |    9 +-
 arch/arm/mach-at91/board-cap9adk.c          |    9 +-
 arch/arm/mach-at91/board-kb9202.c           |    9 +-
 arch/arm/mach-at91/board-neocore926.c       |    9 +-
 arch/arm/mach-at91/board-qil-a9260.c        |    9 +-
 arch/arm/mach-at91/board-rm9200dk.c         |    9 +-
 arch/arm/mach-at91/board-sam9-l9260.c       |    9 +-
 arch/arm/mach-at91/board-sam9260ek.c        |    9 +-
 arch/arm/mach-at91/board-sam9261ek.c        |    9 +-
 arch/arm/mach-at91/board-sam9263ek.c        |    9 +-
 arch/arm/mach-at91/board-sam9g20ek.c        |    9 +-
 arch/arm/mach-at91/board-sam9m10g45ek.c     |    9 +-
 arch/arm/mach-at91/board-sam9rlek.c         |    9 +-
 arch/arm/mach-at91/board-snapper9260.c      |   10 +-
 arch/arm/mach-at91/board-usb-a9260.c        |    9 +-
 arch/arm/mach-at91/board-usb-a9263.c        |    9 +-
 arch/arm/mach-at91/board-yl-9200.c          |    9 +-
 arch/arm/mach-at91/include/mach/board.h     |    3 +-
 arch/arm/mach-clps711x/ceiva.c              |   60 +++++
 arch/arm/mach-ep93xx/ts72xx.c               |   22 +--
 arch/avr32/boards/atngw100/setup.c          |    8 +-
 arch/avr32/boards/atstk1000/atstk1002.c     |    9 +-
 arch/avr32/mach-at32ap/include/mach/board.h |    3 +-
 drivers/mtd/Kconfig                         |   10 +
 drivers/mtd/Makefile                        |    1 +
 drivers/mtd/devices/lart.c                  |   12 +-
 drivers/mtd/devices/m25p80.c                |   42 +---
 drivers/mtd/devices/mtd_dataflash.c         |   26 +--
 drivers/mtd/devices/sst25l.c                |   38 +---
 drivers/mtd/maps/Kconfig                    |   14 -
 drivers/mtd/maps/Makefile                   |    1 -
 drivers/mtd/maps/bfin-async-flash.c         |   16 +-
 drivers/mtd/maps/ceiva.c                    |  341 ---------------------------
 drivers/mtd/maps/dc21285.c                  |    9 +-
 drivers/mtd/maps/gpio-addr-flash.c          |   16 +-
 drivers/mtd/maps/h720x-flash.c              |   23 +--
 drivers/mtd/maps/impa7.c                    |   26 +--
 drivers/mtd/maps/intel_vr_nor.c             |    7 +-
 drivers/mtd/maps/ixp2000.c                  |   11 +-
 drivers/mtd/maps/ixp4xx.c                   |   29 +--
 drivers/mtd/maps/lantiq-flash.c             |   17 +--
 drivers/mtd/maps/latch-addr-flash.c         |   24 +--
 drivers/mtd/maps/physmap.c                  |   38 +---
 drivers/mtd/maps/physmap_of.c               |   79 +------
 drivers/mtd/maps/plat-ram.c                 |   23 +--
 drivers/mtd/maps/pxa2xx-flash.c             |   20 +--
 drivers/mtd/maps/rbtx4939-flash.c           |   21 +--
 drivers/mtd/maps/sa1100-flash.c             |   30 +--
 drivers/mtd/maps/solutionengine.c           |   30 +--
 drivers/mtd/maps/wr_sbc82xx_flash.c         |   30 +--
 drivers/mtd/mtdcore.c                       |   49 ++++
 drivers/mtd/mtdpart.c                       |   16 ++
 drivers/mtd/nand/atmel_nand.c               |   25 +--
 drivers/mtd/nand/bcm_umi_nand.c             |   22 +--
 drivers/mtd/nand/cafe_nand.c                |   13 +-
 drivers/mtd/nand/cmx270_nand.c              |   23 +--
 drivers/mtd/nand/cs553x_nand.c              |   10 +-
 drivers/mtd/nand/davinci_nand.c             |   32 +---
 drivers/mtd/nand/edb7312.c                  |   19 +--
 drivers/mtd/nand/fsl_elbc_nand.c            |   16 +-
 drivers/mtd/nand/fsl_upm.c                  |   13 +-
 drivers/mtd/nand/fsmc_nand.c                |   75 +-----
 drivers/mtd/nand/h1910.c                    |   19 +--
 drivers/mtd/nand/jz4740_nand.c              |   18 +--
 drivers/mtd/nand/mpc5121_nfc.c              |   18 +--
 drivers/mtd/nand/mxc_nand.c                 |   15 +-
 drivers/mtd/nand/ndfc.c                     |   20 +--
 drivers/mtd/nand/omap2.c                    |   12 +-
 drivers/mtd/nand/orion_nand.c               |   16 +-
 drivers/mtd/nand/plat_nand.c                |   24 +--
 drivers/mtd/nand/ppchameleonevb.c           |   47 +---
 drivers/mtd/nand/pxa3xx_nand.c              |   14 +-
 drivers/mtd/nand/s3c2410.c                  |   19 +--
 drivers/mtd/nand/sharpsl.c                  |   13 +-
 drivers/mtd/nand/socrates_nand.c            |   27 +--
 drivers/mtd/nand/tmio_nand.c                |   17 +-
 drivers/mtd/nand/txx9ndfmc.c                |    8 +-
 drivers/mtd/ofoldpart.c                     |   89 +++++++
 drivers/mtd/ofpart.c                        |   28 ++-
 drivers/mtd/onenand/generic.c               |   13 +-
 drivers/mtd/onenand/omap2.c                 |   15 +-
 drivers/mtd/onenand/samsung.c               |   13 +-
 include/linux/mtd/mtd.h                     |    8 +
 include/linux/mtd/nand.h                    |    2 -
 include/linux/mtd/partitions.h              |   27 +--
 include/linux/mtd/physmap.h                 |   17 --
 87 files changed, 457 insertions(+), 1557 deletions(-)
 delete mode 100644 drivers/mtd/maps/ceiva.c
 create mode 100644 drivers/mtd/ofoldpart.c
