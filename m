From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@bootlin.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH v2 1/4] dt-bindings: mtd: mtk-nand: Update properties
 description
Date: Mon, 16 Apr 2018 15:41:01 +0800
Message-ID: <1523864464-41059-2-git-send-email-xiaolei.li@mediatek.com>
In-Reply-To: <1523864464-41059-1-git-send-email-xiaolei.li@mediatek.com>
References: <1523864464-41059-1-git-send-email-xiaolei.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Update ecc step size, ecc strength, and parity bits supported on
each MTK NAND controller.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 Documentation/devicetree/bindings/mtd/mtk-nand.txt | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtk-nand.txt b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
index 1c88526..ef786568 100644
--- a/Documentation/devicetree/bindings/mtd/mtk-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
@@ -50,14 +50,19 @@ Optional:
 - nand-on-flash-bbt:	Store BBT on NAND Flash.
 - nand-ecc-mode:	the NAND ecc mode (check driver for supported modes)
 - nand-ecc-step-size:	Number of data bytes covered by a single ECC step.
-			valid values: 512 and 1024.
+			valid values:
+			512 and 1024 on mt2701 and mt2712.
+			512 only on mt7622.
 			1024 is recommended for large page NANDs.
 - nand-ecc-strength:	Number of bits to correct per ECC step.
-			The valid values that the controller supports are: 4, 6,
-			8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 32, 36, 40, 44,
-			48, 52, 56, 60.
+			The valid values that each controller supports:
+			mt2701: 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28,
+				32, 36, 40, 44, 48, 52, 56, 60.
+			mt2712: 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28,
+				32, 36, 40, 44, 48, 52, 56, 60, 68, 72, 80.
+			mt7622: 4, 6, 8, 10, 12, 14, 16.
 			The strength should be calculated as follows:
-			E = (S - F) * 8 / 14
+			E = (S - F) * 8 / B
 			S = O / (P / Q)
 				E :	nand-ecc-strength.
 				S :	spare size per sector.
@@ -66,6 +71,9 @@ Optional:
 				O :	oob size.
 				P :	page size.
 				Q :	nand-ecc-step-size.
+				B :	parity bits to do 1 bit ECC.
+					Be 14 on mt2701 and mt2712.
+					Be 13 on mt7622.
 			If the result does not match any one of the listed
 			choices above, please select the smaller valid value from
 			the list.
-- 
1.9.1
