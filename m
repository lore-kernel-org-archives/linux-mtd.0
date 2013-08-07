Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V72uc-0006oF-EU
 for linux-mtd@lists.infradead.org; Wed, 07 Aug 2013 12:32:24 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 07/14] mtd: nand: pxa3xx: Remove hardcoded mtd name
Date: Wed,  7 Aug 2013 09:31:12 -0300
Message-Id: <1375878679-18098-8-git-send-email-ezequiel.garcia@free-electrons.com>
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

There's no advantage in using a hardcoded name for the mtd device.
Instead use the provided by the platform_device.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index f5626c3..122e77c 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -244,8 +244,6 @@ static struct pxa3xx_nand_flash builtin_flash_types[] = {
 /* Define a default flash type setting serve as flash detecting only */
 #define DEFAULT_FLASH_TYPE (&builtin_flash_types[0])
 
-const char *mtd_names[] = {"pxa3xx_nand-0", "pxa3xx_nand-1", NULL};
-
 #define NDTR0_tCH(c)	(min((c), 7) << 19)
 #define NDTR0_tCS(c)	(min((c), 7) << 16)
 #define NDTR0_tWH(c)	(min((c), 7) << 11)
@@ -1082,8 +1080,6 @@ KEEP_CONFIG:
 		host->row_addr_cycles = 3;
 	else
 		host->row_addr_cycles = 2;
-
-	mtd->name = mtd_names[0];
 	return nand_scan_tail(mtd);
 }
 
@@ -1319,6 +1315,8 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 	probe_success = 0;
 	for (cs = 0; cs < pdata->num_cs; cs++) {
 		struct mtd_info *mtd = info->host[cs]->mtd;
+
+		mtd->name = pdev->name;
 		info->cs = cs;
 		ret = pxa3xx_nand_scan(mtd);
 		if (ret) {
-- 
1.8.1.5
