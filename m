Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtvGz-00025H-B3
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 08:17:31 +0000
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MY300NGUJ0H3370@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 17:17:05 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
Subject: [PATCH 1/4] mtd: atmel_nand: use dev_err() instead of printk()
Date: Fri, 20 Dec 2013 17:17:04 +0900
Message-id: <001701cefd5b$de189f90$9a49deb0$%han@samsung.com>
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
 drivers/mtd/nand/atmel_nand.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 59f08c4..354ca6d 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1962,7 +1962,7 @@ static int atmel_nand_probe(struct platform_device *pdev)
 	/* Allocate memory for the device structure (and zero it) */
 	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
 	if (!host) {
-		printk(KERN_ERR "atmel_nand: failed to allocate device structure.\n");
+		dev_err(&pdev->dev, "atmel_nand: failed to allocate device structure.\n");
 		return -ENOMEM;
 	}
 
@@ -2062,14 +2062,14 @@ static int atmel_nand_probe(struct platform_device *pdev)
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
+		dev_info(&pdev->dev, "atmel_nand: Use On Flash BBT\n");
 		nand_chip->bbt_options |= NAND_BBT_USE_FLASH;
 	}
 
-- 
1.7.10.4
