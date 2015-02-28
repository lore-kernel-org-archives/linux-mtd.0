Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YReEv-00008p-TX
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:03:18 +0000
Received: by pdev10 with SMTP id v10so26947610pde.10
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:02:57 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 4/7] mtd: nand: fixup bounds checks for nand_{lock,unlock}()
Date: Sat, 28 Feb 2015 02:02:27 -0800
Message-Id: <1425117750-22298-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
References: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Coverity noticed that these 'ret' assignments weren't being used. Let's
use them.

Note that nand_lock() and nand_unlock() are still not officially used by
any drivers.

Coverity CIDs #1227054 and #1227037

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index df7eb4ff07d1..5488a7ad63e7 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -968,7 +968,7 @@ int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 			__func__, (unsigned long long)ofs, len);
 
 	if (check_offs_len(mtd, ofs, len))
-		ret = -EINVAL;
+		return -EINVAL;
 
 	/* Align to last block address if size addresses end of the device */
 	if (ofs + len == mtd->size)
@@ -1031,7 +1031,7 @@ int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 			__func__, (unsigned long long)ofs, len);
 
 	if (check_offs_len(mtd, ofs, len))
-		ret = -EINVAL;
+		return -EINVAL;
 
 	nand_get_device(mtd, FL_LOCKING);
 
-- 
2.1.0
