Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4Ka1-00021q-5c
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2016 04:33:48 +0000
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
Subject: [PATCH 02/11] mtd: nand: denali: remove unused struct member
 denali_nand_info::idx
Date: Wed,  9 Nov 2016 13:35:21 +0900
Message-Id: <1478666130-13413-3-git-send-email-yamada.masahiro@socionext.com>
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

The struct member "idx" was used as an index for debug_array long
ago, but the DEBUG_DENALI feature was removed by commit 7cfffac06ca0
("nand/denali: use dev_xx debug function to replace nand_dbg_print
and some printk").  Since then, this has been only initialized, but
never referenced.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 2 --
 drivers/mtd/nand/denali.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 062d5b5..51ddb84 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1436,8 +1436,6 @@ static int denali_ooblayout_free(struct mtd_info *mtd, int section,
 /* initialize driver data structures */
 static void denali_drv_init(struct denali_nand_info *denali)
 {
-	denali->idx = 0;
-
 	/* setup interrupt handler */
 	/*
 	 * the completion object will be used to notify
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index e7ab486..0ce7344 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -467,7 +467,6 @@ struct denali_nand_info {
 	spinlock_t irq_lock;
 	uint32_t irq_status;
 	int irq_debug_array[32];
-	int idx;
 	int irq;
 
 	uint32_t devnum;	/* represent how many nands connected */
-- 
1.9.1
