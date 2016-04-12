Received: from mail-am1on0074.outbound.protection.outlook.com ([157.56.112.74]
 helo=emea01-am1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aq6Qt-0000y4-Jq
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2016 22:05:17 +0000
From: Han Xu <han.xu@nxp.com>
To: <han.xu@nxp.com>, <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: nand: gpmi: get correct free oob space
Date: Tue, 12 Apr 2016 17:06:33 -0500
Message-ID: <1460498793-19431-1-git-send-email-han.xu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

change the way to calculate pagesize to get correct free oob space for
legacy_set_geometry function.

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 316b5ac..bda77a9 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -319,7 +319,8 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
 		return -EINVAL;
 	}
 
-	geo->page_size = mtd->writesize + mtd->oobsize;
+	geo->page_size = mtd->writesize + geo->metadata_size +
+		(geo->gf_len * geo->ecc_strength * geo->ecc_chunk_count) / 8;
 	geo->payload_size = mtd->writesize;
 
 	/*
-- 
1.9.1
