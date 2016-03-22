Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aiVCe-00028U-JH
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2016 22:55:09 +0000
Received: by mail-lf0-x234.google.com with SMTP id d82so75498006lfe.3
 for <linux-mtd@lists.infradead.org>; Tue, 22 Mar 2016 15:54:48 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 2/3] mtd: nand: set ECC algorithm in nand_dt_init
Date: Tue, 22 Mar 2016 23:54:13 +0100
Message-Id: <1458687254-26181-3-git-send-email-zajec5@gmail.com>
In-Reply-To: <1458687254-26181-1-git-send-email-zajec5@gmail.com>
References: <1458687254-26181-1-git-send-email-zajec5@gmail.com>
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

Right now we set it based on "nand-ecc-mode" property value. At some
point we will most likely want a new property, but we'll need to keep
backward compatibility, so such code will be needed anyway.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index f2c8ff3..75c5564 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3979,7 +3979,7 @@ ident_done:
 static int nand_dt_init(struct nand_chip *chip)
 {
 	struct device_node *dn = nand_get_flash_node(chip);
-	int ecc_mode, ecc_strength, ecc_step;
+	int ecc_mode, ecc_algo, ecc_strength, ecc_step;
 
 	if (!dn)
 		return 0;
@@ -3991,6 +3991,16 @@ static int nand_dt_init(struct nand_chip *chip)
 		chip->bbt_options |= NAND_BBT_USE_FLASH;
 
 	ecc_mode = of_get_nand_ecc_mode(dn);
+	switch (ecc_mode) {
+	case NAND_ECC_SOFT:
+		ecc_algo = NAND_ECC_HAMMING;
+		break;
+	case NAND_ECC_SOFT_BCH:
+		ecc_algo = NAND_ECC_BCH;
+		break;
+	default:
+		ecc_algo = -1;
+	}
 	ecc_strength = of_get_nand_ecc_strength(dn);
 	ecc_step = of_get_nand_ecc_step_size(dn);
 
@@ -4003,6 +4013,9 @@ static int nand_dt_init(struct nand_chip *chip)
 	if (ecc_mode >= 0)
 		chip->ecc.mode = ecc_mode;
 
+	if (ecc_algo >= 0)
+		chip->ecc.algo = ecc_algo;
+
 	if (ecc_strength >= 0)
 		chip->ecc.strength = ecc_strength;
 
-- 
1.8.4.5
