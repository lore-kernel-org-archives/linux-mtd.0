Received: from smtp06.smtpout.orange.fr ([80.12.242.128]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXxlz-0003fD-0I
 for linux-mtd@lists.infradead.org; Sat, 27 Sep 2014 19:35:15 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 2/2] mtd: docg3: add device-tree documentation
Date: Sat, 27 Sep 2014 21:34:30 +0200
Message-Id: <1411846470-30041-2-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1411846470-30041-1-git-send-email-robert.jarzmik@free.fr>
References: <1411846470-30041-1-git-send-email-robert.jarzmik@free.fr>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org
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
Cc: Mark Rutland <mark.rutland@arm.com>

---
Since v1: Mark's review : use m-systems,diskonchip-g3, add flash@0,
grammar
---
 Documentation/devicetree/bindings/mtd/diskonchip.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/diskonchip.txt

diff --git a/Documentation/devicetree/bindings/mtd/diskonchip.txt b/Documentation/devicetree/bindings/mtd/diskonchip.txt
new file mode 100644
index 0000000..3e13bfd
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/diskonchip.txt
@@ -0,0 +1,15 @@
+M-Systems and Sandisk DiskOnChip devices
+
+M-System DiskOnChip G3
+======================
+The Sandisk (formerly M-Systems) docg3 is a nand device of 64M to 256MB.
+
+Required properties:
+ - compatible: should be "m-systems,diskonchip-g3"
+ - reg: register base and size
+
+Example:
+	docg3: flash@0 {
+		compatible = "m-systems,diskonchip-g3";
+		reg = <0x0 0x2000>;
+	};
-- 
2.1.0
