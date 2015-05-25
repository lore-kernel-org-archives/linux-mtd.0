Received: from mail-bn1bon0119.outbound.protection.outlook.com
 ([157.56.111.119] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ywqxy-0004IT-OZ
 for linux-mtd@lists.infradead.org; Mon, 25 May 2015 11:54:51 +0000
From: Haikun Wang <haikun.wang@freescale.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>, <han.xu@freescale.com>
Subject: [PATCH 4/4 v1] documentation: devicetree: bindings: fsl-quadspi.txt:
 Add "fsl, ls1-qspi" compatible string
Date: Mon, 25 May 2015 19:50:22 +0800
Message-ID: <1432554622-3133-1-git-send-email-haikun.wang@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Haikun Wang <haikun.wang@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Haikun Wang <haikun.wang@freescale.com>
---
 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
index 4461dc7..a148b17 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -1,7 +1,7 @@
 * Freescale Quad Serial Peripheral Interface(QuadSPI)
 
 Required properties:
-  - compatible : Should be "fsl,vf610-qspi" or "fsl,imx6sx-qspi"
+  - compatible : Should be "fsl,vf610-qspi" "fsl,ls1-qspi" or "fsl,imx6sx-qspi"
   - reg : the first contains the register location and length,
           the second contains the memory mapping address and length
   - reg-names: Should contain the reg names "QuadSPI" and "QuadSPI-memory"
-- 
2.1.0.27.g96db324
