Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fPlMe-0007y4-3C
 for linux-mtd@lists.infradead.org; Mon, 04 Jun 2018 09:01:22 +0000
Date: Mon, 4 Jun 2018 11:01:07 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marex@denx.de>, Miquel Raynal
 <miquel.raynal@bootlin.com>, David Woodhouse <dwmw2@infradead.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [GIT PULL] mtd: nand: Changes for 4.18
Message-ID: <20180604110107.7e6e046e@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm a bit late this time, but here is the NAND PR for 4.18. Unless someone
complains I plan to merge it in the mtd/next branch later this week.

Regards,

Boris

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/nand/for-4.18

for you to fetch changes up to f567c71f4f91d173795a2f46d6fc493387ce084d:

  mtd: nand: Pass mode information to nand_page_io_req (2018-06-01 14:53:50 +0200)

----------------------------------------------------------------
Core changes:
- Add Miquel as a NAND maintainer
- Add access mode to the nand_page_io_req struct
- Fix kernel-doc in rawnand.h
- Support bit-wise majority to recover from corrupted ONFI parameter
  pages
- Stop checking FAIL bit after a SET_FEATURES, as documented in the
  ONFI spec

Raw NAND Driver changes:
- Fix and cleanup the error path of many NAND controller drivers
- GPMI:
  * Cleanup/simplification of a few aspects in the driver
  * Take ECC setup specified in the DT into account
- sunxi: remove support for GPIO-based R/B polling
- MTK:
  * Use of_device_get_match_data() instead of of_match_device()
  * Add an entry in MAINTAINERS for this driver
  * Fix nand-ecc-step-size and nand-ecc-strength description in the DT
    bindings doc
- fsl_ifc: fix ->cmdfunc() to read more than one ONFI parameter page

OneNAND driver changes:
- samsung: use dev_get_drvdata() instead of platform_get_drvdata()

----------------------------------------------------------------
Boris Brezillon (4):
      Merge tag 'nand/davinci-clock' of git://git.infradead.org/linux-mtd into HEAD
      mtd: rawnand: sunxi: Remove support for GPIO-based Ready/Busy polling
      mtd: rawnand: Do not check FAIL bit when executing a SET_FEATURES op
      mtd: nand: Pass mode information to nand_page_io_req

Jane Wan (1):
      mtd: rawnand: fsl_ifc: fix FSL NAND driver to read all ONFI parameter pages

Jia-Ju Bai (1):
      mtd: rawnand: diskonchip: Replace mdelay with usleep_range in doc_probe

Mauro Carvalho Chehab (1):
      mtd: rawnand.h: use nested union kernel-doc markups

Miquel Raynal (12):
      mtd: rawnand: fsl_elbc: fix probe function error path
      mtd: rawnand: fsl_ifc: fix probe function error path
      mtd: rawnand: fsmc: clean the probe function style
      mtd: rawnand: fsmc: fix the probe function error path
      mtd: rawnand: hisi504: clean the probe function error path
      mtd: rawnand: hisi504: fix the probe function error path
      mtd: rawnand: lpc32xx_mlc: clean the probe function
      mtd: rawnand: lpc32xx_mlc: fix the probe function error path
      mtd: rawnand: lpc32xx_slc: clean the probe function
      mtd: rawnand: lpc32xx_slc: fix the probe function error path
      mtd: rawnand: add a way to pass an ID table with nand_scan()
      mtd: nand: add myself as NAND co-maintainer

Ryder Lee (1):
      mtd: rawnand: mtk: use of_device_get_match_data()

Sascha Hauer (6):
      mtd: rawnand: gpmi: drop dma_ops_type
      mtd: rawnand: gpmi: pass buffer and len around
      mtd: rawnand: gpmi: put only once used functions inline
      mtd: rawnand: gpmi: remove direct_dma_map_ok from driver data struct
      mtd: rawnand: gpmi: return valid value from bch_set_geometry()
      mtd: rawnand: gpmi: remove unnecessary variables

Sekhar Nori (1):
      mtd: rawnand: davinci: don't acquire and enable clock

Stefan Agner (2):
      mtd: rawnand: gpmi: add support for specific ECC strength
      dt-bindings: mtd: rawnand: gpmi: document specific ECC strength

Wan, Jane (Nokia - US/Sunnyvale) (1):
      mtd: rawnand: use bit-wise majority to recover the ONFI param page

Wolfram Sang (1):
      mtd: onenand: simplify getting .drvdata

Xiaolei Li (2):
      MAINTAINERS: Add entry for Mediatek NAND controller driver
      dt-bindings: mtd: mtk-nand: Update properties description

 Documentation/devicetree/bindings/mtd/gpmi-nand.txt  |   5 ++
 Documentation/devicetree/bindings/mtd/mtk-nand.txt   |  24 ++++--
 Documentation/devicetree/bindings/mtd/sunxi-nand.txt |   2 -
 MAINTAINERS                                          |   8 ++
 drivers/mtd/nand/onenand/samsung.c                   |   6 +-
 drivers/mtd/nand/raw/davinci_nand.c                  |  25 +-----
 drivers/mtd/nand/raw/diskonchip.c                    |   4 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c                 |  13 ++-
 drivers/mtd/nand/raw/fsl_ifc_nand.c                  |  29 ++++---
 drivers/mtd/nand/raw/fsmc_nand.c                     |  27 ++++---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c            |  54 +++++++------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c           | 188 ++++++++++++++-----------------------------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.h           |  25 +-----
 drivers/mtd/nand/raw/hisi504_nand.c                  |  35 +++-----
 drivers/mtd/nand/raw/lpc32xx_mlc.c                   |  38 ++++-----
 drivers/mtd/nand/raw/lpc32xx_slc.c                   |  26 +++---
 drivers/mtd/nand/raw/mtk_ecc.c                       |   7 +-
 drivers/mtd/nand/raw/mtk_nand.c                      |  10 +--
 drivers/mtd/nand/raw/nand_base.c                     |  89 +++++++++++++-------
 drivers/mtd/nand/raw/sunxi_nand.c                    |  91 ++++-----------------
 include/linux/mtd/nand.h                             |   3 +
 include/linux/mtd/rawnand.h                          |  35 +++++---
 22 files changed, 328 insertions(+), 416 deletions(-)


-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
