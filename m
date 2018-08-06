Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fmbpU-00023K-Md
 for linux-mtd@lists.infradead.org; Mon, 06 Aug 2018 09:29:34 +0000
From: Stefan Agner <stefan@agner.ch>
To: boris.brezillon@bootlin.com,
	miquel.raynal@bootlin.com
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
Subject: [PATCH 2/3] mtd: rawnand: vf610_nfc: explicitly disable interrupts
 first
Date: Mon,  6 Aug 2018 11:29:08 +0200
Message-Id: <20180806092909.28980-2-stefan@agner.ch>
In-Reply-To: <20180806092909.28980-1-stefan@agner.ch>
References: <20180806092909.28980-1-stefan@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Explicitly disable all interrupts on probe. This should be the
default state, but the bootloader could leave the device in any
state. No issues have been observed so far, but it is still worth
fixing it.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 740a91c5c86e..52e7811c0bde 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -130,8 +130,13 @@
 #define CONFIG_PAGE_CNT_SHIFT			0
 
 /* NFC_IRQ_STATUS Field */
+#define WERR_IRQ_BIT				BIT(31)
+#define DONE_IRQ_BIT				BIT(30)
 #define IDLE_IRQ_BIT				BIT(29)
+#define WERR_EN_BIT				BIT(22)
+#define DONE_EN_BIT				BIT(21)
 #define IDLE_EN_BIT				BIT(20)
+#define WERR_CLEAR_BIT				BIT(19)
 #define DONE_CLEAR_BIT				BIT(18)
 #define IDLE_CLEAR_BIT				BIT(17)
 
@@ -819,6 +824,10 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 
 	init_completion(&nfc->cmd_done);
 
+	vf610_nfc_clear(nfc, NFC_IRQ_STATUS, WERR_EN_BIT);
+	vf610_nfc_clear(nfc, NFC_IRQ_STATUS, DONE_EN_BIT);
+	vf610_nfc_clear(nfc, NFC_IRQ_STATUS, IDLE_EN_BIT);
+
 	err = devm_request_irq(nfc->dev, irq, vf610_nfc_irq, 0, DRV_NAME, mtd);
 	if (err) {
 		dev_err(nfc->dev, "Error requesting IRQ!\n");
-- 
2.18.0
