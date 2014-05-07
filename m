Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhxXm-00039s-4Y
 for linux-mtd@lists.infradead.org; Wed, 07 May 2014 08:49:38 +0000
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5700KGG4I23C30@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Wed, 07 May 2014 17:49:14 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <021e01cf69d0$e89e8290$b9db87b0$%han@samsung.com>
In-reply-to: <021e01cf69d0$e89e8290$b9db87b0$%han@samsung.com>
Subject: [PATCH 2/3] mtd: nand: pxa3xx: Make of_device_id array const
Date: Wed, 07 May 2014 17:49:13 +0900
Message-id: <021f01cf69d1$38d99a60$aa8ccf20$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>, 'Jason Cooper' <jason@lakedaemon.net>,
 'Ezequiel Garcia' <ezequiel.garcia@free-electrons.com>
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
 drivers/mtd/nand/pxa3xx_nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 7588fe2..940e6c7 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -337,7 +337,7 @@ static struct nand_ecclayout ecc_layout_4KB_bch8bit = {
 /* convert nano-seconds to nand flash controller clock cycles */
 #define ns2cycle(ns, clk)	(int)((ns) * (clk / 1000000) / 1000)
 
-static struct of_device_id pxa3xx_nand_dt_ids[] = {
+static const struct of_device_id pxa3xx_nand_dt_ids[] = {
 	{
 		.compatible = "marvell,pxa3xx-nand",
 		.data       = (void *)PXA3XX_NAND_VARIANT_PXA,
-- 
1.7.10.4
