Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqu49-0004VY-HU
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 02:32:50 +0000
Received: by pasz6 with SMTP id z6so206143917pas.2
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 19:32:28 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Marek Vasut <marex@denx.de>, Scott Wood <scottwood@freescale.com>,
 Josh Wu <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>,
 Huang Shijie <shijie.huang@arm.com>
Subject: [PATCH 0/5] mtd: migrate 'of_node' handling to core,
 not in mtd_part_parser_data
Date: Mon, 26 Oct 2015 19:31:05 -0700
Message-Id: <1445913070-17950-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I noticed that, for MTD drivers that want to support DT partition parsing
(essentially all recent ones), it's a bit awkward to set the tell MTD which DT
node to use. I also noticed that this info is duplicated in a few places;
namely, some sub-subsystems (like SPI NOR and NAND) need their own field to
track the DT node, so let's have the propagate the 'MTD' DT node down for us.

Besides simplifying the boilerplate throughout MTD, this series also has the
side effect of producing 'of_node' symlinks in sysfs. e.g.:

  # ls -al /sys/class/mtd/mtd0/of_node 
  lrwxrwxrwx 1 root root 0 Oct 26 19:17 /sys/class/mtd/mtd0/of_node -> ../../../../firmware/devicetree/base/spi@ff130000/flash@0

For NAND, this potentially has some other bigger initial side effects, since
nand_dt_init() handles a bit more automagically for drivers that defined their
->flash_node. But these drivers should probably convert anyway. So, please test
your favorite driver!

Thanks,
Brian

Brian Norris (5):
  mtd: ofpart: grab device tree node directly from master device node
  mtd: nand: drop unnecessary partition parser data
  mtd: spi-nor: drop unnecessary partition parser data
  mtd: drop unnecessary partition parser data
  mtd: drop 'of_node' partition parser data

 drivers/mtd/devices/m25p80.c                  |  8 ++------
 drivers/mtd/devices/mtd_dataflash.c           |  5 ++---
 drivers/mtd/devices/spear_smi.c               |  6 ++----
 drivers/mtd/devices/st_spi_fsm.c              |  5 ++---
 drivers/mtd/maps/lantiq-flash.c               |  5 ++---
 drivers/mtd/maps/physmap_of.c                 |  5 ++---
 drivers/mtd/nand/atmel_nand.c                 |  7 +++----
 drivers/mtd/nand/brcmnand/brcmnand.c          |  3 +--
 drivers/mtd/nand/davinci_nand.c               | 10 +++-------
 drivers/mtd/nand/fsl_elbc_nand.c              |  5 ++---
 drivers/mtd/nand/fsl_ifc_nand.c               |  5 ++---
 drivers/mtd/nand/fsl_upm.c                    |  5 ++---
 drivers/mtd/nand/fsmc_nand.c                  |  7 +++----
 drivers/mtd/nand/gpio.c                       |  8 +++-----
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c        |  5 ++---
 drivers/mtd/nand/hisi504_nand.c               |  5 ++---
 drivers/mtd/nand/lpc32xx_mlc.c                |  7 +++----
 drivers/mtd/nand/lpc32xx_slc.c                |  7 +++----
 drivers/mtd/nand/mpc5121_nfc.c                |  5 ++---
 drivers/mtd/nand/mxc_nand.c                   |  5 ++---
 drivers/mtd/nand/nand_base.c                  |  3 +++
 drivers/mtd/nand/ndfc.c                       |  5 ++---
 drivers/mtd/nand/omap2.c                      |  6 ++----
 drivers/mtd/nand/orion_nand.c                 |  6 ++----
 drivers/mtd/nand/plat_nand.c                  |  5 ++---
 drivers/mtd/nand/pxa3xx_nand.c                | 10 +++++-----
 drivers/mtd/nand/sh_flctl.c                   |  6 ++----
 drivers/mtd/nand/socrates_nand.c              |  5 ++---
 drivers/mtd/nand/sunxi_nand.c                 |  4 +---
 drivers/mtd/nand/vf610_nfc.c                  |  6 +-----
 drivers/mtd/ofpart.c                          | 12 ++++--------
 drivers/mtd/onenand/omap2.c                   |  8 +++-----
 drivers/mtd/spi-nor/fsl-quadspi.c             |  4 +---
 drivers/mtd/spi-nor/nxp-spifi.c               |  4 +---
 drivers/mtd/spi-nor/spi-nor.c                 |  1 +
 drivers/staging/mt29f_spinand/mt29f_spinand.c |  5 ++---
 include/linux/mtd/partitions.h                |  2 --
 37 files changed, 79 insertions(+), 131 deletions(-)

-- 
2.6.0.rc2.230.g3dd15c0
