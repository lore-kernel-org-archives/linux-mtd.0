Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLbLR-0003ny-3U
 for linux-mtd@lists.infradead.org; Tue, 09 Oct 2012 15:03:43 +0000
From: "Woodhouse, David" <david.woodhouse@intel.com>
To: "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Subject: MTD pull for 3.7
Date: Tue, 9 Oct 2012 15:02:46 +0000
Message-ID: <1349794964.6072.24.camel@shinybook.infradead.org>
Content-Language: en-GB
Content-Type: multipart/signed; micalg=sha1;
 protocol="application/x-pkcs7-signature"; boundary="=-Rre1kL8JZn4pZMXmA/WX"
MIME-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-Rre1kL8JZn4pZMXmA/WX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Linus, please pull from
	git://git.infradead.org/mtd-2.6 for-linus-20121009

This is bigger than normal since I missed the large merge window, but
it's the normal set of additional hardware support and cleanups:

 - Disable broken mtdchar mmap() on MMU systems
 - Additional ECC tests for NAND flash, and some test cleanups
 - New NAND and SPI chip support
 - Fixes/cleanup for SH FLCTL NAND controller driver
 - Improved hardware support for GPMI NAND controller
 - Conversions to device-tree support for various drivers
 - Removal of obsolete drivers (sbc8xxx, bcmring, etc.)
 - New LPC32xx drivers for MLC and SLC NAND
 - Further cleanup of NAND OOB/ECC handling
 - UAPI cleanup merge from David Howells (just moving files, since MTD
   headers were sorted out long ago to separate user-visible from kernel
   bits)

Akinobu Mita (11):
      mtd: mtd_nandecctest: remove unnecessary srandom32() call
      mtd: mtd_nandecctest: make module_init() return an error code if test=
 fails
      mtd: mtd_nandecctest: remove unnecessary include
      mtd: mtd_nandecctest: make module_init() return appropriate errno
      mtd: mtd_nandecctest: improve message output
      mtd: mtd_nandecctest: ensure alignment requirement for bitops
      mtd: mtd_nandecctest: support injecting bit error for ecc code
      mtd: mtd_nandecctest: rewrite the test routine
      mtd: mtd_nandecctest: add no corruption test
      mtd: mtd_nandecctest: add single bit error correction test
      mtd: mtd_nandecctest: add double bit error detection tests

Alexander Shiyan (2):
      mtd: autcpu12-nvram: Fix compile breakage
      mtd: autcpu12-nvram: Convert driver to platform_device

Alexandre Pereira da Silva (3):
      mtd: m25p80: Add support for m25pe20
      mtd: m25p80: Add support for n25q064
      mtd: lpc32xx_slc: Make wp gpio optional

Andreas Bie=C3=9Fmann (2):
      mtd: omap2: fix omap_nand_remove segfault
      mtd: omap2: fix module loading

Andy Shevchenko (1):
      mtd: use %*ph[CN] to dump small buffers

Artem Bityutskiy (6):
      mtd: tests: use random32 instead of home-brewed generator
      mtd: spear_smi: fix compilation warning
      JFFS2: fix unmount regression
      mtd: cmdlinepart: remove unneeded initialization
      mtd: cmdlinepart: revise error handling
      mtd: cmdlinepart: minor cleanups

Bastian Hecht (10):
      mtd: sh_flctl: Add missing iounmap()
      mtd: sh_flctl: Add support for error IRQ
      mtd: sh_flctl: Use different OOB layout
      mtd: sh_flctl: Fix hardware ECC behaviour
      mtd: sh_flctl: Simplify the hardware ecc page read/write
      mtd: sh_flctl: Group sector accesses into a single transfer
      mtd: sh_flctl: Restructure the hardware ECC handling
      mtd: sh_flctl: Use user oob data in hardware ECC mode
      mtd: sh_flctl: Use memcpy() instead of using a loop
      mtd: sh_flctl: Only copy OOB data if it is required

Brian Norris (26):
      mtd: move mtd_read_oob() definition out of mtd.h
      mtd: mtdoops: refactor loop
      mtd: cafe_nand: spelling mistake
      mtd: nand: gpmi: need to use {read,write}_oob_raw
      mtd: nand: add Eon Silicon Solutions manufacturer ID
      mtd: nand: remove NAND_BBT_SEARCH option
      mtd: nand: kill NAND_NO_READRDY
      mtd: nand: change "AMD" manuf. ID to "AMD/Spansion"
      mtd: nand: rename "no_bbt" descriptors to "no_oob"
      mtd: nand_bbt: refactor check_pattern_no_oob()
      mtd: check for max_bitflips in mtd_read_oob()
      mtd: nand: remove unused 'int' return codes
      mtd: nand_bbt: use string library
      mtd: nand: use ECC, if present, when scanning OOB
      mtd: nand: rename '_raw' BBT scan functions
      mtd: nand: allow NAND_NO_SUBPAGE_WRITE to be set from driver
      JFFS2: don't fail on bitflips in OOB
      mtd: nand: remove unnecessary variable
      mtd: nand: remove redundant ID read
      mtd: nand: split BB marker options decoding into its own function
      mtd: nand: split extended ID decoding into its own function
      mtd: nand: split simple ID decode into its own function
      mtd: nand: add generic READ ID length calculation functions
      mtd: nand: increase max OOB size to 640
      mtd: nand: decode Hynix MLC, 6-byte ID length
      mtd: nand: detect Samsung K9GBG08U0A, K9GAG08U0F ID

