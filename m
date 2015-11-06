Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZumOC-0006cn-A1
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2015 19:09:35 +0000
Received: by padhx2 with SMTP id hx2so122848214pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2015 11:09:11 -0800 (PST)
Date: Fri, 6 Nov 2015 11:09:08 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [GIT PULL] MTD updates for 4.4-rc1
Message-ID: <20151106190908.GF12143@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

The following changes since commit e5a5d92d9dc36055b971d79e408e345f5ce88701:

  mxc_nand: fix copy_spare (2015-09-27 17:09:35 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20151106

for you to fetch changes up to f8479dd6a03cfdc3b14e742045bfd8748cd86bd7:

  mtd: don't WARN about overloaded users of mtd->reboot_notifier.notifier_call (2015-11-06 09:33:15 -0800)

----------------------------------------------------------------
MTD updates for 4.4-rc1:

 Core

  * WARN (in some cases) when a struct mtd_info is registered multiple times;
    in the past this was "supported", but it's still error prone for future
    development. There's only one ugly case of this left in the tree (that
    we're aware of) and the owners are aware of the problems there.

  * fix potential deadlock in the blkdev removal path
    NOTE: the (potential) deadlock was introduced in a for-stable patch. This
    one is also marked for -stable.

  * ioctl(BLKPG) compat_ioctl support; resolves issues with 32-bit user space
    vs. 64-bit kernel space

  * Set MTD parent device correctly throughout the tree, so the tree structure
    appears correctly in sysfs; many drivers were missing this (soft)
    requirement

  * Move device tree partitions (ofpart) into a dedicated 'partitions' subnode;
    this helps to disambiguate whether a node is a partition or some other
    auxiliary data

  * Improve error handling for partitioning failures

 NAND

  * General: Increase timeout period, for corner-case systems with
    less-than-accurate jiffies

  * Fix OF-based autoloading of several NAND drivers when built as modules

  * pxa3xx_nand:
    - Rework timing configuration to be more dynamic
    - Refactor PM support

  * brcmnand: prepare for NorthStar 2 support (ARM64, 16-bit NAND chips)

  * sunxi_nand: refactoring and a few bug fixes

  * vf610: new NAND driver

  * FSMC: add SW BCH support; support common NAND DT bindings

  * lpc32xx_slc: refactor and improve timing calculations logic

  * denali: support for rev 5.1

 SPI NOR

  * Layering improvements

  * Added Winbond lock/unlock support

  * Added mtd_is_locked() (i.e., ioctl(MEMISLOCKED)) support

  * Increase full-chip-erase timeout linearly with flash size

  * fsl-quadspi: fix compile for non-ARM architectures

  * New flash support

----------------------------------------------------------------
Alex Smith (1):
      mtd: nand: increase ready wait timeout and report timeouts

Antoine Ténart (4):
      mtd: pxa3xx_nand: fix some compile issues on non-ARM arches
      mtd: pxa3xx_nand: add helpers to setup the timings
      mtd: pxa3xx_nand: rework flash detection and timing setup
      mtd: pxa3xx_nand: clean up the pxa3xx timings

Anup Patel (3):
      mtd: brcmnand: Fix pointer type-cast in brcmnand_write()
      mtd: nand: Allow MTD_NAND_BRCMNAND to be selected for ARM64
      mtd: brcmnand: Force 8bit mode before doing nand_scan_ident()

Aurelien Chanot (1):
      mtd: spi-nor: Add support for Micron n25q032a

Boris BREZILLON (15):
      mtd: nand: sunxi: rely on nand_dt_init initialization
      mtd: nand: add nand_check_erased helper functions
      mtd: mtdpart: fix add_mtd_partitions error path
      mtd: nand: sunxi: rework macros
      mtd: nand: remove unused ->init_size() hook
      mtd: nand: sunxi: create sunxi_nfc_hw_ecc_enable()/disable() functions
      mtd: nand: sunxi: introduce sunxi_nfc_hw_ecc_read/write_chunk()
      mtd: nand: sunxi: make use of sunxi_nfc_hw_ecc_read/write_chunk()
      mtd: nand: sunxi: factorize extra OOB bytes handling
      mtd: nand: sunxi: retrieve corrected OOB bytes
      mtd: nand: sunxi: replace the NFC_BUF_TO_USER_DATA() macro by an inline function
      mtd: nand: sunxi: fix bitflips in erased pages
      mtd: nand: pass page number to ecc->write_xxx() methods
      mtd: nand: sunxi: fix sunxi_nfc_hw_ecc_read/write_chunk()
      mtd: nand: sunxi: avoid retrieving data before ECC pass

Brian Norris (39):
      mtd: spi-nor: assign mtd->priv in spi_nor_scan()
      mtd: spi-nor: add forward declaration for mtd_info
      mtd: spi-nor: embed struct mtd_info within struct spi_nor
      mtd: fsl-quadspi: use automatic spi-nor detection
      Merge MTD 4.3-rc1 updates into -next
      Merge tag 'v4.3-rc1' into MTD -next development
      mtd: cmdlinepart: allow small partitions
      mtd: cmdlinepart: convert printk() to pr_*()
      mtd: spi-nor: add support for w25q128fw
      mtd: provide proper 32/64-bit compat_ioctl() support for BLKPG
      Revert "mtd: mtdram: check offs and len in mtdram->erase"
      mtd: nand: vf610_nfc: include missing pincrl/consumer.h
      Merge MTD 4.3-rc updates into -next
      mtd: brcmnand: refactor bcm63138 SoC layering
      mtd: brcmnand: refactor iProc SoC layering
      mtd: brcmnand: remove unnecessary fields from brcmnand_soc
      sh: mach-rsk: remove unnecessary MTD partition probe specification
      mtd: spi-nor: make implicit <linux/bitops.h> dependency explicit
      mtd: spi-nor: make bitfield constants more consistent
      mtd: spi-nor: add SPI NOR manufacturer IDs
      mtd: spi-nor: use SNOR_MFR_* instead of CFI_MFR_*
      mtd: spi-nor: fixup kernel-doc for flash lock/unlock function pointers
      mtd: spi-nor: refactor block protection functions
      mtd: spi-nor: add mtd_is_locked() support
      mtd: spi-nor: support lock/unlock/is_locked for Winbond
      mtd: spi-nor: disable protection for Winbond flash at startup
      mtd: spi-nor: add DUAL_READ for w25q{32,64}dw
      mtd: fsl-quadspi: fix printk() format warning for size_t
      mtd: fsl-quadspi: allow building for other ARCHes with COMPILE_TEST
      mtd: pxa3xx_nand: don't duplicate MTD suspend/resume
      mtd: pxa3xx_nand: switch to device PM
      mtd: maps: rbtx4939-flash: fix compile error
      mtd: nand: vf610_nfc: use nand_check_erased_ecc_chunk() helper
      mtd: fixup corner case error handling in mtd_device_parse_register()
      mtd: warn when registering the same master many times
      mtd: mtdpart: Do not fail mtd probe when parsing partitions fails
      mtd: brcmnand: factor out CFG and CFG_EXT bitfields
      mtd: blkdevs: fix potential deadlock + lockdep warnings
      mtd: don't WARN about overloaded users of mtd->reboot_notifier.notifier_call

Cyrille Pitchen (1):
      mtd: spi-nor: remove unused read_xfer/write_xfer hooks

Dan Carpenter (1):
      mtd: docg3: off by one in doc_register_sysfs()

Dan Williams (1):
      mtd: pxa2xx-flash: switch from ioremap_cache to memremap

Dongsheng Yang (2):
      mtd: mtdram: check offs and len in mtdram->erase
      mtd: mtdram: check offs and len in mtdram->erase

Enrico Jorns (1):
      mtd: nand: denali: pass col argument to READID operation

Ezequiel García (1):
      mtd: pxa3xx_nand: Remove unused platform-data flash specification

Fabio Estevam (1):
      mtd: fsl-quadspi: Include <linux/sizes.h> to avoid build error

Frans Klaver (57):
      mtd: core: tone down suggestion that dev.parent should be set
      mtd: core: set some defaults when dev.parent is set
      mtd: devices: bcm47xxflash: show parent device in sysfs
      mtd: devices: docg3: show parent device in sysfs
      mtd: devices: mtd_dataflash: drop owner assignment
      mtd: devices: spear_smi: show parent device in sysfs
      mtd: devices: sst251: show parent device in sysfs
      mtd: lpddr: show parent device in sysfs
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
      mtd: nand: fsl_ifc_nand: show parent device in sysfs
      mtd: nand: fsmc_nand: show parent device in sysfs
      mtd: nand: gpmi-nand: show parent device in sysfs
      mtd: nand: hisi504_nand: drop owner assignment
      mtd: nand: mpc5121_nfc: show parent device in sysfs
      mtd: nand: nuc900_nand: show parent device in sysfs
      mtd: nand: orion_nand: show parent device in sysfs
      mtd: nand: plat_nand: show parent device in sysfs
      mtd: nand: r852: drop owner assignment
      mtd: nand: sh_flctl: show parent device in sysfs
      mtd: nand: sunxi_nand: drop owner assignment
      mtd: nand: tmio_nand: show parent device in sysfs
      mtd: onenand: generic: show parent device in sysfs
      mtd: nand: mxc_nand: drop owner assignment
      mtd: nand: pasemi_nand: show parent device in sysfs
      mtd: nand: ndfc: show parent device in sysfs
      mtd: nand: lpc32xx_mlc: drop owner assignment
      mtd: onenand: samsung: drop owner assignment
      mtd: nand: omap2: show parent device structure in sysfs
      mtd: nand: sharpsl: show parent device in sysfs
      mtd: nand: s3c2410: show parent device in sysfs
      mtd: onenand: omap2: drop owner and name assignment
      staging: mt29f_spinand: show parent device in sysfs
      mtd: nand: gpio: show parent device in sysfs
      mtd: nand: pxa3xx_nand: show parent device in sysfs
      mtd: nand: fsl_elbc_nand: show parent device in sysfs
      mtd: nand: socrates_nand: drop owner assignment
      mtd: nand: fsl_upm: show parent device in sysfs
      mtd: nand: jz4740_nand: show parent device in sysfs
      mtd: nand: txx9ndfmc: show parent device in sysfs

Furquan Shaikh (1):
      mtd: spi-nor: scale up timeout for full-chip erase

Graham Moore (1):
      mtd: nand: denali: max_banks calculation changed in revision 5.1

Han Xu (1):
      mtd: fsl-quadspi: fix macro collision problems with READ/WRITE

Jagan Teki (2):
      mtd: spi-nor: Use write_sr for write status
      mtd: spi-nor: Zap unneeded write_enable from write_reg

Joachim Eastwood (1):
      mtd: spi-nor: s25fl008k and s25fl016k supports dual/quad mode

Johannes Thumshirn (1):
      mtd: Destroy mtd_idr on module_exit

Julia Lawall (2):
      mtd: nandsim: drop null test before destroy functions
      jffs2: drop null test before destroy functions

Luis de Bethencourt (5):
      mtd: orion_nand: Fix module autoload for OF platform driver
      mtd: fsl_elbc_nand: Fix module autoload for OF platform driver
      mtd: fsl_ifc_nand: Fix module autoload for OF platform driver
      mtd: mpc5121_nfc: Fix module autoload for OF platform driver
      mtd: mxc_nand: Fix module autoload for OF platform driver

Marek Vasut (2):
      mtd: spi-nor: Decouple SPI NOR's device_node from controller device
      mtd: nand: Rename nand_chip .dn to .flash_node

Michal Suchanek (3):
      mtd: mtdpart: add debug prints to partition parser.
      doc: dt: mtd: support partitions in a special 'partitions' subnode
      mtd: ofpart: move ofpart partitions to a dedicated dt node

Mikko Rapeli (1):
      mtd: mtd-user: remove stdint.h include

Peng Fan (1):
      mtd: blktrans: fix multiplication overflow

Robert Jarzmik (2):
      mtd: nand: pxa3xx-nand: switch to dmaengine
      mtd: nand: pxa3xx-nand: prevent DFI bus lockup on removal

Sean Nyekjaer (2):
      mtd: spi-nor: s25fl204k supports dual I/0
      mtd: spi-nor: Add support for s25fl004k

Sheng Yong (1):
      mtd: nand_bbt: set the smallest size of bbt table

Shraddha Barke (1):
      mtd: tests: Replace timeval with ktime_t

Stefan Agner (3):
      mtd: nand: vf610_nfc: Freescale NFC for VF610, MPC5125 and others
      mtd: nand: vf610_nfc: add hardware BCH-ECC support
      mtd: nand: vf610_nfc: add device tree bindings

Stefan Roese (4):
      mtd: sunxi_nand: Select the chip in sunxi_nand_chip_init_timings()
      mtd: nand: fsmc: Small whitespace cleanup
      mtd: nand: fsmc: Remove BUG macros
      mtd: fsmc_nand: Add BCH4 SW ECC support for SPEAr600

Tom Englund (1):
      pcmciamtd: Add id for PRETEC 4MB SRAM

Vladimir Zapolskiy (5):
      mtd: nand: lpc32xx_slc: improve SLCTAC_*() macro definitions
      mtd: nand: lpc32xx_slc: fix potential overflow over 4 bits
      mtd: nand: lpc32xx_slc: fix calculation of timing arcs from given values
      mtd: lpc32xx_slc: fix warnings caused by enabling unprepared clock
      mtd: lpc32xx_mlc: fix warnings caused by enabling unprepared clock

Wei Fang (1):
      jffs2: fix a memleak in read_direntry()

Yao Yuan (1):
      mtd: spi-nor: Add support for sst25wf040b

Yaowei Bai (1):
      jffs2: remove unnecessary new_valid_dev check

fangwei (1):
      jffs2: remove unneeded kfree

 .../devicetree/bindings/mtd/fsmc-nand.txt          |   6 +
 .../devicetree/bindings/mtd/partition.txt          |  71 +-
 .../devicetree/bindings/mtd/vf610-nfc.txt          |  59 ++
 MAINTAINERS                                        |   6 +
 arch/sh/boards/mach-rsk/setup.c                    |   3 -
 drivers/mtd/cmdlinepart.c                          |  28 +-
 drivers/mtd/devices/bcm47xxsflash.c                |   7 +-
 drivers/mtd/devices/docg3.c                        |  24 +-
 drivers/mtd/devices/m25p80.c                       |  15 +-
 drivers/mtd/devices/mtd_dataflash.c                |   1 -
 drivers/mtd/devices/mtdram.c                       |  21 +
 drivers/mtd/devices/spear_smi.c                    |   1 +
 drivers/mtd/devices/sst25l.c                       |   3 +-
 drivers/mtd/lpddr/lpddr2_nvm.c                     |   1 +
 drivers/mtd/maps/gpio-addr-flash.c                 |   2 +-
 drivers/mtd/maps/intel_vr_nor.c                    |   2 +-
 drivers/mtd/maps/ixp4xx.c                          |   2 +-
 drivers/mtd/maps/lantiq-flash.c                    |   2 +-
 drivers/mtd/maps/latch-addr-flash.c                |   2 +-
 drivers/mtd/maps/pcmciamtd.c                       |   1 +
 drivers/mtd/maps/physmap.c                         |   1 -
 drivers/mtd/maps/physmap_of.c                      |   1 -
 drivers/mtd/maps/plat-ram.c                        |   1 -
 drivers/mtd/maps/pxa2xx-flash.c                    |   8 +-
 drivers/mtd/maps/rbtx4939-flash.c                  |   2 +-
 drivers/mtd/maps/sa1100-flash.c                    |   2 +-
 drivers/mtd/mtd_blkdevs.c                          |  12 +-
 drivers/mtd/mtdchar.c                              |  42 +-
 drivers/mtd/mtdcore.c                              |  35 +-
 drivers/mtd/mtdpart.c                              |  23 +-
 drivers/mtd/nand/Kconfig                           |  13 +-
 drivers/mtd/nand/Makefile                          |   1 +
 drivers/mtd/nand/atmel_nand.c                      |   8 +-
 drivers/mtd/nand/au1550nd.c                        |   2 +-
 drivers/mtd/nand/bcm47xxnflash/main.c              |   2 +-
 drivers/mtd/nand/bf5xx_nand.c                      |   5 +-
 drivers/mtd/nand/brcmnand/bcm63138_nand.c          |  18 +-
 drivers/mtd/nand/brcmnand/brcmnand.c               |  61 +-
 drivers/mtd/nand/brcmnand/brcmnand.h               |   2 -
 drivers/mtd/nand/brcmnand/iproc_nand.c             |  22 +-
 drivers/mtd/nand/cafe_nand.c                       |   4 +-
 drivers/mtd/nand/davinci_nand.c                    |   3 -
 drivers/mtd/nand/denali.c                          |  19 +-
 drivers/mtd/nand/denali.h                          |   2 +
 drivers/mtd/nand/docg4.c                           |   8 +-
 drivers/mtd/nand/fsl_elbc_nand.c                   |   7 +-
 drivers/mtd/nand/fsl_ifc_nand.c                    |   5 +-
 drivers/mtd/nand/fsl_upm.c                         |   2 +-
 drivers/mtd/nand/fsmc_nand.c                       |  67 +-
 drivers/mtd/nand/gpio.c                            |   2 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |  10 +-
 drivers/mtd/nand/hisi504_nand.c                    |   4 +-
 drivers/mtd/nand/jz4740_nand.c                     |   2 +-
 drivers/mtd/nand/lpc32xx_mlc.c                     |  14 +-
 drivers/mtd/nand/lpc32xx_slc.c                     |  42 +-
 drivers/mtd/nand/mpc5121_nfc.c                     |   2 +
 drivers/mtd/nand/mxc_nand.c                        |   2 +-
 drivers/mtd/nand/nand_base.c                       | 201 ++++-
 drivers/mtd/nand/nand_bbt.c                        |   2 +-
 drivers/mtd/nand/nandsim.c                         |   3 +-
 drivers/mtd/nand/ndfc.c                            |   2 +-
 drivers/mtd/nand/nuc900_nand.c                     |   2 +-
 drivers/mtd/nand/omap2.c                           |   6 +-
 drivers/mtd/nand/orion_nand.c                      |   3 +-
 drivers/mtd/nand/pasemi_nand.c                     |   2 +-
 drivers/mtd/nand/plat_nand.c                       |   3 +-
 drivers/mtd/nand/pxa3xx_nand.c                     | 570 +++++++------
 drivers/mtd/nand/r852.c                            |   1 -
 drivers/mtd/nand/s3c2410.c                         |   2 +-
 drivers/mtd/nand/sh_flctl.c                        |   4 +-
 drivers/mtd/nand/sharpsl.c                         |   2 +-
 drivers/mtd/nand/socrates_nand.c                   |   1 -
 drivers/mtd/nand/sunxi_nand.c                      | 540 +++++++------
 drivers/mtd/nand/tmio_nand.c                       |   1 +
 drivers/mtd/nand/txx9ndfmc.c                       |   2 +-
 drivers/mtd/nand/vf610_nfc.c                       | 878 +++++++++++++++++++++
 drivers/mtd/ofpart.c                               |  63 +-
 drivers/mtd/onenand/generic.c                      |   3 +-
 drivers/mtd/onenand/omap2.c                        |   2 -
 drivers/mtd/onenand/samsung.c                      |   1 -
 drivers/mtd/spi-nor/Kconfig                        |   3 +-
 drivers/mtd/spi-nor/fsl-quadspi.c                  |  46 +-
 drivers/mtd/spi-nor/nxp-spifi.c                    |  11 +-
 drivers/mtd/spi-nor/spi-nor.c                      | 319 ++++++--
 drivers/mtd/tests/speedtest.c                      |  10 +-
 drivers/mtd/tests/torturetest.c                    |  10 +-
 drivers/staging/mt29f_spinand/mt29f_spinand.c      |   6 +-
 fs/jffs2/dir.c                                     |   3 -
 fs/jffs2/malloc.c                                  |  27 +-
 fs/jffs2/readinode.c                               |   6 +-
 fs/jffs2/wbuf.c                                    |   1 -
 include/linux/blkpg.h                              |  21 +
 include/linux/mtd/nand.h                           |  21 +-
 include/linux/mtd/spi-nor.h                        |  88 +--
 include/linux/platform_data/mtd-nand-pxa3xx.h      |  27 -
 include/uapi/linux/blkpg.h                         |   6 +-
 include/uapi/mtd/mtd-user.h                        |   2 -
 97 files changed, 2567 insertions(+), 1047 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/vf610-nfc.txt
 create mode 100644 drivers/mtd/nand/vf610_nfc.c
 create mode 100644 include/linux/blkpg.h
