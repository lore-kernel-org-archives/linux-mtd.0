Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwmdv-0000JC-Ki
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 07:50:04 +0000
Received: by wmvv187 with SMTP id v187so19338221wmv.1
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 23:49:42 -0800 (PST)
From: LABBE Corentin <clabbe.montjoie@gmail.com>
To: computersforpeace@gmail.com,
	dwmw2@infradead.org,
	josh.wu@atmel.com
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: atmel_nand: fix a possible NULL dereference
Date: Thu, 12 Nov 2015 08:49:39 +0100
Message-Id: <1447314579-31374-1-git-send-email-clabbe.montjoie@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

of_match_device could return NULL, and so cause a NULL pointer
dereference later.

Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
---
 drivers/mtd/nand/atmel_nand.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 475c938..f3cf68b 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1495,9 +1495,12 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
 	int ecc_mode;
 	struct atmel_nand_data *board = &host->board;
 	enum of_gpio_flags flags = 0;
+	const struct of_device_id *of_id;
 
-	host->caps = (struct atmel_nand_caps *)
-		of_match_device(atmel_nand_dt_ids, host->dev)->data;
+	of_id = of_match_device(atmel_nand_dt_ids, host->dev);
+	if (!of_id)
+		return -ENODEV;
+	host->caps = of_id->data;
 
 	if (of_property_read_u32(np, "atmel,nand-addr-offset", &val) == 0) {
 		if (val >= 32) {
-- 
2.4.10
