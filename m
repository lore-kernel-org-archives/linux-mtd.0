From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: sebastian.hesselbarth@gmail.com, ezequiel.garcia@free-electrons.com,
 dwmw2@infradead.org, computersforpeace@gmail.com
Subject: [PATCH v3 9/9] ARM: berlin: enable flash on the BG2Q DMP
Date: Thu,  5 Mar 2015 12:31:25 +0100
Message-Id: <1425555085-29531-10-git-send-email-antoine.tenart@free-electrons.com>
In-Reply-To: <1425555085-29531-1-git-send-email-antoine.tenart@free-electrons.com>
References: <1425555085-29531-1-git-send-email-antoine.tenart@free-electrons.com>
Cc: thomas.petazzoni@free-electrons.com, boris.brezillon@free-electrons.com,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 linux-kernel@vger.kernel.org, zmxu@marvell.com, linux-mtd@lists.infradead.org,
 jszhang@marvell.com, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The BG2Q DMP has a nand controller. Add the corresponding node, but do
not enable it by default because the nand is only available on some BG2Q
DMP.

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
---
 arch/arm/boot/dts/berlin2q-marvell-dmp.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
index a98ac1bd8f65..4157258a6fb0 100644
--- a/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
+++ b/arch/arm/boot/dts/berlin2q-marvell-dmp.dts
@@ -112,3 +112,28 @@
 &sata_phy {
 	status = "okay";
 };
+
+&chip {
+	nand_pmux: nand-pmux {
+		groups = "G0", "G1";
+		function = "nand";
+	};
+};
+
+&nand0 {
+	pinctrl-0 = <&nand_pmux>;
+	pinctrl-names = "default";
+
+	marvell,nand-enable-arbiter;
+	nand-ecc-strength = <48>;
+	nand-ecc-step-size = <1024>;
+
+	num-cs = <1>;
+
+	/*
+	 * Two kinds of BG2Q DMP are available: one with emmc and
+	 * one with a nand. The latter is not widespread. Because
+	 * of this, disable the nand by default.
+	 */
+	status = "disabled";
+};
-- 
2.3.1
