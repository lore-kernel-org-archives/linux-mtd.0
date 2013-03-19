Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHsDE-0005Or-4O
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2013 08:48:06 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] mtd: nand_ids: improve LEGACY_ID_NAND macro a bit
Date: Tue, 19 Mar 2013 10:49:46 +0200
Message-Id: <1363682987-20824-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Notice that all the flashes belonging to the "legacy ID" class have 512 bytes
NAND page. This means we may simplify the 'LEGACY_ID_NAND()' macro as well as
the NAND ID table a little.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/nand/nand_ids.c |   60 +++++++++++++++++++++----------------------
 include/linux/mtd/nand.h    |    9 +++----
 2 files changed, 34 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index d2c7236..80634b0 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -44,36 +44,36 @@ struct nand_flash_dev nand_flash_ids[] = {
 		{ .id = {0x98, 0xde, 0x94, 0x82, 0x76, 0x56, 0x04, 0x20} },
 		  SZ_8K, SZ_8K, SZ_2M, 0, 8, 640},
 
-	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 512, 4, 0x2000, SP_OPTIONS),
-	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 512, 4, 0x2000, SP_OPTIONS),
-	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE5, 512, 4, 0x2000, SP_OPTIONS),
-	LEGACY_ID_NAND("NAND 8MiB 3,3V 8-bit", 0xD6, 512, 8, 0x2000, SP_OPTIONS),
-	LEGACY_ID_NAND("NAND 8MiB 3,3V 8-bit", 0xE6, 512, 8, 0x2000, SP_OPTIONS),
-
-	LEGACY_ID_NAND("NAND 16MiB 1,8V 8-bit",  0x33, 512, 16, 0x4000, SP_OPTIONS),
-	LEGACY_ID_NAND("NAND 16MiB 3,3V 8-bit",  0x73, 512, 16, 0x4000, SP_OPTIONS),
-	LEGACY_ID_NAND("NAND 16MiB 1,8V 16-bit", 0x43, 512, 16, 0x4000, SP_OPTIONS16),
-	LEGACY_ID_NAND("NAND 16MiB 3,3V 16-bit", 0x53, 512, 16, 0x4000, SP_OPTIONS16),
-
-	LEGACY_ID_NAND("NAND 32MiB 1,8V 8-bit",  0x35, 512, 32, 0x4000, SP_OPTIONS),
-	LEGACY_ID_NAND("NAND 32MiB 3,3V 8-bit",  0x75, 512, 32, 0x4000, SP_OPTIONS),
-	LEGACY_ID_NAND("NAND 32MiB 1,8V 16-bit", 0x45, 512, 32, 0x4000, SP_OPTIONS16),
-	LEGACY_ID_NAND("NAND 32MiB 3,3V 16-bit", 0x55, 512, 32, 0x4000, SP_OPTIONS16),
-
-	LEGACY_ID_NAND("NAND 64MiB 1,8V 8-bit",  0x36, 512, 64, 0x4000, SP_OPTIONS),
-	LEGACY_ID_NAND("NAND 64MiB 3,3V 8-bit",  0x76, 512, 64, 0x4000, SP_OPTIONS),
-	LEGACY_ID_NAND("NAND 64MiB 1,8V 16-bit", 0x46, 512, 64, 0x4000, SP_OPTIONS16),
-	LEGACY_ID_NAND("NAND 64MiB 3,3V 16-bit", 0x56, 512, 64, 0x4000, SP_OPTIONS16),
-
-	LEGACY_ID_NAND("NAND 128MiB 1,8V 8-bit",  0x78, 512, 128, 0x4000, SP_OPTIONS),
-	LEGACY_ID_NAND("NAND 128MiB 1,8V 8-bit",  0x39, 512, 128, 0x4000, SP_OPTIONS),
-	LEGACY_ID_NAND("NAND 128MiB 3,3V 8-bit",  0x79, 512, 128, 0x4000, SP_OPTIONS),
-	LEGACY_ID_NAND("NAND 128MiB 1,8V 16-bit", 0x72, 512, 128, 0x4000, SP_OPTIONS16),
-	LEGACY_ID_NAND("NAND 128MiB 1,8V 16-bit", 0x49, 512, 128, 0x4000, SP_OPTIONS16),
-	LEGACY_ID_NAND("NAND 128MiB 3,3V 16-bit", 0x74, 512, 128, 0x4000, SP_OPTIONS16),
-	LEGACY_ID_NAND("NAND 128MiB 3,3V 16-bit", 0x59, 512, 128, 0x4000, SP_OPTIONS16),
-
-	LEGACY_ID_NAND("NAND 256MiB 3,3V 8-bit", 0x71, 512, 256, 0x4000, SP_OPTIONS),
+	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 4, 0x2000, SP_OPTIONS),
+	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 4, 0x2000, SP_OPTIONS),
+	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE5, 4, 0x2000, SP_OPTIONS),
+	LEGACY_ID_NAND("NAND 8MiB 3,3V 8-bit", 0xD6, 8, 0x2000, SP_OPTIONS),
+	LEGACY_ID_NAND("NAND 8MiB 3,3V 8-bit", 0xE6, 8, 0x2000, SP_OPTIONS),
+
+	LEGACY_ID_NAND("NAND 16MiB 1,8V 8-bit",  0x33, 16, 0x4000, SP_OPTIONS),
+	LEGACY_ID_NAND("NAND 16MiB 3,3V 8-bit",  0x73, 16, 0x4000, SP_OPTIONS),
+	LEGACY_ID_NAND("NAND 16MiB 1,8V 16-bit", 0x43, 16, 0x4000, SP_OPTIONS16),
+	LEGACY_ID_NAND("NAND 16MiB 3,3V 16-bit", 0x53, 16, 0x4000, SP_OPTIONS16),
+
+	LEGACY_ID_NAND("NAND 32MiB 1,8V 8-bit",  0x35, 32, 0x4000, SP_OPTIONS),
+	LEGACY_ID_NAND("NAND 32MiB 3,3V 8-bit",  0x75, 32, 0x4000, SP_OPTIONS),
+	LEGACY_ID_NAND("NAND 32MiB 1,8V 16-bit", 0x45, 32, 0x4000, SP_OPTIONS16),
+	LEGACY_ID_NAND("NAND 32MiB 3,3V 16-bit", 0x55, 32, 0x4000, SP_OPTIONS16),
+
+	LEGACY_ID_NAND("NAND 64MiB 1,8V 8-bit",  0x36, 64, 0x4000, SP_OPTIONS),
+	LEGACY_ID_NAND("NAND 64MiB 3,3V 8-bit",  0x76, 64, 0x4000, SP_OPTIONS),
+	LEGACY_ID_NAND("NAND 64MiB 1,8V 16-bit", 0x46, 64, 0x4000, SP_OPTIONS16),
+	LEGACY_ID_NAND("NAND 64MiB 3,3V 16-bit", 0x56, 64, 0x4000, SP_OPTIONS16),
+
+	LEGACY_ID_NAND("NAND 128MiB 1,8V 8-bit",  0x78, 128, 0x4000, SP_OPTIONS),
+	LEGACY_ID_NAND("NAND 128MiB 1,8V 8-bit",  0x39, 128, 0x4000, SP_OPTIONS),
+	LEGACY_ID_NAND("NAND 128MiB 3,3V 8-bit",  0x79, 128, 0x4000, SP_OPTIONS),
+	LEGACY_ID_NAND("NAND 128MiB 1,8V 16-bit", 0x72, 128, 0x4000, SP_OPTIONS16),
+	LEGACY_ID_NAND("NAND 128MiB 1,8V 16-bit", 0x49, 128, 0x4000, SP_OPTIONS16),
+	LEGACY_ID_NAND("NAND 128MiB 3,3V 16-bit", 0x74, 128, 0x4000, SP_OPTIONS16),
+	LEGACY_ID_NAND("NAND 128MiB 3,3V 16-bit", 0x59, 128, 0x4000, SP_OPTIONS16),
+
+	LEGACY_ID_NAND("NAND 256MiB 3,3V 8-bit", 0x71, 256, 0x4000, SP_OPTIONS),
 
 	/*
 	 * These are the new chips with large page size. Their page size and
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 57be4db..dd7953b 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -555,12 +555,11 @@ struct nand_chip {
 /*
  * A helper for defining older NAND chips where the second ID byte fully
  * defined the chip, including the geometry (chip size, eraseblock size, page
- * size).
+ * size). All these chips have 512 bytes NAND page size.
  */
-#define LEGACY_ID_NAND(nm, devid, pagesz, chipsz, erasesz, opts)       \
-	{ .name = (nm), {{ .dev_id = (devid) }}, .pagesize = (pagesz), \
-	  .chipsize = (chipsz), .erasesize = (erasesz),                \
-	  .options = (opts) }
+#define LEGACY_ID_NAND(nm, devid, chipsz, erasesz, opts)          \
+	{ .name = (nm), {{ .dev_id = (devid) }}, .pagesize = 512, \
+	  .chipsize = (chipsz), .erasesize = (erasesz), .options = (opts) }
 
 /*
  * A helper for defining newer chips which report their page size and
-- 
1.7.10.4
