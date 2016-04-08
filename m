From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Wan ZongShun <mcuos.com@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/NUVOTON W90X900 ARM
 ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/8] mtd: nand: nuc900: set ECC algorithm explicitly
Date: Fri,  8 Apr 2016 12:23:47 +0200
Message-Id: <1460111031-8706-5-git-send-email-zajec5@gmail.com>
In-Reply-To: <1460111031-8706-1-git-send-email-zajec5@gmail.com>
References: <1460111031-8706-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is part of process deprecating NAND_ECC_SOFT_BCH (and switching to
enum nand_ecc_algo).

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/nuc900_nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/nuc900_nand.c b/drivers/mtd/nand/nuc900_nand.c
index dbc5b57..8f64011 100644
--- a/drivers/mtd/nand/nuc900_nand.c
+++ b/drivers/mtd/nand/nuc900_nand.c
@@ -261,6 +261,7 @@ static int nuc900_nand_probe(struct platform_device *pdev)
 	chip->chip_delay	= 50;
 	chip->options		= 0;
 	chip->ecc.mode		= NAND_ECC_SOFT;
+	chip->ecc.algo		= NAND_ECC_HAMMING;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	nuc900_nand->reg = devm_ioremap_resource(&pdev->dev, res);
-- 
1.8.4.5
