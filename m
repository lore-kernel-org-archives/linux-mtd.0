From: Zhou Wang <wangzhou1@hisilicon.com>
To: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, <haojian.zhuang@gmail.com>,
 <xuwei5@hisilicon.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v8 2/2] mtd: hisilicon: add device tree binding documentation
Date: Sun, 25 Jan 2015 18:53:14 +0800
Message-ID: <1422183194-10148-3-git-send-email-wangzhou1@hisilicon.com>
In-Reply-To: <1422183194-10148-1-git-send-email-wangzhou1@hisilicon.com>
References: <1422183194-10148-1-git-send-email-wangzhou1@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, Zhou Wang <wangzhou1@hisilicon.com>,
 linux-mtd@lists.infradead.org, caizhiyong@huawei.com, yubingxu@hisilicon.com,
 liguozhu@hisilicon.com, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds the related dts binding document for Hisilicon 504 NAND
controller.

Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
---
 .../devicetree/bindings/mtd/hisi504-nand.txt       | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/hisi504-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/hisi504-nand.txt b/Documentation/devicetree/bindings/mtd/hisi504-nand.txt
new file mode 100644
index 0000000..2e35f06
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/hisi504-nand.txt
@@ -0,0 +1,47 @@
+Hisilicon Hip04 Soc NAND controller DT binding
+
+Required properties:
+
+- compatible:          Should be "hisilicon,504-nfc".
+- reg:                 The first contains base physical address and size of
+                       NAND controller's registers. The second contains base
+                       physical address and size of NAND controller's buffer.
+- interrupts:          Interrupt number for nfc.
+- nand-bus-width:      See nand.txt.
+- nand-ecc-mode:       Support none and hw ecc mode.
+- #address-cells:      Partition address, should be set 1.
+- #size-cells:         Partition size, should be set 1.
+
+Optional properties:
+
+- nand-ecc-strength:   Number of bits to correct per ECC step.
+- nand-ecc-step-size:  Number of data bytes covered by a single ECC step.
+
+The following ECC strength and step size are currently supported:
+
+ - nand-ecc-strength = <16>, nand-ecc-step-size = <1024>
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
+		nand-ecc-strength = <16>;
+		nand-ecc-step-size = <1024>;
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
1.9.1
