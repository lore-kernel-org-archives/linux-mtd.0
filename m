Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbSSz-00041V-85
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 09:53:33 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-omap@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
Subject: [PATCH 1/1] mtd: nand: omap2: Fix device detection path
Date: Wed, 30 Oct 2013 06:53:08 -0300
Message-Id: <1383126788-27426-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1383126788-27426-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1383126788-27426-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: marek.belisko@gmail.com,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Pekon Gupta <pekon@ti.com>,
 Felipe Balbi <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Because the device bus can be 8-bit or 16-bit width, yet ONFI detection
cannot work in 16-bit mode, we need to set the NAND_BUSWIDTH_AUTO option
which allows proper initialization configuration.

Once the bus width is detected, nand_scan_ident() updates the nand_chip struct
'option' field to use the appropriate read/write functions and configure
the ECC engine.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/omap2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index ec40b8d..c71206b 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1662,7 +1662,7 @@ static int omap_nand_probe(struct platform_device *pdev)
 	mtd->owner		= THIS_MODULE;
 	nand_chip		= &info->nand;
 	nand_chip->ecc.priv	= NULL;
-	nand_chip->options	|= NAND_SKIP_BBTSCAN;
+	nand_chip->options	|= NAND_SKIP_BBTSCAN | NAND_BUSWIDTH_AUTO;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (res == NULL) {
@@ -1708,7 +1708,6 @@ static int omap_nand_probe(struct platform_device *pdev)
 	}
 
 	/* scan NAND device connected to chip controller */
-	nand_chip->options |= pdata->devsize & NAND_BUSWIDTH_16;
 	if (nand_scan_ident(mtd, 1, NULL)) {
 		pr_err("nand device scan failed, may be bus-width mismatch\n");
 		err = -ENXIO;
-- 
1.8.1.5
