Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aUICa-0002YS-Dx
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2016 18:12:21 +0000
Received: by mail-lf0-x244.google.com with SMTP id h198so4532981lfh.3
 for <linux-mtd@lists.infradead.org>; Fri, 12 Feb 2016 10:11:59 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Hauke Mehrtens <hauke@hauke-m.de>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 2/3] mtd: nand: read (from DT) and store ECC algorithm
Date: Fri, 12 Feb 2016 19:11:24 +0100
Message-Id: <1455300685-27009-2-git-send-email-zajec5@gmail.com>
In-Reply-To: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
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

This will allow drivers handle ECC properly.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 6 +++++-
 include/linux/mtd/nand.h     | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index f2c8ff3..ef977f3 100644
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
@@ -3991,6 +3991,7 @@ static int nand_dt_init(struct nand_chip *chip)
 		chip->bbt_options |= NAND_BBT_USE_FLASH;
 
 	ecc_mode = of_get_nand_ecc_mode(dn);
+	ecc_algo = of_get_nand_ecc_algo(dn);
 	ecc_strength = of_get_nand_ecc_strength(dn);
 	ecc_step = of_get_nand_ecc_step_size(dn);
 
@@ -4003,6 +4004,9 @@ static int nand_dt_init(struct nand_chip *chip)
 	if (ecc_mode >= 0)
 		chip->ecc.mode = ecc_mode;
 
+	if (ecc_algo >= 0)
+		chip->ecc.algo = ecc_algo;
+
 	if (ecc_strength >= 0)
 		chip->ecc.strength = ecc_strength;
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 25854d2..8deca1b 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -513,6 +513,7 @@ struct nand_hw_control {
  */
 struct nand_ecc_ctrl {
 	nand_ecc_modes_t mode;
+	enum nand_ecc_algo algo;
 	int steps;
 	int size;
 	int bytes;
-- 
1.8.4.5