Christian Daudt (1):
      mtd: remove bcmring NAND driver

Chunhe Lan (1):
      mtd: m25p80: Add support for Atmel at45db081d

David Howells (1):
      UAPI: (Scripted) Disintegrate include/mtd

David Woodhouse (4):
      Merge tag 'v3.6-rc2' of git://git.kernel.org/.../torvalds/linux
      Merge commit '371a00448f95adaa612cf1a0b31a11e7093bc706' of 'git://git=
.kernel.org/.../davem/net-next.git'
      Merge tag 'disintegrate-mtd-20121009' of git://git.infradead.org/user=
s/dhowells/linux-headers
      mtd: Disable mtdchar mmap on MMU systems

Fabio Estevam (9):
      nand: mxc_nand: Use clk_prepare_enable/clk_disable_unprepare
      mtd: mxc_nand: Select the driver via ARCH_MXC
      mtd: nand: Include IMX6 in the list of supported SoCs
      mtd: nand: nand_bbt: export nand_update_bbt
      mtd: allow MTD_NAND_GPMI_NAND to be built as module
      mtd: gpmi-nand: Improve logging style
      mtd: gpmi-nand: Convert to module_platform_driver()
      mtd: mxc_nand: Convert to module_platform_driver()
      mtd: mxc_nand: Adapt the clock name to the new clock framework

Gabor Juhos (1):
      mtd: m25p80: add support for the EON EN25Q64 chip

Gerlando Falauto (1):
      mtd: cfi_cmdset_0002: Micron M29EW bugfixes as per TN-13-07

Greg Ungerer (2):
      mtd: fix wrong usage of ioremap_nocache() in uclinux.c map driver
      mtd: allow uclinux map driver to be used on any ColdFire CPU platform

Heiko Schocher (1):
      mtd: nand: davinci: add OF support for davinci nand controller

Huang Shijie (18):
      mtd: use MTD_OPS_PLACE_OOB macro consistently
      mtd: fix typo in comment
      mtd: gpmi: add on-flash BBT support for gpmi nand
      mtd: gpmi: update the bitflip_threshold
      mtd: gpmi: change the code for clocks
      mtd: gpmi: fix the compiler warnings
      mtd: kill MTD_NAND_VERIFY_WRITE
      defconfigs: remove CONFIG_MTD_NAND_VERIFY_WRITE
      mtd: mtdpart: break it as soon as we parse out the partitions
      mtd: add helpers to set/get features for ONFI nand
      mtd: add helpers to get the supportted ONFI timing mode
      mtd: gpmi: add a new field for HW_GPMI_TIMING1
      mtd: gpmi: do not get the clock frequency in gpmi_begin()
      mtd: gpmi: add a new field for HW_GPMI_CTRL1
      mtd: gpmi: simplify the DLL setting code
      mtd: gpmi: do not set the default values for the extra clocks
      mtd: gpmi: add EDO feature for imx6q
      mtd: gpmi: initialize the timing registers only one time

Iwo Mergler (1):
      mtd: tests: test for multi-bit error correction

Jan Luebbe (1):
      mtd: m25p80: add support for Micron N25Q128

Jean-Christophe PLAGNIOL-VILLARD (1):
      mtd: atmel nand: fix gpio missing request

Jeff Westfahl (1):
      mtd: nand: Added a device flag for subpage read support

John Crispin (2):
      mtd: check for valid pdata inside plat_nand
      mtd: lantiq: Add NAND support on Lantiq XWAY SoC.

Josh Wu (4):
      mtd: at91: extract hw ecc initialization to one function
      mtd: nand: teach write_page and write_page_raw return an error code
      mtd: at91: add dt parameters for Atmel PMECC
      mtd: at91: atmel_nand: add Programmable Multibit ECC controller suppo=
rt

Julia Lawall (4):
      mtd: spear_smi: failure test for null rather than negative integer
      mtd: spear_smi: use devm_ functions consistently
      mtd: maps: rbtx4939-flash: delete unneeded test
      mtd: autcpu12-nvram: drop frees of devm_ alloc'd data

