Received: from mail-wi0-f172.google.com ([209.85.212.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuaA-0003EX-Gw
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:27 +0000
Received: by wiwl15 with SMTP id l15so26122676wiw.3
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:04 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 26/60] mtd: nand: cafe_nand: drop owner assignment
Date: Tue,  3 Mar 2015 22:40:10 +0100
Message-Id: <1425418844-25177-27-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
Cc: linux-mtd@lists.infradead.org, Frans Klaver <fransklaver@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Owner is automatically set by mtdcore. Make use of that.

Signed-off-by: Frans Klaver <fransklaver@gmail.com>
---
 drivers/mtd/nand/cafe_nand.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
index 9a0f45f..aa1dc55 100644
--- a/drivers/mtd/nand/cafe_nand.c
+++ b/drivers/mtd/nand/cafe_nand.c
@@ -604,7 +604,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 
 	mtd->dev.parent = &pdev->dev;
 	mtd->priv = cafe;
-	mtd->owner = THIS_MODULE;
 
 	cafe->pdev = pdev;
 	cafe->mmio = pci_iomap(pdev, 0, 0);
-- 
2.2.2
