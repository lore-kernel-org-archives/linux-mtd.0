Received: from mailout4.samsung.com ([203.254.224.34])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw1GD-00037K-AM
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 03:05:22 +0000
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE001YX8KA5630@mailout4.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 12:04:58 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
In-reply-to: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
Subject: [PATCH 06/23] mtd: cafe_nand: Remove unnecessary OOM messages
Date: Thu, 26 Dec 2013 12:04:58 +0900
Message-id: <008801cf01e7$42768350$c76389f0$%han@samsung.com>
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
 drivers/mtd/nand/cafe_nand.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index c34985a..f2f64ad 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -640,10 +640,8 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	pci_set_master(pdev);
 
 	mtd = kzalloc(sizeof(*mtd) + sizeof(struct cafe_priv), GFP_KERNEL);
-	if (!mtd) {
-		dev_warn(&pdev->dev, "failed to alloc mtd_info\n");
+	if (!mtd)
 		return  -ENOMEM;
-	}
 	cafe = (void *)(&mtd[1]);
 
 	mtd->dev.parent = &pdev->dev;
-- 
1.7.10.4