Kim Phillips (1):
      mtd: fsl_ifc_nand: fix sparse warnings

Knut Wohlrab (1):
      mtd: m25p80: Add support for serial flash STM/Micron N25Q032

Marek Vasut (4):
      mtd: fix bogus inequation
      mtd: m25p80: add support for Spansion s25sl064p chip
      mtd: m25p80: Fix the Spansion chip detection
      mtd: m25p80: Disable 4KiB erase for s25sl032p, s25sl064p

Mike Dunn (3):
      mtd: docg4: fix oob reads
      mtd: nand: expand description of read_page method in comment header
      mtd: docg4: ecc.read_page() returns 0 on uncorrectable errors

Paul Bolle (1):
      mtd: chips: reorganize Kconfig help on swapping

Paul Gortmaker (1):
      mtd: delete SBC82xx/SBC8560 MTD mapping support

Peter Huewe (1):
      mtd: docg4: add missing HAS_IOMEM dependency

Peter Meerwald (1):
      mtd: omap2: fix some typos in comments

Rafa=C5=82 Mi=C5=82ecki (2):
      mtd: bcm47part driver for BCM47XX chipsets
      mtd: basic (read only) driver for BCMA serial flash

Randy Dunlap (1):
      mtd: fix kernel-doc warning in include/linux/mtd/nand.h

Richard Genoud (3):
      mtd: nand: remove stale config options
      mtd: nand: use NAND_BBT_SCAN_MAXBLOCKS
      mtd: nandsim: bugfix: fail if overridesize is too big

Roland Stigge (10):
      mtd: add LPC32xx SLC NAND driver
      mtd: lpc32xx_slc: Use of_get_named_gpio()
      mtd: lpc32xx_slc: Make probe() return -EPROBE_DEFER if necessary
      mtd: add LPC32xx MLC NAND driver
      mtd: lpc32xx_slc: Adjust to pl08x DMA interface changes
      mtd: lpc32xx_mlc: Adjust to pl08x DMA interface changes
      mtd: lpc32xx_slc: Make driver independent of AMBA DMA engine driver
      mtd: lpc32xx_mlc: Make driver independent of AMBA DMA engine driver
      mtd: lpc32xx_slc: Cleanup after DT-only conversion
      mtd: lpc32xx_mlc: Cleanup after DT-only conversion

Sachin Kamat (9):
      mtd: s3c2410: Use module_platform_driver()
      mtd: s3c2410: Use pr_* instead of printk
      mtd: s3c2410: Use <linux/io.h> instead of <asm/io.h>
      mtd: s3c2410: Do not initialise statics to 0 or NULL
      mtd: s3c2410: Fix checkpatch warnings and errors related to whitespac=
es
      mtd: s3c2410: Fix line over 80 characters warning
      mtd: s3c2410: Use devm_* functions
      mtd: s3c2410: Fix compiler warnings
      mtd: nand/gpio: Convert to module_platform_driver()

Sascha Hauer (4):
      mtd: mxc_nand: Use managed resources
      mtd: mxc_nand: swap iomem resource order
      mtd: mxc_nand: add i.MX53 support
      ARM: i.MX5: Add nand oftree support

Scott Wood (1):
      mtd: elbc nand: use drvdata to only remove the relevant chip

Shiraz Hashim (1):
      mtd: spear_smi: clear status register on init

Shmulik Ladkani (4):
      mtd: nand: Use the mirror BBT descriptor when reading its version
      mtd: Better comment NAND_BBT_NO_OOB
      mtd: nand: rename create_bbt()'s 'len' variable to 'numpages'
      mtd: cmdlinepart: make the partitions rule more strict

Stefan Roese (2):
      mtd: physmap_of: Add "no-unaligned-direct-access" DT property
      mtd: cfi_cmdset_0001: Fix problem with unlocking timeout

Thomas Petazzoni (1):
      mtd: orion_nand: remove <mach/hardware.h> include

Vipin Kumar (1):
      mtd: spear_smi: handle return value of timeouts properly

Viresh Kumar (1):
      mtd: spear_smi: Move suspend/resume to follow dev_pm_ops

Vivien Didelot (1):
      mtd: m25p80: add support for Micron N25Q256A

Wolfram Sang (1):
      mtd: maps: pci: remove dead code

ing. Federico Fuga (1):
      mtd: add JEDEC ID for w25q32dw to chip table

