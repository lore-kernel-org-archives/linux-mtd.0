Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YkygO-0007k8-Vb
 for linux-mtd@lists.infradead.org; Wed, 22 Apr 2015 17:43:34 +0000
Received: by pdbqd1 with SMTP id qd1so280561593pdb.2
 for <linux-mtd@lists.infradead.org>; Wed, 22 Apr 2015 10:42:41 -0700 (PDT)
Date: Wed, 22 Apr 2015 10:42:37 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] MTD updates for 4.1
Message-ID: <20150422174237.GU32500@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:

  Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20150422

for you to fetch changes up to 3e550d2396d9deef77328237ed992e19dcfefca5:

  Merge MTD fixes from 4.0 into -next (2015-04-22 10:29:19 -0700)

----------------------------------------------------------------

Common MTD:
 * Add Kconfig option for keeping both the 'master' and 'partition' MTDs
   registered as devices. This would really make a better default if we could
   do it over, as it allows a lot more flexibility in (1) determining the flash
   topology of the system from user-space and (2) adding temporary partitions
   at runtime (ioctl(BLKPG)). Unfortunately, this would possibly cause
   user-space breakage, as it will cause renumbering of the /dev/mtdX devices.
   We'll see if we can change this in the future, as there have already been a
   few people looking for this feature, and I know others have just been
   working around our current limitations instead of fixing them this way.
 * Along with the previous change, add some additional information to sysfs, so
   user-space can read the offset of each partition within its master device

SPI NOR:
 * add new device tree compatible binding to represent the mostly-compatible
   class of SPI NOR flash which can be detected by their extended JEDEC ID
   bytes, cutting down the duplication of our ID tables
 * misc. new IDs

Various other miscellaneous fixes and changes

----------------------------------------------------------------
Antoine Ténart (1):
      mtd: pxa3xx_nand: initialiaze pxa3xx_flash_ids to 0

Arnd Bergmann (2):
      mtd: cfi: reduce stack size
      mtd: clean up whitespace in linux/mtd/map.h

Baruch Siach (1):
      mtd: nand: sunxi: fix generic nand binding reference

Boris Brezillon (1):
      mtd: atmel_nand: check NFC busy flag by HSMC_SR instead of NFC cmd regs

Brian Norris (17):
      Merge MTD updates into -next
      Merge MTD updates into -next
      mtd: s3c2410: drop useless / misspelled debug prints
      mtd: docg3: drop dead code
      mtd: onenand: drop dead code
      mtd: tests: fix more potential integer overflows
      mtd: nand: fixup bounds checks for nand_{lock,unlock}()
      mtd: nand: denali: drop dead code
      mtd: blkdevs: remove dead code
      mtd: nand: fully initialize mtd_oob_ops
      Documentation: devicetree: fix spelling in pxa3xx-nand binding
      mtd: nand: fix spelling of REPLACEABLE
      mtd: spi-nor: factor out replace-able flash_{lock,unlock}
      mtd: docg3: remove invalid __exit annotations
      Documentation: devicetree: m25p80: add "nor-jedec" binding
      mtd: m25p80: bind to "nor-jedec" ID, for auto-detection
      Merge MTD fixes from 4.0 into -next

Christophe Leroy (1):
      mtd: replace CONFIG_8xx by CONFIG_PPC_8xx

Colin Ian King (1):
      mtd: atmel_nand: fix typo in dev_err error message

Dan Carpenter (2):
      jffs2: remove an unneeded condition
      mtd: cfi: clean up some indenting

Dan Ehrenberg (3):
      mtd: part: Create the master device node when partitioned
      mtd: part: Add sysfs variable for offset of partition
      mtd: part: Remove partition overlap checks

Dmitry Torokhov (1):
      mtd: maps: sa1100-flash: remove incorrect __exit markups

Fabio Estevam (2):
      mtd: fsl-quadspi: Print the error value
      mtd: nand: gpmi: Check for scan_bbt() error

Felix Fietkau (1):
      mtd: block2mtd: wait until block devices are presented

Gabor Juhos (1):
      mtd: spi-nor: add support for the Winbond W25X05 flash

Geert Uytterhoeven (1):
      mtd: nand: MTD_NAND_HISI504 should depend on HAS_DMA

Graham Moore (1):
      mtd: denali: Disable sub-page writes in Denali NAND driver

Josh Wu (1):
      mtd: atmel_nand: add a definition for the oob reserved bytes

Masanari Iida (1):
      mtd: ts5500_flash: Fix typo in MODULE_DESCRIPTION in ts5500_flash.c

Maxime Ripard (1):
      mtd: nand: pxa3xx: Fix PIO FIFO draining

Mika Westerberg (2):
      mtd: spi-nor: Add support for Winbond w25q64dw serial flash
      mtd: spi-nor: Add support for Macronix mx25u6435f serial flash

