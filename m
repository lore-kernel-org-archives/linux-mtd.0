Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw1WN-0003dJ-9l
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 03:22:05 +0000
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE0088K9C4A830@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 12:21:40 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
In-reply-to: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
Subject: [PATCH 22/23] mtd: s3c2410: Remove unnecessary OOM messages
Date: Thu, 26 Dec 2013 12:21:39 +0900
Message-id: <009901cf01e9$977e2c70$c67a8550$%han@samsung.com>
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
 drivers/mtd/nand/s3c2410.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index d65cbe9..47fbd9a 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -919,7 +919,6 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (info == NULL) {
-		dev_err(&pdev->dev, "no memory for flash info\n");
 		err = -ENOMEM;
 		goto exit_error;
 	}
@@ -974,7 +973,6 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
 	size = nr_sets * sizeof(*info->mtds);
 	info->mtds = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
 	if (info->mtds == NULL) {
-		dev_err(&pdev->dev, "failed to allocate mtd storage\n");
 		err = -ENOMEM;
 		goto exit_error;
 	}
-- 
1.7.10.4
