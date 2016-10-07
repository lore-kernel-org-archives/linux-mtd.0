Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bsWxr-00079I-OY
 for linux-mtd@lists.infradead.org; Fri, 07 Oct 2016 15:21:38 +0000
Received: by mail-wm0-x236.google.com with SMTP id i130so45900066wmg.1
 for <linux-mtd@lists.infradead.org>; Fri, 07 Oct 2016 08:21:15 -0700 (PDT)
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>,
 Wolfram Sang <wsa@the-dreams.de>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Wim Van Sebroeck <wim@iguana.be>,
 Peter Rosin <peda@axentia.se>, Debjit Ghosh <dghosh@juniper.net>,
 Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>,
 Maryam Seraj <mseraj@juniper.net>,
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-watchdog@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH 08/10] mtd: flash-sam: Bindings for Juniper's SAM FPGA flash
Date: Fri,  7 Oct 2016 18:18:36 +0300
Message-Id: <1475853518-22264-9-git-send-email-pantelis.antoniou@konsulko.com>
In-Reply-To: <1475853518-22264-1-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853518-22264-1-git-send-email-pantelis.antoniou@konsulko.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Georgi Vlaev <gvlaev@juniper.net>

Add binding document for Junipers Flash IP block present
in the SAM FPGA on PTX series of routers.

Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 .../devicetree/bindings/mtd/flash-sam.txt          | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/flash-sam.txt

diff --git a/Documentation/devicetree/bindings/mtd/flash-sam.txt b/Documentation/devicetree/bindings/mtd/flash-sam.txt
new file mode 100644
index 0000000..bdf1d78
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/flash-sam.txt
@@ -0,0 +1,31 @@
+Flash device on a Juniper SAM FPGA
+
+These flash chips are found in the PTX series of Juniper routers.
+
+They are regular CFI compatible (Intel or AMD extended) flash chips with
+some special write protect/VPP bits that can be controlled by the machine's
+system controller.
+
+Required properties:
+- compatible : must be "jnx,flash-sam"
+
+Optional properties:
+- reg : memory address for the flash chip, note that this is not
+required since usually the device is a subdevice of the SAM MFD
+driver which fills in the register fields.
+
+For the rest of the properties, see mtd-physmap.txt.
+
+The device tree may optionally contain sub-nodes describing partitions of the
+address space. See partition.txt for more detail.
+
+Example:
+
+flash_sam {
+	compatible = "jnx,flash-sam";
+	partition@0 {
+		reg = <0x0 0x400000>;
+		label = "pic0-golden";
+		read-only;
+	};
+};
-- 
1.9.1
