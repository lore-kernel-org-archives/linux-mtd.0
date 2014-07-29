Received: from mail-wg0-x22c.google.com ([2a00:1450:400c:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XC7Qv-00068y-LQ
 for linux-mtd@lists.infradead.org; Tue, 29 Jul 2014 13:27:14 +0000
Received: by mail-wg0-f44.google.com with SMTP id m15so8794140wgh.15
 for <linux-mtd@lists.infradead.org>; Tue, 29 Jul 2014 06:26:46 -0700 (PDT)
From: Raphael Poggi <poggi.raph@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: atmel_nand: increase chip_delay
Date: Tue, 29 Jul 2014 15:27:27 +0200
Message-Id: <1406640447-9080-1-git-send-email-poggi.raph@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Raphael Poggi <poggi.raph@gmail.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some nand with 8k page size like Micron MT29F32G08ABAAAWP need more than 20us.

Signed-off-by: Raphaël Poggi <poggi.raph@gmail.com>
---
 drivers/mtd/nand/atmel_nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index e321c56..77bd877 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -2099,7 +2099,7 @@ static int atmel_nand_probe(struct platform_device *pdev)
 	}
 
 	nand_chip->ecc.mode = host->board.ecc_mode;
-	nand_chip->chip_delay = 20;		/* 20us command delay time */
+	nand_chip->chip_delay = 40;		/* 40us command delay time */
 
 	if (host->board.bus_width_16)	/* 16-bit bus width */
 		nand_chip->options |= NAND_BUSWIDTH_16;
-- 
1.7.9.5
