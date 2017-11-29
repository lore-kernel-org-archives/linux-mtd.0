Received: from mail-co1nam03on0053.outbound.protection.outlook.com
 ([104.47.40.53] helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eK0YQ-0004Bv-Cx
 for linux-mtd@lists.infradead.org; Wed, 29 Nov 2017 11:29:31 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: <linux-mtd@lists.infradead.org>, <devicetree-discuss@lists.ozlabs.org>
CC: <dedekind1@gmail.com>, <oss@buserror.net>, <computersforpeace@gmail.com>,
 Jagdish Gediya <jagdish.gediya@nxp.com>, Alison Wang <alison.wang@nxp.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: [PATCH 1/2] arm: dts: Add big-endian for IFC on LS1021A
Date: Wed, 29 Nov 2017 16:57:53 +0530
Message-ID: <1511954873-8639-1-git-send-email-prabhakar.kushwaha@nxp.com>
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

From: Jagdish Gediya <jagdish.gediya@nxp.com>

For the patch to update struct map_info's swap field based on device
characteristics defined in device tree, big-endian parameter is added
for LS1021A.

Signed-off-by: Alison Wang <alison.wang@nxp.com>
Signed-off-by: Jagdish Gediya <jagdish.gediya@nxp.com>
Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
 arch/arm/boot/dts/ls1021a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 9319e1f..babb086 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -145,6 +145,7 @@
 		ifc: ifc@1530000 {
 			compatible = "fsl,ifc", "simple-bus";
 			reg = <0x0 0x1530000 0x0 0x10000>;
+			big-endian;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-- 
1.9.1
