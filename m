Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1afIbE-0004oW-Sr
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2016 02:51:17 +0000
Received: by mail-pf0-x242.google.com with SMTP id x3so3768984pfb.0
 for <linux-mtd@lists.infradead.org>; Sun, 13 Mar 2016 19:50:56 -0700 (PDT)
From: Peter Pan <peterpansjtu@gmail.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 karlzhang@micron.com, beanhuo@micron.com, xuejiancheng@huawei.com,
 Peter Pan <peterpandong@micron.com>
Subject: [PATCH 10/11] mtd: nand_bbt: remove NAND_BBT_DYNAMICSTRUCT macro
Date: Mon, 14 Mar 2016 02:48:03 +0000
Message-Id: <1457923684-13505-11-git-send-email-peterpandong@micron.com>
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

nand_bbt doesn't need nand badblock_pattern any more. So remove
NAND_BBT_DYNAMICSTRUCT from nand_bbt.h

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Peter Pan <peterpandong@micron.com>
---
 include/linux/mtd/nand_bbt.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/linux/mtd/nand_bbt.h b/include/linux/mtd/nand_bbt.h
index a0683b0..ec3d5ec 100644
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
