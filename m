Received: from smtp09.smtpout.orange.fr ([80.12.242.131]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXHbe-0002bZ-4T
 for linux-mtd@lists.infradead.org; Thu, 25 Sep 2014 22:33:47 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v1 2/2] mtd: docg3: add device-tree documentation
Date: Fri, 26 Sep 2014 00:33:16 +0200
Message-Id: <1411684396-12094-2-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1411684396-12094-1-git-send-email-robert.jarzmik@free.fr>
References: <1411684396-12094-1-git-send-email-robert.jarzmik@free.fr>
Cc: devicetree@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add documentation for the sandisk docg3 chip.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/mtd/docg3.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/docg3.txt

diff --git a/Documentation/devicetree/bindings/mtd/docg3.txt b/Documentation/devicetree/bindings/mtd/docg3.txt
new file mode 100644
index 0000000..3fcc163
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/docg3.txt
@@ -0,0 +1,14 @@
+Sandisk docg3 device
+====================
+
+The Sandisk (former MSystems) docg3 is a nand device of 64M to 256MB.
+
+Required properties:
+ - compatible: Should be "sandisk,docg3"
+ - reg: register base and size
+
+Example:
+	docg3 {
+		compatible = "sandisk,docg3";
+		reg = <0x0 0x2000>;
+	};
-- 
2.0.0.rc2
