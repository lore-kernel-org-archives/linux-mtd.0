Received: from mail-bn1bon0113.outbound.protection.outlook.com
 ([157.56.111.113] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1ZMeE8-0002oc-Rm
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2015 15:34:05 +0000
From: Han Xu <b45815@freescale.com>
To: <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <frank.li@freescale.com>,
 <han.xu@freescale.com>
Subject: [PATCH v4 04/10] Documentation: fsl-quadspi: Add fsl,
 imx7d-qspi compatible string
Date: Tue, 4 Aug 2015 10:25:41 -0500
Message-ID: <1438701941-27039-1-git-send-email-b45815@freescale.com>
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

From: Frank Li <Frank.Li@freescale.com>

new compatible string: "fsl,imx7d-qspi"

Signed-off-by: Frank Li <Frank.Li@freescale.com>
---
 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
index 4461dc7..ca72696 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -1,7 +1,8 @@
 * Freescale Quad Serial Peripheral Interface(QuadSPI)
 
 Required properties:
-  - compatible : Should be "fsl,vf610-qspi" or "fsl,imx6sx-qspi"
+  - compatible : Should be "fsl,vf610-qspi", "fsl,imx6sx-qspi",
+		 "fsl,imx7d-qspi"
   - reg : the first contains the register location and length,
           the second contains the memory mapping address and length
   - reg-names: Should contain the reg names "QuadSPI" and "QuadSPI-memory"
-- 
1.9.1
