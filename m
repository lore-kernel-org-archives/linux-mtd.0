Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YbJG5-0004Vg-V5
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2015 01:40:26 +0000
From: Michael Opdenacker <michael.opdenacker@free-electrons.com>
To: dwmw2@infradead.org,
	computersforpeace@gmail.com
Subject: [PATCH] mtd: hisilicon: remove deprecated IRQF_DISABLED
Date: Thu, 26 Mar 2015 18:39:53 -0700
Message-Id: <1427420393-28723-1-git-send-email-michael.opdenacker@free-electrons.com>
Cc: Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 wangzhou1@hisilicon.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, dan.carpenter@oracle.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This removes the use of the IRQF_DISABLED flag
from drivers/mtd/nand/hisi504_nand.c

It's a NOOP since 2.6.35.

Signed-off-by: Michael Opdenacker <michael.opdenacker@free-electrons.com>
---
 drivers/mtd/nand/hisi504_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/hisi504_nand.c b/drivers/mtd/nand/hisi504_nand.c
index 289ad3ac3e80..e39482441430 100644
--- a/drivers/mtd/nand/hisi504_nand.c
+++ b/drivers/mtd/nand/hisi504_nand.c
@@ -758,7 +758,7 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 
 	hisi_nfc_host_init(host);
 
-	ret = devm_request_irq(dev, irq, hinfc_irq_handle, IRQF_DISABLED,
+	ret = devm_request_irq(dev, irq, hinfc_irq_handle, 0,
 				"nandc", host);
 	if (ret) {
 		dev_err(dev, "failed to request IRQ\n");
-- 
2.1.0
