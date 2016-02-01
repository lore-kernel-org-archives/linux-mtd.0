Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQBh2-0003qk-AC
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2016 10:26:51 +0000
Received: by mail-wm0-x241.google.com with SMTP id r129so8390925wmr.0
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 02:26:28 -0800 (PST)
From: Romain Izard <romain.izard.pro@gmail.com>
To: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Josh Wu <rainyfeeling@outlook.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Yang Wenyou <Wenyou.Yang@atmel.com>,
 Romain Izard <romain.izard.pro@gmail.com>
Subject: [PATCH v3 2/5] dt-bindings: atmel_nand: Reword the documenation
Date: Mon,  1 Feb 2016 11:25:57 +0100
Message-Id: <1454322360-8666-3-git-send-email-romain.izard.pro@gmail.com>
In-Reply-To: <1454322360-8666-1-git-send-email-romain.izard.pro@gmail.com>
References: <1454322360-8666-1-git-send-email-romain.izard.pro@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Do not mention which chips supporting the PMECC controller, as it a
duplicate of the information in the chips' device trees.

Use common terms when describing the sub-node for the NAND Flash
controller.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
---
v3: no change
v2: new

 .../devicetree/bindings/mtd/atmel-nand.txt         | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index 89b0db9801b0..e68ab404d912 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
@@ -21,8 +21,8 @@ Optional properties:
 - nand-ecc-mode : String, operation mode of the NAND ecc mode, soft by default.
   Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
   "soft_bch".
-- atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardware.
-  Only supported by at91sam9x5 or later sam9 product.
+- atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardware,
+  capable of BCH encoding and decoding, on devices where it is present.
 - atmel,pmecc-cap : error correct capability for Programmable Multibit ECC
   Controller. Supported values are: 2, 4, 8, 12, 24.
 - atmel,pmecc-sector-size : sector size for ECC computation. Supported values
@@ -32,15 +32,16 @@ Optional properties:
   sector size 1024. If not specified, driver will build the table in runtime.
 - nand-bus-width : 8 or 16 bus width if not present 8
 - nand-on-flash-bbt: boolean to enable on flash bbt option if not present false
-- Nand Flash Controller(NFC) is a slave driver under Atmel nand flash
-  - Required properties:
-    - compatible : "atmel,sama5d3-nfc" or "atmel,sama5d4-nfc".
-    - reg : should specify the address and size used for NFC command registers,
-            NFC registers and NFC Sram. NFC Sram address and size can be absent
-            if don't want to use it.
-    - clocks: phandle to the peripheral clock
-  - Optional properties:
-    - atmel,write-by-sram: boolean to enable NFC write by sram.
+
+Nand Flash Controller(NFC) is an optional sub-node
+Required properties:
+- compatible : "atmel,sama5d3-nfc" or "atmel,sama5d4-nfc".
+- reg : should specify the address and size used for NFC command registers,
+        NFC registers and NFC SRAM. NFC SRAM address and size can be absent
+        if don't want to use it.
+- clocks: phandle to the peripheral clock
+Optional properties:
+- atmel,write-by-sram: boolean to enable NFC write by SRAM.
 
 Examples:
 nand0: nand@40000000,0 {
-- 
2.5.0
