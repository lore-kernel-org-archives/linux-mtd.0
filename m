Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aK1jQ-00049U-Ik
 for linux-mtd@lists.infradead.org; Fri, 15 Jan 2016 10:35:49 +0000
Received: by mail-wm0-x243.google.com with SMTP id l65so2124671wmf.3
 for <linux-mtd@lists.infradead.org>; Fri, 15 Jan 2016 02:35:32 -0800 (PST)
From: Romain Izard <romain.izard.pro@gmail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Josh Wu <rainyfeeling@outlook.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Yang Wenyou <Wenyou.Yang@atmel.com>,
 Romain Izard <romain.izard.pro@gmail.com>
Subject: [PATCH v2 3/8] mtd: atmel_nand: Use of_device_get_match_data
Date: Fri, 15 Jan 2016 11:34:57 +0100
Message-Id: <1452854102-6125-4-git-send-email-romain.izard.pro@gmail.com>
In-Reply-To: <1452854102-6125-1-git-send-email-romain.izard.pro@gmail.com>
References: <1452854102-6125-1-git-send-email-romain.izard.pro@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove the need for forward declaration and the risk for a null pointer
when accessing the private part of the compatible match table, by using
the newly introduced of_device_get_match_data function.

Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
---
v2: new patch

 drivers/mtd/nand/atmel_nand.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 6e548fc3ab7b..b5e2e62cd261 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1485,8 +1485,6 @@ static void atmel_nand_hwctl(struct mtd_info *mtd, int mode)
 		ecc_writel(host->ecc, CR, ATMEL_ECC_RST);
 }
 
-static const struct of_device_id atmel_nand_dt_ids[];
-
 static int atmel_of_init_port(struct atmel_nand_host *host,
 			      struct device_node *np)
 {
@@ -1497,7 +1495,7 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
 	enum of_gpio_flags flags = 0;
 
 	host->caps = (struct atmel_nand_caps *)
-		of_match_device(atmel_nand_dt_ids, host->dev)->data;
+		of_device_get_match_data(host->dev);
 
 	if (of_property_read_u32(np, "atmel,nand-addr-offset", &val) == 0) {
 		if (val >= 32) {
-- 
2.5.0
