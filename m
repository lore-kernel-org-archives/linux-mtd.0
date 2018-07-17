Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffMhZ-0005dQ-5j
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 09:55:26 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 0/3] Changes in the internal raw NAND API
Date: Tue, 17 Jul 2018 11:54:51 +0200
Message-Id: <20180717095454.27935-1-miquel.raynal@bootlin.com>
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

Hello,

After having sent two versions of a series removing the
nand_scan_ident/nand_scan_tail limitation that prevents us to allocate
memory at critical moments, we are still discussing the internal API.

To avoid sending again more than 20 patches, this is an RFC of the
internal changes prior to the above modifications in each driver:

1/ Rename struct nand_hw_control -> struct nand_controller which is
   much more meaningful.
2/ Rename the function initializing the above structure
   nand_hw_control_init() -> nand_controller_init().
3/ Create a nand_controller_ops structure which will be embedded in the
   nand_controller structure. These operations are:
   int (*attach_chip)(struct nand_chip *) and
   void (*detach_chip)(struct nand_chip *).

If we agree on this, I could merge them first and then send the bunch of
patches making use of these API changes.

Thanks,
Miquèl


Miquel Raynal (3):
  mtd: rawnand: better name for the controller structure
  mtd: rawnand: update the controller structure initialization function
    name
  mtd: rawnand: add hooks that may be called during nand_scan()

 drivers/mtd/nand/raw/atmel/nand-controller.c | 10 +++++-----
 drivers/mtd/nand/raw/brcmnand/brcmnand.c     |  4 ++--
 drivers/mtd/nand/raw/docg4.c                 |  2 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c         |  4 ++--
 drivers/mtd/nand/raw/fsl_ifc_nand.c          |  4 ++--
 drivers/mtd/nand/raw/jz4780_nand.c           |  7 ++++---
 drivers/mtd/nand/raw/marvell_nand.c          |  6 +++---
 drivers/mtd/nand/raw/mtk_nand.c              |  2 +-
 drivers/mtd/nand/raw/nand_base.c             | 23 ++++++++++++++++++++---
 drivers/mtd/nand/raw/ndfc.c                  |  4 ++--
 drivers/mtd/nand/raw/omap2.c                 |  2 +-
 drivers/mtd/nand/raw/oxnas_nand.c            |  4 ++--
 drivers/mtd/nand/raw/qcom_nandc.c            |  4 ++--
 drivers/mtd/nand/raw/s3c2410.c               |  4 ++--
 drivers/mtd/nand/raw/sunxi_nand.c            |  6 +++---
 drivers/mtd/nand/raw/tango_nand.c            |  4 ++--
 drivers/mtd/nand/raw/tegra_nand.c            |  6 +++---
 drivers/mtd/nand/raw/txx9ndfmc.c             |  4 ++--
 include/linux/mtd/rawnand.h                  | 27 ++++++++++++++++++++++-----
 19 files changed, 81 insertions(+), 46 deletions(-)

-- 
2.14.1
