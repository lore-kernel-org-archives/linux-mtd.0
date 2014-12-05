Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwilB-0005RU-9V
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 02:36:46 +0000
Received: by mail-pa0-f46.google.com with SMTP id lj1so19128368pab.19
 for <linux-mtd@lists.infradead.org>; Thu, 04 Dec 2014 18:36:25 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/3] mtd: nand: added nand_shutdown
Date: Thu,  4 Dec 2014 18:36:07 -0800
Message-Id: <1417746968-28747-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1417746968-28747-1-git-send-email-computersforpeace@gmail.com>
References: <1417746968-28747-1-git-send-email-computersforpeace@gmail.com>
Cc: cdoban@broadcom.com, rjui@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>, sbranden@broadcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Scott Branden <sbranden@broadcom.com>

Add nand_shutdown to wait for current nand operations to finish and prevent
further operations by changing the nand flash state to FL_SHUTDOWN.

This is addressing a problem observed during reboot tests using UBIFS
root file system: NAND erase operations that are in progress during
system reboot/shutdown are causing partial erased blocks. Although UBI should
be able to detect and recover from this error, this change will avoid
the creation of partial erased blocks on reboot in the middle of a NAND erase
operation.

Signed-off-by: Scott Branden <sbranden@broadcom.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Modified to use the new mtd->_reboot hook

Not tested yet

 drivers/mtd/nand/nand_base.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 41585dfb206f..382354b5547b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2944,6 +2944,16 @@ static void nand_resume(struct mtd_info *mtd)
 			__func__);
 }
 
+/**
+ * nand_shutdown - [MTD Interface] Finish the current NAND operation and
+ *                 prevent further operations
+ * @mtd: MTD device structure
+ */
+static void nand_shutdown(struct mtd_info *mtd)
+{
+	nand_get_device(mtd, FL_SHUTDOWN);
+}
+
 /* Set default functions */
 static void nand_set_defaults(struct nand_chip *chip, int busw)
 {
@@ -4146,6 +4156,7 @@ int nand_scan_tail(struct mtd_info *mtd)
 	mtd->_unlock = NULL;
 	mtd->_suspend = nand_suspend;
 	mtd->_resume = nand_resume;
+	mtd->_reboot = nand_shutdown;
 	mtd->_block_isreserved = nand_block_isreserved;
 	mtd->_block_isbad = nand_block_isbad;
 	mtd->_block_markbad = nand_block_markbad;
-- 
1.9.1
