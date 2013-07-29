Received: from [94.23.35.102] (helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V3woK-000395-Vx
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2013 23:25:07 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 05/13] mtd: nand: pxa3xx: Add a local loop variable
Date: Mon, 29 Jul 2013 20:24:15 -0300
Message-Id: <1375140263-2028-6-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1375140263-2028-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, leiwen@marvell.com,
 haojian.zhuang@gmail.com, zonque@gmail.com, eric.miao@marvell.com,
 grinberg@compulab.co.il, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 computersforpeace@gmail.com, David Woodhouse <dwmw2@infradead.org>,
 Willy Tarreau <w@1wt.eu>, nikita@compulab.co.il
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
index 0b73a58..7c14fc2 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1279,8 +1279,9 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 	info = platform_get_drvdata(pdev);
 	probe_success = 0;
 	for (cs = 0; cs < pdata->num_cs; cs++) {
+		struct mtd_info *mtd = info->host[cs]->mtd;
 		info->cs = cs;
-		ret = pxa3xx_nand_scan(info->host[cs]->mtd);
+		ret = pxa3xx_nand_scan(mtd);
 		if (ret) {
 			dev_warn(&pdev->dev, "failed to scan nand at cs %d\n",
 				cs);
@@ -1288,7 +1289,7 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 		}
 
 		ppdata.of_node = pdev->dev.of_node;
-		ret = mtd_device_parse_register(info->host[cs]->mtd, NULL,
+		ret = mtd_device_parse_register(mtd, NULL,
 						&ppdata, pdata->parts[cs],
 						pdata->nr_parts[cs]);
 		if (!ret)
-- 
1.8.1.5
