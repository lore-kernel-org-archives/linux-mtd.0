Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzgOB-0005ER-Ei
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 07:45:49 +0000
Received: by wmec201 with SMTP id c201so9814453wme.1
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 23:45:25 -0800 (PST)
From: LABBE Corentin <clabbe.montjoie@gmail.com>
To: computersforpeace@gmail.com,
	dwmw2@infradead.org,
	josh.wu@atmel.com
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/2] mtd: nand: atmel_nand: fix a possible NULL dereference
Date: Fri, 20 Nov 2015 08:45:17 +0100
Message-Id: <1448005517-26004-3-git-send-email-clabbe.montjoie@gmail.com>
In-Reply-To: <1448005517-26004-1-git-send-email-clabbe.montjoie@gmail.com>
References: <1448005517-26004-1-git-send-email-clabbe.montjoie@gmail.com>
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
 drivers/mtd/nand/atmel_nand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 475c938..7902967 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1496,8 +1496,9 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
 	struct atmel_nand_data *board = &host->board;
 	enum of_gpio_flags flags = 0;
 
-	host->caps = (struct atmel_nand_caps *)
-		of_match_device(atmel_nand_dt_ids, host->dev)->data;
+	host->caps = of_device_get_match_data(host->dev);
+	if (!host->caps)
+		return 1;
 
 	if (of_property_read_u32(np, "atmel,nand-addr-offset", &val) == 0) {
 		if (val >= 32) {
-- 
2.4.10
