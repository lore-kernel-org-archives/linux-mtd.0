Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WBI9F-0003N5-3o
 for linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 06:09:18 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0K00F3692U65D0@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 06 Feb 2014 15:08:54 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <000201cf2301$b168d250$143a76f0$%han@samsung.com>
In-reply-to: <000201cf2301$b168d250$143a76f0$%han@samsung.com>
Subject: [PATCH 1/8] mtd: devices: elm: Remove unnecessary OOM messages
Date: Thu, 06 Feb 2014 15:08:53 +0900
Message-id: <000301cf2301$e987e310$bc97a930$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>, "'Gupta, Pekon'" <pekon@ti.com>,
 'Philip Avinash' <avinashphilip@ti.com>
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
 drivers/mtd/devices/elm.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
index d1dd6a3..437ed3a 100644
--- a/drivers/mtd/devices/elm.c
+++ b/drivers/mtd/devices/elm.c
@@ -354,10 +354,8 @@ static int elm_probe(struct platform_device *pdev)
 	struct elm_info *info;
 
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
-	if (!info) {
-		dev_err(&pdev->dev, "failed to allocate memory\n");
+	if (!info)
 		return -ENOMEM;
-	}
 
 	info->dev = &pdev->dev;
 
-- 
1.7.10.4
