Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw1XH-0003fE-9s
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 03:23:00 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE005KS9DPNP70@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 12:22:37 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
In-reply-to: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
Subject: [PATCH 23/23] mtd: sh_flctl: Remove unnecessary OOM messages
Date: Thu, 26 Dec 2013 12:22:37 +0900
Message-id: <009a01cf01e9$b9b469d0$2d1d3d70$%han@samsung.com>
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
 drivers/mtd/nand/sh_flctl.c |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/sh_flctl.c b/drivers/mtd/nand/sh_flctl.c
index 1940bd1..d72783d 100644
--- a/drivers/mtd/nand/sh_flctl.c
+++ b/drivers/mtd/nand/sh_flctl.c
@@ -1058,10 +1058,8 @@ static struct sh_flctl_platform_data *flctl_parse_dt(struct device *dev)
 
 	pdata = devm_kzalloc(dev, sizeof(struct sh_flctl_platform_data),
 								GFP_KERNEL);
-	if (!pdata) {
-		dev_err(dev, "%s: failed to allocate config data\n", __func__);
+	if (!pdata)
 		return NULL;
-	}
 
 	/* set SoC specific options */
 	pdata->flcmncr_val = config->flcmncr_val;
@@ -1092,10 +1090,8 @@ static int flctl_probe(struct platform_device *pdev)
 	struct mtd_part_parser_data ppdata = {};
 
 	flctl = devm_kzalloc(&pdev->dev, sizeof(struct sh_flctl), GFP_KERNEL);
-	if (!flctl) {
-		dev_err(&pdev->dev, "failed to allocate driver data\n");
+	if (!flctl)
 		return -ENOMEM;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	flctl->reg = devm_ioremap_resource(&pdev->dev, res);
-- 
1.7.10.4
