Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4Ka1-00021t-5f
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2016 04:33:46 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Alan Cox <alan@linux.intel.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Jason Roberts <jason.e.roberts@intel.com>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Dinh Nguyen <dinguyen@altera.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 06/11] mtd: nand: denali: remove unused struct member
 totalblks, blksperchip
Date: Wed,  9 Nov 2016 13:35:25 +0900
Message-Id: <1478666130-13413-7-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
References: <1478666130-13413-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The denali->blksperchip is set, but not referenced any more.  The
denali->totalblks is used only for calculating denali->blksperchip.
Both of them are unneeded.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 8 --------
 drivers/mtd/nand/denali.h | 2 --
 2 files changed, 10 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 78d795b..548278b 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1573,14 +1573,6 @@ int denali_init(struct denali_nand_info *denali)
 	denali->nand.ecc.bytes *= denali->devnum;
 	denali->nand.ecc.strength *= denali->devnum;
 
-	/*
-	 * Let driver know the total blocks number and how many blocks
-	 * contained by each nand chip. blksperchip will help driver to
-	 * know how many blocks is taken by FW.
-	 */
-	denali->totalblks = mtd->size >> denali->nand.phys_erase_shift;
-	denali->blksperchip = denali->totalblks / denali->nand.numchips;
-
 	/* override the default read operations */
 	denali->nand.ecc.size = ECC_SECTOR_SIZE * denali->devnum;
 	denali->nand.ecc.read_page = denali_read_page;
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 7c0800d..ea22191 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -462,8 +462,6 @@ struct denali_nand_info {
 	int irq;
 
 	uint32_t devnum;	/* represent how many nands connected */
-	uint32_t totalblks;
-	uint32_t blksperchip;
 	uint32_t bbtskipbytes;
 	uint32_t max_banks;
 };
-- 
1.9.1
