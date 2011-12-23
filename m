Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Re9aG-0005VB-D3
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 18:11:12 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 27/28] mtd: introduce mtd_get_device interface
Date: Fri, 23 Dec 2011 20:11:19 +0200
Message-Id: <1324663880-22477-28-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
References: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdcore.c   |    2 +-
 include/linux/mtd/mtd.h |    7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 376fbfd..fbecbe8 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -614,7 +614,7 @@ int __get_mtd_device(struct mtd_info *mtd)
 		return -ENODEV;
 
 	if (mtd->get_device) {
-		err = mtd->get_device(mtd);
+		err = mtd_get_device(mtd);
 
 		if (err) {
 			module_put(mtd->owner);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 64aa54f..0e696b7 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -214,6 +214,7 @@ struct mtd_info {
 	int (*block_markbad) (struct mtd_info *mtd, loff_t ofs);
 	int (*suspend) (struct mtd_info *mtd);
 	void (*resume) (struct mtd_info *mtd);
+	int (*get_device) (struct mtd_info *mtd);
 
 	/* Backing device capabilities for this device
 	 * - provides mmap capabilities
@@ -237,7 +238,6 @@ struct mtd_info {
 	 * its own reference counting. The below functions are only for driver.
 	 * The driver may register its callbacks. These callbacks are not
 	 * supposed to be called by MTD users */
-	int (*get_device) (struct mtd_info *mtd);
 	void (*put_device) (struct mtd_info *mtd);
 };
 
@@ -414,6 +414,11 @@ static inline int mtd_block_markbad(struct mtd_info *mtd, loff_t ofs)
 	return mtd->block_markbad(mtd, ofs);
 }
 
+static inline int mtd_get_device(struct mtd_info *mtd)
+{
+	return mtd->get_device(mtd);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.3
