Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qw1AR-00082K-0f
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2011 00:18:04 +0000
Received: by mail-yx0-f177.google.com with SMTP id 8so643642yxk.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Aug 2011 17:18:02 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 5/5] mtd: style fixups in multi-line comment, indentation
Date: Tue, 23 Aug 2011 17:17:36 -0700
Message-Id: <1314145056-5233-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314145056-5233-1-git-send-email-computersforpeace@gmail.com>
References: <1314145056-5233-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/linux/mtd/mtd.h |   16 +++++++++-------
 1 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 68ea229..ff7bae0 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -33,17 +33,19 @@
 #define MTD_CHAR_MAJOR 90
 #define MTD_BLOCK_MAJOR 31
 
-#define MTD_ERASE_PENDING      	0x01
+#define MTD_ERASE_PENDING	0x01
 #define MTD_ERASING		0x02
 #define MTD_ERASE_SUSPEND	0x04
-#define MTD_ERASE_DONE          0x08
-#define MTD_ERASE_FAILED        0x10
+#define MTD_ERASE_DONE		0x08
+#define MTD_ERASE_FAILED	0x10
 
 #define MTD_FAIL_ADDR_UNKNOWN -1LL
 
-/* If the erase fails, fail_addr might indicate exactly which block failed.  If
-   fail_addr = MTD_FAIL_ADDR_UNKNOWN, the failure was not at the device level or was not
-   specific to any particular block. */
+/*
+ * If the erase fails, fail_addr might indicate exactly which block failed. If
+ * fail_addr = MTD_FAIL_ADDR_UNKNOWN, the failure was not at the device level
+ * or was not specific to any particular block.
+ */
 struct erase_info {
 	struct mtd_info *mtd;
 	uint64_t addr;
@@ -60,7 +62,7 @@ struct erase_info {
 };
 
 struct mtd_erase_region_info {
-	uint64_t offset;			/* At which this region starts, from the beginning of the MTD */
+	uint64_t offset;		/* At which this region starts, from the beginning of the MTD */
 	uint32_t erasesize;		/* For this region */
 	uint32_t numblocks;		/* Number of blocks of erasesize in this region */
 	unsigned long *lockmap;		/* If keeping bitmap of locks */
-- 
1.7.5.4
