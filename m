From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org,
 mark.rutland@arm.com, shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, boris.brezillon@free-electrons.com,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com, oss@buserror.net,
 leoyang.li@nxp.com, Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: [PATCH 3/4][v4] ARM: dts: Add NOR connection type with IFC
Date: Thu, 15 Feb 2018 17:20:54 +0530
Message-Id: <20180215115054.23747-1-prabhakar.kushwaha@nxp.com>
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

Connection between IFC and NOR flash is of big-endian type.

So add big-endian property in flash node to reflect the same.

Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
Changes for v2: None
Changes for v3: None
Changes for v4: Updated device tree as per new binding

 arch/arm/boot/dts/ls1021a-qds.dts | 1 +
 arch/arm/boot/dts/ls1021a-twr.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a-qds.dts b/arch/arm/boot/dts/ls1021a-qds.dts
index 940875316d0f..8a383d37884a 100644
--- a/arch/arm/boot/dts/ls1021a-qds.dts
+++ b/arch/arm/boot/dts/ls1021a-qds.dts
@@ -237,6 +237,7 @@
 		reg = <0x0 0x0 0x8000000>;
 		bank-width = <2>;
 		device-width = <1>;
+		big-endian;
 	};
 
 	fpga: board-control@3,0 {
diff --git a/arch/arm/boot/dts/ls1021a-twr.dts b/arch/arm/boot/dts/ls1021a-twr.dts
index a8b148ad1dd2..2056d30df020 100644
--- a/arch/arm/boot/dts/ls1021a-twr.dts
+++ b/arch/arm/boot/dts/ls1021a-twr.dts
@@ -205,6 +205,7 @@
 		reg = <0x0 0x0 0x8000000>;
 		bank-width = <2>;
 		device-width = <1>;
+		big-endian;
 	};
 };
 
-- 
2.14.1
