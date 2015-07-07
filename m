Received: from mail-bl2on0137.outbound.protection.outlook.com ([65.55.169.137]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1ZCOTr-0001Vs-8b
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2015 08:43:56 +0000
From: Haikun Wang <haikun.wang@freescale.com>
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <computersforpeace@gmail.com>, <han.xu@freescale.com>
CC: Haikun Wang <haikun.wang@freescale.com>
Subject: [PATCH 7/8 v2] mtd: spi-nor: fsl-quadspi: Update bindings
 documentation
Date: Tue, 7 Jul 2015 16:38:19 +0800
Message-ID: <1436258300-21261-7-git-send-email-haikun.wang@freescale.com>
In-Reply-To: <1436258300-21261-1-git-send-email-haikun.wang@freescale.com>
References: <1436258300-21261-1-git-send-email-haikun.wang@freescale.com>
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

Add QuadSPI slave properties description.

Signed-off-by: Haikun Wang <haikun.wang@freescale.com>
---
Changes in v2:
- Rebase

 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
index 4461dc7..6627893 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -1,6 +1,6 @@
 * Freescale Quad Serial Peripheral Interface(QuadSPI)
 
-Required properties:
+QuadSPI master required properties:
   - compatible : Should be "fsl,vf610-qspi" or "fsl,imx6sx-qspi"
   - reg : the first contains the register location and length,
           the second contains the memory mapping address and length
@@ -18,6 +18,13 @@ Optional properties:
 			      bus, you should enable this property.
 			      (Please check the board's schematic.)
 
+QuadSPI slave required properties:
+  - compatible : Should be the manufacturer and the name of the chip,
+		 like "spansion,s25fl128s", "micron,n25q128a13"...
+		 See the "spi_nor_ids" table in drivers/mtd/spi-nor/spi-nor.c
+		 for the list of supported chips.
+  - spi-max-frequency : Maximum SPI clocking speed of device in Hz
+
 Example:
 
 qspi0: quadspi@40044000 {
-- 
2.1.0.27.g96db324