Nicholas Mc Guire (4):
      mtd: fsl-quadspi: cleanup wait_for_completion return handling
      mtd: nand: gpmi: fixup return type of wait_for_completion_timeout
      mtd: pxa3xx_nand: cleanup wait_for_completion handling
      mtd: fsl_ifc_nand: use msecs_to_jiffies for time conversion

Richard Weinberger (1):
      mtd: Make MTD tests cancelable

Robert Jarzmik (2):
      mtd: pxa3xx-nand: handle PIO in threaded interrupt
      mtd: pxa3xx_nand: fix driver when num_cs is 0

Roger Quadros (2):
      mtd: nand: Prevent possible kernel lockup in nand_command()
      mtd: mtd_oobtest: Fix bitflip_limit usage in test case 3

Shengzhou Liu (1):
      mtd: spi-nor: support en25s64 device

Stefan Roese (1):
      mtd: fsmc_nand.c: Use default timings if none are provided in the dts

Uwe Kleine-König (6):
      mtd: mxc-nand: Add a timeout when waiting for interrupt
      mtd: mxc-nand: Only enable hardware checksumming for fully detected flashes
      mtd: mxc-nand: Do the word to byte mangling in the read_byte callback
      mtd: mxc-nand: Allow to use column addresses different from 0
      mtd: mxc-nand: Implement support for PARAM command
      mtd: mxc-nand: Warn on unimplemented commands

Wu, Josh (1):
      mtd: atmel_nand: don't map the ROM table if no pmecc table offset in DT

 Documentation/ABI/testing/sysfs-class-mtd          |  10 ++
 Documentation/devicetree/bindings/mtd/m25p80.txt   |  13 +-
 .../devicetree/bindings/mtd/pxa3xx-nand.txt        |   2 +-
 .../devicetree/bindings/mtd/sunxi-nand.txt         |   2 +-
 drivers/mtd/Kconfig                                |  13 ++
 drivers/mtd/chips/cfi_cmdset_0020.c                |  30 ++---
 drivers/mtd/devices/block2mtd.c                    |  58 +++++---
 drivers/mtd/devices/docg3.c                        |  11 +-
 drivers/mtd/devices/m25p80.c                       |  21 ++-
 drivers/mtd/maps/Kconfig                           |   2 +-
 drivers/mtd/maps/sa1100-flash.c                    |   4 +-
 drivers/mtd/maps/ts5500_flash.c                    |   2 +-
 drivers/mtd/mtd_blkdevs.c                          |   3 -
 drivers/mtd/mtdcore.c                              |  52 +++++---
 drivers/mtd/mtdpart.c                              |  68 ++++++----
 drivers/mtd/nand/Kconfig                           |   1 +
 drivers/mtd/nand/atmel_nand.c                      |  26 ++--
 drivers/mtd/nand/atmel_nand_ecc.h                  |   3 +
 drivers/mtd/nand/atmel_nand_nfc.h                  |   1 +
 drivers/mtd/nand/denali.c                          |   6 +-
 drivers/mtd/nand/fsl_ifc_nand.c                    |   4 +-
 drivers/mtd/nand/fsmc_nand.c                       |   7 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |  16 ++-
 drivers/mtd/nand/mxc_nand.c                        | 146 +++++++++++++--------
 drivers/mtd/nand/nand_base.c                       |  41 ++++--
 drivers/mtd/nand/pxa3xx_nand.c                     |  98 ++++++++++----
 drivers/mtd/nand/s3c2410.c                         |   3 -
 drivers/mtd/onenand/onenand_base.c                 |  12 +-
 drivers/mtd/spi-nor/fsl-quadspi.c                  |  11 +-
 drivers/mtd/spi-nor/spi-nor.c                      |  61 ++++++---
 drivers/mtd/tests/mtd_nandecctest.c                |   6 +
 drivers/mtd/tests/mtd_test.h                       |  12 ++
 drivers/mtd/tests/nandbiterrs.c                    |   4 +
 drivers/mtd/tests/oobtest.c                        |  90 ++++++++-----
 drivers/mtd/tests/pagetest.c                       |  10 +-
 drivers/mtd/tests/readtest.c                       |   5 +-
 drivers/mtd/tests/speedtest.c                      |  38 ++++--
 drivers/mtd/tests/stresstest.c                     |   9 +-
 drivers/mtd/tests/subpagetest.c                    |  29 +++-
 drivers/mtd/tests/torturetest.c                    |  23 +++-
 fs/jffs2/xattr.c                                   |   1 -
 include/linux/mtd/map.h                            |  54 +++++---
 include/linux/mtd/spi-nor.h                        |   5 +
 43 files changed, 687 insertions(+), 326 deletions(-)
