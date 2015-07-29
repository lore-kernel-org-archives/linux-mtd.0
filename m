Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKVYY-0004KA-9H
 for linux-mtd@lists.infradead.org; Wed, 29 Jul 2015 17:54:18 +0000
From: Hans de Goede <hdegoede@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>, linux-mtd@lists.infradead.org,
 linux-sunxi@googlegroups.com, Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/4] mtd: nand: nand_decode_ext_id(): Fill in ecc strength and
 size for Samsung
Date: Wed, 29 Jul 2015 19:53:52 +0200
Message-Id: <1438192434-18363-2-git-send-email-hdegoede@redhat.com>
In-Reply-To: <1438192434-18363-1-git-send-email-hdegoede@redhat.com>
References: <1438192434-18363-1-git-send-email-hdegoede@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On some nand controllers with hw-ecc the controller code wants to know the
ecc strength and size and having these as 0, 0 is not accepted.

Specifying these in devicetree is possible but undesirable as the nand
may be different in different production runs of the same board, so it
is better to get this info from the nand id where possible.

This commit adds code to read the ecc strength and size from the nand for
Samsung extended-id nands. This code is based on the info for the 5th
id byte in the datasheets for the following Samsung nands: K9GAG08U0E,
K9GAG08U0F, K9GAG08X0D, K9GBG08U0A, K9GBG08U0B. These all use these bits
in the exact same way.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/mtd/nand/nand_base.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 462984a..f3fefbf 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -4059,6 +4059,41 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 		mtd->erasesize = (128 * 1024) <<
 			(((extid >> 1) & 0x04) | (extid & 0x03));
 		*busw = 0;
+		/* Calc ecc strength and size from 5th id byte*/
+		switch ((id_data[4] >> 4) & 0x07) {
+		case 0:
+			chip->ecc_strength_ds = 1;
+			chip->ecc_step_ds = 512;
+			break;
+		case 1:
+			chip->ecc_strength_ds = 2;
+			chip->ecc_step_ds = 512;
+			break;
+		case 2:
+			chip->ecc_strength_ds = 4;
+			chip->ecc_step_ds = 512;
+			break;
+		case 3:
+			chip->ecc_strength_ds = 8;
+			chip->ecc_step_ds = 512;
+			break;
+		case 4:
+			chip->ecc_strength_ds = 16;
+			chip->ecc_step_ds = 512;
+			break;
+		case 5:
+			chip->ecc_strength_ds = 24;
+			chip->ecc_step_ds = 1024;
+			break;
+		case 6:
+			chip->ecc_strength_ds = 40;
+			chip->ecc_step_ds = 1024;
+			break;
+		case 7:
+			chip->ecc_strength_ds = 60;
+			chip->ecc_step_ds = 1024;
+			break;
+		}
 	} else if (id_len == 6 && id_data[0] == NAND_MFR_HYNIX &&
 			!nand_is_slc(chip)) {
 		unsigned int tmp;
-- 
2.4.3
