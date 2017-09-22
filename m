Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dvEwE-0004Ca-C1
 for linux-mtd@lists.infradead.org; Fri, 22 Sep 2017 03:47:40 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v2 00/12] mtd: nand: denali: more clean-ups
Date: Fri, 22 Sep 2017 12:46:37 +0900
Message-Id: <1506052009-8285-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This series make the Denali driver even cleaner and more correct.


Masahiro Yamada (12):
  mtd: nand: denali: squash setup_ecc_for_xfer() helper into caller
  mtd: nand: denali: prefix detect_max_banks() with denali_
  mtd: nand: denali: consolidate include directives
  mtd: nand: denali: squash denali_enable_dma() helper into caller
  mtd: nand: denali: slight clean up of denali_wait_for_irq()
  mtd: nand: denali: clean up macros with <linux/bitfield.h>
  mtd: nand: denali: use more FIELD_PREP / FIELD_GET where appropriate
  mtd: nand: denali: clean up comments
  mtd: nand: denali: use upper/lower_32_bits() macro for clean-up
  mtd: nand: denali: remove unneeded init of ECC_ENABLE register
  mtd: nand: denali: support direct addressing mode
  mtd: nand: denali: change the setup_dma choice into hook

 drivers/mtd/nand/denali.c     | 277 ++++++++++++++++++------------------------
 drivers/mtd/nand/denali.h     |  44 +++----
 drivers/mtd/nand/denali_dt.c  |   4 +-
 drivers/mtd/nand/denali_pci.c |   5 +-
 4 files changed, 141 insertions(+), 189 deletions(-)

-- 
2.7.4
