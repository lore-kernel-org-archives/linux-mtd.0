Received: from mail-px0-f175.google.com ([209.85.212.175])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSOu2-00007V-QT
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 07:34:43 +0000
Received: by pxi17 with SMTP id 17so918423pxi.20
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 00:34:39 -0700 (PDT)
Subject: [PATCH] mtd: pxa3xx_nand: remove unused variable 'mtd'
From: Axel Lin <axel.lin@gmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 15:34:33 +0800
Message-ID: <1307086473.7474.1.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Eric Miao <eric.y.miao@gmail.com>,
	Haojian Zhuang <haojian.zhuang@marvell.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove unused variable 'mtd' to eliminate below warning.

  CC      drivers/mtd/nand/pxa3xx_nand.o
drivers/mtd/nand/pxa3xx_nand.c: In function 'pxa3xx_nand_suspend':
drivers/mtd/nand/pxa3xx_nand.c:1167: warning: unused variable 'mtd'
drivers/mtd/nand/pxa3xx_nand.c: In function 'pxa3xx_nand_resume':
drivers/mtd/nand/pxa3xx_nand.c:1180: warning: unused variable 'mtd'

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/mtd/nand/pxa3xx_nand.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 1fb3b3a..5cae8ae 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1164,7 +1164,6 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 static int pxa3xx_nand_suspend(struct platform_device *pdev, pm_message_t state)
 {
 	struct pxa3xx_nand_info *info = platform_get_drvdata(pdev);
-	struct mtd_info *mtd = info->mtd;
 
 	if (info->state) {
 		dev_err(&pdev->dev, "driver busy, state = %d\n", info->state);
@@ -1177,7 +1176,6 @@ static int pxa3xx_nand_suspend(struct platform_device *pdev, pm_message_t state)
 static int pxa3xx_nand_resume(struct platform_device *pdev)
 {
 	struct pxa3xx_nand_info *info = platform_get_drvdata(pdev);
-	struct mtd_info *mtd = info->mtd;
 
 	nand_writel(info, NDTR0CS0, info->ndtr0cs0);
 	nand_writel(info, NDTR1CS0, info->ndtr1cs0);
-- 
1.7.4.1
