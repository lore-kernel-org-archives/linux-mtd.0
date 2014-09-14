Received: from hauke-m.de ([2001:41d0:8:b27b::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTHcB-0003hq-GO
 for linux-mtd@lists.infradead.org; Sun, 14 Sep 2014 21:45:48 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: dwmw2@infradead.org,
	computersforpeace@gmail.com
Subject: [PATCH] mtd: nand: fix return code for uncorrectable error
Date: Sun, 14 Sep 2014 23:45:02 +0200
Message-Id: <1410731102-26765-1-git-send-email-hauke@hauke-m.de>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_correct_data() should return -EBADMSG when it finds an
uncorrectable error and not just -1.

This is based on OpenWrt patch:
https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-3.10/451-mtd-nand-fix-return-code-of-nand_correct_data-function.patcht

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/nand_ecc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
index 97c4c02..244a634 100644
--- a/drivers/mtd/nand/nand_ecc.c
+++ b/drivers/mtd/nand/nand_ecc.c
@@ -507,7 +507,7 @@ int __nand_correct_data(unsigned char *buf,
 		return 1;	/* error in ECC data; no action needed */
 
 	pr_err("%s: uncorrectable ECC error\n", __func__);
-	return -1;
+	return -EBADMSG;
 }
 EXPORT_SYMBOL(__nand_correct_data);
 
-- 
1.9.1
