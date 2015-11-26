Received: from mail-io0-x235.google.com ([2607:f8b0:4001:c06::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1q1g-0002zK-Cg
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2015 06:27:28 +0000
Received: by ioir85 with SMTP id r85so75775135ioi.1
 for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2015 22:27:07 -0800 (PST)
From: Nikolay Martynov <mar.kolya@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 Nikolay Martynov <mar.kolya@gmail.com>
Subject: [PATCH] mtd: nand: Fix Spansion sparearea size detection
Date: Thu, 26 Nov 2015 01:25:22 -0500
Message-Id: <1448519122-6259-1-git-send-email-mar.kolya@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

According to datasheet S34ML02G2 and S34ML04G2 have
larger sparea area size than was detected.

Signed-off-by: Nikolay Martynov <mar.kolya@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ceb68ca..2c01f9e 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3415,6 +3415,7 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 	/*
 	 * Field definitions are in the following datasheets:
 	 * Old style (4,5 byte ID): Samsung K9GAG08U0M (p.32)
+	 *                          Spansion S34ML02G2 (p.33)
 	 * New Samsung (6 byte ID): Samsung K9GAG08U0F (p.44)
 	 * Hynix MLC   (6 byte ID): Hynix H27UBG8T2B (p.22)
 	 *
@@ -3512,6 +3513,14 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 		*busw = (extid & 0x01) ? NAND_BUSWIDTH_16 : 0;
 
 		/*
+		 * Spansion S34ML0[24]G2 have oobsize twice as large
+		 * as S34ML01G2 encoded in the same bit. We
+		 * differentiate them by their ID length
+		 */
+		if (id_len == 5 && id_data[0] == NAND_MFR_AMD)
+			mtd->oobsize *= 2;
+
+		/*
 		 * Toshiba 24nm raw SLC (i.e., not BENAND) have 32B OOB per
 		 * 512B page. For Toshiba SLC, we decode the 5th/6th byte as
 		 * follows:
-- 
2.6.3
