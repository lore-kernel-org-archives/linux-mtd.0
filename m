Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSuaH-00077M-Tq
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 21:42:35 +0000
Received: by wiwh11 with SMTP id h11so26268545wiw.3
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 13:42:15 -0800 (PST)
From: Frans Klaver <fransklaver@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 38/60] mtd: nand: lpc32xx_mlc: drop owner assignment
Date: Tue,  3 Mar 2015 22:40:22 +0100
Message-Id: <1425418844-25177-39-git-send-email-fransklaver@gmail.com>
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
2.2.2
