Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arqF5-0002Mp-2U
 for linux-mtd@lists.infradead.org; Sun, 17 Apr 2016 17:12:15 +0000
Received: by mail-lf0-x234.google.com with SMTP id e190so193763846lfe.0
 for <linux-mtd@lists.infradead.org>; Sun, 17 Apr 2016 10:11:54 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH V2 02/11] mtd: nand: davinci: set ECC algorithm explicitly
Date: Sun, 17 Apr 2016 19:11:35 +0200
Message-Id: <1460913104-27388-3-git-send-email-zajec5@gmail.com>
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
Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/davinci_nand.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index fe3fd29..b0a2801 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -738,6 +738,14 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	}
 	info->chip.ecc.mode = ecc_mode;
 
+	/*
+	 * When using software ECC this driver support hamming only. Force
+	 * ecc.algo to NAND_ECC_HAMMING to avoid adding an extra ->ecc_algo
+	 * field to davinci_nand_pdata.
+	 */
+	if (ecc_mode == NAND_ECC_SOFT)
+		info->chip.ecc.algo = NAND_ECC_HAMMING;
+
 	info->clk = devm_clk_get(&pdev->dev, "aemif");
 	if (IS_ERR(info->clk)) {
 		ret = PTR_ERR(info->clk);
-- 
1.8.4.5
