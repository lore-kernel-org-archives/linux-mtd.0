Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afIbC-0004oX-KJ
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2016 02:51:15 +0000
Received: by mail-pf0-x243.google.com with SMTP id n5so6870041pfn.1
 for <linux-mtd@lists.infradead.org>; Sun, 13 Mar 2016 19:50:58 -0700 (PDT)
From: Peter Pan <peterpansjtu@gmail.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com, xuejiancheng@huawei.com,
 Peter Pan <peterpandong@micron.com>
Subject: [PATCH 11/11] mtd: nand: remove nand_chip.bbt
Date: Mon, 14 Mar 2016 02:48:04 +0000
Message-Id: <1457923684-13505-12-git-send-email-peterpandong@micron.com>
In-Reply-To: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
References: <1457923684-13505-1-git-send-email-peterpandong@micron.com>
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
index d180e86..00c2dbb 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -651,7 +651,6 @@ struct nand_buffers {
  * @read_retries:	[INTERN] the number of read retry modes supported
  * @onfi_set_features:	[REPLACEABLE] set the features for ONFI nand
  * @onfi_get_features:	[REPLACEABLE] get the features for ONFI nand
- * @bbt:		[INTERN] bad block table pointer
  * @nand_bbt:		[INTERN] pointer to bad block table structure, which
  *			includes all information needed by Bad Block Management
  * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash
@@ -739,7 +738,6 @@ struct nand_chip {
 	struct nand_buffers *buffers;
 	struct nand_hw_control hwcontrol;
 
-	uint8_t *bbt;
 	struct nand_bbt *nand_bbt;
 	struct nand_bbt_descr *bbt_td;
 	struct nand_bbt_descr *bbt_md;
-- 
1.9.1
