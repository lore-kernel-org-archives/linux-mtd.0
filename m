Received: from mail-lb0-x234.google.com ([2a00:1450:4010:c04::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aoTaX-00014w-HI
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2016 10:24:30 +0000
Received: by mail-lb0-x234.google.com with SMTP id u8so66605732lbk.0
 for <linux-mtd@lists.infradead.org>; Fri, 08 Apr 2016 03:24:09 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/8] mtd: nand: gpio: set ECC algorithm explicitly
Date: Fri,  8 Apr 2016 12:23:45 +0200
Message-Id: <1460111031-8706-3-git-send-email-zajec5@gmail.com>
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
 drivers/mtd/nand/gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/gpio.c b/drivers/mtd/nand/gpio.c
index ded658f..6317f68 100644
--- a/drivers/mtd/nand/gpio.c
+++ b/drivers/mtd/nand/gpio.c
@@ -273,6 +273,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	nand_set_flash_node(chip, pdev->dev.of_node);
 	chip->IO_ADDR_W		= chip->IO_ADDR_R;
 	chip->ecc.mode		= NAND_ECC_SOFT;
+	chip->ecc.algo		= NAND_ECC_HAMMING;
 	chip->options		= gpiomtd->plat.options;
 	chip->chip_delay	= gpiomtd->plat.chip_delay;
 	chip->cmd_ctrl		= gpio_nand_cmd_ctrl;
-- 
1.8.4.5
