Received: from smtp6-g21.free.fr ([212.27.42.6])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RJqcG-00079U-0u
	for linux-mtd@lists.infradead.org; Fri, 28 Oct 2011 17:53:19 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dwmw2@infradead.org,
	dedekind1@gmail.com,
	mikedunn@newsguy.com
Subject: [PATCH 11/13] mtd/docg3: map erase and write functions
Date: Fri, 28 Oct 2011 19:51:30 +0200
Message-Id: <1319824292-11085-12-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1319824292-11085-1-git-send-email-robert.jarzmik@free.fr>
References: <1319824292-11085-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Map the developped write and erase functions into the mtd
structure.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
 drivers/mtd/devices/docg3.c |   14 ++++----------
 1 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 6e323f3..9983594 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -41,8 +41,6 @@
  *
  * As no specification is available from M-Systems/Sandisk, this drivers lacks
  * several functions available on the chip, as :
- *  - block erase
- *  - page write
  *  - IPL write
  *  - ECC fixing (lack of BCH algorith understanding)
  *  - powerdown / powerup
@@ -1467,23 +1465,19 @@ static void __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
 		break;
 	}
 	mtd->type = MTD_NANDFLASH;
-	/*
-	 * Once write methods are added, the correct flags will be set.
-	 * mtd->flags = MTD_CAP_NANDFLASH;
-	 */
-	mtd->flags = MTD_CAP_ROM;
+	mtd->flags = MTD_CAP_NANDFLASH;
 	mtd->size = (docg3->max_block + 1) * DOC_LAYOUT_BLOCK_SIZE;
 	mtd->erasesize = DOC_LAYOUT_BLOCK_SIZE * DOC_LAYOUT_NBPLANES;
 	mtd->writesize = DOC_LAYOUT_PAGE_SIZE;
 	mtd->oobsize = DOC_LAYOUT_OOB_SIZE;
 	mtd->owner = THIS_MODULE;
-	mtd->erase = NULL;
+	mtd->erase = doc_erase;
 	mtd->point = NULL;
 	mtd->unpoint = NULL;
 	mtd->read = doc_read;
-	mtd->write = NULL;
+	mtd->write = doc_write;
 	mtd->read_oob = doc_read_oob;
-	mtd->write_oob = NULL;
+	mtd->write_oob = doc_write_oob;
 	mtd->sync = NULL;
 	mtd->block_isbad = doc_block_isbad;
 	mtd->ecclayout = &docg3_oobinfo;
-- 
1.7.5.4
