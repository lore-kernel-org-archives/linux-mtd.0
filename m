Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eC5H3-0005Ez-S3
 for linux-mtd@lists.infradead.org; Tue, 07 Nov 2017 14:54:48 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Nadav Haklai <nadavh@marvell.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Agner <stefan@agner.ch>
Subject: [RFC PATCH v2 0/6] Marvell NAND controller rework with ->exec_op()
Date: Tue,  7 Nov 2017 15:54:13 +0100
Message-Id: <20171107145419.22717-1-miquel.raynal@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This is the second version of the implementation of ->exec_op() and the
rework of the Marvell NAND controller driver, see behind for more
details.

Robert, we are still waiting our PXA3xx board to arrive so it would be
great if you could test this series (applies on top of mtd-next),
platform data support should work, only DMA is not implemented yet. If
you can take the time to test it, please send me the result of the
following, all binaries will be available in a recent buildroot. To
enable the new driver, you just need to select CONFIG_MTD_NAND_MARVELL
instead of CONFIG_MTD_NAND_PXA3xx.

dmesg
nandbiterrs -i /dev/mtdX
nandpagetest -c 10 /dev/mtdX
nandsubpagetest -c 10 /dev/mtdX
flash_speed -d -c 10 /dev/mtdX

Thank you very much.


Changes since RFCv1:

* General:
  - Typos and alignements.

* mtd: nand: use a static data_interface
  - Fix the commit message
  - Cancel the renaming of onfi_init_data_interface()
  - Ensure SDR timings (at least mode 0) are always set.

* mtd: nand: add ->exec_op() implementation
  - Removed ->waitfunc() calls when not useful anymore.
  - Rephrasing as suggested.
  - Moved ->exec_op() timings conversion to the caller of the
    PATTERN_* macros.
  - Fixed the inner loop and the success condition in the parser.

* dt-bindings: mtd: add Marvell NAND controller documentation
  - Corrected wrong/badly written sentences.
  - Removed status from examples.
  - Removed the enable-arbiter property from the new bindings and
    adapted the code in the Marvell driver.
  - Added the label node.

* mtd: nand: add reworked Marvell NAND controller driver
  - Removed the enable-arbiter property
  - Removed "variant" fields from the capabilities of the
    controller, instead use booleans to indicate for each platform
    what is needed (system controller, arbiter, ...)
  - Added pdata support for PXA tests.

========================================================================

This series adds the implementation of the NAND framework ->exec_op()
interface with all the related hooks and helpers. The reasons for adding
it are explained in details in the commit log "mtd: nand: add
 ->exec_op() implementation", but mostly it will ease later expansion of
the framework, as well as the implementation of new vendor specific
commands, and should also ease driver development.

The series contains as well the reworked NAND controller driver from
Marvell.

A lot of comments are written to explain how to use the new API and the
Marvell driver shows how to implement it. A proper external
documentation is being written and will later be submitted.

Changes on the device tree NAND node definition for all platforms
referring to the Marvell driver were sent in the first version of the
RFC but should not need to be resent here, thus they are not part of
the series.

See the commit log of "mtd: nand: add reworked Marvell NAND controller
driver" for details about why a completely new driver is needed.

As this series changes several core functions and also directly touches
multiple controller drivers, it would be great to have reviews and tests
from the concerned maintainers. Only PXA3xx SoCs are not supported yet
(explaining the RFC) as having a local board to test is really needed.

Thank you,
Miquèl


Boris Brezillon (2):
  mtd: nand: provide several helpers to do common NAND operations
  mtd: nand: force drivers to explicitly send READ/PROG commands

Miquel Raynal (4):
  mtd: nand: use a static data_interface in the nand_chip structure
  mtd: nand: add ->exec_op() implementation
  dt-bindings: mtd: add Marvell NAND controller documentation
  mtd: nand: add reworked Marvell NAND controller driver

 .../devicetree/bindings/mtd/marvell-nand.txt       |   84 +
 drivers/mtd/nand/Kconfig                           |   11 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/atmel/nand-controller.c           |    9 +-
 drivers/mtd/nand/bf5xx_nand.c                      |    6 +-
 drivers/mtd/nand/brcmnand/brcmnand.c               |   20 +-
 drivers/mtd/nand/cafe_nand.c                       |   20 +-
 drivers/mtd/nand/denali.c                          |   53 +-
 drivers/mtd/nand/diskonchip.c                      |    4 +-
 drivers/mtd/nand/docg4.c                           |   19 +-
 drivers/mtd/nand/fsl_elbc_nand.c                   |    6 +-
 drivers/mtd/nand/fsl_ifc_nand.c                    |    6 +-
 drivers/mtd/nand/fsmc_nand.c                       |    5 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c             |   76 +-
 drivers/mtd/nand/hisi504_nand.c                    |    9 +-
 drivers/mtd/nand/jz4740_nand.c                     |   16 +-
 drivers/mtd/nand/lpc32xx_mlc.c                     |    7 +-
 drivers/mtd/nand/lpc32xx_slc.c                     |   33 +-
 drivers/mtd/nand/marvell_nand.c                    | 2443 ++++++++++++++++++++
 drivers/mtd/nand/mtk_nand.c                        |   21 +-
 drivers/mtd/nand/nand_base.c                       | 2017 +++++++++++++---
 drivers/mtd/nand/nand_hynix.c                      |  128 +-
 drivers/mtd/nand/nand_micron.c                     |   51 +-
 drivers/mtd/nand/nand_timings.c                    |   23 +-
 drivers/mtd/nand/omap2.c                           |    8 +-
 drivers/mtd/nand/pxa3xx_nand.c                     |    8 +-
 drivers/mtd/nand/qcom_nandc.c                      |   16 +-
 drivers/mtd/nand/r852.c                            |   11 +-
 drivers/mtd/nand/sh_flctl.c                        |    6 +-
 drivers/mtd/nand/sunxi_nand.c                      |   97 +-
 drivers/mtd/nand/tango_nand.c                      |   27 +-
 drivers/mtd/nand/tmio_nand.c                       |    5 +-
 drivers/mtd/nand/vf610_nfc.c                       |    6 +-
 drivers/staging/mt29f_spinand/mt29f_spinand.c      |    7 +-
 include/linux/mtd/rawnand.h                        |  402 +++-
 35 files changed, 5057 insertions(+), 604 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/marvell-nand.txt
 create mode 100644 drivers/mtd/nand/marvell_nand.c

-- 
2.11.0
