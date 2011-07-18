Received: from mail.df.lth.se ([194.47.250.12])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QilUP-0004zH-Cm
	for linux-mtd@lists.infradead.org; Mon, 18 Jul 2011 10:55:57 +0000
From: Linus Walleij <linus.walleij@linaro.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd/fsmc_nand: fix build error
Date: Mon, 18 Jul 2011 12:55:39 +0200
Message-Id: <1310986539-458-1-git-send-email-linus.walleij@linaro.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Recent -next does not build due to malformed code, so just fix it.

Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Dmitry can you check that I fixed this the right way?
---
 drivers/mtd/nand/fsmc_nand.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 8cc8065..e53b760 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -719,7 +719,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 				partition_info_128KB_blk,
 			host->mtd.size <= 0x04000000 ?
 				ARRAY_SIZE(partition_info_16KB_blk) :
-				ARRAY_SIZE(partition_info_128KB_blk),
+				ARRAY_SIZE(partition_info_128KB_blk));
 	if (ret)
 		goto err_probe;
 
-- 
1.7.6
