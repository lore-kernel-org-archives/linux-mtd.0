Received: from mail-db3on0088.outbound.protection.outlook.com ([157.55.234.88]
 helo=emea01-db3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGYoy-00084y-7g
 for linux-mtd@lists.infradead.org; Fri, 24 Jun 2016 21:39:29 +0000
From: Han Xu <han.xu@nxp.com>
To: <han.xu@nxp.com>, <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <robh+dt@kernel.org>,
 <pawel.moll@arm.com>, <mark.rutland@arm.com>,
 <ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v3 2/6] Documentation: dt: mtd: gpmi: document the clocks and
 clock-names in DT property
Date: Fri, 24 Jun 2016 16:40:07 -0500
Message-ID: <1466804411-19874-3-git-send-email-han.xu@nxp.com>
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

add the clocks and clock-names in DT property, gpmi-io clock is
mandatory for all platforms, but some platforms, such as i.MX6Q may
need more extra clocks for submodules. More details please refer to the
SoC reference manual.

Signed-off-by: Han Xu <han.xu@nxp.com>
---
 Documentation/devicetree/bindings/mtd/gpmi-nand.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
index d02acaf..a2fd034 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
@@ -13,6 +13,13 @@ Required properties:
     and GPMI DMA channel ID.
     Refer to dma.txt and fsl-mxs-dma.txt for details.
   - dma-names: Must be "rx-tx".
+  - clocks : The clocks needed by the gpmi controller. This field varies
+    depends on the SoC design, "gpmi-io" is mandatory but some platforms may
+    need several extra clocks, such as i.MX6 series, which requires "gpmi_apb,
+    gpmi_bch, gpmi_bch_apb and per1_bch" for all submodules, while i.MX7 only
+    need gpmi_bch_apb. Please refer to the HW design manual.
+  - clock-names : the name of the clocks, please refer to the HW design
+    manual.
 
 Optional properties:
   - nand-on-flash-bbt: boolean to enable on flash bbt option if not
@@ -51,6 +58,8 @@ gpmi-nand@8000c000 {
 	interrupt-names = "bch";
 	dmas = <&dma_apbh 4>;
 	dma-names = "rx-tx";
+	clocks = <&clks 50>,;
+	clock-names = "gpmi_io";
 
 	partition@0 {
 	...
-- 
1.9.1
