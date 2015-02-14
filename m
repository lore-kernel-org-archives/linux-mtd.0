Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YMcqG-0003Fc-8f
 for linux-mtd@lists.infradead.org; Sat, 14 Feb 2015 13:33:06 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [RFC PATCH 2/3] mtd: nand: export nand_wait so that NAND controller
 driver can use it
Date: Sat, 14 Feb 2015 14:32:37 +0100
Message-Id: <1423920758-1556-3-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1423920758-1556-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1423920758-1556-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Export this function for NAND controller that which to use this default
implementation as their waitfunc method.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 3 ++-
 include/linux/mtd/nand.h     | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index e36ec5e..63bf2ba 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -872,7 +872,7 @@ static void panic_nand_wait(struct mtd_info *mtd, struct nand_chip *chip,
  * take up to 400ms and program up to 20ms according to general NAND and
  * SmartMedia specs.
  */
-static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
+int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 {
 
 	int status, state = chip->state;
@@ -910,6 +910,7 @@ static int nand_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	WARN_ON(!(status & NAND_STATUS_READY));
 	return status;
 }
+EXPORT_SYMBOL_GPL(nand_wait);
 
 /**
  * __nand_unlock - [REPLACEABLE] unlocks specified locked blocks
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 6c0aadc..30f8aa1 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -26,6 +26,8 @@
 
 struct mtd_info;
 struct nand_flash_dev;
+struct nand_chip;
+
 /* Scan and identify a NAND device */
 extern int nand_scan(struct mtd_info *mtd, int max_chips);
 /*
@@ -42,6 +44,9 @@ extern void nand_release(struct mtd_info *mtd);
 /* Internal helper for board drivers which need to override command function */
 extern void nand_wait_ready(struct mtd_info *mtd);
 
+/* Internal helper for drivers which rely on the default nand_wait func */
+int nand_wait(struct mtd_info *mtd, struct nand_chip *chip);
+
 /* locks all blocks present in the device */
 extern int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 
-- 
1.9.1
