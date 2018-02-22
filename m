From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org,
 mark.rutland@arm.com, shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, boris.brezillon@free-electrons.com,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com, oss@buserror.net,
 leoyang.li@nxp.com, Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 Jagdish Gediya <jagdish.gediya@nxp.com>
Subject: [PATCH 2/2][v2][RESEND] ARM: dts: ls1021aqds: Add nand node for ifc
 controller
Date: Thu, 22 Feb 2018 15:45:11 +0530
Message-Id: <20180222101511.29631-7-prabhakar.kushwaha@nxp.com>
In-Reply-To: <20180222101511.29631-1-prabhakar.kushwaha@nxp.com>
References: <20180222101511.29631-1-prabhakar.kushwaha@nxp.com>
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
Due to patch series http://patchwork.ozlabs.org/project/linux-mtd/list/?series=28735
this patch is now independent of flash propoerty. So resending.

Resending as all patches of patchset never reaches to patchwork.

 arch/arm/boot/dts/ls1021a-qds.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a-qds.dts b/arch/arm/boot/dts/ls1021a-qds.dts
index 8a383d37884a..fe352ff60b35 100644
--- a/arch/arm/boot/dts/ls1021a-qds.dts
+++ b/arch/arm/boot/dts/ls1021a-qds.dts
@@ -240,6 +240,11 @@
 		big-endian;
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
2.14.1
