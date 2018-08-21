Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fs7hr-00041f-IM
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2018 14:32:32 +0000
Received: by mail-ed1-x543.google.com with SMTP id j21-v6so10756277edp.10
 for <linux-mtd@lists.infradead.org>; Tue, 21 Aug 2018 07:32:17 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
 devicetree@vger.kernel.org
Subject: [PATCH 8/8] dt-binding: mtd: Document gpio-addr-flash
Date: Tue, 21 Aug 2018 16:31:52 +0200
Message-Id: <20180821143152.32293-9-ricardo.ribalda@gmail.com>
In-Reply-To: <20180821143152.32293-1-ricardo.ribalda@gmail.com>
References: <20180821143152.32293-1-ricardo.ribalda@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add documentation for gpio-addr-flash. This binding allow creating
flash devices that are paged using GPIOs.

Cc: devicetree@vger.kernel.org
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 .../bindings/mtd/gpio-addr-flash.txt          | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt

diff --git a/Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt b/Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt
new file mode 100644
index 000000000000..4279e8cad09b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/gpio-addr-flash.txt
@@ -0,0 +1,46 @@
+Memory Mapped flash with some address lines addressed using GPIOs
+
+Handle the case where a flash device is mostly addressed using physical
+line and supplemented by GPIOs.  This way you can hook up say a 8MiB flash
+to a 2MiB memory range and use the GPIOs to select a particular range.
+
+ - compatible : "cfi-gpio-addr-flash"
+ - reg : Address range of the mtd chip that is memory mapped, this is,
+   on the previous example 2MiB.
+ - bank-width : Width (in bytes) of the bank.  Equal to the
+   device width times the number of interleaved chips.
+ - probe-type : (optional) "cfi_probe", "jedec_probe". How the mtd chip
+   is going to be probed. If omitted, assumed to be equal to "cfi_probe".
+ - #address-cells, #size-cells : Must be present if the device has
+   sub-nodes representing partitions (see below).  In this case
+   both #address-cells and #size-cells must be equal to 1.
+
+The device tree may optionally contain sub-nodes describing partitions of the
+address space. See partition.txt for more detail.
+
+Example:
+
+	cfi_flash_0: cfi_flash {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "cfi-gpio-addr-flash";
+		bank-width = <2>;
+		reg = < 0x00300000 0x00200000 >;
+		gpios = <&gpio_0 3 0>, <&gpio_0 4 0>;
+		partition@0 {
+			reg = < 0x0 0x200000 >;
+			label = "Golden Bitstream";
+		};
+		partition@200000 {
+			reg = < 0x200000 0x200000 >;
+			label = "User Bitstream";
+		};
+		partition@400000 {
+			reg = < 0x400000 0x200000 >;
+			label = "V4L Controls";
+		};
+		partition@600000 {
+			reg = < 0x600000 0x200000 >;
+			label = "Production Data";
+		};
+	} ;
-- 
2.18.0
