Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTEvz-0005vh-HY
 for linux-mtd@lists.infradead.org; Thu, 27 Mar 2014 18:21:50 +0000
From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
To: <robh+dt@kernel.org>, <pawel.moll@arm.com>, <mark.rutland@arm.com>,
 <ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>, <rob@landley.net>,
 <michal.simek@xilinx.com>, <grant.likely@linaro.org>,
 <gregkh@linuxfoundation.org>, <jason@lakedaemon.net>,
 <ezequiel.garcia@free-electrons.com>, <arnd@arndb.de>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <artem.bityutskiy@linux.intel.com>,
 <pekon@ti.com>, <jussi.kivilinna@iki.fi>, <acourbot@nvidia.com>,
 <ivan.khoronzhuk@ti.com>, <joern@logfs.org>
Subject: [PATCH RFC 1/3] Devicetree: Add pl353 smc controller devicetree
 binding information
Date: Thu, 27 Mar 2014 23:51:05 +0530
In-Reply-To: <1395944467-26291-1-git-send-email-punnaia@xilinx.com>
References: <1395944467-26291-1-git-send-email-punnaia@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <05521479-afd6-4c52-afbb-ef3fe2dafd18@CH1EHSMHS001.ehs.local>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 kalluripunnaiahchoudary@gmail.com, kpc528@gmail.com,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add pl353 static memory controller devicetree binding information.

Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
---
 .../bindings/memory-controllers/pl353-smc.txt      |   53 ++++++++++++++++++++
 1 files changed, 53 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt

diff --git a/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
new file mode 100644
index 0000000..623c1c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
@@ -0,0 +1,53 @@
+Device tree bindings for ARM PL353 static memory controller
+
+PL353 static memory controller supports two kinds of memory
+interfaces.i.e NAND and SRAM/NOR interfaces.
+The actual devices are instantiated from the child nodes of pl353 smc node.
+
+Required properties:
+- compatible		: Should be "arm,pl353-smc-r2p1"
+- reg			: Controller registers map and length.
+- clock-names		: List of input clock names - "ref_clk", "aper_clk"
+			  (See clock bindings for details).
+- clocks		: Clock phandles (see clock bindings for details).
+- address-cells	: Address cells, must be 1.
+- size-cells		: Size cells. Must be 1.
+
+Child nodes:
+ For NAND the "arm,pl353-nand-r2p1" and for NOR the "cfi-flash" drivers are
+supported as child nodes.
+
+Mandatory timing properties for child nodes:
+- arm,nand-cycle-t0	: Read cycle time(t_rc).
+- arm,nand-cycle-t1	: Write cycle time(t_wc).
+- arm,nand-cycle-t2	: re_n assertion delay(t_rea).
+- arm,nand-cycle-t3	: we_n de-assertion delay(t_wp).
+- arm,nand-cycle-t4	: Status read time(t_clr)
+- arm,nand-cycle-t5	: ID read time(t_ar)
+- arm,nand-cycle-t6	: busy to re_n(t_rr)
+
+for nand partition information please refer the below file
+Documentation/devicetree/bindings/mtd/partition.txt
+
+Example:
+	pl353smcc_0: pl353smcc@e000e000 {
+			compatible = "arm,pl353-smcc-r2p1"
+			clock-names = "memclk", "aclk";
+			clocks = <&clkc 11>, <&clkc 44>;
+			reg = <0xe000e000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+			nand_0: nand@e1000000 {
+				compatible = "arm,pl353-nand-r2p1"
+				reg = <0xe1000000 0x1000000>;
+				arm,nand-cycle-t0 = <0x4>;
+				arm,nand-cycle-t1 = <0x4>;
+				arm,nand-cycle-t2 = <0x1>;
+				arm,nand-cycle-t3 = <0x2>;
+				arm,nand-cycle-t4 = <0x2>;
+				arm,nand-cycle-t5 = <0x2>;
+				arm,nand-cycle-t6 = <0x4>;
+				(...)
+			};
+	};
-- 
1.7.4