m-karicheri2@ti.com (1):
      mtd: nand: clk: preparation for switch to common clock framework

 Documentation/DocBook/mtdnand.tmpl                 |    2 -
 .../devicetree/bindings/arm/davinci/nand.txt       |   51 +
 .../devicetree/bindings/mtd/atmel-nand.txt         |   40 +-
 .../devicetree/bindings/mtd/gpmi-nand.txt          |    4 +
 .../devicetree/bindings/mtd/lpc32xx-mlc.txt        |   50 +
 .../devicetree/bindings/mtd/lpc32xx-slc.txt        |   52 +
 .../devicetree/bindings/mtd/mtd-physmap.txt        |    7 +
 arch/arm/boot/dts/imx51.dtsi                       |    7 +
 arch/arm/boot/dts/imx53.dtsi                       |    7 +
 arch/arm/configs/cam60_defconfig                   |    1 -
 arch/arm/configs/corgi_defconfig                   |    1 -
 arch/arm/configs/ep93xx_defconfig                  |    1 -
 arch/arm/configs/mini2440_defconfig                |    1 -
 arch/arm/configs/mv78xx0_defconfig                 |    1 -
 arch/arm/configs/nhk8815_defconfig                 |    1 -
 arch/arm/configs/orion5x_defconfig                 |    1 -
 arch/arm/configs/pxa3xx_defconfig                  |    1 -
 arch/arm/configs/spitz_defconfig                   |    1 -
 arch/arm/mach-clps711x/autcpu12.c                  |   19 +
 arch/arm/mach-imx/clk-imx51-imx53.c                |    2 +
 arch/arm/plat-mxc/devices/platform-mxc_nand.c      |   11 +-
 arch/blackfin/configs/BF561-ACVILON_defconfig      |    1 -
 arch/mips/configs/rb532_defconfig                  |    1 -
[dwmw2@shinybook mtd-2.6]$ git diff linus.. --stat | cat
 Documentation/DocBook/mtdnand.tmpl                 |    2 -
 .../devicetree/bindings/arm/davinci/nand.txt       |   51 +
 .../devicetree/bindings/mtd/atmel-nand.txt         |   40 +-
 .../devicetree/bindings/mtd/gpmi-nand.txt          |    4 +
 .../devicetree/bindings/mtd/lpc32xx-mlc.txt        |   50 +
 .../devicetree/bindings/mtd/lpc32xx-slc.txt        |   52 +
 .../devicetree/bindings/mtd/mtd-physmap.txt        |    7 +
 arch/arm/boot/dts/imx51.dtsi                       |    7 +
 arch/arm/boot/dts/imx53.dtsi                       |    7 +
 arch/arm/configs/cam60_defconfig                   |    1 -
 arch/arm/configs/corgi_defconfig                   |    1 -
 arch/arm/configs/ep93xx_defconfig                  |    1 -
 arch/arm/configs/mini2440_defconfig                |    1 -
 arch/arm/configs/mv78xx0_defconfig                 |    1 -
 arch/arm/configs/nhk8815_defconfig                 |    1 -
 arch/arm/configs/orion5x_defconfig                 |    1 -
 arch/arm/configs/pxa3xx_defconfig                  |    1 -
 arch/arm/configs/spitz_defconfig                   |    1 -
 arch/arm/mach-clps711x/autcpu12.c                  |   19 +
 arch/arm/mach-imx/clk-imx51-imx53.c                |    2 +
 arch/arm/plat-mxc/devices/platform-mxc_nand.c      |   11 +-
 arch/blackfin/configs/BF561-ACVILON_defconfig      |    1 -
 arch/mips/configs/rb532_defconfig                  |    1 -
 arch/powerpc/configs/83xx/mpc8313_rdb_defconfig    |    1 -
 arch/powerpc/configs/83xx/mpc8315_rdb_defconfig    |    1 -
 arch/powerpc/configs/mpc83xx_defconfig             |    1 -
 drivers/mtd/Kconfig                                |    7 +
 drivers/mtd/Makefile                               |    1 +
 drivers/mtd/bcm47xxpart.c                          |  202 ++++
 drivers/mtd/chips/Kconfig                          |   11 +-
 drivers/mtd/chips/cfi_cmdset_0001.c                |   14 +-
 drivers/mtd/chips/cfi_cmdset_0002.c                |   67 ++
 drivers/mtd/cmdlinepart.c                          |  183 ++--
 drivers/mtd/devices/Kconfig                        |   10 +-
 drivers/mtd/devices/Makefile                       |    1 +
 drivers/mtd/devices/bcm47xxsflash.c                |  105 ++
 drivers/mtd/devices/doc2001plus.c                  |   14 +-
 drivers/mtd/devices/docg3.c                        |   12 +-
 drivers/mtd/devices/m25p80.c                       |   24 +-
 drivers/mtd/devices/spear_smi.c                    |  141 +--
 drivers/mtd/maps/Kconfig                           |   16 +-
 drivers/mtd/maps/Makefile                          |    1 -
 drivers/mtd/maps/autcpu12-nvram.c                  |  153 +--
 drivers/mtd/maps/pci.c                             |   23 -
 drivers/mtd/maps/physmap_of.c                      |   14 +
 drivers/mtd/maps/rbtx4939-flash.c                  |    2 -
 drivers/mtd/maps/uclinux.c                         |   15 +-
 drivers/mtd/maps/wr_sbc82xx_flash.c                |  174 ----
 drivers/mtd/mtdchar.c                              |    6 +-
 drivers/mtd/mtdcore.c                              |   21 +
 drivers/mtd/mtdoops.c                              |   14 +-
 drivers/mtd/mtdpart.c                              |    5 +-
 drivers/mtd/nand/Kconfig                           |   63 +-
 drivers/mtd/nand/Makefile                          |    4 +-
 drivers/mtd/nand/ams-delta.c                       |   13 -
 drivers/mtd/nand/atmel_nand.c                      |  987 ++++++++++++++++=
