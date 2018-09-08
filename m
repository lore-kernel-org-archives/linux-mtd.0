Received: from scopuli.esotechnik.de ([2a02:c205:3001:6788::1]
 helo=mail.esotechnik.net)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyd45-0007UF-4V
 for linux-mtd@lists.infradead.org; Sat, 08 Sep 2018 13:14:19 +0000
From: Bernhard Frauendienst <kernel@nospam.obeliks.de>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Bernhard Frauendienst <kernel@nospam.obeliks.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] dt-bindings: add bindings for mtd-concat devices
Date: Sat,  8 Sep 2018 15:13:44 +0200
Message-Id: <20180908131345.8145-3-kernel@nospam.obeliks.de>
In-Reply-To: <20180908131345.8145-1-kernel@nospam.obeliks.de>
References: <20180908131345.8145-1-kernel@nospam.obeliks.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Document virtual mtd-concat device bindings.

Signed-off-by: Bernhard Frauendienst <kernel@nospam.obeliks.de>
---
 .../devicetree/bindings/mtd/mtd-concat.txt    | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/mtd-concat.txt

diff --git a/Documentation/devicetree/bindings/mtd/mtd-concat.txt b/Documentation/devicetree/bindings/mtd/mtd-concat.txt
new file mode 100644
index 000000000000..2daf3157b163
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/mtd-concat.txt
@@ -0,0 +1,36 @@
+Virtual MTD concat device
+
+Requires properties:
+- devices: list of phandles to mtd nodes that should be concatenated
+
+Example:
+
+&spi {
+	flash0: flash@0 {
+		...
+	};
+	flash1: flash@1 {
+		...
+	};
+};
+
+flash {
+	compatible = "mtd-concat";
+
+	devices = <&flash0 &flash1>;
+
+	partitions {
+		compatible = "fixed-partitions";
+
+		partition@0 {
+			label = "boot";
+			reg = <0x0000000 0x0040000>;
+			read-only;
+		};
+
+		partition@40000 {
+			label = "firmware";
+			reg = <0x0040000 0x1fc0000>;
+		};
+	}
+}
-- 
2.18.0
