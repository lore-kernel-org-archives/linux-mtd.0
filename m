Received: from mail-la0-x22f.google.com ([2a00:1450:4010:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcDDM-00033i-8O
 for linux-mtd@lists.infradead.org; Tue, 14 May 2013 11:16:16 +0000
Received: by mail-la0-f47.google.com with SMTP id fq12so382179lab.6
 for <linux-mtd@lists.infradead.org>; Tue, 14 May 2013 04:15:53 -0700 (PDT)
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/5] mtd: nand: pxa3xx: Use of_machine_is_compatible()
Date: Tue, 14 May 2013 08:15:22 -0300
Message-Id: <1368530125-12959-3-git-send-email-elezegarcia@gmail.com>
In-Reply-To: <1368530125-12959-1-git-send-email-elezegarcia@gmail.com>
References: <1368530125-12959-1-git-send-email-elezegarcia@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Lei Wen <leiwen@marvell.com>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Maen Suleiman <maen@marvell.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Neil Zhang <zhangwm@marvell.com>, Chao Xie <cxie4@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

This patch replaces cpu_is_pxa3xx() with of_machine_is_compatible()
which allows to build this driver for other platforms than ARCH_PXA.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index cef1eeb..8386e9a 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1094,7 +1094,7 @@ static int alloc_nand_resource(struct platform_device *pdev)
 	 * bindings. It can be removed once we have a prober DMA controller
 	 * framework for DT.
 	 */
-	if (pdev->dev.of_node && cpu_is_pxa3xx()) {
+	if (pdev->dev.of_node && of_machine_is_compatible("marvell,pxa3xx")) {
 		info->drcmr_dat = 97;
 		info->drcmr_cmd = 99;
 	} else {
-- 
1.8.1.5
