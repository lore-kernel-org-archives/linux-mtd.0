Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fknzu-0002pu-Rf
 for linux-mtd@lists.infradead.org; Wed, 01 Aug 2018 10:04:55 +0000
Date: Wed, 1 Aug 2018 12:04:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <Boris.Brezillon@bootlin.com>, Richard Weinberger
 <richard.weinberger@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: mtd: nand: Changes for 4.19
Message-ID: <20180801120429.62dfdb11@xps13>
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

The following changes since commit 021c91791a5e7e85c567452f1be3e4c2c6cb6063:

  Linux 4.18-rc3 (2018-07-01 16:04:53 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/nand/for-4.19

for you to fetch changes up to ed128e8b757b4e759e5585df720888b30a7f2196:

  MAINTAINERS: drop Wenyou Yang from Atmel NAND driver support (2018-08-01 =
09:46:09 +0200)

----------------------------------------------------------------
NAND core changes:
- Add the SPI-NAND framework.
- Create a helper to find the best ECC configuration.
- Create NAND controller operations.
- Allocate dynamically ONFI parameters structure.
- Add defines for ONFI version bits.
- Add manufacturer fixup for ONFI parameter page.
- Add an option to specify NAND chip as a boot device.
- Add Reed-Solomon error correction algorithm.
- Better name for the controller structure.
- Remove unused caller_is_module() definition.
- Make subop helpers return unsigned values.
- Expose _notsupp() helpers for raw page accessors.
- Add default values for dynamic timings.
- Kill the chip->scan_bbt() hook.
- Rename nand_default_bbt() into nand_create_bbt().
- Start to clean the nand_chip structure.
- Remove stale prototype from rawnand.h.

Raw NAND controllers drivers changes:
- Qcom: structuring cleanup.
- Denali: use core helper to find the best ECC configuration.
- Possible build of almost all drivers by adding a dependency on
  COMPILE_TEST for almost all of them in Kconfig, implies various
  fixes, Kconfig cleanup, GPIO headers inclusion cleanup, and even
  changes in sparc64 and ia64 architectures.
- Clean the ->probe() functions error path of a lot of drivers.
- Migrate all drivers to use nand_scan() instead of
  nand_scan_ident()/nand_scan_tail() pair.
- Use mtd_device_register() where applicable to simplify the code.
- Marvell:
  * Handle on-die ECC.
  * Better clocks handling.
  * Remove bogus comment.
  * Add suspend and resume support.
- Tegra: add NAND controller driver.
- Atmel:
  * Add module param to avoid using dma.
  * Drop Wenyou Yang from MAINTAINERS.
- Denali: optimize timings handling.
- FSMC: Stop using chip->read_buf().
- FSL:
  * Switch to SPDX license tag identifiers.
  * Fix qualifiers in MXC init functions.

Raw NAND chip drivers changes:
- Micron:
  * Add fixup for ONFI revision.
  * Update ecc_stats.corrected.
  * Make ECC activation stateful.
  * Avoid enabling/disabling ECC when it can't be disabled.
  * Get the actual number of bitflips.
  * Allow forced on-die ECC.
  * Support 8/512 on-die ECC.
  * Fix on-die ECC detection logic.
- Hynix:
  * Fix decoding the OOB size on H27UCG8T2BTR.
  * Use ->exec_op() in hynix_nand_reg_write_op().

----------------------------------------------------------------
Abhishek Sahu (15):
      mtd: rawnand: helper function for setting up ECC configuration
      mtd: rawnand: denali: use helper function for ecc setup
      dt-bindings: qcom_nandc: update for ECC strength and step size
      mtd: rawnand: qcom: remove dt property nand-ecc-step-size
      mtd: rawnand: qcom: use the ecc strength from device parameter
      mtd: rawnand: qcom: wait for desc completion in all BAM channels
      mtd: rawnand: qcom: erased page detection for uncorrectable errors on=
ly
      mtd: rawnand: qcom: fix null pointer access for erased page detection
      mtd: rawnand: qcom: parse read errors for read oob also
      mtd: rawnand: qcom: modify write_oob to remove read codeword part
      mtd: rawnand: qcom: fix return value for raw page read
      mtd: rawnand: qcom: check for operation errors in case of raw read
      mtd: rawnand: qcom: code reorganization for raw read
      mtd: rawnand: provide only single helper function for ECC conf
      mtd: rawnand: qcom: erased page bitflips detection

Anders Roxell (1):
      drivers/memory/Kconfig: Add CONFIG_OF dependency

Arnd Bergmann (4):
      mtd: rawnand: MTD_NAND_BCM47XXNFLASH needs CONFIG_BCMA
      mtd: rawnand: qcom: stop using phys_to_dma()
      ia64: use asm-generic/io.h
      sparc64: add reads{b,w,l}/writes{b,w,l}

Boris Brezillon (60):
      mtd: rawnand: micron: Update ecc_stats.corrected
      dt-bindings: Add bindings for SPI NAND devices
      mtd: spinand: Add initial support for the MX35LF1GE4AB chip
      mtd: rawnand: gpmi: Remove useless dependency on MTD_NAND
      mtd: rawnand: Add 'depends on HAS_IOMEM' where missing
      mtd: rawnand: omap2: Allow selection of this driver when COMPILE_TEST=
=3Dy
      mtd: rawnand: sharpsl: Remove inclusion of mach and asm headers
      mtd: rawnand: sharpsl: Allow selection of this driver when COMPILE_TE=
ST=3Dy
      mtd: rawnand: lpc32xx: Allow selection of these drivers when COMPILE_=
TEST=3Dy
      mtd: rawnand: brcmnand: Allow selection of this driver when COMPILE_T=
EST=3Dy
      mtd: rawnand: mxc: Avoid inclusion of asm/mach headers
      mtd: rawnand: mxc: Allow selection of this driver when COMPILE_TEST=
=3Dy
      mtd: rawnand: qcom: Allow selection of this driver when COMPILE_TEST=
=3Dy
      mtd: rawnand: nuc900: Allow selection of this driver when COMPILE_TES=
T=3Dy
      bcma: Allow selection of this driver when COMPILE_TEST=3Dy
      mtd: rawnand: Kill cafe_nand_bug()
      mtd: rawnand: Remove nand_do_read() prototype from rawnand.h
      mtd: rawnand: Remove forward declaration of mtd_info
      mtd: rawnand: Remove forward declaration of device_node
      mtd: rawnand: Rename nand_default_bbt() into nand_create_bbt()
      mtd: rawnand: Kill the chip->scan_bbt() hook
      mtd: rawnand: orion_nand: Kill orion_nand_data.dev_ready()
      mtd: rawnand: plat_nand: Kill pdata->ctrl.{hwcontrol, read_byte}()
      mtd: rawnand: hynix: Use ->exec_op() in hynix_nand_reg_write_op()
      mtd: rawnand: atmel: Use uintptr_t casts instead of unsigned int
      mtd: rawnand: atmel: Add an __iomem cast on gen_pool_dma_alloc() call
      mtd: rawnand: atmel: Allow selection of this driver when COMPILE_TEST=
=3Dy
      mtd: rawnand: davinci: Stop doing iomem pointer <-> u32 conversions
      mtd: rawnand: davinci: Use uintptr_t casts instead of unsigned ones
      mtd: rawnand: davinci: Allow selection of this driver when COMPILE_TE=
ST=3Dy
      mtd: rawnand: sunxi: Add an U suffix to NFC_PAGE_OP definition
      mtd: rawnand: sunxi: Make sure ret is initialized in sunxi_nfc_read_b=
yte()
      mtd: rawnand: sunxi: Allow selection of this driver when COMPILE_TEST=
=3Dy
      mtd: rawnand: fscm: Avoid collision on PC def when compiling for MIPS
      mtd: rawnand: fsmc: Use uintptr_t casts instead of unsigned ones
      mtd: rawnand: fsmc: Allow selection of this driver when COMPILE_TEST=
=3Dy
      memory: fsl_ifc: Allow selection of this driver when COMPILE_TEST=3Dy
      mtd: rawnand: fsl_ifc: Add an __iomem specifier on eccstat_regs
      mtd: rawnand: fsl_ifc: Allow selection of this driver when COMPILE_TE=
ST=3Dy
      MIPS: txx9: Move the ndfc.h header to include/linux/platform_data/txx9
      mtd: rawnand: txx9ndfmc: Allow selection of this driver when COMPILE_=
TEST=3Dy
      MIPS: jz4740: Move jz4740_nand.h header to include/linux/platform_dat=
a/jz4740
      mtd: rawnand: jz4740: Allow selection of this driver when COMPILE_TES=
T=3Dy
      mtd: rawnand: jz4780: Drop the dependency on MACH_JZ4780
      mtd: rawnand: jz4740: Use the proper format specifier to print chipnr
      memory: jz4780-nemc: Allow selection of this driver when COMPILE_TEST=
=3Dy
      mtd: rawnand: fsmc: Stop using chip->read_buf()
      mtd: rawnand: micron: Fix on-die ECC detection logic
      mtd: rawnand: Expose _notsupp() helpers for raw page accessors
      mtd: rawnand: micron: Get the actual number of bitflips
      mtd: rawnand: micron: Avoid enabling/disabling ECC when it can't be d=
isabled
      mtd: rawnand: micron: Make ECC activation stateful
      mtd: rawnand: orion: Avoid direct inclusion of asm headers
      mtd: rawnand: orion: Handle cases where __LINUX_ARM_ARCH__ is not def=
ined
      mtd: rawnand: s3c2410: Error out when ->nrsets < 0 or ->sets =3D=3D N=
ULL
      mtd: rawnand: Remove unused caller_is_module() definition
      mtd: rawnand: jz4740: Include gpio/consumer.h instead of gpio.h
      mtd: rawnand: sunxi: Remove gpio.h and of_gpio.h inclusions
      mtd: rawnand: atmel: Stop including gpio.h
      mtd: rawnand: au1550nd: Remove unneeded gpio.h inclusion

Chris Packham (6):
      mtd: rawnand: marvell: Handle on-die ECC
      mtd: rawnand: add manufacturer fixup for ONFI parameter page
      mtd: rawnand: add defines for ONFI version bits
      mtd: rawnand: micron: add fixup for ONFI revision
      mtd: rawnand: micron: support 8/512 on-die ECC
      mtd: rawnand: micron: allow forced on-die ECC

Colin Ian King (1):
      mtd: rawnand: gpmi: remove redundant variable payload_virt

Daniel Mack (3):
      mtd: rawnand: marvell: add suspend and resume hooks
      mtd: rawnand: marvell: remove bogus comment in marvell_nfc_select_chi=
p()
      mtd: rawnand: marvell: set reg_clk to NULL if it can't be obtained

Fabio Estevam (2):
      mtd: rawnand: gpmi: Switch to SPDX identifier
      mtd: rawnand: mxc: Switch to SPDX identifier

Frieder Schrempf (1):
      mtd: spinand: Add initial support for Winbond W25M02GV

Martin Blumenstingl (1):
      mtd: rawnand: hynix: fix decoding the OOB size on H27UCG8T2BTR

Martin Kaiser (1):
      mtd: rawnand: mxc: remove __init qualifier from mxcnd_probe_dt

Masahiro Yamada (4):
      mtd: rawnand: denali_dt: use dev as a shorthand of &pdev->dev
      dt-binding: mtd: denali_dt: document clock property
      mtd: rawnand: denali_dt: add more clocks based on IP datasheet
      mtd: rawnand: denali: optimize timing parameters for data interface

Miquel Raynal (48):
      mtd: spinand: macronix: Add support for MX35LF2GE4AB
      mtd: rawnand: docg4: fix the probe function error path
      mtd: rawnand: fix indentation in Kconfig
      mtd: rawnand: add default values for dynamic timings
      mtd: rawnand: make subop helpers return unsigned values
      mtd: rawnand: better name for the controller structure
      mtd: rawnand: add hooks that may be called during nand_scan()
      mtd: rawnand: davinci: convert driver to nand_scan()
      mtd: rawnand: denali: convert to nand_scan()
      mtd: rawnand: fsl_elbc: return meaningful values
      mtd: rawnand: fsl_elbc: convert driver to nand_scan()
      mtd: rawnand: fsl_ifc: convert driver to nand_scan()
      mtd: rawnand: fsmc: convert driver to nand_scan()
      mtd: rawnand: gpmi: convert driver to nand_scan()
      mtd: rawnand: hisi504: convert driver to nand_scan()
      mtd: rawnand: jz4780: convert driver to nand_scan()
      mtd: rawnand: lpc32xx_slc: convert driver to nand_scan()
      mtd: rawnand: marvell: convert driver to nand_scan()
      mtd: rawnand: mtk: convert driver to nand_scan()
      mtd: rawnand: mxc: convert driver to nand_scan()
      mtd: rawnand: nandsim: convert driver to nand_scan()
      mtd: rawnand: s3c2410: convert driver to nand_scan()
      mtd: rawnand: sh_flctl: convert driver to nand_scan()
      mtd: rawnand: sunxi: convert driver to nand_scan()
      mtd: rawnand: tango: convert driver to nand_scan()
      mtd: rawnand: txx9ndfmc: rename nand controller internal structure
      mtd: rawnand: vf610: convert driver to nand_scan()
      mtd: rawnand: sm_common: fix the probe function error path
      mtd: rawnand: sm_common: convert driver to nand_scan_with_ids()
      mtd: rawnand: qcom: convert driver to nand_scan()
      mtd: rawnand: brcmnand: convert driver to nand_scan()
      mtd: rawnand: cafe: convert driver to nand_scan()
      mtd: rawnand: lpc32xx_mlc: convert driver to nand_scan()
      mtd: rawnand: omap2: convert driver to nand_scan()
      mtd: rawnand: atmel: clarify NAND addition/removal paths
      mtd: rawnand: atmel: convert driver to nand_scan()
      mtd: rawnand: do not execute nand_scan_ident() if maxchips is zero
      mtd: rawnand: docg4: convert driver to nand_scan()
      mtd: rawnand: jz4740: fix probe function error path
      mtd: rawnand: jz4740: group nand_scan_{ident, tail} calls
      mtd: rawnand: jz4740: convert driver to nand_scan()
      mtd: rawnand: tegra: convert driver to nand_scan()
      mtd: rawnand: txx9ndfmc: clarify ECC parameters assignation
      mtd: rawnand: txx9ndfmc: convert driver to nand_scan()
      mtd: rawnand: do not export nand_scan_[ident|tail]() anymore
      mtd: rawnand: allocate model parameter dynamically
      mtd: rawnand: allocate dynamically ONFI parameters during detection
      MAINTAINERS: drop Wenyou Yang from Atmel NAND driver support

Peter Pan (2):
      mtd: nand: Add core infrastructure to support SPI NANDs
      mtd: spinand: Add initial support for Micron MT29F2G01ABAGD

Peter Rosin (1):
      mtd: rawnand: atmel: add module param to avoid using dma

Rafa=C5=82 Mi=C5=82ecki (2):
      mtd: rawnand: use mtd_device_register() where applicable
      mtd: onenand: use mtd_device_register() where applicable

Stefan Agner (5):
      mtd: rawnand: add Reed-Solomon error correction algorithm
      mtd: rawnand: add an option to specify NAND chip as a boot device
      dt-bindings: mtd: add tegra NAND controller binding
      mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver
      mtd: rawnand: tegra: check bounds of die_nr properly

 .../devicetree/bindings/mtd/denali-nand.txt        |    5 +
 Documentation/devicetree/bindings/mtd/nand.txt     |    6 +-
 .../bindings/mtd/nvidia-tegra20-nand.txt           |   64 +
 .../devicetree/bindings/mtd/qcom_nandc.txt         |    7 +-
 Documentation/devicetree/bindings/mtd/spi-nand.txt |    5 +
 MAINTAINERS                                        |    8 +-
 arch/arm/mach-pxa/balloon3.c                       |    1 -
 arch/arm/mach-pxa/em-x270.c                        |    1 -
 arch/ia64/include/asm/io.h                         |   13 +-
 arch/mips/jz4740/board-qi_lb60.c                   |    3 +-
 arch/mips/txx9/generic/setup.c                     |    2 +-
 arch/mips/txx9/generic/setup_tx4938.c              |    2 +-
 arch/mips/txx9/generic/setup_tx4939.c              |    2 +-
 arch/sparc/include/asm/io_64.h                     |   19 +-
 drivers/bcma/Kconfig                               |    3 +-
 drivers/memory/Kconfig                             |    6 +-
 drivers/mtd/nand/Kconfig                           |    1 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/onenand/generic.c                 |    5 +-
 drivers/mtd/nand/onenand/samsung.c                 |    5 +-
 drivers/mtd/nand/raw/Kconfig                       |  152 ++-
 drivers/mtd/nand/raw/Makefile                      |    1 +
 drivers/mtd/nand/raw/atmel/nand-controller.c       |  175 ++-
 drivers/mtd/nand/raw/au1550nd.c                    |    1 -
 drivers/mtd/nand/raw/brcmnand/brcmnand.c           |   67 +-
 drivers/mtd/nand/raw/cafe_nand.c                   |  143 ++-
 drivers/mtd/nand/raw/cmx270_nand.c                 |    4 +-
 drivers/mtd/nand/raw/cs553x_nand.c                 |    3 +-
 drivers/mtd/nand/raw/davinci_nand.c                |  231 ++--
 drivers/mtd/nand/raw/denali.c                      |  216 ++--
 drivers/mtd/nand/raw/denali.h                      |    1 +
 drivers/mtd/nand/raw/denali_dt.c                   |   72 +-
 drivers/mtd/nand/raw/denali_pci.c                  |    1 +
 drivers/mtd/nand/raw/diskonchip.c                  |    4 +-
 drivers/mtd/nand/raw/docg4.c                       |   89 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c               |   25 +-
 drivers/mtd/nand/raw/fsl_ifc_nand.c                |   25 +-
 drivers/mtd/nand/raw/fsmc_nand.c                   |  183 +--
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c          |   15 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c         |   76 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h         |   11 +-
 drivers/mtd/nand/raw/hisi504_nand.c                |   78 +-
 drivers/mtd/nand/raw/jz4740_nand.c                 |   51 +-
 drivers/mtd/nand/raw/jz4780_nand.c                 |   41 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c                 |   61 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c                 |   77 +-
 drivers/mtd/nand/raw/marvell_nand.c                |  302 +++--
 drivers/mtd/nand/raw/mtk_nand.c                    |   79 +-
 drivers/mtd/nand/raw/mxc_nand.c                    |  157 ++-
 drivers/mtd/nand/raw/nand_base.c                   |  343 ++++--
 drivers/mtd/nand/raw/nand_bbt.c                    |   10 +-
 drivers/mtd/nand/raw/nand_hynix.c                  |   23 +
 drivers/mtd/nand/raw/nand_micron.c                 |  351 +++++-
 drivers/mtd/nand/raw/nand_timings.c                |   32 +-
 drivers/mtd/nand/raw/nandsim.c                     |   84 +-
 drivers/mtd/nand/raw/ndfc.c                        |    4 +-
 drivers/mtd/nand/raw/omap2.c                       |  533 +++++----
 drivers/mtd/nand/raw/orion_nand.c                  |    9 +-
 drivers/mtd/nand/raw/oxnas_nand.c                  |    4 +-
 drivers/mtd/nand/raw/plat_nand.c                   |    2 -
 drivers/mtd/nand/raw/qcom_nandc.c                  |  595 ++++++----
 drivers/mtd/nand/raw/s3c2410.c                     |   52 +-
 drivers/mtd/nand/raw/sh_flctl.c                    |   36 +-
 drivers/mtd/nand/raw/sharpsl.c                     |    5 +-
 drivers/mtd/nand/raw/sm_common.c                   |   39 +-
 drivers/mtd/nand/raw/sunxi_nand.c                  |   55 +-
 drivers/mtd/nand/raw/tango_nand.c                  |   44 +-
 drivers/mtd/nand/raw/tegra_nand.c                  | 1246 ++++++++++++++++=
++++
 drivers/mtd/nand/raw/txx9ndfmc.c                   |   42 +-
 drivers/mtd/nand/raw/vf610_nfc.c                   |  127 +-
 drivers/mtd/nand/spi/Kconfig                       |    7 +
 drivers/mtd/nand/spi/Makefile                      |    3 +
 drivers/mtd/nand/spi/core.c                        | 1155 ++++++++++++++++=
++
 drivers/mtd/nand/spi/macronix.c                    |  144 +++
 drivers/mtd/nand/spi/micron.c                      |  133 +++
 drivers/mtd/nand/spi/winbond.c                     |  141 +++
 include/linux/mtd/rawnand.h                        |  126 +-
 include/linux/mtd/spinand.h                        |  421 +++++++
 .../linux/platform_data/jz4740}/jz4740_nand.h      |    4 +-
 include/linux/platform_data/mtd-orion_nand.h       |    1 -
 .../linux/platform_data}/txx9/ndfmc.h              |    6 +-
 include/linux/spi/spi-mem.h                        |    4 +-
 82 files changed, 6200 insertions(+), 2081 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/nvidia-tegra20-na=
nd.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
 create mode 100644 drivers/mtd/nand/raw/tegra_nand.c
 create mode 100644 drivers/mtd/nand/spi/Kconfig
 create mode 100644 drivers/mtd/nand/spi/Makefile
 create mode 100644 drivers/mtd/nand/spi/core.c
 create mode 100644 drivers/mtd/nand/spi/macronix.c
 create mode 100644 drivers/mtd/nand/spi/micron.c
 create mode 100644 drivers/mtd/nand/spi/winbond.c
 create mode 100644 include/linux/mtd/spinand.h
 rename {arch/mips/include/asm/mach-jz4740 =3D> include/linux/platform_data=
/jz4740}/jz4740_nand.h (91%)
 rename {arch/mips/include/asm =3D> include/linux/platform_data}/txx9/ndfmc=
.h (91%)
