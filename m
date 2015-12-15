Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8ifc-0008Ku-NX
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2015 06:01:10 +0000
Received: by padhk6 with SMTP id hk6so12796097pad.2
 for <linux-mtd@lists.infradead.org>; Mon, 14 Dec 2015 22:00:49 -0800 (PST)
From: Peter Pan <peterpansjtu@gmail.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, fransklaver@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com,
 Peter Pan <peterpandong@micron.com>
Subject: [PATCH v2 10/12] mtd: nand_bbt: remove NAND_BBT_DYNAMICSTRUCT macro
Date: Tue, 15 Dec 2015 05:59:36 +0000
Message-Id: <1450159178-29895-11-git-send-email-peterpandong@micron.com>
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

nand_bbt doesn't need nand badblock_pattern any more. So remove
NAND_BBT_DYNAMICSTRUCT from nand_bbt.h

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 include/linux/mtd/nand_bbt.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/linux/mtd/nand_bbt.h b/include/linux/mtd/nand_bbt.h
index 48a0620..e85596f 100644
--- a/include/linux/mtd/nand_bbt.h
+++ b/include/linux/mtd/nand_bbt.h
@@ -107,13 +107,6 @@ struct nand_bbt_descr {
  */
 #define NAND_BBT_NO_OOB_BBM	0x00080000
 
-/*
- * Flag set by nand_create_default_bbt_descr(), marking that the nand_bbt_descr
- * was allocated dynamicaly and must be freed in nand_release(). Has no meaning
- * in nand_chip.bbt_options.
- */
-#define NAND_BBT_DYNAMICSTRUCT	0x80000000
-
 /* The maximum number of blocks to scan for a bbt */
 #define NAND_BBT_SCAN_MAXBLOCKS	4
 
-- 
1.9.1
