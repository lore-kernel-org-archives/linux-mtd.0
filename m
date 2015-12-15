Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8ifg-0008Kx-3M
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2015 06:01:13 +0000
Received: by pabtx6 with SMTP id tx6so843229pab.3
 for <linux-mtd@lists.infradead.org>; Mon, 14 Dec 2015 22:00:51 -0800 (PST)
From: Peter Pan <peterpansjtu@gmail.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, fransklaver@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com,
 Peter Pan <peterpandong@micron.com>
Subject: [PATCH v2 11/12] mtd: nand: remove nand_chip.bbt
Date: Tue, 15 Dec 2015 05:59:37 +0000
Message-Id: <1450159178-29895-12-git-send-email-peterpandong@micron.com>
In-Reply-To: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
References: <1450159178-29895-1-git-send-email-peterpandong@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Brian Norris <computersforpeace@gmail.com>

With new nand_bbt.c, nand_chip doesn't need bbt element any more

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 include/linux/mtd/nand.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index ee15f7d..99e4846 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -629,7 +629,6 @@ struct nand_buffers {
  * @read_retries:	[INTERN] the number of read retry modes supported
  * @onfi_set_features:	[REPLACEABLE] set the features for ONFI nand
  * @onfi_get_features:	[REPLACEABLE] get the features for ONFI nand
- * @bbt:		[INTERN] bad block table pointer
  * @nand_bbt:		[INTERN] pointer to bad block table structure, which
  *			includes all information needed by Bad Block Management
  * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash
@@ -719,7 +718,6 @@ struct nand_chip {
 	struct nand_buffers *buffers;
 	struct nand_hw_control hwcontrol;
 
-	uint8_t *bbt;
 	struct nand_bbt *nand_bbt;
 	struct nand_bbt_descr *bbt_td;
 	struct nand_bbt_descr *bbt_md;
-- 
1.9.1
