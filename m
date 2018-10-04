Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g83GJ-0007db-C4
 for linux-mtd@lists.infradead.org; Thu, 04 Oct 2018 13:02:21 +0000
Received: by mail-lj1-x243.google.com with SMTP id 203-v6so8253692ljj.13
 for <linux-mtd@lists.infradead.org>; Thu, 04 Oct 2018 06:01:41 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Zhouyang Jia <jiazhouyang09@gmail.com>, linux-mtd@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
 devicetree@vger.kernel.org
Subject: [PATCH v6 09/10] dt-binding: mtd: Document gpio-addr-flash
Date: Thu,  4 Oct 2018 15:01:09 +0200
Message-Id: <20181004130110.8496-9-ricardo.ribalda@gmail.com>
In-Reply-To: <20181004130110.8496-1-ricardo.ribalda@gmail.com>
References: <20181004130110.8496-1-ricardo.ribalda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 .../bindings/mtd/mtd,gpio-addr-flash.txt      | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/mtd,gpio-addr-flash.txt

diff --git a/Documentation/devicetree/bindings/mtd/mtd,gpio-addr-flash.txt b/Documentation/devicetree/bindings/mtd/mtd,gpio-addr-flash.txt
new file mode 100644
index 000000000000..304a33880f9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/mtd,gpio-addr-flash.txt
@@ -0,0 +1,25 @@
+Memory Mapped flash with some address lines addressed using GPIOs
+
+Handle the case where a flash device is mostly addressed using physical
+line and supplemented by GPIOs.  This way you can hook up say a 8MiB flash
+to a 2MiB memory range and use the GPIOs to select a particular range.
+
+ - compatible :  must be "mtd,gpio-addr-flash", "cfi-flash";
+ - reg : Address range of the mtd chip that is memory mapped, this is,
+   on the previous example 2MiB.
+ - addr-gpios: List of GPIO specifiers that will be used to address the MSBs
+   address lines. The order goes from LSB to MSB.
+
+For the rest of the properties, see mtd-physmap.txt.
+
+The device tree may optionally contain sub-nodes describing partitions of the
+address space. Check partition.txt for more details.
+
+Example:
+
+	flash@300000 {
+		compatible = "mtd,gpio-addr-flash", "cfi-flash";
+		bank-width = <2>;
+		reg = < 0x00300000 0x00200000 >;
+		addr-gpios = <&gpio_0 3 0>, <&gpio_0 4 0>;
+	} ;
-- 
2.19.0
