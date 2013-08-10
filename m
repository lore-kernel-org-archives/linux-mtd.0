Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8Ex4-0002Yl-Dn
 for linux-mtd@lists.infradead.org; Sat, 10 Aug 2013 19:35:51 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 01/15] mtd: nand: pxa3xx: Remove unneeded ifdef CONFIG_OF
Date: Sat, 10 Aug 2013 16:34:51 -0300
Message-Id: <1376163305-5591-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1376163305-5591-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1376163305-5591-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
 devicetree@vger.kernel.org,
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

There's no need to enclose this code within idef CONFIG_OF,
because the OF framework provides no-op stubs if CONFIG_OF=n.

Cc: devicetree@vger.kernel.org
Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 501e380..02f214d 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1190,7 +1190,6 @@ static int pxa3xx_nand_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_OF
 static struct of_device_id pxa3xx_nand_dt_ids[] = {
 	{ .compatible = "marvell,pxa3xx-nand" },
 	{}
@@ -1221,12 +1220,6 @@ static int pxa3xx_nand_probe_dt(struct platform_device *pdev)
 
 	return 0;
 }
-#else
-static inline int pxa3xx_nand_probe_dt(struct platform_device *pdev)
-{
-	return 0;
-}
-#endif
 
 static int pxa3xx_nand_probe(struct platform_device *pdev)
 {
-- 
1.8.1.5
