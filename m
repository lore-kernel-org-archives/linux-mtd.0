Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw1Bg-0002w7-F2
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 03:00:41 +0000
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE007XC8CGMX20@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 12:00:16 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
In-reply-to: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
Subject: [PATCH 01/23] mtd: atmel_nand: Remove unnecessary OOM messages
Date: Thu, 26 Dec 2013 12:00:16 +0900
Message-id: <008301cf01e6$9a679820$cf36c860$%han@samsung.com>
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

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/atmel_nand.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 59f08c4..e633c44 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1961,10 +1961,8 @@ static int atmel_nand_probe(struct platform_device *pdev)
 
 	/* Allocate memory for the device structure (and zero it) */
 	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
-	if (!host) {
-		printk(KERN_ERR "atmel_nand: failed to allocate device structure.\n");
+	if (!host)
 		return -ENOMEM;
-	}
 
 	res = platform_driver_register(&atmel_nand_nfc_driver);
 	if (res)
-- 
1.7.10.4
