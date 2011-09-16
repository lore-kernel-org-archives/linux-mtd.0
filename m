From: bpringle@sympatico.ca (Bill Pringlemeir)
Date: Fri, 16 Sep 2011 16:29:41 -0400
Subject: [PATCH] Fix romfs when using an NAND flash MTD.
Message-ID: <mailman.140.1316206132.20020.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

The code '-EUCLEAN' is returned when an NAND mtd has used ECC to
correct data.  This is fine for the reader of the RomFs and their
data is correct.
---
 fs/romfs/storage.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/romfs/storage.c b/fs/romfs/storage.c
index 71e2b4d..4105d1c 100644
--- a/fs/romfs/storage.c
+++ b/fs/romfs/storage.c
@@ -19,8 +19,10 @@
 #endif
 
 #ifdef CONFIG_ROMFS_ON_MTD
-#define ROMFS_MTD_READ(sb, ...) ((sb)->s_mtd->read((sb)->s_mtd, ##__VA_ARGS__))
-
+#define ROMFS_MTD_READ(sb, ...)                                        \
+    ({ int res;                                                        \
+        res = ((sb)->s_mtd->read((sb)->s_mtd, ##__VA_ARGS__)) == -EUCLEAN ? \
+            0 : res; })                                                         
 /*
  * read data from an romfs image on an MTD device
  */
-- 
1.7.0.4


--=-=-=--
