Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP1vn-0005m8-J9
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 09:02:57 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>, Stefan Agner <stefan@agner.ch>
Subject: [PATCH 00/10] mtd: rawnand: 4th batch of cleanups
Date: Tue, 20 Nov 2018 10:02:29 +0100
Message-Id: <20181120090239.5792-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

This time on I deprecate the dummy controller field, as we try to force
people to declare their own controller instance.

Patches 1 to 9 are cleanup patches for the fsmc and vf610 drivers, the
most important ones being patch 3 and 8 where we declare a
nand_controller instance instead of using the dummy one. By doing this
we make sure these drivers keep not using any deprecated fields and can
thus serve as examples to other developers.

Patch 10 is deprecating the dummy_controller field by moving it to the
nand_legacy struct.

Regards,

Boris

Boris Brezillon (10):
  mtd: rawnand: fsmc: Stop passing mtd_info objects to internal
    functions
  mtd: rawnand: fsmc: Fix the fsmc_nand_data kernel-doc
  mtd: rawnand: fsmc: Make conversion from chip to fsmc consistent
  mtd: rawnand: fsmc: Stop using the dummy controller obj
  mtd: rawnand: fsmc: Add an SPDX tag to replace the license text
  mtd: rawnand: fsmc: Fix all coding style issues reported by checkpatch
  mtd: rawnand: vf610: Stop passing mtd_info to internal functions
  mtd: rawnand: vf610: Stop using the dummy controller obj
  mtd: rawnand: vf610: Add an SPDX tag to replace the license text
  mtd: rawnand: Deprecate the dummy_controller field

 drivers/mtd/nand/raw/cafe_nand.c           |   2 +-
 drivers/mtd/nand/raw/davinci_nand.c        |   2 +-
 drivers/mtd/nand/raw/denali.c              |   2 +-
 drivers/mtd/nand/raw/fsmc_nand.c           | 264 ++++++++++-----------
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c |   2 +-
 drivers/mtd/nand/raw/hisi504_nand.c        |   2 +-
 drivers/mtd/nand/raw/jz4740_nand.c         |   2 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c         |   2 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c         |   2 +-
 drivers/mtd/nand/raw/mxc_nand.c            |   2 +-
 drivers/mtd/nand/raw/nand_base.c           |   2 +-
 drivers/mtd/nand/raw/nandsim.c             |   2 +-
 drivers/mtd/nand/raw/sh_flctl.c            |   2 +-
 drivers/mtd/nand/raw/sm_common.c           |   2 +-
 drivers/mtd/nand/raw/vf610_nfc.c           |  60 ++---
 include/linux/mtd/rawnand.h                |   6 +-
 16 files changed, 171 insertions(+), 185 deletions(-)

-- 
2.17.1
