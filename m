Received: from mail-lf0-x22f.google.com ([2a00:1450:4010:c07::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqJbB-0002Us-7U
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 12:08:50 +0000
Received: by mail-lf0-x22f.google.com with SMTP id e190so66614471lfe.0
 for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2016 05:08:25 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/9] mtd: nand: mpc5121_nfc: set ECC algorithm explicitly
Date: Wed, 13 Apr 2016 14:06:58 +0200
Message-Id: <1460549222-24198-6-git-send-email-zajec5@gmail.com>
In-Reply-To: <1460549222-24198-1-git-send-email-zajec5@gmail.com>
References: <1460549222-24198-1-git-send-email-zajec5@gmail.com>
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
 drivers/mtd/nand/mpc5121_nfc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index 5d7843f..7eacb2f 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -710,6 +710,7 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	chip->select_chip = mpc5121_nfc_select_chip;
 	chip->bbt_options = NAND_BBT_USE_FLASH;
 	chip->ecc.mode = NAND_ECC_SOFT;
+	chip->ecc.algo = NAND_ECC_HAMMING;
 
 	/* Support external chip-select logic on ADS5121 board */
 	if (of_machine_is_compatible("fsl,mpc5121ads")) {
-- 
1.8.4.5
