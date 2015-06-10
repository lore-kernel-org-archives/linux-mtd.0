Received: from mail-wi0-x244.google.com ([2a00:1450:400c:c05::244])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mme-0003iZ-7n
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:36 +0000
Received: by wivz2 with SMTP id z2so11951932wiv.0
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:11 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 04/60] mtd: devices: docg3: show parent device in sysfs
Date: Wed, 10 Jun 2015 22:38:18 +0200
Message-Id: <1433968754-10651-5-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
References: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
Cc: linux-mtd@lists.infradead.org, Frans Klaver <fransklaver@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix a bug where mtd parent device symlinks aren't shown in sysfs.

While at it, make use of the default owner value set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/devices/docg3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 866d319..7697c58 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1841,7 +1841,6 @@ static void __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
 		mtd->erasesize /= 2;
 	mtd->writebufsize = mtd->writesize = DOC_LAYOUT_PAGE_SIZE;
 	mtd->oobsize = DOC_LAYOUT_OOB_SIZE;
-	mtd->owner = THIS_MODULE;
 	mtd->_erase = doc_erase;
 	mtd->_read = doc_read;
 	mtd->_write = doc_write;
@@ -1881,6 +1880,7 @@ doc_probe_device(struct docg3_cascade *cascade, int floor, struct device *dev)
 	if (!mtd)
 		goto nomem2;
 	mtd->priv = docg3;
+	mtd->dev.parent = dev;
 	bbt_nbpages = DIV_ROUND_UP(docg3->max_block + 1,
 				   8 * DOC_LAYOUT_PAGE_SIZE);
 	docg3->bbt = kzalloc(bbt_nbpages * DOC_LAYOUT_PAGE_SIZE, GFP_KERNEL);
-- 
2.4.0
