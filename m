Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzWzT-00087l-A6
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2015 21:11:26 +0000
From: Richard Weinberger <richard@nod.at>
To: computersforpeace@gmail.com
Subject: [PATCH 4/6] mtd: docg3: Don't leak docg3->bbt in error path
Date: Mon,  1 Jun 2015 23:10:52 +0200
Message-Id: <1433193054-26865-5-git-send-email-richard@nod.at>
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

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/devices/docg3.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index be5fb2b..486936b 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1900,7 +1900,7 @@ doc_probe_device(struct docg3_cascade *cascade, int floor, struct device *dev)
 
 	ret = 0;
 	if (chip_id != (u16)(~chip_id_inv)) {
-		goto nomem3;
+		goto nomem4;
 	}
 
 	switch (chip_id) {
@@ -1910,7 +1910,7 @@ doc_probe_device(struct docg3_cascade *cascade, int floor, struct device *dev)
 		break;
 	default:
 		doc_err("Chip id %04x is not a DiskOnChip G3 chip\n", chip_id);
-		goto nomem3;
+		goto nomem4;
 	}
 
 	doc_set_driver_info(chip_id, mtd);
@@ -1919,6 +1919,8 @@ doc_probe_device(struct docg3_cascade *cascade, int floor, struct device *dev)
 	doc_reload_bbt(docg3);
 	return mtd;
 
+nomem4:
+	kfree(docg3->bbt);
 nomem3:
 	kfree(mtd);
 nomem2:
-- 
1.8.4.5
