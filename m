Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBIAS-0003Pn-RQ
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 06:10:33 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0K00GHG94YQYB0@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 15:10:11 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <000201cf2301$b168d250$143a76f0$%han@samsung.com>
In-reply-to: <000201cf2301$b168d250$143a76f0$%han@samsung.com>
Subject: [PATCH 2/8] mtd: spear_smi: Remove unnecessary OOM messages
Date: Thu, 06 Feb 2014 15:10:10 +0900
Message-id: <000401cf2302$1768bac0$463a3040$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Viresh Kumar' <viresh.kumar@linaro.org>
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
 drivers/mtd/devices/spear_smi.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mtd/devices/spear_smi.c b/drivers/mtd/devices/spear_smi.c
index 4238214..363da96 100644
--- a/drivers/mtd/devices/spear_smi.c
+++ b/drivers/mtd/devices/spear_smi.c
@@ -913,7 +913,6 @@ static int spear_smi_probe(struct platform_device *pdev)
 	if (np) {
 		pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
 		if (!pdata) {
-			pr_err("%s: ERROR: no memory", __func__);
 			ret = -ENOMEM;
 			goto err;
 		}
@@ -943,7 +942,6 @@ static int spear_smi_probe(struct platform_device *pdev)
 	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_ATOMIC);
 	if (!dev) {
 		ret = -ENOMEM;
-		dev_err(&pdev->dev, "mem alloc fail\n");
 		goto err;
 	}
 
-- 
1.7.10.4
