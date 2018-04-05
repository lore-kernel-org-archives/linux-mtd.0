Received: from us-smtp-delivery-107.mimecast.com ([63.128.21.107])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f44T6-0002ss-TO
 for linux-mtd@lists.infradead.org; Thu, 05 Apr 2018 12:58:22 +0000
Subject: [PATCH v2] mtd: rawnand: tango: Fix struct clk memory leak
To: Boris Brezillon <boris.brezillon@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
CC: Xidong Wang <wangxidong_97@163.com>, Mans Rullgard <mans@mansr.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "Marc
 Gonzalez" <marc.w.gonzalez@free.fr>, linux-mtd
 <linux-mtd@lists.infradead.org>
References: <1522811151-18853-1-git-send-email-wangxidong_97@163.com>
 <20180404082807.0f211578@xps13> <20180404090710.4f74b5b4@bbrezillon>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <8cffd501-b83f-8140-9cc6-021fcd90e277@sigmadesigns.com>
Date: Thu, 5 Apr 2018 14:57:59 +0200
MIME-Version: 1.0
In-Reply-To: <20180404090710.4f74b5b4@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use devm_clk_get() to let Linux manage struct clk memory.

Fixes: 6956e2385a16 ("add tango NAND flash controller support")
Reported-by: Xidong Wang <wangxidong_97@163.com>
Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
Missing clk_prepare_enable() would be handled in a separate patch.
---
 drivers/mtd/nand/tango_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
index c5bee00b7f5e..76761b841f1f 100644
--- a/drivers/mtd/nand/tango_nand.c
+++ b/drivers/mtd/nand/tango_nand.c
@@ -643,7 +643,7 @@ static int tango_nand_probe(struct platform_device *pdev)
 
 	writel_relaxed(MODE_RAW, nfc->pbus_base + PBUS_PAD_MODE);
 
-	clk = clk_get(&pdev->dev, NULL);
+	clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
-- 
2.16.2
