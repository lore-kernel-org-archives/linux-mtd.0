Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6HJ0-0002Xs-7p
 for linux-mtd@lists.infradead.org; Fri, 27 May 2016 12:55:59 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/15] mtd: nand: samsung: retrieve ECC requirements from
 extended ID
Date: Fri, 27 May 2016 14:54:59 +0200
Message-Id: <1464353701-23233-14-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1464353701-23233-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1464353701-23233-1-git-send-email-boris.brezillon@free-electrons.com>
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
index 27ede41..39448ff 100644
--- a/drivers/mtd/nand/nand_samsung.c
+++ b/drivers/mtd/nand/nand_samsung.c
@@ -61,6 +61,26 @@ static int samsung_nand_decode_id(struct nand_chip *chip)
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
 	}
 
 	if (mtd->writesize > 512)
-- 
2.7.4
