Received: from mail-lf0-f50.google.com ([209.85.215.50])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cXauI-0001ks-Kb
 for linux-mtd@lists.infradead.org; Sat, 28 Jan 2017 21:51:41 +0000
Received: by mail-lf0-f50.google.com with SMTP id x1so91353300lff.0
 for <linux-mtd@lists.infradead.org>; Sat, 28 Jan 2017 13:51:18 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: Janos Laube <janos.dev@gmail.com>,
 Paulius Zaleckas <paulius.zaleckas@gmail.com>, openwrt-devel@openwrt.org,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org
Subject: [PATCH 09/22 v2] mtd: add DT bindings for the Cortina Systems Gemini
 Flash
Date: Sat, 28 Jan 2017 22:50:04 +0100
Message-Id: <20170128215004.11532-1-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This adds device tree bindings for the Cortina systems Gemini
flash controller, a simple physmap which however need a few
syscon bits to be poked to operate properly.

Cc: Janos Laube <janos.dev@gmail.com>
Cc: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: devicetree@vger.kernel.org
Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Add Marek's and Rob's ACK tags.

MTD maintainers: please just apply this to the MTD tree when
you are happy with it. It is functionally orthogonal to the rest
of the series and is just in the series for context.
---
 .../bindings/mtd/cortina,gemini-flash.txt          | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt

diff --git a/Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt b/Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt
new file mode 100644
index 000000000000..3fa1b34d69ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt
@@ -0,0 +1,24 @@
+Flash device on Cortina Systems Gemini SoC
+
+This flash is regular CFI compatible (Intel or AMD extended) flash chips with
+some special bits that can be controlled by the machine's system controller.
+
+Required properties:
+- compatible : must be "cortina,gemini-flash", "cfi-flash";
+- reg : memory address for the flash chip
+- syscon : must be a phandle to the system controller
+- bank-width : width in bytes of flash interface, should be <2>
+
+For the rest of the properties, see mtd-physmap.txt.
+
+The device tree may optionally contain sub-nodes describing partitions of the
+address space. See partition.txt for more detail.
+
+Example:
+
+flash@30000000 {
+	compatible = "cortina,gemini-flash", "cfi-flash";
+	reg = <0x30000000 0x01000000>;
+	syscon = <&syscon>;
+	bank-width = <2>;
+};
-- 
2.9.3
