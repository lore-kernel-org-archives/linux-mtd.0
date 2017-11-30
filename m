From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Wenyou Yang <wenyou.yang@atmel.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Marc Gonzalez <marc_gonzalez@sigmadesigns.com>,
 Stefan Agner <stefan@agner.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Nadav Haklai <nadavh@marvell.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>,
 Ofer Heifetz <oferh@marvell.com>, Hanna Hawa <hannah@marvell.com>,
 linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org,
 devel@driverdev.osuosl.org
Subject: [PATCH 0/5] Introduce the new NAND core interface: ->exec_op()
Date: Thu, 30 Nov 2017 18:01:27 +0100
Message-Id: <20171130170132.27522-1-miquel.raynal@free-electrons.com>
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

This series adds the implementation of the NAND framework ->exec_op()
interface with all the related hooks and helpers. The reasons for adding
it are explained in details in the commit log:

        "mtd: nand: add ->exec_op() implementation"

Long story short: it will ease later expansion of the framework, as well
as the implementation of new vendor specific commands, and should also
ease driver development.

A lot of comments are written to explain how to use the new API. Several
NAND controller drivers are already/almost converted to ->exec_op(), in
particular a rework of the Marvell NAND controller driver, and will
follow. One can have a look at them as examples to understand how to
implement or rework NAND controller drivers. A proper external
documentation is being written and will later be submitted.

Thank you,
Miquèl


Boris Brezillon (2):
  mtd: nand: provide several helpers to do common NAND operations
  mtd: nand: force drivers to explicitly send READ/PROG commands

Miquel Raynal (3):
  mtd: nand: use usual return values for the ->erase() hook
  mtd: nand: use a static data_interface in the nand_chip structure
  mtd: nand: add ->exec_op() implementation

 drivers/mtd/nand/atmel/nand-controller.c      |    9 +-
 drivers/mtd/nand/bf5xx_nand.c                 |    6 +-
 drivers/mtd/nand/brcmnand/brcmnand.c          |   20 +-
 drivers/mtd/nand/cafe_nand.c                  |   20 +-
 drivers/mtd/nand/denali.c                     |   40 +-
 drivers/mtd/nand/diskonchip.c                 |    4 +-
 drivers/mtd/nand/docg4.c                      |   21 +-
 drivers/mtd/nand/fsl_elbc_nand.c              |   10 +-
 drivers/mtd/nand/fsl_ifc_nand.c               |    6 +-
 drivers/mtd/nand/fsmc_nand.c                  |    5 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c        |   77 +-
 drivers/mtd/nand/hisi504_nand.c               |    9 +-
 drivers/mtd/nand/jz4740_nand.c                |   16 +-
 drivers/mtd/nand/lpc32xx_mlc.c                |    7 +-
 drivers/mtd/nand/lpc32xx_slc.c                |   33 +-
 drivers/mtd/nand/mtk_nand.c                   |   25 +-
 drivers/mtd/nand/nand_base.c                  | 2161 ++++++++++++++++++++++---
 drivers/mtd/nand/nand_hynix.c                 |  124 +-
 drivers/mtd/nand/nand_micron.c                |   83 +-
 drivers/mtd/nand/nand_timings.c               |   21 +-
 drivers/mtd/nand/omap2.c                      |   18 +-
 drivers/mtd/nand/pxa3xx_nand.c                |   14 +-
 drivers/mtd/nand/qcom_nandc.c                 |   27 +-
 drivers/mtd/nand/r852.c                       |   11 +-
 drivers/mtd/nand/sh_flctl.c                   |    6 +-
 drivers/mtd/nand/sunxi_nand.c                 |   97 +-
 drivers/mtd/nand/tango_nand.c                 |   27 +-
 drivers/mtd/nand/tmio_nand.c                  |    5 +-
 drivers/mtd/nand/vf610_nfc.c                  |    6 +-
 drivers/staging/mt29f_spinand/mt29f_spinand.c |    5 +-
 include/linux/mtd/rawnand.h                   |  414 ++++-
 31 files changed, 2673 insertions(+), 654 deletions(-)

-- 
2.11.0
