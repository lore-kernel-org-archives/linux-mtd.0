Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgIAL-0007sO-1N
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 15:45:13 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: doc: do not initialize mtd_info fields to 0 or NULL
Date: Thu, 29 Dec 2011 17:47:06 +0200
Message-Id: <1325173626-6739-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325173626-6739-1-git-send-email-dedekind1@gmail.com>
References: <1325173626-6739-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The 'struct mtd_info' object is allocated with 'kzalloc()', so it
contains only zeroes - no need to initialize various fields to 0 or
NULL.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/devices/doc2000.c     |    9 ---------
 drivers/mtd/devices/doc2001.c     |    8 --------
 drivers/mtd/devices/doc2001plus.c |    9 ---------
 drivers/mtd/devices/docg3.c       |    3 ---
 4 files changed, 0 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/devices/doc2000.c b/drivers/mtd/devices/doc2000.c
index e9fad91..b1cdf64 100644
--- a/drivers/mtd/devices/doc2000.c
+++ b/drivers/mtd/devices/doc2000.c
@@ -562,23 +562,14 @@ void DoC2k_init(struct mtd_info *mtd)
 
 	mtd->type = MTD_NANDFLASH;
 	mtd->flags = MTD_CAP_NANDFLASH;
-	mtd->size = 0;
-	mtd->erasesize = 0;
 	mtd->writesize = 512;
 	mtd->oobsize = 16;
 	mtd->owner = THIS_MODULE;
 	mtd->erase = doc_erase;
-	mtd->point = NULL;
-	mtd->unpoint = NULL;
 	mtd->read = doc_read;
 	mtd->write = doc_write;
 	mtd->read_oob = doc_read_oob;
 	mtd->write_oob = doc_write_oob;
-	mtd->sync = NULL;
-
-	this->totlen = 0;
-	this->numchips = 0;
-
 	this->curfloor = -1;
 	this->curchip = -1;
 	mutex_init(&this->lock);
diff --git a/drivers/mtd/devices/doc2001.c b/drivers/mtd/devices/doc2001.c
index a3f7a27..7543b98 100644
--- a/drivers/mtd/devices/doc2001.c
+++ b/drivers/mtd/devices/doc2001.c
@@ -343,25 +343,17 @@ void DoCMil_init(struct mtd_info *mtd)
 
 	mtd->type = MTD_NANDFLASH;
 	mtd->flags = MTD_CAP_NANDFLASH;
-	mtd->size = 0;
 
 	/* FIXME: erase size is not always 8KiB */
 	mtd->erasesize = 0x2000;
-
 	mtd->writesize = 512;
 	mtd->oobsize = 16;
 	mtd->owner = THIS_MODULE;
 	mtd->erase = doc_erase;
-	mtd->point = NULL;
-	mtd->unpoint = NULL;
 	mtd->read = doc_read;
 	mtd->write = doc_write;
 	mtd->read_oob = doc_read_oob;
 	mtd->write_oob = doc_write_oob;
-	mtd->sync = NULL;
-
-	this->totlen = 0;
-	this->numchips = 0;
 	this->curfloor = -1;
 	this->curchip = -1;
 
diff --git a/drivers/mtd/devices/doc2001plus.c b/drivers/mtd/devices/doc2001plus.c
index 99351bc..177510d 100644
--- a/drivers/mtd/devices/doc2001plus.c
+++ b/drivers/mtd/devices/doc2001plus.c
@@ -467,23 +467,14 @@ void DoCMilPlus_init(struct mtd_info *mtd)
 
 	mtd->type = MTD_NANDFLASH;
 	mtd->flags = MTD_CAP_NANDFLASH;
-	mtd->size = 0;
-
-	mtd->erasesize = 0;
 	mtd->writesize = 512;
 	mtd->oobsize = 16;
 	mtd->owner = THIS_MODULE;
 	mtd->erase = doc_erase;
-	mtd->point = NULL;
-	mtd->unpoint = NULL;
 	mtd->read = doc_read;
 	mtd->write = doc_write;
 	mtd->read_oob = doc_read_oob;
 	mtd->write_oob = doc_write_oob;
-	mtd->sync = NULL;
-
-	this->totlen = 0;
-	this->numchips = 0;
 	this->curfloor = -1;
 	this->curchip = -1;
 
diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 22d5099..ad11ef0a 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1821,13 +1821,10 @@ static void __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
 	mtd->oobsize = DOC_LAYOUT_OOB_SIZE;
 	mtd->owner = THIS_MODULE;
 	mtd->erase = doc_erase;
-	mtd->point = NULL;
-	mtd->unpoint = NULL;
 	mtd->read = doc_read;
 	mtd->write = doc_write;
 	mtd->read_oob = doc_read_oob;
 	mtd->write_oob = doc_write_oob;
-	mtd->sync = NULL;
 	mtd->block_isbad = doc_block_isbad;
 	mtd->ecclayout = &docg3_oobinfo;
 }
-- 
1.7.7.3
