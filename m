Received: from conuserg-09.nifty.com ([210.131.2.76])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4Ka1-00021p-5Y
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
Subject: [PATCH 03/11] mtd: nand: denali: remove bogus comment about interrupt
 handler setup
Date: Wed,  9 Nov 2016 13:35:22 +0900
Message-Id: <1478666130-13413-4-git-send-email-yamada.masahiro@socionext.com>
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

The interrupt handler is setup in denali_init(), not in
denali_drv_init().  This comment is false.

Such a comment adds no value, so just delete it instead of move.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/mtd/nand/denali.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 51ddb84..d6f1b29 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1436,7 +1436,6 @@ static int denali_ooblayout_free(struct mtd_info *mtd, int section,
 /* initialize driver data structures */
 static void denali_drv_init(struct denali_nand_info *denali)
 {
-	/* setup interrupt handler */
 	/*
 	 * the completion object will be used to notify
 	 * the callee that the interrupt is done
-- 
1.9.1
