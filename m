Received: from mout.gmx.net ([212.227.15.18])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y6IsI-0003f0-Lj
 for linux-mtd@lists.infradead.org; Wed, 31 Dec 2014 12:59:43 +0000
From: Oleksij Rempel <linux@rempel-privat.de>
To: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com
Subject: [PATCH v3 2/3] mtd: nand: add asm9260-nand devicetree documentation
Date: Wed, 31 Dec 2014 13:58:52 +0100
Message-Id: <1420030733-10374-2-git-send-email-linux@rempel-privat.de>
In-Reply-To: <1420030733-10374-1-git-send-email-linux@rempel-privat.de>
References: <20141230200946.277c56c0@bbrezillon>
 <1420030733-10374-1-git-send-email-linux@rempel-privat.de>
Cc: Oleksij Rempel <linux@rempel-privat.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
---
 .../devicetree/bindings/mtd/asm9260-nand.txt       | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/asm9260-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/asm9260-nand.txt b/Documentation/devicetree/bindings/mtd/asm9260-nand.txt
new file mode 100644
index 0000000..07bfdac
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/asm9260-nand.txt
@@ -0,0 +1,25 @@
+* Alphascales's asm9260_nand
+
+Required properties:
+- compatible: "alphascale,asm9260-nand"
+- reg: address range of the nfc block
+- interrupts: irq to be used
+- clocks: clock ids.
+- clock-names: only "sys" and "ahb" should be used.
+- nand-ecc-strength: see nand.txt
+- nand-ecc-mode: see nand.txt
+- nand-on-flash-bbt: see nand.txt
+- nand-max-chips: maximal number of attached chips. asm9260 support max 2.
+
+Example:
+
+	nand@d8000000 {
+		compatible = "alphascale,asm9260-nand";
+		reg = <0x80600000 0x100>;
+		interrupts = <29>;
+		nand-ecc-strength = <4>;
+		nand-ecc-mode = "hw";
+		nand-max-chips = <1>;
+		clocks = <&acc CLKID_SYS_NAND>, <&acc CLKID_AHB_NAND>;
+		clock-names = "sys", "ahb";
+	};
-- 
1.9.1
