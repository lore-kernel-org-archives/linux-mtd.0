Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fmbpU-00023M-Mi
 for linux-mtd@lists.infradead.org; Mon, 06 Aug 2018 09:29:34 +0000
From: Stefan Agner <stefan@agner.ch>
To: boris.brezillon@bootlin.com,
	miquel.raynal@bootlin.com
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
Subject: [PATCH 1/3] mtd: rawnand: vf610_nfc: align IRQ bit naming
Date: Mon,  6 Aug 2018 11:29:07 +0200
Message-Id: <20180806092909.28980-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rename the IRQ DONE clear bit to align with other IRQ bits.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index d5a22fc96878..740a91c5c86e 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -132,7 +132,7 @@
 /* NFC_IRQ_STATUS Field */
 #define IDLE_IRQ_BIT				BIT(29)
 #define IDLE_EN_BIT				BIT(20)
-#define CMD_DONE_CLEAR_BIT			BIT(18)
+#define DONE_CLEAR_BIT				BIT(18)
 #define IDLE_CLEAR_BIT				BIT(17)
 
 /*
@@ -290,7 +290,7 @@ static inline void vf610_nfc_clear_status(struct vf610_nfc *nfc)
 {
 	u32 tmp = vf610_nfc_read(nfc, NFC_IRQ_STATUS);
 
-	tmp |= CMD_DONE_CLEAR_BIT | IDLE_CLEAR_BIT;
+	tmp |= DONE_CLEAR_BIT | IDLE_CLEAR_BIT;
 	vf610_nfc_write(nfc, NFC_IRQ_STATUS, tmp);
 }
 
-- 
2.18.0
