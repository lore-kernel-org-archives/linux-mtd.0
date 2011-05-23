Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORMg-0002TB-Uu
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:23:56 +0000
Received: by wyb28 with SMTP id 28so5098469wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:23:52 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 00/62] Remove CONFIG_MTD_PARTITIONS
Date: Mon, 23 May 2011 10:22:41 +0100
Message-Id: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series remove the configuration option CONFIG_MTD_PARTITIONS so that
partitioning support is always enabled in the kernel.  A new set of symbols
for registering MTD devices (mtd_device_register()/mtd_device_unregister())
are introduced that replace add_mtd_device()/add_mtd_partitions() and their
removal counterparts and the preprocessor conditionals in drivers are removed
so that we can always register partitions.

Most of the driver changes are only compile tested but physmap and gpio-nand
have been tested on hardware.

This series is based on next-20110519 so that the new lantiq driver can be
converted.  There are a couple of small conflicts with Artem's tree but are
fairly easily resolved.

Jamie Iles (62):
  mtd: always build partitioning support
  mtd: introduce mtd_device_(un)register()
  mtd: provide of_mtd_parse_partitions for !CONFIG_MTD_OF_PARTS
  mtd/physmap: convert to mtd_device_register()
  mtd/nand: convert to mtd_device_register()
  mtd/plat_nand: convert to mtd_device_register()
  arm/mtd/gemini: convert to mtd_device_register()
  mtd/ixp: convert to mtd_device_register()
  mtd/pxa: convert to mtd_device_register()
  mtd/s3c2410: remove CONFIG_MTD_PARTITIONS test
  mtd/bfin: convert to mtd_device_register()
  mtd/cris: convert to mtd_device_register()
  mtd/octeon: convert to mtd_device_register()
  mips/tx99: remove CONFIG_MTD_PARTITIONS check
  mtd/onenand: convert to mtd_device_register()
  mtd/m25p80: convert to mtd_device_register()
  mtd/dataflash: convert to mtd_device_register()
  mtd/sst25l: convert to mtd_device_register()
  mtd/dc21285: convert to mtd_device_register()
  mtd/edb7312: convert to mtd_device_register()
  mtd/gpio-addr-flash: convert to mtd_device_register()
  mtd/h720x-flash: convert to mtd_device_register()
  mtd/impa7: convert to mtd_device_register()
  mtd/intel_vr_nor: convert to mtd_device_register()
  mtd/latch-addr-flash: convert to mtd_device_register()
  mtd/plat-ram: convert to mtd_device_register()
  mtd/rbtx4939-flash: convert to mtd_device_register()
  mtd/sa1100-flash: convert to mtd_device_register()
  mtd/scx200_docflash: convert to mtd_device_register()
  mtd/tqm8xll: convert to mtd_device_register()
  mtd/uclinux: convert to mtd_device_register()
  mtd/atmel_nand: convert to mtd_device_register()
  mtd/bcm_umi_nand: convert to mtd_device_register()
  mtd/bf5xx_nand: convert to mtd_device_register()
  mtd/cafe_nand: convert to mtd_device_register()
  mtd/cs553x_nand: convert to mtd_device_register()
  mtd/davinci_nand: convert to mtd_device_register()
  mtd/diskonchip: convert to mtd_device_register()
  mtd/edb7312 nand: convert to mtd_device_register()
  mtd/fsl_elbc_nand: convert to mtd_device_register()
  mtd/fsl_upm: convert to mtd_device_register()
  mtd/fsmc_nand: convert to mtd_device_register()
  mtd/h1910: convert to mtd_device_register()
  mtd/jz4740_nand: convert to mtd_device_register()
  mtd/mpc5121_nfc: convert to mtd_device_register()
  mtd/mxc_nand: convert to mtd_device_register()
  mtd/ndfc: convert to mtd_device_register()
  mtd/nomadik_nand: convert to mtd_device_register()
  mtd/omap2: convert to mtd_device_register()
  mtd/orion_nand: convert to mtd_device_register()
  mtd/ppchameleonevb: convert to mtd_device_register()
  mtd/s3c2410 nand: convert to mtd_device_register()
  mtd/sharpsl: convert to mtd_device_register()
  mtd/socrates_nand: convert to mtd_device_register()
  mtd/tmio_nand: convert to mtd_device_register()
  mtd/txx9ndfmc: convert to mtd_device_register()
  mtd/omap2 onenand: convert to mtd_device_register()
  mtd/samsung onenand: convert to mtd_device_register()
  mtd: convert remaining users to mtd_device_register()
  mtd/lantiq: convert to mtd_device_register()
  mtd: remove add_mtd_partitions, add_mtd_device and friends
  mtd: kill CONFIG_MTD_PARTITIONS

 Documentation/DocBook/mtdnand.tmpl        |    3 +-
 arch/arm/mach-gemini/board-wbd111.c       |    7 +---
 arch/arm/mach-gemini/board-wbd222.c       |    7 +---
 arch/arm/mach-ixp4xx/ixdp425-setup.c      |    4 --
 arch/arm/mach-pxa/Kconfig                 |    1 -
 arch/arm/mach-s3c2410/mach-amlm5900.c     |    5 --
 arch/arm/mach-s3c2410/mach-tct_hammer.c   |    6 ---
 arch/blackfin/mach-bf537/boards/stamp.c   |    4 --
 arch/blackfin/mach-bf561/boards/acvilon.c |    4 --
 arch/cris/Kconfig                         |    1 -
 arch/cris/arch-v10/drivers/axisflashmap.c |   10 +++--
 arch/cris/arch-v32/drivers/Kconfig        |    1 -
 arch/cris/arch-v32/drivers/axisflashmap.c |    7 ++-
 arch/mips/cavium-octeon/flash_setup.c     |   11 +----
 arch/mips/txx9/generic/setup.c            |    3 +-
 drivers/mtd/Kconfig                       |   18 +-------
 drivers/mtd/Makefile                      |    3 +-
 drivers/mtd/devices/block2mtd.c           |    4 +-
 drivers/mtd/devices/doc2000.c             |    4 +-
 drivers/mtd/devices/doc2001.c             |    4 +-
 drivers/mtd/devices/doc2001plus.c         |    4 +-
 drivers/mtd/devices/lart.c                |    9 ++--
 drivers/mtd/devices/m25p80.c              |   68 +++++++++++++----------------
 drivers/mtd/devices/ms02-nv.c             |    4 +-
 drivers/mtd/devices/mtd_dataflash.c       |   45 ++++++++-----------
 drivers/mtd/devices/mtdram.c              |    5 +-
 drivers/mtd/devices/phram.c               |    4 +-
 drivers/mtd/devices/pmc551.c              |    6 +-
 drivers/mtd/devices/slram.c               |    4 +-
 drivers/mtd/devices/sst25l.c              |   62 +++++++++++---------------
 drivers/mtd/maps/Kconfig                  |   24 +++-------
 drivers/mtd/maps/amd76xrom.c              |    4 +-
 drivers/mtd/maps/autcpu12-nvram.c         |    4 +-
 drivers/mtd/maps/bcm963xx-flash.c         |    6 +-
 drivers/mtd/maps/bfin-async-flash.c       |   21 ++-------
 drivers/mtd/maps/cdb89712.c               |   12 +++---
 drivers/mtd/maps/ceiva.c                  |    6 +-
 drivers/mtd/maps/cfi_flagadm.c            |    4 +-
 drivers/mtd/maps/ck804xrom.c              |    4 +-
 drivers/mtd/maps/dbox2-flash.c            |    4 +-
 drivers/mtd/maps/dc21285.c                |   20 +-------
 drivers/mtd/maps/dilnetpc.c               |    9 ++--
 drivers/mtd/maps/dmv182.c                 |    4 +-
 drivers/mtd/maps/edb7312.c                |   26 +++--------
 drivers/mtd/maps/esb2rom.c                |    4 +-
 drivers/mtd/maps/fortunet.c               |    7 ++-
 drivers/mtd/maps/gpio-addr-flash.c        |   27 ++++-------
 drivers/mtd/maps/h720x-flash.c            |    6 +--
 drivers/mtd/maps/ichxrom.c                |    4 +-
 drivers/mtd/maps/impa7.c                  |   22 +--------
 drivers/mtd/maps/integrator-flash.c       |    6 +-
 drivers/mtd/maps/intel_vr_nor.c           |   19 +-------
 drivers/mtd/maps/ixp2000.c                |    4 +-
 drivers/mtd/maps/ixp4xx.c                 |   16 +++----
 drivers/mtd/maps/l440gx.c                 |    4 +-
 drivers/mtd/maps/lantiq-flash.c           |    4 +-
 drivers/mtd/maps/latch-addr-flash.c       |   45 +++++++------------
 drivers/mtd/maps/mbx860.c                 |    6 +-
 drivers/mtd/maps/netsc520.c               |    4 +-
 drivers/mtd/maps/nettel.c                 |   12 +++---
 drivers/mtd/maps/octagon-5066.c           |    4 +-
 drivers/mtd/maps/pci.c                    |    4 +-
 drivers/mtd/maps/pcmciamtd.c              |    4 +-
 drivers/mtd/maps/physmap.c                |   34 ++++-----------
 drivers/mtd/maps/physmap_of.c             |   30 ++-----------
 drivers/mtd/maps/plat-ram.c               |   24 ++++------
 drivers/mtd/maps/pmcmsp-flash.c           |    6 +-
 drivers/mtd/maps/pxa2xx-flash.c           |   18 ++------
 drivers/mtd/maps/rbtx4939-flash.c         |   24 ++--------
 drivers/mtd/maps/rpxlite.c                |    4 +-
 drivers/mtd/maps/sa1100-flash.c           |   21 +++------
 drivers/mtd/maps/sbc_gxx.c                |    4 +-
 drivers/mtd/maps/sc520cdp.c               |    8 ++--
 drivers/mtd/maps/scb2_flash.c             |    6 +-
 drivers/mtd/maps/scx200_docflash.c        |   16 +------
 drivers/mtd/maps/solutionengine.c         |   12 +++---
 drivers/mtd/maps/sun_uflash.c             |    4 +-
 drivers/mtd/maps/tqm8xxl.c                |   20 ++------
 drivers/mtd/maps/ts5500_flash.c           |    4 +-
 drivers/mtd/maps/tsunami_flash.c          |    4 +-
 drivers/mtd/maps/uclinux.c                |   12 +----
 drivers/mtd/maps/vmax301.c                |    4 +-
 drivers/mtd/maps/vmu-flash.c              |    4 +-
 drivers/mtd/maps/wr_sbc82xx_flash.c       |   15 ++++---
 drivers/mtd/mtdchar.c                     |    5 --
 drivers/mtd/mtdcore.c                     |   29 +++++++++++-
 drivers/mtd/mtdcore.h                     |    6 +++
 drivers/mtd/mtdpart.c                     |    4 +-
 drivers/mtd/nand/Kconfig                  |    5 +-
 drivers/mtd/nand/alauda.c                 |    4 +-
 drivers/mtd/nand/ams-delta.c              |    4 +-
 drivers/mtd/nand/atmel_nand.c             |   12 +-----
 drivers/mtd/nand/au1550nd.c               |    3 +-
 drivers/mtd/nand/autcpu12.c               |   16 +++---
 drivers/mtd/nand/bcm_umi_nand.c           |    4 +-
 drivers/mtd/nand/bf5xx_nand.c             |    7 +---
 drivers/mtd/nand/cafe_nand.c              |   11 +----
 drivers/mtd/nand/cmx270_nand.c            |    2 +-
 drivers/mtd/nand/cs553x_nand.c            |   19 +-------
 drivers/mtd/nand/davinci_nand.c           |   51 +++++++++-------------
 drivers/mtd/nand/denali.c                 |    4 +-
 drivers/mtd/nand/diskonchip.c             |   18 +++-----
 drivers/mtd/nand/edb7312.c                |    9 +---
 drivers/mtd/nand/fsl_elbc_nand.c          |   12 +-----
 drivers/mtd/nand/fsl_upm.c                |   12 +-----
 drivers/mtd/nand/fsmc_nand.c              |   25 ++---------
 drivers/mtd/nand/gpio.c                   |    4 +-
 drivers/mtd/nand/h1910.c                  |    5 +--
 drivers/mtd/nand/jz4740_nand.c            |   10 +----
 drivers/mtd/nand/mpc5121_nfc.c            |   12 +-----
 drivers/mtd/nand/mxc_nand.c               |   13 ++----
 drivers/mtd/nand/nand_base.c              |   10 +----
 drivers/mtd/nand/nandsim.c                |    4 +-
 drivers/mtd/nand/ndfc.c                   |   13 +-----
 drivers/mtd/nand/nomadik_nand.c           |    7 +---
 drivers/mtd/nand/nuc900_nand.c            |    4 +-
 drivers/mtd/nand/omap2.c                  |   10 +---
 drivers/mtd/nand/orion_nand.c             |   14 +------
 drivers/mtd/nand/pasemi_nand.c            |    2 +-
 drivers/mtd/nand/plat_nand.c              |   12 +----
 drivers/mtd/nand/ppchameleonevb.c         |   15 ++----
 drivers/mtd/nand/pxa3xx_nand.c            |   13 +----
 drivers/mtd/nand/rtc_from4.c              |    3 +-
 drivers/mtd/nand/s3c2410.c                |   16 +------
 drivers/mtd/nand/sh_flctl.c               |    2 +-
 drivers/mtd/nand/sharpsl.c                |   12 +----
 drivers/mtd/nand/sm_common.c              |    2 +-
 drivers/mtd/nand/socrates_nand.c          |   16 +------
 drivers/mtd/nand/spia.c                   |    2 +-
 drivers/mtd/nand/tmio_nand.c              |   10 +----
 drivers/mtd/nand/txx9ndfmc.c              |   14 +------
 drivers/mtd/onenand/Kconfig               |    1 -
 drivers/mtd/onenand/generic.c             |   16 ++-----
 drivers/mtd/onenand/omap2.c               |   10 +---
 drivers/mtd/onenand/onenand_base.c        |    6 +--
 drivers/mtd/onenand/onenand_sim.c         |    3 +-
 drivers/mtd/onenand/samsung.c             |   12 +----
 drivers/mtd/ubi/gluebi.c                  |    6 +-
 drivers/net/sfc/mtd.c                     |    6 +-
 include/linux/mtd/mtd.h                   |   37 +++++++++++----
 include/linux/mtd/partitions.h            |   16 +++---
 include/linux/mtd/physmap.h               |    4 --
 142 files changed, 523 insertions(+), 1023 deletions(-)

-- 
1.7.4.4
