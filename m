Received: from [210.94.41.89] (helo=party)
	by bombadil.infradead.org with esmtpsa (Exim 4.68 #1 (Red Hat Linux))
	id 1JJlxX-0001k1-NT
	for linux-mtd@lists.infradead.org; Tue, 29 Jan 2008 08:36:48 +0000
Date: Tue, 29 Jan 2008 17:36:30 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [JFFS2] JFFS2 doesn't use OOB at MLC NAND/OneNAND
Message-ID: <20080129083630.GA31954@party>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

It's revised patch from 
http://patchwork.ozlabs.org/linux-mtd/patch?id=15260

Just remove one line
+#define MTD_CAP_MLC_NANDFLASH	(MTD_WRITEABLE)

If you don't any rejct please apply this one.

Any comments are welcome.

Thank you,
Kyungmin Park

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 fs/jffs2/erase.c      |    1 +
 fs/jffs2/fs.c         |    6 ++++--
 fs/jffs2/os-linux.h   |    2 +-
 include/mtd/mtd-abi.h |    3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index a1db918..65d7dd7 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -415,6 +415,7 @@ static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct jffs2_eraseb
 	/* Cleanmarker in oob area or no cleanmarker at all ? */
 	if (jffs2_cleanmarker_oob(c) || c->cleanmarker_size == 0) {
 
+		/* We only write cleanmarker in case of SLC NAND */
 		if (jffs2_cleanmarker_oob(c)) {
 			if (jffs2_write_nand_cleanmarker(c, jeb))
 				goto filebad;
diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index ee192af..cbeb822 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -656,7 +656,9 @@ void jffs2_gc_release_page(struct jffs2_sb_info *c,
 static int jffs2_flash_setup(struct jffs2_sb_info *c) {
 	int ret = 0;
 
-	if (jffs2_cleanmarker_oob(c)) {
+	if (c->mtd->type == MTD_NANDFLASH) {
+		if (!(c->mtd->flags & MTD_OOB_WRITEABLE))
+			printk(KERN_INFO "JFFS2 doesn't use OOB.\n");
 		/* NAND flash... do setup accordingly */
 		ret = jffs2_nand_flash_setup(c);
 		if (ret)
@@ -689,7 +691,7 @@ static int jffs2_flash_setup(struct jffs2_sb_info *c) {
 
 void jffs2_flash_cleanup(struct jffs2_sb_info *c) {
 
-	if (jffs2_cleanmarker_oob(c)) {
+	if (c->mtd->type == MTD_NANDFLASH) {
 		jffs2_nand_flash_cleanup(c);
 	}
 
diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index bf64686..27dd4e8 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -110,7 +110,7 @@ static inline void jffs2_init_inode_info(struct jffs2_inode_info *f)
 #define jffs2_can_mark_obsolete(c) (c->mtd->flags & (MTD_BIT_WRITEABLE))
 #endif
 
-#define jffs2_cleanmarker_oob(c) (c->mtd->type == MTD_NANDFLASH)
+#define jffs2_cleanmarker_oob(c) (c->mtd->type == MTD_NANDFLASH && (c->mtd->flags & MTD_OOB_WRITEABLE))
 
 #define jffs2_flash_write_oob(c, ofs, len, retlen, buf) ((c)->mtd->write_oob((c)->mtd, ofs, len, retlen, buf))
 #define jffs2_flash_read_oob(c, ofs, len, retlen, buf) ((c)->mtd->read_oob((c)->mtd, ofs, len, retlen, buf))
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index f71dac4..5a61074 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -30,12 +30,13 @@ struct mtd_oob_buf {
 #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
 #define MTD_NO_ERASE		0x1000	/* No erase necessary */
 #define MTD_STUPID_LOCK		0x2000	/* Always locked after reset */
+#define MTD_OOB_WRITEABLE	0x4000	/* Use Out-Of-Band area */
 
 // Some common devices / combinations of capabilities
 #define MTD_CAP_ROM		0
 #define MTD_CAP_RAM		(MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_NO_ERASE)
 #define MTD_CAP_NORFLASH	(MTD_WRITEABLE | MTD_BIT_WRITEABLE)
-#define MTD_CAP_NANDFLASH	(MTD_WRITEABLE)
+#define MTD_CAP_NANDFLASH	(MTD_WRITEABLE | MTD_OOB_WRITEABLE)
 
 /* ECC byte placement */
 #define MTD_NANDECC_OFF		0	// Switch off ECC (Not recommended)
-- 
1.5.0.6
