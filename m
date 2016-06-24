Received: from mail-db3on0088.outbound.protection.outlook.com ([157.55.234.88]
 helo=emea01-db3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGYp5-00084y-DF
 for linux-mtd@lists.infradead.org; Fri, 24 Jun 2016 21:39:36 +0000
From: Han Xu <han.xu@nxp.com>
To: <han.xu@nxp.com>, <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <robh+dt@kernel.org>,
 <pawel.moll@arm.com>, <mark.rutland@arm.com>,
 <ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v3 6/6] Documentation: dt: mtd: gpmi: document the new
 supported chip in DT
Date: Fri, 24 Jun 2016 16:40:11 -0500
Message-ID: <1466804411-19874-7-git-send-email-han.xu@nxp.com>
In-Reply-To: <1466804411-19874-1-git-send-email-han.xu@nxp.com>
References: <1466804411-19874-1-git-send-email-han.xu@nxp.com>
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

listed all supported chips in DT.

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 Documentation/devicetree/bindings/mtd/gpmi-nand.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
index a2fd034..4997a00 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
@@ -4,7 +4,8 @@ The GPMI nand controller provides an interface to control the
 NAND flash chips.
 
 Required properties:
-  - compatible : should be "fsl,<chip>-gpmi-nand"
+  - compatible : should be "fsl,<chip>-gpmi-nand", the chip should be imx23,
+    imx28, imx6q, imx6qp, imx6sx, imx6ul or imx7d.
   - reg : should contain registers location and length for gpmi and bch.
   - reg-names: Should contain the reg names "gpmi-nand" and "bch"
   - interrupts : BCH interrupt number.
-- 
1.9.1