+--
 drivers/mtd/nand/atmel_nand_ecc.h                  |  114 ++-
 drivers/mtd/nand/au1550nd.c                        |   46 -
 drivers/mtd/nand/bcm_umi_bch.c                     |  217 ----
 drivers/mtd/nand/bcm_umi_nand.c                    |  555 -----------
 drivers/mtd/nand/bf5xx_nand.c                      |    6 +-
 drivers/mtd/nand/cafe_nand.c                       |   20 +-
 drivers/mtd/nand/cmx270_nand.c                     |   13 -
 drivers/mtd/nand/davinci_nand.c                    |   78 +-
 drivers/mtd/nand/denali.c                          |   12 +-
 drivers/mtd/nand/diskonchip.c                      |   63 --
 drivers/mtd/nand/docg4.c                           |   43 +-
 drivers/mtd/nand/fsl_elbc_nand.c                   |   51 +-
 drivers/mtd/nand/fsl_ifc_nand.c                    |   52 +-
 drivers/mtd/nand/gpio.c                            |   54 +-
 drivers/mtd/nand/gpmi-nand/gpmi-lib.c              |  322 +++++-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |  152 ++-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.h             |   26 +-
 drivers/mtd/nand/gpmi-nand/gpmi-regs.h             |   12 +
 drivers/mtd/nand/lpc32xx_mlc.c                     |  924 ++++++++++++++++=
+
 drivers/mtd/nand/lpc32xx_slc.c                     | 1039 ++++++++++++++++=
++++
 drivers/mtd/nand/mpc5121_nfc.c                     |   22 -
 drivers/mtd/nand/mxc_nand.c                        |  168 ++--
 drivers/mtd/nand/nand_base.c                       |  529 ++++++----
 drivers/mtd/nand/nand_bbt.c                        |  148 +--
 drivers/mtd/nand/nand_bcm_umi.c                    |  149 ---
 drivers/mtd/nand/nand_bcm_umi.h                    |  336 -------
 drivers/mtd/nand/nand_ids.c                        |    7 +-
 drivers/mtd/nand/nandsim.c                         |   17 +-
 drivers/mtd/nand/ndfc.c                            |   13 -
 drivers/mtd/nand/nuc900_nand.c                     |   17 -
 drivers/mtd/nand/omap2.c                           |   36 +-
 drivers/mtd/nand/orion_nand.c                      |    1 -
 drivers/mtd/nand/plat_nand.c                       |    5 +
 drivers/mtd/nand/pxa3xx_nand.c                     |   12 +-
 drivers/mtd/nand/r852.c                            |   22 -
 drivers/mtd/nand/s3c2410.c                         |  191 ++--
 drivers/mtd/nand/sh_flctl.c                        |  327 +++---
 drivers/mtd/nand/socrates_nand.c                   |   19 -
 drivers/mtd/nand/tmio_nand.c                       |   13 -
 drivers/mtd/nand/txx9ndfmc.c                       |   13 -
 drivers/mtd/nand/xway_nand.c                       |  201 ++++
 drivers/mtd/sm_ftl.c                               |    1 -
 drivers/mtd/tests/Makefile                         |    1 +
 drivers/mtd/tests/mtd_nandbiterrs.c                |  460 +++++++++
 drivers/mtd/tests/mtd_nandecctest.c                |  294 +++++-
 drivers/mtd/tests/mtd_speedtest.c                  |   16 +-
 drivers/mtd/tests/mtd_stresstest.c                 |   39 +-
 fs/jffs2/super.c                                   |    4 +
 fs/jffs2/wbuf.c                                    |    8 +-
 include/linux/bcma/bcma_driver_chipcommon.h        |    2 +
 include/linux/mtd/bbm.h                            |    7 +-
 include/linux/mtd/lpc32xx_mlc.h                    |   20 +
 include/linux/mtd/lpc32xx_slc.h                    |   20 +
 include/linux/mtd/mtd.h                            |    9 +-
 include/linux/mtd/nand.h                           |   72 +-
 include/linux/mtd/sh_flctl.h                       |   23 +-
 include/mtd/Kbuild                                 |    5 -
 include/mtd/inftl-user.h                           |   91 --
 include/mtd/mtd-abi.h                              |  278 ------
 include/mtd/mtd-user.h                             |   34 -
 include/mtd/nftl-user.h                            |   90 --
 include/mtd/ubi-user.h                             |  420 --------
 include/uapi/mtd/Kbuild                            |    5 +
 include/uapi/mtd/inftl-user.h                      |   91 ++
 include/uapi/mtd/mtd-abi.h                         |  278 ++++++
 include/uapi/mtd/mtd-user.h                        |   34 +
 include/uapi/mtd/nftl-user.h                       |   90 ++
 include/uapi/mtd/ubi-user.h                        |  420 ++++++++
 124 files changed, 7274 insertions(+), 4152 deletions(-)

