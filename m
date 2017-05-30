From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Nicolas Ferre <nicolas.ferre@atmel.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/5] dt-bindings: mtd: atmel-nand: Document the nfc-io bindings
Date: Tue, 30 May 2017 10:32:46 +0200
Message-Id: <1496133171-4787-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1496133171-4787-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1496133171-4787-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SAMA5 SoCs embed an advanced NAND controller logic to automate READ/WRITE
page accesses. This advanced logic is exposed through a separate I/O mem
range and is thus represented in a different node with its own compatible.

Document the bindings of this nfc-io block.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 Documentation/devicetree/bindings/mtd/atmel-nand.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index f6bee57e453a..9bb66e476672 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
@@ -59,8 +59,22 @@ Required properties:
 - reg: should contain 2 register ranges. The first one is pointing to the PMECC
        block, and the second one to the PMECC_ERRLOC block.
 
+* SAMA5 NFC I/O bindings:
+
+SAMA5 SoCs embed an advanced NAND controller logic to automate READ/WRITE page
+operations. This interface to this logic is placed in a separate I/O range and
+should thus have its own DT node.
+
+- compatible: should be "atmel,sama5d3-nfc-io", "syscon".
+- reg: should contain the I/O range used to interact with the NFC logic.
+
 Example:
 
+	nfc_io: nfc-io@70000000 {
+		compatible = "atmel,sama5d3-nfc-io", "syscon";
+		reg = <0x70000000 0x8000000>;
+	};
+
 	pmecc: ecc-engine@ffffc070 {
 		compatible = "atmel,at91sam9g45-pmecc";
                 reg = <0xffffc070 0x490>,
-- 
2.7.4
