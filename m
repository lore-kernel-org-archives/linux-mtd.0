Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z7S6p-0008MT-9N
 for linux-mtd@lists.infradead.org; Tue, 23 Jun 2015 17:35:44 +0000
Received: by padev16 with SMTP id ev16so11248447pad.0
 for <linux-mtd@lists.infradead.org>; Tue, 23 Jun 2015 10:35:21 -0700 (PDT)
Date: Tue, 23 Jun 2015 10:35:15 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] MTD fixes for 4.2
Message-ID: <20150623173515.GN4917@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

The following changes since commit e26081808edadfd257c6c9d81014e3b25e9a6118:

  Linux 4.1-rc4 (2015-05-18 10:13:47 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20150623

for you to fetch changes up to 0eb8618bd07533f423fed47399a0d6387bfe7cac:

  mtd: docg3: Fix kasprintf() usage (2015-06-16 18:58:47 -0700)

----------------------------------------------------------------
MTD fixes for 4.2

JFFS2

 * fix a theoretical unbalanced locking issue; the lock handling was a bit
   unclean, but AFAICT, it didn't actually lead to real deadlocks

NAND

 * brcmnand driver: new driver supporting NAND controller found originally on
   Broadcom STB SoCs (BCM7xxx), but now also found on BCM63xxx, iProc (e.g.,
   Cygnus, BCM5301x), BCM3xxx, and more

 * Begin factoring out BBT code so it can be shared between traditional
   (parallel) NAND drivers and upcoming SPI NAND drivers (WIP)

 * Add common DT-based init support, so nand_base can pick up some flash
   properties automatically, using established common NAND DT properties

 * mxc_nand: support 8-bit ECC

 * pxa3xx_nand:
   - fix build for ARM64
   - use a jiffies-based timeout

SPI NOR

 * Add a few new IDs

 * Clear out some unnecessary entries

 * Make sure SECT_4K flags are correct for all (?) entries

Core

 * Fix mtd->usecount race conditions (BUG_ON())

 * Switch to modern PM ops

Other

 * CFI: save code space by de-inlining large functions

 * Clean up some partition parser selection code across several drivers

 * Various miscellaneous changes, mostly minor

----------------------------------------------------------------
Baruch Siach (3):
      mtd: mxc_nand: limit the size of used oob
      mtd: mxc_nand: fix truncate of unaligned oob copying
      mtd: mxc_nand: generate nand_ecclayout for 8 bit ECC

Brian Norris (26):
      mtd: nand_bbt: drop unnecessary header
      mtd: diskonchip: don't call nand_scan_bbt() directly
      mtd: nand_bbt: make nand_scan_bbt() static
      mtd: nand_bbt: unify/fix error handling in nand_scan_bbt()
      mtd: nand_bbt: fix theoretical integer overflow in BBT write
      jffs2: fix unbalanced locking
      mtd: nand: add common DT init code
      mtd: fix: avoid race condition when accessing mtd->usecount
      Documentation: devicetree: add binding doc for Broadcom NAND controller
      mtd: nand: add NAND driver "library" for Broadcom STB NAND controller
      mtd: brcmnand: add support for STB chips
      Documentation: devicetree: brcmstb_nand: add BCM63138 and Cygnus/iProc
      mtd: brcmnand: add extra SoC support to library
      mtd: brcmnand: add support for Broadcom's IPROC family
      mtd: brcmnand: add BCM63138 support
      MAINTAINERS: add entry for new brcmnand/ directory
      Merge tag 'v4.1-rc4' into MTD's -next
      mtd: blktrans: use better error code for unimplemented ioctl()
      mtd: remove incorrect file name
      mtd: nand: correct indentation within conditional
      mtd: plat_nand: use default partition probe
      mtd: lantiq-flash: use default partition parsers
      mtd: chips: fixup dependencies, to prevent build error
      mtd: diskonchip: remove two-phase partitioning / registration
      mtd: propagate error codes from add_mtd_device()
      mtd: brcmnand: drop unnecessary initialization

Christian Riesch (1):
      mtd: cfi_cmdset_0002: Initialize datum before calling map_word_load_partial

Denys Vlasenko (1):
      mtd: cfi: deinline large functions

Fabian Frederick (1):
      mtd: constify of_device_id array

Gabor Juhos (2):
      mtd: spi-nor: add support for the Macronix MX25L512E SPI flash chip
      mtd: spi-nor: add support for the ISSI SI25CD512 SPI flash

Geert Uytterhoeven (2):
      mtd: Allow compile test of GPIO consumers if !GPIOLIB
      mtd: maps: Spelling s/reseved/reserved/

Hauke Mehrtens (2):
      mtd: brcmnand: remove double new line from print
      mtd: brcmnand: do not make local variable static

Krzysztof Kozlowski (3):
      mtd: mxc-nand: Constify platform_device_id
      mtd: s3c2410: Constify platform_device_id
      mtd: samsung: Constify platform_device_id

Lars-Peter Clausen (1):
      mtd: Switch to PM ops

Maxime Ripard (1):
      mtd: nand: pxa3xx: Switch FIFO draining to jiffies-based timeout

Nicholas Mc Guire (2):
      mtd: fsmc_nand: fix handling of wait_for_completion_timeout return value
      mtd: fsmc_nand: match wait_for_completion_timeout return type

Rafał Miłecki (3):
      mtd: m25p80: remove unused flash entries from id_table
      mtd: spi-nor: Add support for Spansion S25FL164K
      mtd: spi-nor: Properly set SECT_4K for recently added flashes

Richard Weinberger (6):
      mtd: nand: Remove in vain memset() in nand_onfi_get_features()
      mtd: r852: Fix device_create_file() usage
      mtd: cs553x_nand: Fix kasprintf() usage
      mtd: nandsim: Fix kasprintf() usage
      mtd: docg3: Don't leak docg3->bbt in error path
      mtd: docg3: Fix kasprintf() usage

Rob Herring (1):
      mtd: nand: pxa3xx: fix build on ARM64

Uwe Kleine-König (2):
      mtd: mxc_nand: cleanup copy_spare function
      mtd: dc21285: use raw spinlock functions for nw_gpio_lock

Wenlin Kang (1):
      mtd: blktrans: change blktrans_getgeo return value

 .../devicetree/bindings/mtd/brcm,brcmnand.txt      |  150 ++
 MAINTAINERS                                        |    6 +
 drivers/mtd/chips/Kconfig                          |    1 +
 drivers/mtd/chips/cfi_cmdset_0002.c                |    2 +-
 drivers/mtd/chips/cfi_util.c                       |  188 ++
 drivers/mtd/devices/docg3.c                        |   18 +-
 drivers/mtd/devices/m25p80.c                       |   60 +-
 drivers/mtd/devices/spear_smi.c                    |    4 +-
 drivers/mtd/maps/Kconfig                           |    2 +-
 drivers/mtd/maps/amd76xrom.c                       |    2 +-
 drivers/mtd/maps/dc21285.c                         |    4 +-
 drivers/mtd/maps/esb2rom.c                         |    2 +-
 drivers/mtd/maps/ichxrom.c                         |    2 +-
 drivers/mtd/maps/lantiq-flash.c                    |    4 +-
 drivers/mtd/maps/physmap_of.c                      |    4 +-
 drivers/mtd/mtd_blkdevs.c                          |    7 +-
 drivers/mtd/mtdcore.c                              |   62 +-
 drivers/mtd/nand/Kconfig                           |   10 +-
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/brcmnand/Makefile                 |    6 +
 drivers/mtd/nand/brcmnand/bcm63138_nand.c          |  111 +
 drivers/mtd/nand/brcmnand/brcmnand.c               | 2246 ++++++++++++++++++++
 drivers/mtd/nand/brcmnand/brcmnand.h               |   73 +
 drivers/mtd/nand/brcmnand/brcmstb_nand.c           |   44 +
 drivers/mtd/nand/brcmnand/iproc_nand.c             |  150 ++
 drivers/mtd/nand/cs553x_nand.c                     |   12 +-
 drivers/mtd/nand/diskonchip.c                      |   37 +-
 drivers/mtd/nand/fsmc_nand.c                       |    8 +-
 drivers/mtd/nand/mpc5121_nfc.c                     |    2 +-
 drivers/mtd/nand/mxc_nand.c                        |  112 +-
 drivers/mtd/nand/nand_base.c                       |   48 +-
 drivers/mtd/nand/nand_bbt.c                        |   26 +-
 drivers/mtd/nand/nand_ids.c                        |    2 -
 drivers/mtd/nand/nandsim.c                         |   10 +
 drivers/mtd/nand/ndfc.c                            |    2 -
 drivers/mtd/nand/plat_nand.c                       |    4 +-
 drivers/mtd/nand/pxa3xx_nand.c                     |   43 +-
 drivers/mtd/nand/r852.c                            |    6 +-
 drivers/mtd/nand/s3c2410.c                         |    2 +-
 drivers/mtd/nand/xway_nand.c                       |    4 -
 drivers/mtd/onenand/samsung.c                      |    2 +-
 drivers/mtd/spi-nor/fsl-quadspi.c                  |    2 +-
 drivers/mtd/spi-nor/spi-nor.c                      |   18 +-
 fs/jffs2/fs.c                                      |    7 +-
 fs/jffs2/readinode.c                               |   27 +-
 include/linux/mtd/cfi.h                            |  188 +-
 include/linux/mtd/nand.h                           |    6 +-
 47 files changed, 3331 insertions(+), 396 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
 create mode 100644 drivers/mtd/nand/brcmnand/Makefile
 create mode 100644 drivers/mtd/nand/brcmnand/bcm63138_nand.c
 create mode 100644 drivers/mtd/nand/brcmnand/brcmnand.c
 create mode 100644 drivers/mtd/nand/brcmnand/brcmnand.h
 create mode 100644 drivers/mtd/nand/brcmnand/brcmstb_nand.c
 create mode 100644 drivers/mtd/nand/brcmnand/iproc_nand.c
