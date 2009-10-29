Received: from relay.atmel.no ([80.232.32.139])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N3TkX-0003iX-Sb
	for linux-mtd@lists.infradead.org; Thu, 29 Oct 2009 12:05:10 +0000
From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] atmel_nand: silence compiler warning by removing unused
	variable
Date: Thu, 29 Oct 2009 13:04:53 +0100
Message-Id: <1256817893-16413-1-git-send-email-hans-christian.egtvedt@atmel.com>
Cc: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch removes the eccpos variable from the atmel_nand_calculate function,
thus silencing a compiler warning about unused variable.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index f8e9975..4f62d20 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -192,7 +192,6 @@ static int atmel_nand_calculate(struct mtd_info *mtd,
 {
 	struct nand_chip *nand_chip = mtd->priv;
 	struct atmel_nand_host *host = nand_chip->priv;
-	uint32_t *eccpos = nand_chip->ecc.layout->eccpos;
 	unsigned int ecc_value;
 
 	/* get the first 2 ECC bytes */
-- 
1.6.0.4
