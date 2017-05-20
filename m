Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dC6Fg-0000hw-68
 for linux-mtd@lists.infradead.org; Sat, 20 May 2017 15:25:12 +0000
Received: by mail-qk0-x241.google.com with SMTP id o85so13770872qkh.0
 for <linux-mtd@lists.infradead.org>; Sat, 20 May 2017 08:24:47 -0700 (PDT)
From: "Mario J. Rugiero" <mrugiero@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr,
 "Mario J. Rugiero" <mrugiero@gmail.com>
Subject: [PATCH 3/3] mtd: nand: add option to ignore bad blocks when erasing,
 opt-in through debugfs
Date: Sat, 20 May 2017 12:24:28 -0300
Message-Id: <20170520152428.9184-4-mrugiero@gmail.com>
In-Reply-To: <20170520152428.9184-3-mrugiero@gmail.com>
References: <20170520152428.9184-1-mrugiero@gmail.com>
 <20170520152428.9184-2-mrugiero@gmail.com>
 <20170520152428.9184-3-mrugiero@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 26 ++++++++++++++++++++++----
 include/linux/mtd/nand.h     | 12 ++++++++++++
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 52a257e12026..8cffea38a642 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -47,6 +47,7 @@
 #include <linux/io.h>
 #include <linux/mtd/partitions.h>
 #include <linux/of.h>
+#include <linux/debugfs.h>
 
 static int nand_get_device(struct mtd_info *mtd, int new_state);
 
@@ -3209,10 +3210,15 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		/* Check if we have a bad block, we do not erase bad blocks! */
 		if (nand_block_checkbad(mtd, ((loff_t) page) <<
 					chip->page_shift, allowbbt)) {
-			pr_warn("%s: attempt to erase a bad block at page 0x%08x\n",
-				    __func__, page);
-			instr->state = MTD_ERASE_FAILED;
-			goto erase_exit;
+			if (!chip->dbg.scrub_enabled) {
+				pr_warn("%s: attempt to erase a bad block at page 0x%08x\n",
+				    	__func__, page);
+				instr->state = MTD_ERASE_FAILED;
+				goto erase_exit;
+			} else {
+				pr_warn("%s: erasing a bad block at page 0x%08x\n",
+					__func__, page);
+			}
 		}
 
 		/*
@@ -4931,6 +4937,18 @@ int nand_device_register(struct mtd_info *mtd,
 			 int defnr_parts)
 {
 	int ret = nand_device_register(mtd, defparts, defnr_parts);
+	struct nand_debug_info *dbg;
+
+	if (!ret) {
+		dbg = &mtd_to_nand(mtd)->dbg;
+		dbg->scrub_enabled = false;
+		dbg->dfs_scrub_enabled = debugfs_create_bool("scrub_enabled",
+							     0600,
+							     mtd->dbg.dfs_dir,
+							     &dbg->scrub_enabled);
+		if (IS_ERR(dbg->dfs_scrub_enabled))
+			dbg->dfs_scrub_enabled = NULL;
+	}
 
 	return ret;
 }
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 77fc60923fdd..24114b120d0f 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -731,6 +731,16 @@ struct nand_manufacturer_ops {
 };
 
 /**
+ * struct nand_debug_info - NAND specific debugfs
+ * @dfs_scrub_enabled:	dentry for setting force-erase of bad blocks
+ * @scrub_enabled:	if true, erase can erase blocks marked as bad
+ */
+struct nand_debug_info {
+	struct dentry *dfs_scrub_enabled;
+	bool scrub_enabled;
+};
+
+/**
  * struct nand_chip - NAND Private Flash Chip Data
  * @mtd:		MTD device registered to the MTD framework
  * @IO_ADDR_R:		[BOARDSPECIFIC] address to read the 8 I/O lines of the
@@ -835,6 +845,7 @@ struct nand_manufacturer_ops {
  *			additional error status checks (determine if errors are
  *			correctable).
  * @manufacturer:	[INTERN] Contains manufacturer information
+ * @dbg:		NAND debugfs data
  */
 
 struct nand_chip {
@@ -926,6 +937,7 @@ struct nand_chip {
 		const struct nand_manufacturer *desc;
 		void *priv;
 	} manufacturer;
+	struct nand_debug_info dbg;
 };
 
 extern const struct mtd_ooblayout_ops nand_ooblayout_sp_ops;
-- 
2.13.0
