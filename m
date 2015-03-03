Received: from mail-we0-x22e.google.com ([2a00:1450:400c:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuZq-00037e-8V
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:08 +0000
Received: by wesw62 with SMTP id w62so42579348wes.9
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:41:44 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 04/60] mtd: devices: docg3: show device in sysfs
Date: Tue,  3 Mar 2015 22:39:48 +0100
Message-Id: <1425418844-25177-5-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
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

Fix a bug where mtd devices aren't shown in sysfs.

While at it, make use of the default owner value set by mtdcore.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/devices/docg3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 448ce42..dd851d6 100644
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
2.2.2
