Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XhJ2A-0007b6-D9
 for linux-mtd@lists.infradead.org; Thu, 23 Oct 2014 14:06:35 +0000
Received: by mail-pd0-f172.google.com with SMTP id r10so350073pdi.3
 for <linux-mtd@lists.infradead.org>; Thu, 23 Oct 2014 07:06:13 -0700 (PDT)
From: Zhou Wang <wangzhou.bry@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/2] mtd: hisilicon: add device tree binding documentation
Date: Thu, 23 Oct 2014 22:04:45 +0800
Message-Id: <1414073085-19296-3-git-send-email-wangzhou.bry@gmail.com>
In-Reply-To: <1414073085-19296-1-git-send-email-wangzhou.bry@gmail.com>
References: <1414073085-19296-1-git-send-email-wangzhou.bry@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, Zhou Wang <wangzhou.bry@gmail.com>,
 linux-kernel@vger.kernel.org, haojian.zhuang@gmail.com,
 wangzhou1@hisilicon.com, robh+dt@kernel.org, xuwei5@hisilicon.com,
 galak@codeaurora.org, caizhiyong@huawei.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Zhou Wang <wangzhou.bry@gmail.com>
---
 .../devicetree/bindings/mtd/hisi504-nand.txt       |   40 ++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/hisi504-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/hisi504-nand.txt b/Documentation/devicetree/bindings/mtd/hisi504-nand.txt
new file mode 100644
index 0000000..c8b3988
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/hisi504-nand.txt
@@ -0,0 +1,40 @@
+Hisilicon Hip04 Soc NAND controller DT binding
+
+Required properties:
+- compatible:          Should be "hisilicon,504-nfc".
+- reg:                 The first contains base physical address and size of
+                       NAND controller's registers. The second contains base
+                       physical address and size of NAND controller's buffer.
+- interrupts:          Interrupt number for nfc.
+- nand-bus-width:      See nand.txt.
+- nand-ecc-mode:       See nand.txt.
+- hisi,nand-ecc-bits:  ECC bits type support.
+                 <0>:  none ecc
+                 <1>:  Can correct 1bit per 512byte.
+                 <6>:  Can correct 16bits per 1K byte.
+- #address-cells:      partition address, should be set 1.
+- #size-cells:         partition size, should be set 1.
+
+Flash chip may optionally contain additional sub-nodes describing partitions of
+the address space. See partition.txt for more detail.
+
+Example:
+
+	nand: nand@4020000 {
+		compatible = "hisilicon,504-nfc";
+		reg = <0x4020000 0x10000>, <0x5000000 0x1000>;
+		interrupts = <0 379 4>;
+		nand-bus-width = <8>;
+		nand-ecc-mode = "hw";
+		hisi,nand-ecc-bits = <1>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "nand_text";
+			reg = <0x00000000 0x00400000>;
+		};
+
+		...
+
+	};
-- 
1.7.9.5
