Received: from mail-bl2nam02on0040.outbound.protection.outlook.com
 ([104.47.38.40] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eK0Yl-0004L6-6G
 for linux-mtd@lists.infradead.org; Wed, 29 Nov 2017 11:29:51 +0000
From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: <linux-mtd@lists.infradead.org>, <devicetree-discuss@lists.ozlabs.org>
CC: <dedekind1@gmail.com>, <oss@buserror.net>, <computersforpeace@gmail.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>, Jagdish Gediya
 <jagdish.gediya@nxp.com>
Subject: [PATCH 2/2] arm: dts: ls1021aqds: Add nand node for ifc controller
Date: Wed, 29 Nov 2017 16:58:11 +0530
Message-ID: <1511954891-8695-1-git-send-email-prabhakar.kushwaha@nxp.com>
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

LS1021AQDS support NAND flash on IFC chip-select 2.

So add NAND node in device tree for IFC controller.

Signed-off-by: Jagdish Gediya <jagdish.gediya@nxp.com>
Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
 arch/arm/boot/dts/ls1021a-qds.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a-qds.dts b/arch/arm/boot/dts/ls1021a-qds.dts
index 9408753..2b37d04 100644
--- a/arch/arm/boot/dts/ls1021a-qds.dts
+++ b/arch/arm/boot/dts/ls1021a-qds.dts
@@ -239,6 +239,11 @@
 		device-width = <1>;
 	};
 
+	nand@2,0 {
+		compatible = "fsl,ifc-nand";
+		reg = <0x2 0x0 0x10000>;
+	};
+
 	fpga: board-control@3,0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.9.1
