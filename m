Received: from mail-bn1bon0140.outbound.protection.outlook.com
 ([157.56.111.140] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCOTv-0000Yc-0i
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2015 08:43:59 +0000
From: Haikun Wang <haikun.wang@freescale.com>
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <computersforpeace@gmail.com>, <han.xu@freescale.com>
CC: Haikun Wang <haikun.wang@freescale.com>
Subject: [PATCH 8/8 v2] mtd: spi-nor: fsl-quadspi: Add compatible string "fsl,
 ls1-qspi" in bindings documentation
Date: Tue, 7 Jul 2015 16:38:20 +0800
Message-ID: <1436258300-21261-8-git-send-email-haikun.wang@freescale.com>
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

Freescale LS1021A SOC also has QSPI controller and it has platform special
features than other platforms.
Add "fsl,ls1-qspi" in the valid compatible string list.

Signed-off-by: Haikun Wang <haikun.wang@freescale.com>
---
Changes in v2:
- Rebase

 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
index 6627893..42c2954 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -1,7 +1,7 @@
 * Freescale Quad Serial Peripheral Interface(QuadSPI)
 
 QuadSPI master required properties:
-  - compatible : Should be "fsl,vf610-qspi" or "fsl,imx6sx-qspi"
+  - compatible : Should be "fsl,vf610-qspi", "fsl,ls1-qspi" or "fsl,imx6sx-qspi"
   - reg : the first contains the register location and length,
           the second contains the memory mapping address and length
   - reg-names: Should contain the reg names "QuadSPI" and "QuadSPI-memory"
-- 
2.1.0.27.g96db324
