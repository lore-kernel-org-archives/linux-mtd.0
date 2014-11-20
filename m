Received: from mail-gw2-out.broadcom.com ([216.31.210.63])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XrXFR-0001L7-AO
 for linux-mtd@lists.infradead.org; Thu, 20 Nov 2014 19:18:34 +0000
From: Scott Branden <sbranden@broadcom.com>
To: Scott Branden <sbranden@broadcom.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: nand: added nand_shutdown
Date: Thu, 20 Nov 2014 11:18:05 -0800
Message-ID: <1416511085-3930-1-git-send-email-sbranden@broadcom.com>
In-Reply-To: <Scott Branden <sbranden@broadcom.com>
References: <Scott Branden <sbranden@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add nand_shutdown to wait for current nand operations to finish and prevent
further operations by changing the nand flash state to FL_SHUTDOWN.

This is addressing a problem observed during reboot tests using UBIFS
root file system: NAND erase operations that are in progress during
system reboot/shutdown are causing partial erased blocks. Although UBI should
be able to detect and recover from this error, this change will avoid
the creation of partial erased blocks on reboot in the middle of a NAND erase
operation.

Signed-off-by: Scott Branden <sbranden@broadcom.com>
---
 drivers/mtd/nand/nand_base.c | 11 +++++++++++
 include/linux/mtd/nand.h     |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 5b5c627..100a967 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4236,6 +4236,17 @@ void nand_release(struct mtd_info *mtd)
 }
 EXPORT_SYMBOL_GPL(nand_release);
 
+/**
+ * nand_shutdown - [NAND Interface] finish the current nand operation and
+ *                 prevent further operations
+ * @mtd: MTD device structure
+ */
+int nand_shutdown(struct mtd_info *mtd)
+{
+	return nand_get_device(mtd, FL_SHUTDOWN);
+}
+EXPORT_SYMBOL_GPL(nand_shutdown);
+
 static int __init nand_base_init(void)
 {
 	led_trigger_register_simple("nand-disk", &nand_led_trigger);
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index e4d451e..80e4367 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -48,6 +48,13 @@ extern int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 /* unlocks specified locked blocks */
 extern int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 
+/*
+ * Internal helper for board drivers which need to make sure that the current
+ * nand operation is finished and further operations are prevented before
+ * rebooting the system.
+ */
+extern int nand_shutdown(struct mtd_info *mtd);
+
 /* The maximum number of NAND chips in an array */
 #define NAND_MAX_CHIPS		8
 
-- 
2.1.3
