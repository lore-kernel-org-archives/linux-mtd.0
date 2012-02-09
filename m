Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RvUAu-0007H5-0C
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2012 13:36:37 +0000
Received: by wico1 with SMTP id o1so1373566wic.36
 for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2012 05:36:34 -0800 (PST)
Date: Thu, 9 Feb 2012 15:36:29 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: unify initialization of erase_info->fail_addr
Message-ID: <20120209153629.16bb9b01@pixies.home.jungo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Shmulik Ladkani <shmulik.ladkani@gmail.com>

Initialization of 'erase_info->fail_addr' to MTD_FAIL_ADDR_UNKNOWN prior
erase operation is duplicated accross several MTD drivers, and also taken
care of by some MTD users as well.

Harmonize it: initialize 'fail_addr' within 'mtd_erase()' interface.

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
Compile tested only, l2-mtd.git

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index f7a31cc..b900056 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -426,8 +426,6 @@ static int concat_erase(struct mtd_info *mtd, struct erase_info *instr)
 			return -EINVAL;
 	}
 
-	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
-
 	/* make a local copy of instr to avoid modifying the caller's struct */
 	erase = kmalloc(sizeof (struct erase_info), GFP_KERNEL);
 
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index b274fdf..c837507 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -695,6 +695,7 @@ int mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 		return -EINVAL;
 	if (!(mtd->flags & MTD_WRITEABLE))
 		return -EROFS;
+	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
 	if (!instr->len) {
 		instr->state = MTD_ERASE_DONE;
 		mtd_erase_callback(instr);
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 5822e3a..5c69204 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2550,8 +2550,6 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
 	if (check_offs_len(mtd, instr->addr, instr->len))
 		return -EINVAL;
 
-	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
-
 	/* Grab the lock and see if the device is available */
 	nand_get_device(chip, mtd, FL_ERASING);
 
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index a1592cf..0e1ff9f 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2502,8 +2502,6 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 		return -EINVAL;
 	}
 
-	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
-
 	/* Grab the lock and see if the device is available */
 	onenand_get_device(mtd, FL_ERASING);
 
diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index eafb8d3..095e4b1 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -69,7 +69,6 @@ static void jffs2_erase_block(struct jffs2_sb_info *c,
 	instr->len = c->sector_size;
 	instr->callback = jffs2_erase_callback;
 	instr->priv = (unsigned long)(&instr[1]);
-	instr->fail_addr = MTD_FAIL_ADDR_UNKNOWN;
 
 	((struct erase_priv_struct *)instr->priv)->jeb = jeb;
 	((struct erase_priv_struct *)instr->priv)->c = c;
