Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw1Kr-0003It-Nu
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 03:10:10 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE000PX8SB3S50@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 12:09:47 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
In-reply-to: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
Subject: [PATCH 12/23] mtd: jz4740_nand: Remove unnecessary OOM messages
Date: Thu, 26 Dec 2013 12:09:47 +0900
Message-id: <008e01cf01e7$eeb387d0$cc1a9770$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/jz4740_nand.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
index a264b88..a2c804d 100644
--- a/drivers/mtd/nand/jz4740_nand.c
+++ b/drivers/mtd/nand/jz4740_nand.c
@@ -416,10 +416,8 @@ static int jz_nand_probe(struct platform_device *pdev)
 	uint8_t nand_maf_id = 0, nand_dev_id = 0;
 
 	nand = kzalloc(sizeof(*nand), GFP_KERNEL);
-	if (!nand) {
-		dev_err(&pdev->dev, "Failed to allocate device structure.\n");
+	if (!nand)
 		return -ENOMEM;
-	}
 
 	ret = jz_nand_ioremap_resource(pdev, "mmio", &nand->mem, &nand->base);
 	if (ret)
-- 
1.7.10.4
