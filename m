Received: from mail-la0-x22e.google.com ([2a00:1450:4010:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcDDR-00033j-TR
 for linux-mtd@lists.infradead.org; Tue, 14 May 2013 11:16:22 +0000
Received: by mail-la0-f46.google.com with SMTP id fk20so382659lab.5
 for <linux-mtd@lists.infradead.org>; Tue, 14 May 2013 04:15:59 -0700 (PDT)
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 3/5] mtd: nand: pxa3xx: Fix MODULE_DEVICE_TABLE declaration
Date: Tue, 14 May 2013 08:15:23 -0300
Message-Id: <1368530125-12959-4-git-send-email-elezegarcia@gmail.com>
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

This module's device table is incorrectly declared using
i2c_pxa_dt_ids, instead of pxa3xx_nand_dt_ids.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/pxa3xx_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 8386e9a..e4e697f 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1185,7 +1185,7 @@ static struct of_device_id pxa3xx_nand_dt_ids[] = {
 	{ .compatible = "marvell,pxa3xx-nand" },
 	{}
 };
-MODULE_DEVICE_TABLE(of, i2c_pxa_dt_ids);
+MODULE_DEVICE_TABLE(of, pxa3xx_nand_dt_ids);
 
 static int pxa3xx_nand_probe_dt(struct platform_device *pdev)
 {
-- 
1.8.1.5
