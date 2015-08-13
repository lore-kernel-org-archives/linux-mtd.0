From: Mathieu Olivari <mathieu@codeaurora.org>
To: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
 linux@arm.linux.org.uk, dwmw2@infradead.org, computersforpeace@gmail.com,
 agross@codeaurora.org, sboyd@codeaurora.org, bjorn.andersson@sonymobile.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Mathieu Olivari <mathieu@codeaurora.org>
Subject: [PATCH 1/3] ARM: qcom: add SFPB nodes to IPQ806x dts
Date: Thu, 13 Aug 2015 14:33:38 -0700
Message-Id: <1439501620-24073-2-git-send-email-mathieu@codeaurora.org>
In-Reply-To: <1439501620-24073-1-git-send-email-mathieu@codeaurora.org>
References: <1439501620-24073-1-git-send-email-mathieu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add one new node to the ipq806x.dtsi file to declare & register the
hardware spinlock devices. This mechanism is required to be used by
other drivers such as SMEM.

Signed-off-by: Mathieu Olivari <mathieu@codeaurora.org>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 9f727d8..ea7b959 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -67,6 +67,18 @@
 			clock-frequency = <32768>;
 			#clock-cells = <0>;
 		};
+
+		sfpb_mutex_block: syscon@01200600 {
+			compatible = "syscon";
+			reg = <0x01200600 0x100>;
+		};
+
+		sfpb_mutex: sfpb-mutex {
+			compatible = "qcom,sfpb-mutex";
+			syscon = <&sfpb_mutex_block 4 4>;
+
+			#hwlock-cells = <1>;
+		};
 	};
 
 	soc: soc {
-- 
2.1.4
