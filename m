Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V72uX-0006nI-Ep
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 12:32:18 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 06/14] mtd: nand: pxa3xx: Add a local loop variable
Date: Wed,  7 Aug 2013 09:31:11 -0300
Message-Id: <1375878679-18098-7-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1375878679-18098-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1375878679-18098-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Artem Bityutskiy <dedekind1@gmail.com>,
 Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is just a cosmetic change, to make the code more readable.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index d1e8ddb3..f5626c3 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1318,8 +1318,9 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 	info->variant = pxa3xx_nand_get_variant(pdev);
 	probe_success = 0;
 	for (cs = 0; cs < pdata->num_cs; cs++) {
+		struct mtd_info *mtd = info->host[cs]->mtd;
 		info->cs = cs;
-		ret = pxa3xx_nand_scan(info->host[cs]->mtd);
+		ret = pxa3xx_nand_scan(mtd);
 		if (ret) {
 			dev_warn(&pdev->dev, "failed to scan nand at cs %d\n",
 				cs);
@@ -1327,7 +1328,7 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 		}
 
 		ppdata.of_node = pdev->dev.of_node;
-		ret = mtd_device_parse_register(info->host[cs]->mtd, NULL,
+		ret = mtd_device_parse_register(mtd, NULL,
 						&ppdata, pdata->parts[cs],
 						pdata->nr_parts[cs]);
 		if (!ret)
-- 
1.8.1.5
