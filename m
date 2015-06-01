Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzWzp-0008Dy-DF
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2015 21:11:47 +0000
From: Richard Weinberger <richard@nod.at>
To: computersforpeace@gmail.com
Subject: [PATCH 5/6] mtd: docg3: Fix kasprintf() usage
Date: Mon,  1 Jun 2015 23:10:53 +0200
Message-Id: <1433193054-26865-6-git-send-email-richard@nod.at>
In-Reply-To: <1433193054-26865-1-git-send-email-richard@nod.at>
References: <1433193054-26865-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, maximlevitsky@gmail.com, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

kasprintf() does a dynamic memory allocation and can fail.
We have to handle that case.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/devices/docg3.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 486936b..5e67b4a 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1815,7 +1815,7 @@ static void doc_dbg_unregister(struct docg3 *docg3)
  * @chip_id: The chip ID of the supported chip
  * @mtd: The structure to fill
  */
-static void __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
+static int __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
 {
 	struct docg3 *docg3 = mtd->priv;
 	int cfg;
@@ -1828,6 +1828,8 @@ static void __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
 	case DOC_CHIPID_G3:
 		mtd->name = kasprintf(GFP_KERNEL, "docg3.%d",
 				      docg3->device_id);
+		if (!mtd->name)
+			return -ENOMEM;
 		docg3->max_block = 2047;
 		break;
 	}
@@ -1850,6 +1852,8 @@ static void __init doc_set_driver_info(int chip_id, struct mtd_info *mtd)
 	mtd->_block_isbad = doc_block_isbad;
 	mtd->ecclayout = &docg3_oobinfo;
 	mtd->ecc_strength = DOC_ECC_BCH_T;
+
+	return 0;
 }
 
 /**
@@ -1913,7 +1917,9 @@ doc_probe_device(struct docg3_cascade *cascade, int floor, struct device *dev)
 		goto nomem4;
 	}
 
-	doc_set_driver_info(chip_id, mtd);
+	ret = doc_set_driver_info(chip_id, mtd);
+	if (ret)
+		goto nomem4;
 
 	doc_hamming_ecc_init(docg3, DOC_LAYOUT_OOB_PAGEINFO_SZ);
 	doc_reload_bbt(docg3);
-- 
1.8.4.5