--=20
                   Sent with MeeGo's ActiveSync support.

David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation



--=-Rre1kL8JZn4pZMXmA/WX
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIO6jCCAz0w
ggKmoAMCAQICAwWw/zANBgkqhkiG9w0BAQUFADBOMQswCQYDVQQGEwJVUzEQMA4GA1UEChMHRXF1
aWZheDEtMCsGA1UECxMkRXF1aWZheCBTZWN1cmUgQ2VydGlmaWNhdGUgQXV0aG9yaXR5MB4XDTA2
MDIxNjE4MDEzMFoXDTE2MDIxOTE4MDEzMFowUjELMAkGA1UEBhMCVVMxGjAYBgNVBAoTEUludGVs
IENvcnBvcmF0aW9uMScwJQYDVQQDEx5JbnRlbCBFeHRlcm5hbCBCYXNpYyBQb2xpY3kgQ0EwggEi
MA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDBpd/XOb9QVqEZ8mQ1042TdOIq3ATDIsV2xDyt
30yLyMR5Wjtus0bn3B+he89BiNO/LP6+rFzEwlD55PlX+HLGIKeNNG97dqyc30FElEUjZzTZFq2N
4e3kVJ/XAEEgANzV8v9qp7qWwxugPgfc3z9BkYot+CifozexHLb/hEZj+yISCU61kRZvuSQ0E11y
YL4dRgcglJeaHo3oX57rvIckaLsYV5/1Aj+R8DM1Ppk965XQAKsHfnyT7C4S50T4lVn4lz36wOdN
Zn/zegG1zp41lnoTFfT4KuKVJH5x7YD1p6KbgJCKLovnujGuohquBNfdXKpZkvz6pGv+iC1HawJd
AgMBAAGjgaAwgZ0wDgYDVR0PAQH/BAQDAgEGMB0GA1UdDgQWBBQaxgxKxEdvqNutK/D0Vgaj7TdU
DDA6BgNVHR8EMzAxMC+gLaArhilodHRwOi8vY3JsLmdlb3RydXN0LmNvbS9jcmxzL3NlY3VyZWNh
LmNybDAfBgNVHSMEGDAWgBRI5mj5K9KylddH2CMgEE8zmJCf1DAPBgNVHRMBAf8EBTADAQH/MA0G
CSqGSIb3DQEBBQUAA4GBABMQOK2kVKVIlUWwLTdywJ+e2O+PC/uQltK2F3lRyrPfBn69tOkIP4Sg
DJOfsxyobIrPLe75kBLw+Dom13OBDp/EMZJZ1CglQfVV8co9mT3aZMjSGGQiMgkJLR3jMfr900fX
ZKj5XeqCJ+JP0mEhJGEdVCY+FFlksJjV86fDrq1QMIIFijCCBHKgAwIBAgIKYR6AtwAAAAAABzAN
BgkqhkiG9w0BAQUFADBSMQswCQYDVQQGEwJVUzEaMBgGA1UEChMRSW50ZWwgQ29ycG9yYXRpb24x
JzAlBgNVBAMTHkludGVsIEV4dGVybmFsIEJhc2ljIFBvbGljeSBDQTAeFw0wOTA1MTUxOTI1MTNa
Fw0xNTA1MTUxOTM1MTNaMFYxCzAJBgNVBAYTAlVTMRowGAYDVQQKExFJbnRlbCBDb3Jwb3JhdGlv
bjErMCkGA1UEAxMiSW50ZWwgRXh0ZXJuYWwgQmFzaWMgSXNzdWluZyBDQSAzQTCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBAMGPgGLnOO5IOzlHRfr1XfCVb97V4BR2QVpPZ7CrcIQ+FGa2
KHD/6dPjwxOIrtFTdfW4BYikdFmxUZVBWRWZ5Vye2cCdGzFWqIEOE1e17nNx1jM8Z6GZEqbDUS+v
BuPlBFHKQoVm5BaNIHpyn2XZxqwjV9j5/crIfPrCGstk+2ztUhVS8OHEgzO784PgD9pOgBnnAbZH
mEM1FYYmQ6ibS+gVCHzobDYG+YReRiHpFKWBxpUuP+X0WYFw/Ja1JW7N8pELAFDw0UFBWFgiv1QI
usdLvSy8mcsLJ5wy050OVcxShqoUxhw/wvyuuoQxvmEPjhRa1C2oSCmGN0003GMhQWMCAwEAAaOC
AlwwggJYMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFKoWZq+3PVZTYK4Nwu3z7gfLUWB+MAsG
A1UdDwQEAwIBhjASBgkrBgEEAYI3FQEEBQIDAQABMCMGCSsGAQQBgjcVAgQWBBTCKwhTx+hdMsKC
gOmWwLgjQsAV+TAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTAfBgNVHSMEGDAWgBQaxgxKxEdv
qNutK/D0Vgaj7TdUDDCBvQYDVR0fBIG1MIGyMIGvoIGsoIGphk5odHRwOi8vd3d3LmludGVsLmNv
bS9yZXBvc2l0b3J5L0NSTC9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBQb2xpY3klMjBDQS5j
cmyGV2h0dHA6Ly9jZXJ0aWZpY2F0ZXMuaW50ZWwuY29tL3JlcG9zaXRvcnkvQ1JML0ludGVsJTIw
RXh0ZXJuYWwlMjBCYXNpYyUyMFBvbGljeSUyMENBLmNybDCB4wYIKwYBBQUHAQEEgdYwgdMwYwYI
KwYBBQUHMAKGV2h0dHA6Ly93d3cuaW50ZWwuY29tL3JlcG9zaXRvcnkvY2VydGlmaWNhdGVzL0lu
dGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMFBvbGljeSUyMENBLmNydDBsBggrBgEFBQcwAoZgaHR0
cDovL2NlcnRpZmljYXRlcy5pbnRlbC5jb20vcmVwb3NpdG9yeS9jZXJ0aWZpY2F0ZXMvSW50ZWwl
MjBFeHRlcm5hbCUyMEJhc2ljJTIwUG9saWN5JTIwQ0EuY3J0MA0GCSqGSIb3DQEBBQUAA4IBAQCU
Y/1d0MS6VPTlIcOho1XWh193PD5kJDJSPdphLHQdM1oKA+whMdIBoY1VzTDDK+C+Ey4Jcyna7fpC
8uVmn/Rz/i9MZtyc7qezPtZTn9UyORvJmddH+Ox/RycGwe3ags8jUdspECorYOkJyZksnDIlTVUv
bR7wyY+gGJYqxWXqrcVFEiMsWu8/OIlf7F2gAYMBw1kZ55dn4lWBIM0WqvReWpPvhYeN7Y+3MKEd
SMkQ7TZiNbfdZ5D/8KfWNMTJ4VHltOgCL1lA5tx/F4R1920skpL5eu3Sj650RUe3rOXsaV5NyJzB
wB31+1zsmleVdFD0k/Fw9HxXbAQE35ucN/7CMIIGFzCCBP+gAwIBAgIKEIhPUAABAABfaTANBgkq
hkiG9w0BAQUFADBWMQswCQYDVQQGEwJVUzEaMBgGA1UEChMRSW50ZWwgQ29ycG9yYXRpb24xKzAp
BgNVBAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3VpbmcgQ0EgM0EwHhcNMTEwNDEyMTIzMzQx
WhcNMTQwMzI3MTIzMzQxWjBFMRkwFwYDVQQDExBXb29kaG91c2UsIERhdmlkMSgwJgYJKoZIhvcN
AQkBFhlkYXZpZC53b29kaG91c2VAaW50ZWwuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAvxW1JMLaZUeM6Cg2OVV1nfsZOt9x/CjVJ7SBlapefSjUoNT48n58zLK+Q00YxPkIxnwl
m57dAxSUf/Dqg+C6DOdLknVQILrGeWNSZdC8GQ8HlHz+D5ldgTDY9L1vDM65p1wbXW4R5QfMbooZ
IQKlyUivGkggwBUpTeeXDOfz5f4m2UW5aCnyG8yhiBUHISAQyXLwQg+iVhBpTqsVvvojybQY8lGF
Z7U+kgbgBY0HCqOuEmT7Iz/tm4W3dpfh8mFluZUn1fMBvCaC+cdKVV/1lpeUdtMNREH+jKUU49lt
BblH1qXmEViOvMT4itbfkUSWeWgeI9umMOK4eL31LLepCQIDAQABo4IC9jCCAvIwCwYDVR0PBAQD
AgeAMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIbDjHWEmeVRg/2BKIWOn1OCkcAJZ4HevTmV
8EMCAWQCAQgwHQYDVR0OBBYEFMcuq9ocKJ7EbWcVlAWTYVXwOsrHMB8GA1UdIwQYMBaAFKoWZq+3
PVZTYK4Nwu3z7gfLUWB+MIHPBgNVHR8EgccwgcQwgcGggb6ggbuGV2h0dHA6Ly93d3cuaW50ZWwu
Y29tL3JlcG9zaXRvcnkvQ1JML0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3VpbmclMjBD
QSUyMDNBKDEpLmNybIZgaHR0cDovL2NlcnRpZmljYXRlcy5pbnRlbC5jb20vcmVwb3NpdG9yeS9D
UkwvSW50ZWwlMjBFeHRlcm5hbCUyMEJhc2ljJTIwSXNzdWluZyUyMENBJTIwM0EoMSkuY3JsMIH1
BggrBgEFBQcBAQSB6DCB5TBsBggrBgEFBQcwAoZgaHR0cDovL3d3dy5pbnRlbC5jb20vcmVwb3Np
dG9yeS9jZXJ0aWZpY2F0ZXMvSW50ZWwlMjBFeHRlcm5hbCUyMEJhc2ljJTIwSXNzdWluZyUyMENB
JTIwM0EoMSkuY3J0MHUGCCsGAQUFBzAChmlodHRwOi8vY2VydGlmaWNhdGVzLmludGVsLmNvbS9y
ZXBvc2l0b3J5L2NlcnRpZmljYXRlcy9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1aW5n
JTIwQ0ElMjAzQSgxKS5jcnQwHwYDVR0lBBgwFgYIKwYBBQUHAwQGCisGAQQBgjcKAwwwKQYJKwYB
BAGCNxUKBBwwGjAKBggrBgEFBQcDBDAMBgorBgEEAYI3CgMMME8GA1UdEQRIMEagKQYKKwYBBAGC
NxQCA6AbDBlkYXZpZC53b29kaG91c2VAaW50ZWwuY29tgRlkYXZpZC53b29kaG91c2VAaW50ZWwu
Y29tMA0GCSqGSIb3DQEBBQUAA4IBAQBxLiiAAGnWEDYYtUaje48WjSbMx8O+TsKX2x1sgi/ilnUR
evhznvvFGx9hRrTtQ4Sz+hU7nWvoxbSLDVx6vDQ7+wyGo6SzE0MYqwB3EzwO/P8MnpgZTlEmgDeP
GjYX2IFzp5fG7NNvc6byf8pLjXgn+2wqRLUqrh2PZZ5KKIiicVNT+UOlRIbB2T1WuSVHBMQxhQBr
rzwwYuyoawJCHHo+eKUE51cSSzkT95K+m0Q6XYGC8tQ3i94nBIaLMIg/GM6K2cYKH3vdu/otvGPl
j9/HEKo+mktp2A2S5sIwCKlw8nYOaYKe1dpmYtXKfVoOIIZ/LaVEB/XEIEC1x/oPbrH/MYIB6jCC
AeYCAQEwZDBWMQswCQYDVQQGEwJVUzEaMBgGA1UEChMRSW50ZWwgQ29ycG9yYXRpb24xKzApBgNV
BAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3VpbmcgQ0EgM0ECChCIT1AAAQAAX2kwCQYFKw4D
AhoFAKBdMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTEyMTAwOTE1
MDI0NFowIwYJKoZIhvcNAQkEMRYEFCrfvdea7NLCZuWlhbivkW8x6r5HMA0GCSqGSIb3DQEBAQUA
BIIBAD9bG2fNe8pZZ2m2ky8/VBJ8ihzHIOTr0amXsSuZe/gLdvD2hMtXdQ1X3CAfLN1ELFOnA7I3
EPk1CxXETlbMbXkY5L/Q5DJL7HWsbvybR0HyQLn0tRNfcuTF0h6iXQMZ0zHgMgxpupYpumM7dTTV
S8DU47T6NWarqTR/vdhd1g/FYslt4aKBXEGCKYy4pIW/mz0+qTJ4F6DFgI8aoeI/bKnBWCxLedS2
u/4nU1lRVCGkCj4L+2dWy7Fsf4N/MPYtev0VeOsM+sTCe/2ZKhbJp1g0adif6ivOMpBo8T9USQdH
CpNt//XeWligFS4kVzUbAJE5/Ug/sSVb2XL4YCbGYuYAAAAAAAA=


--=-Rre1kL8JZn4pZMXmA/WX--
