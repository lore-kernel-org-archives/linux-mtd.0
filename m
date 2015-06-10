Received: from mail-wg0-x241.google.com ([2a00:1450:400c:c00::241])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mn0-0003jL-5q
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:39:59 +0000
Received: by wggy19 with SMTP id y19so8967432wgg.2
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:37 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 26/60] mtd: nand: cafe_nand: drop owner assignment
Date: Wed, 10 Jun 2015 22:38:40 +0200
Message-Id: <1433968754-10651-27-git-send-email-fransklaver@gmail.com>
In-Reply-To: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
References: <1433968754-10651-1-git-send-email-fransklaver@gmail.com>
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
2.4.0
