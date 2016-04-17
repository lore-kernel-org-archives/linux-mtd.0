Received: from mail-lf0-x235.google.com ([2a00:1450:4010:c07::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arqF8-0002OB-SN
 for linux-mtd@lists.infradead.org; Sun, 17 Apr 2016 17:12:19 +0000
Received: by mail-lf0-x235.google.com with SMTP id c126so193694462lfb.2
 for <linux-mtd@lists.infradead.org>; Sun, 17 Apr 2016 10:11:58 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH V2 03/11] mtd: nand: atmel: set ECC algorithm explicitly
Date: Sun, 17 Apr 2016 19:11:36 +0200
Message-Id: <1460913104-27388-4-git-send-email-zajec5@gmail.com>
In-Reply-To: <1460913104-27388-1-git-send-email-zajec5@gmail.com>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
 <1460913104-27388-1-git-send-email-zajec5@gmail.com>
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
V2: Set algo to Hamming based on mode being SOFT. Add a comment how to
    modify it if we ever need to.
---
 drivers/mtd/nand/atmel_nand.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index eec8ca7..efc8ea2 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1212,6 +1212,7 @@ static int atmel_pmecc_nand_init_params(struct platform_device *pdev,
 		dev_warn(host->dev,
 			"Can't get I/O resource regs for PMECC controller, rolling back on software ECC\n");
 		nand_chip->ecc.mode = NAND_ECC_SOFT;
+		nand_chip->ecc.algo = NAND_ECC_HAMMING;
 		return 0;
 	}
 
@@ -1295,6 +1296,7 @@ static int atmel_pmecc_nand_init_params(struct platform_device *pdev,
 		/* page size not handled by HW ECC */
 		/* switching back to soft ECC */
 		nand_chip->ecc.mode = NAND_ECC_SOFT;
+		nand_chip->ecc.algo = NAND_ECC_HAMMING;
 		return 0;
 	}
 
@@ -1613,6 +1615,7 @@ static int atmel_of_init_port(struct atmel_nand_host *host,
 	 * even if the nand-ecc-mode property is not defined.
 	 */
 	host->nand_chip.ecc.mode = NAND_ECC_SOFT;
+	host->nand_chip.ecc.algo = NAND_ECC_HAMMING;
 
 	return 0;
 }
@@ -1629,6 +1632,7 @@ static int atmel_hw_nand_init_params(struct platform_device *pdev,
 		dev_err(host->dev,
 			"Can't get I/O resource regs, use software ECC\n");
 		nand_chip->ecc.mode = NAND_ECC_SOFT;
+		nand_chip->ecc.algo = NAND_ECC_HAMMING;
 		return 0;
 	}
 
@@ -1661,6 +1665,7 @@ static int atmel_hw_nand_init_params(struct platform_device *pdev,
 		/* page size not handled by HW ECC */
 		/* switching back to soft ECC */
 		nand_chip->ecc.mode = NAND_ECC_SOFT;
+		nand_chip->ecc.algo = NAND_ECC_HAMMING;
 		return 0;
 	}
 
@@ -2160,6 +2165,14 @@ static int atmel_nand_probe(struct platform_device *pdev)
 		       sizeof(struct atmel_nand_data));
 		nand_chip->ecc.mode = host->board.ecc_mode;
 
+		/*
+		 * When using software ECC every supported avr32 board means
+		 * Hamming algorithm. If that ever changes we'll need to add
+		 * ecc_algo field to the struct atmel_nand_data.
+		 */
+		if (nand_chip->ecc.mode == NAND_ECC_SOFT)
+			nand_chip->ecc.algo = NAND_ECC_HAMMING;
+
 		/* 16-bit bus width */
 		if (host->board.bus_width_16)
 			nand_chip->options |= NAND_BUSWIDTH_16;
-- 
1.8.4.5
