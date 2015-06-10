Received: from mail-wi0-x244.google.com ([2a00:1450:400c:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mmU-00006X-1A
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:28 +0000
Received: by wivr20 with SMTP id r20so11942536wiv.1
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:05 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 00/60] Fix mtd parent device not showing up in sysfs
Date: Wed, 10 Jun 2015 22:38:14 +0200
Message-Id: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
Cc: linux-mtd@lists.infradead.org, Frans Klaver <fransklaver@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here's the second iteration of a series stemming from a previous discussion
about mtd devices not showing up in sysfs properly[1]. While the original
series 27 patches, this one should cover all drivers that suffer from this
issue, and shamelessly hits 60. Again, if it's preferred that the patches are
grouped differently, like by mtd subdir, I'd be happy to resend. Until then,
we'll make do with this.

This series teaches add_mtd_device() to set name and owner based on the set
parent device, if dev.parent is filled in, and name resp. owner isn't already
filled in. All drivers that I could find that don't set the parent are touched
to set the parent device, and remove the name and owner assignment in cases
where I'm sure the resulting name will not change. Only the latter is done in
cases where I would find the driver explicitly filling in the owner.

Thanks for having a go at your favorite MTD,
Frans

v1..v2
  - Overall: make it more clear that it's about a parent device symlink gone
    missing (thanks, Brian)
  - Fix compile error in 30: "fsmc_nand: show parent device in sysfs"
  - Fix possible null-pointer dereference in 02: "mtd: core: set some
    defaults..."

[1] https://lkml.org/lkml/2014/5/26/586

Frans Klaver (60):
  mtd: core: tone down suggestion that dev.parent should be set
  mtd: core: set some defaults when dev.parent is set
  mtd: devices: bcm47xxflash: show parent device in sysfs
  mtd: devices: docg3: show parent device in sysfs
  mtd: devices: m25p80: show parent device in sysfs
  mtd: devices: mtd_dataflash: drop owner assignment
  mtd: devices: spear_smi: show parent device in sysfs
  mtd: devices: sst251: show parent device in sysfs
  mtd: lpddr: show parent device in sysfs
  mtd: maps: bfin-async-flash: show parent device in sysfs
  mtd: maps: gpio-addr-flash: show parent device in sysfs
  mtd: maps: intel_vr_nor: show parent device in sysfs
  mtd: maps: ixp4xx: show parent device in sysfs
  mtd: maps: lantiq-flash: show parent device in sysfs
  mtd: maps: latch-addr-flash: show parent device in sysfs
  mtd: maps: physmap: drop owner assignment
  mtd: maps: physmap_of: drop owner assignment
  mtd: maps: plat_ram: drop owner assignment
  mtd: maps: pxa2xx-flash: show parent device in sysfs
  mtd: maps: rbtx4939-flash: show parent device in sysfs
  mtd: maps: sa1100-flash: show parent device in sysfs
  mtd: nand: atmel_nand: show parent device in sysfs
  mtd: nand: au1550nd: show parent device in sysfs
  mtd: nand: bcm47xxnflash: show parent device in sysfs
  mtd: nand: bf5xx_nand: show parent device in sysfs
  mtd: nand: cafe_nand: drop owner assignment
  mtd: nand: davinci_nand: drop owner and name assignment
  mtd: nand: denali: drop owner assignment
  mtd: nand: docg4: show parent device in sysfs
  mtd: nand: fsl_elbc_nand: show parent device in sysfs
  mtd: nand: fsl_ifc_nand: show parent device in sysfs
  mtd: nand: fsl_upm: show parent device in sysfs
  mtd: nand: fsmc_nand: show parent device in sysfs
  mtd: nand: gpio: show parent device in sysfs
  mtd: nand: gpmi-nand: show parent device in sysfs
  mtd: nand: hisi504_nand: drop owner assignment
  mtd: nand: jz4740_nand: show parent device in sysfs
  mtd: nand: lpc32xx_mlc: drop owner assignment
  mtd: nand: mpc5121_nfc: show parent device in sysfs
  mtd: nand: mxc_nand: drop owner assignment
  mtd: nand: ndfc: show parent device in sysfs
  mtd: nand: nuc900_nand: show parent device in sysfs
  mtd: nand: omap2: show parent device structure in sysfs
  mtd: nand: orion_nand: show parent device in sysfs
  mtd: nand: pasemi_nand: show parent device in sysfs
  mtd: nand: plat_nand: show parent device in sysfs
  mtd: nand: pxa3xx_nand: show parent device in sysfs
  mtd: nand: r852: drop owner assignment
  mtd: nand: s3c2410: show parent device in sysfs
  mtd: nand: sh_flctl: show parent device in sysfs
  mtd: nand: sharpsl: show parent device in sysfs
  mtd: nand: socrates_nand: drop owner assignment
  mtd: nand: sunxi_nand: drop owner assignment
  mtd: nand: tmio_nand: show parent device in sysfs
  mtd: nand: txx9ndfmc: show parent device in sysfs
  mtd: onenand: generic: show parent device in sysfs
  mtd: onenand: omap2: drop owner and name assignment
  mtd: onenand: samsung: drop owner assignment
  mtd: spi-nor: fsl-quadspi: show parent device in sysfs
  staging: mt29f_spinand: show parent device in sysfs

 drivers/mtd/devices/bcm47xxsflash.c           |  7 ++++---
 drivers/mtd/devices/docg3.c                   |  2 +-
 drivers/mtd/devices/m25p80.c                  |  1 +
 drivers/mtd/devices/mtd_dataflash.c           |  1 -
 drivers/mtd/devices/spear_smi.c               |  1 +
 drivers/mtd/devices/sst25l.c                  |  3 +--
 drivers/mtd/lpddr/lpddr2_nvm.c                |  1 +
 drivers/mtd/maps/bfin-async-flash.c           |  1 +
 drivers/mtd/maps/gpio-addr-flash.c            |  2 +-
 drivers/mtd/maps/intel_vr_nor.c               |  2 +-
 drivers/mtd/maps/ixp4xx.c                     |  2 +-
 drivers/mtd/maps/lantiq-flash.c               |  2 +-
 drivers/mtd/maps/latch-addr-flash.c           |  2 +-
 drivers/mtd/maps/physmap.c                    |  1 -
 drivers/mtd/maps/physmap_of.c                 |  1 -
 drivers/mtd/maps/plat-ram.c                   |  1 -
 drivers/mtd/maps/pxa2xx-flash.c               |  2 +-
 drivers/mtd/maps/rbtx4939-flash.c             |  2 +-
 drivers/mtd/maps/sa1100-flash.c               |  2 +-
 drivers/mtd/mtdcore.c                         | 11 ++++++++++-
 drivers/mtd/nand/atmel_nand.c                 |  2 +-
 drivers/mtd/nand/au1550nd.c                   |  2 +-
 drivers/mtd/nand/bcm47xxnflash/main.c         |  2 +-
 drivers/mtd/nand/bf5xx_nand.c                 |  2 +-
 drivers/mtd/nand/cafe_nand.c                  |  1 -
 drivers/mtd/nand/davinci_nand.c               |  3 ---
 drivers/mtd/nand/denali.c                     |  1 -
 drivers/mtd/nand/docg4.c                      |  2 +-
 drivers/mtd/nand/fsl_elbc_nand.c              |  2 +-
 drivers/mtd/nand/fsl_ifc_nand.c               |  2 +-
 drivers/mtd/nand/fsl_upm.c                    |  2 +-
 drivers/mtd/nand/fsmc_nand.c                  |  2 +-
 drivers/mtd/nand/gpio.c                       |  2 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c        |  2 +-
 drivers/mtd/nand/hisi504_nand.c               |  1 -
 drivers/mtd/nand/jz4740_nand.c                |  2 +-
 drivers/mtd/nand/lpc32xx_mlc.c                |  1 -
 drivers/mtd/nand/mpc5121_nfc.c                |  1 +
 drivers/mtd/nand/mxc_nand.c                   |  1 -
 drivers/mtd/nand/ndfc.c                       |  2 +-
 drivers/mtd/nand/nuc900_nand.c                |  2 +-
 drivers/mtd/nand/omap2.c                      |  3 +--
 drivers/mtd/nand/orion_nand.c                 |  2 +-
 drivers/mtd/nand/pasemi_nand.c                |  2 +-
 drivers/mtd/nand/plat_nand.c                  |  3 +--
 drivers/mtd/nand/pxa3xx_nand.c                |  2 +-
 drivers/mtd/nand/r852.c                       |  1 -
 drivers/mtd/nand/s3c2410.c                    |  2 +-
 drivers/mtd/nand/sh_flctl.c                   |  1 +
 drivers/mtd/nand/sharpsl.c                    |  2 +-
 drivers/mtd/nand/socrates_nand.c              |  1 -
 drivers/mtd/nand/sunxi_nand.c                 |  1 -
 drivers/mtd/nand/tmio_nand.c                  |  1 +
 drivers/mtd/nand/txx9ndfmc.c                  |  2 +-
 drivers/mtd/onenand/generic.c                 |  3 +--
 drivers/mtd/onenand/omap2.c                   |  2 --
 drivers/mtd/onenand/samsung.c                 |  1 -
 drivers/mtd/spi-nor/fsl-quadspi.c             |  1 +
 drivers/staging/mt29f_spinand/mt29f_spinand.c |  3 +--
 59 files changed, 56 insertions(+), 61 deletions(-)

-- 
2.4.0
