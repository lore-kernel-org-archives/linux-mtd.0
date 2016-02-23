Received: from mail-he1eur01on061c.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::61c]
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aYMGQ-0004gx-FX
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2016 23:21:07 +0000
From: Han Xu <han.xu@nxp.com>
To: <shijie.huang@arm.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <han.xu@nxp.com>, <standby24x7@gmail.com>,
 <jkosina@suse.cz>, <boris.brezillon@free-electrons.com>,
 <fabio.estevam@freescale.com>, <fransklaver@gmail.com>, <hofrat@osadl.org>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/5] mtd: nand: gpmi: document the clocks and clock-names in
 DT property
Date: Tue, 23 Feb 2016 17:04:50 -0600
Message-ID: <1456268693-8630-3-git-send-email-han.xu@nxp.com>
In-Reply-To: <1456268693-8630-1-git-send-email-han.xu@nxp.com>
References: <1456268693-8630-1-git-send-email-han.xu@nxp.com>
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
index d02acaf..c8d0e2f 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
@@ -13,6 +13,13 @@ Required properties:
     and GPMI DMA channel ID.
     Refer to dma.txt and fsl-mxs-dma.txt for details.
   - dma-names: Must be "rx-tx".
+  - clocks : The clocks needed by the gpmi controller. This field varies
+    depends on the SoC design, "gpmi-io" is mandatory but some platforms may
+    need several extra clocks, such as i.MX6Q, it requires "gpmi_apb,
+    gpmi_bch, gpmi_bch_apb and per1_bch" for all submodules. Please refer to
+    the HW design manual.
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
