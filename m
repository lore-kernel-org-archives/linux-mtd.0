Message-ID: <48A15AA2.5050500@nokia.com>
Date: Tue, 12 Aug 2008 12:40:50 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] [MTD] Define and use MTD_FAIL_ADDR_UNKNOWN instead of
	0xffffffff
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 drivers/mtd/mtdconcat.c            |    4 ++--
 drivers/mtd/mtdpart.c              |    4 ++--
 drivers/mtd/nand/nand_base.c       |    2 +-
 drivers/mtd/onenand/onenand_base.c |    2 +-
 fs/jffs2/erase.c                   |    4 ++--
 include/linux/mtd/mtd.h            |    4 +++-
 6 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 2972a5e..789842d 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -444,7 +444,7 @@ static int concat_erase(struct mtd_info *mtd, struct erase_info *instr)
 			return -EINVAL;
 	}
 
-	instr->fail_addr = 0xffffffff;
+	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
 
 	/* make a local copy of instr to avoid modifying the caller's struct */
 	erase = kmalloc(sizeof (struct erase_info), GFP_KERNEL);
@@ -493,7 +493,7 @@ static int concat_erase(struct mtd_info *mtd, struct erase_info *instr)
 			/* sanity check: should never happen since
 			 * block alignment has been checked above */
 			BUG_ON(err == -EINVAL);
-			if (erase->fail_addr != 0xffffffff)
+			if (erase->fail_addr != MTD_FAIL_ADDR_UNKNOWN)
 				instr->fail_addr = erase->fail_addr + offset;
 			break;
 		}
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index edb90b5..8e77e36 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -214,7 +214,7 @@ static int part_erase(struct mtd_info *mtd, struct erase_info *instr)
 	instr->addr += part->offset;
 	ret = part->master->erase(part->master, instr);
 	if (ret) {
-		if (instr->fail_addr != 0xffffffff)
+		if (instr->fail_addr != MTD_FAIL_ADDR_UNKNOWN)
 			instr->fail_addr -= part->offset;
 		instr->addr -= part->offset;
 	}
@@ -226,7 +226,7 @@ void mtd_erase_callback(struct erase_info *instr)
 	if (instr->mtd->erase == part_erase) {
 		struct mtd_part *part = PART(instr->mtd);
 
-		if (instr->fail_addr != 0xffffffff)
+		if (instr->fail_addr != MTD_FAIL_ADDR_UNKNOWN)
 			instr->fail_addr -= part->offset;
 		instr->addr -= part->offset;
 	}
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index d1129ba..5822805 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2042,7 +2042,7 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 		return -EINVAL;
 	}
 
-	instr->fail_addr = 0xffffffff;
+	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
 
 	/* Grab the lock and see if the device is available */
 	nand_get_device(chip, mtd, FL_ERASING);
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 926cf3a..90ed319 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1794,7 +1794,7 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 		return -EINVAL;
 	}
 
-	instr->fail_addr = 0xffffffff;
+	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
 
 	/* Grab the lock and see if the device is available */
 	onenand_get_device(mtd, FL_ERASING);
diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index dddb2a6..259461b 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -68,7 +68,7 @@ static void jffs2_erase_block(struct jffs2_sb_info *c,
 	instr->len = c->sector_size;
 	instr->callback = jffs2_erase_callback;
 	instr->priv = (unsigned long)(&instr[1]);
-	instr->fail_addr = 0xffffffff;
+	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
 
 	((struct erase_priv_struct *)instr->priv)->jeb = jeb;
 	((struct erase_priv_struct *)instr->priv)->c = c;
@@ -175,7 +175,7 @@ static void jffs2_erase_failed(struct jffs2_sb_info *c, struct jffs2_eraseblock
 {
 	/* For NAND, if the failure did not occur at the device level for a
 	   specific physical page, don't bother updating the bad block table. */
-	if (jffs2_cleanmarker_oob(c) && (bad_offset != 0xffffffff)) {
+	if (jffs2_cleanmarker_oob(c) && (bad_offset != MTD_FAIL_ADDR_UNKNOWN)) {
 		/* We had a device-level failure to erase.  Let's see if we've
 		   failed too many times. */
 		if (!jffs2_write_nand_badblock(c, jeb, bad_offset)) {
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 4ed40ca..bcc51dd 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -25,8 +25,10 @@
 #define MTD_ERASE_DONE          0x08
 #define MTD_ERASE_FAILED        0x10
 
+#define MTD_FAIL_ADDR_UNKNOWN 0xffffffff
+
 /* If the erase fails, fail_addr might indicate exactly which block failed.  If
-   fail_addr = 0xffffffff, the failure was not at the device level or was not
+   fail_addr = MTD_FAIL_ADDR_UNKNOWN, the failure was not at the device level or was not
    specific to any particular block. */
 struct erase_info {
 	struct mtd_info *mtd;
-- 
1.5.4.3
