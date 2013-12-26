Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw1fM-0003m5-OA
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 03:31:22 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE0086P9RM3X40@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 12:30:58 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <009b01cf01ea$bac213d0$30463b70$%han@samsung.com>
In-reply-to: <009b01cf01ea$bac213d0$30463b70$%han@samsung.com>
Subject: [PATCH V2 1/4] mtd: atmel_nand: use dev_err() instead of printk()
Date: Thu, 26 Dec 2013 12:30:58 +0900
Message-id: <009c01cf01ea$e48f10f0$adad32d0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>, 'Josh Wu' <josh.wu@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use dev_err() instead of printk() to provide a better message
to userspace.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
Change since v1
- Remove the site-specific OOM messages.

 drivers/mtd/nand/atmel_nand.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index e633c44..c36e9b8 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -2060,14 +2060,14 @@ static int atmel_nand_probe(struct platform_device *pdev)
 		}
 
 		if (gpio_get_value(host->board.det_pin)) {
-			printk(KERN_INFO "No SmartMedia card inserted.\n");
+			dev_info(&pdev->dev, "No SmartMedia card inserted.\n");
 			res = -ENXIO;
 			goto err_no_card;
 		}
 	}
 
 	if (host->board.on_flash_bbt || on_flash_bbt) {
-		printk(KERN_INFO "atmel_nand: Use On Flash BBT\n");
+		dev_info(&pdev->dev, "Use On Flash BBT\n");
 		nand_chip->bbt_options |= NAND_BBT_USE_FLASH;
 	}
 
-- 
1.7.10.4
