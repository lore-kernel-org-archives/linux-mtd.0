Received: from mailout1.samsung.com ([203.254.224.24])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhxYs-0004N7-Ox
 for linux-mtd@lists.infradead.org; Wed, 07 May 2014 08:50:47 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N57001294JZ2X70@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Wed, 07 May 2014 17:50:23 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <021e01cf69d0$e89e8290$b9db87b0$%han@samsung.com>
In-reply-to: <021e01cf69d0$e89e8290$b9db87b0$%han@samsung.com>
Subject: [PATCH 3/3] mtd: orion_nand: Make of_device_id array const
Date: Wed, 07 May 2014 17:50:23 +0900
Message-id: <022001cf69d1$624bcd50$26e367f0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>, 'Andrew Lunn' <andrew@lunn.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Make of_device_id array const, because all OF functions
handle it as const.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/orion_nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/orion_nand.c b/drivers/mtd/nand/orion_nand.c
index dd7fe81..471b4df 100644
--- a/drivers/mtd/nand/orion_nand.c
+++ b/drivers/mtd/nand/orion_nand.c
@@ -214,7 +214,7 @@ static int orion_nand_remove(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_OF
-static struct of_device_id orion_nand_of_match_table[] = {
+static const struct of_device_id orion_nand_of_match_table[] = {
 	{ .compatible = "marvell,orion-nand", },
 	{},
 };
-- 
1.7.10.4
