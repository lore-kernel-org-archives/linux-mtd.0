Received: from scopuli.esotechnik.de ([79.143.188.15] helo=mail.esotechnik.net)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxwvZ-0002pz-HS
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2018 16:14:43 +0000
From: Bernhard Frauendienst <kernel@nospam.obeliks.de>
To: linux-mtd@lists.infradead.org
Cc: Bernhard Frauendienst <kernel@nospam.obeliks.de>
Subject: [PATCH 2/3] dt-bindings: add bindings for mtd-concat devices
Date: Thu,  6 Sep 2018 18:14:12 +0200
Message-Id: <20180906161413.6335-3-kernel@nospam.obeliks.de>
In-Reply-To: <20180906161413.6335-1-kernel@nospam.obeliks.de>
References: <20180906161413.6335-1-kernel@nospam.obeliks.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Bernhard Frauendienst <kernel@nospam.obeliks.de>
---
 .../devicetree/bindings/mtd/mtd-concat.txt    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/mtd-concat.txt

diff --git a/Documentation/devicetree/bindings/mtd/mtd-concat.txt b/Documentation/devicetree/bindings/mtd/mtd-concat.txt
new file mode 100644
index 000000000000..9fade3af117b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/mtd-concat.txt
@@ -0,0 +1,21 @@
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
+}
-- 
2.17.1
