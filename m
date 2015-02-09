Received: from mail-qg0-x233.google.com ([2607:f8b0:400d:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKvnW-0008Ck-Am
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 21:23:15 +0000
Received: by mail-qg0-f51.google.com with SMTP id z60so19820249qgd.10
 for <linux-mtd@lists.infradead.org>; Mon, 09 Feb 2015 13:22:52 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH] mtd: nand: gpmi: Check for scan_bbt() error
Date: Mon,  9 Feb 2015 19:22:33 -0200
Message-Id: <1423516953-22938-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org,
 shijie8@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

In case of scan_bbt() failure, we should better propagate it.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 33f3c3c..8ce8bb2 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1950,7 +1950,9 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	ret = nand_boot_init(this);
 	if (ret)
 		goto err_out;
-	chip->scan_bbt(mtd);
+	ret = chip->scan_bbt(mtd);
+	if (ret)
+		goto err_out;
 
 	ppdata.of_node = this->pdev->dev.of_node;
 	ret = mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
-- 
1.9.1
