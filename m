Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw1Oy-0003Pm-9P
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 03:14:25 +0000
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE0081S8ZC3X30@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 12:14:00 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
In-reply-to: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
Subject: [PATCH 15/23] mtd: davinci_nand: Remove unnecessary OOM messages
Date: Thu, 26 Dec 2013 12:13:59 +0900
Message-id: <009101cf01e8$8532c090$8f9841b0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Grygorii Strashko' <grygorii.strashko@ti.com>,
 'Jingoo Han' <jg1.han@samsung.com>, 'Taras Kondratiuk' <taras@ti.com>,
 linux-mtd@lists.infradead.org, 'Ivan Khoronzhuk' <ivan.khoronzhuk@ti.com>,
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
 drivers/mtd/nand/davinci_nand.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 0104d26..a4989ec 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -619,10 +619,8 @@ static int nand_davinci_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
-	if (!info) {
-		dev_err(&pdev->dev, "unable to allocate memory\n");
+	if (!info)
 		return -ENOMEM;
-	}
 
 	platform_set_drvdata(pdev, info);
 
-- 
1.7.10.4
