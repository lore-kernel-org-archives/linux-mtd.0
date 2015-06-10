Received: from mail-wg0-x244.google.com ([2a00:1450:400c:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z2mnD-0000J0-Tt
 for linux-mtd@lists.infradead.org; Wed, 10 Jun 2015 20:40:12 +0000
Received: by wggx12 with SMTP id x12so8981210wgg.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Jun 2015 13:39:50 -0700 (PDT)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2 38/60] mtd: nand: lpc32xx_mlc: drop owner assignment
Date: Wed, 10 Jun 2015 22:38:52 +0200
Message-Id: <1433968754-10651-39-git-send-email-fransklaver@gmail.com>
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
 drivers/mtd/nand/lpc32xx_mlc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/lpc32xx_mlc.c b/drivers/mtd/nand/lpc32xx_mlc.c
index 79c3b78..65b7e03 100644
--- a/drivers/mtd/nand/lpc32xx_mlc.c
+++ b/drivers/mtd/nand/lpc32xx_mlc.c
@@ -682,7 +682,6 @@ static int lpc32xx_nand_probe(struct platform_device *pdev)
 
 	nand_chip->priv = host;		/* link the private data structures */
 	mtd->priv = nand_chip;
-	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = &pdev->dev;
 
 	/* Get NAND clock */
-- 
2.4.0
