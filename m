Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAd7I-0004sD-CZ
 for linux-mtd@lists.infradead.org; Wed, 08 Jun 2016 13:01:53 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 Aleksei Mamlin <mamlinav@gmail.com>
Subject: [PATCH v2 13/15] mtd: nand: samsung: retrieve ECC requirements from
 extended ID
Date: Wed,  8 Jun 2016 15:00:47 +0200
Message-Id: <1465390849-13199-14-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1465390849-13199-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1465390849-13199-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Hans de Goede <hdegoede@redhat.com>

On some nand controllers with hw-ecc the controller code wants to know
the ecc strength and size and having these as 0, 0 is not accepted.

Specifying these in devicetree is possible but undesirable as the nand
may be different in different production runs of the same board, so it
is better to get this info from the nand id where possible.

This commit adds code to read the ecc strength and size from the nand
for Samsung extended-id nands. This code is based on the info for the 5th
id byte in the datasheets for the following Samsung nands: K9GAG08U0E,
K9GAG08U0F, K9GAG08X0D, K9GBG08U0A, K9GBG08U0B. These all use these bits
in the exact same way.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_samsung.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mtd/nand/nand_samsung.c b/drivers/mtd/nand/nand_samsung.c
index 863be01..5d973d4 100644
--- a/drivers/mtd/nand/nand_samsung.c
+++ b/drivers/mtd/nand/nand_samsung.c
@@ -63,6 +63,26 @@ static void samsung_nand_decode_id(struct nand_chip *chip)
 		extid >>= 2;
 		mtd->erasesize = (128 * 1024) <<
 				 (((extid >> 1) & 0x04) | (extid & 0x03));
+
+		/* Extract ECC requirements from 5th id byte*/
+		extid = (chip->id.data[4] >> 4) & 0x07;
+		if (extid < 5) {
+			chip->ecc_step_ds = 512;
+			chip->ecc_strength_ds = 1 << extid;
+		} else {
+			chip->ecc_step_ds = 1024;
+			switch (extid) {
+			case 5:
+				chip->ecc_strength_ds = 24;
+				break;
+			case 6:
+				chip->ecc_strength_ds = 40;
+				break;
+			case 7:
+				chip->ecc_strength_ds = 60;
+				break;
+			}
+		}
 	} else {
 		nand_decode_ext_id(chip);
 	}
-- 
2.7.4
