Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bsWyR-0007V0-2Q
 for linux-mtd@lists.infradead.org; Fri, 07 Oct 2016 15:22:25 +0000
Received: by mail-wm0-x235.google.com with SMTP id b201so45989535wmb.0
 for <linux-mtd@lists.infradead.org>; Fri, 07 Oct 2016 08:21:50 -0700 (PDT)
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>,
 Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>,
 JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>,
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-watchdog@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH 2/4] mfd: ptxpmb-ext-cpld: Add documentation for PTXPMB
 extended CPLD
Date: Fri,  7 Oct 2016 18:19:32 +0300
Message-Id: <1475853574-22339-3-git-send-email-pantelis.antoniou@konsulko.com>
In-Reply-To: <1475853574-22339-1-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853574-22339-1-git-send-email-pantelis.antoniou@konsulko.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Georgi Vlaev <gvlaev@juniper.net>

Add DT bindings document for the PTXPMB extended CPLD device.

Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 .../bindings/mfd/jnx-ptxpmb-ext-cpld.txt           | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/jnx-ptxpmb-ext-cpld.txt

diff --git a/Documentation/devicetree/bindings/mfd/jnx-ptxpmb-ext-cpld.txt b/Documentation/devicetree/bindings/mfd/jnx-ptxpmb-ext-cpld.txt
new file mode 100644
index 0000000..098a548a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/jnx-ptxpmb-ext-cpld.txt
@@ -0,0 +1,35 @@
+* Device tree bindings for Juniper's PTXPMB Extended CPLD FPGA MFD driver
+
+The device supports a gpio block which is described in the
+jnx-gpio-ptxpmb-ext-cpld document.
+
+Required properties:
+
+- compatible:		"jnx,ptxpmb-ext-cpld"
+
+- reg:			contains offset/length value for device state control
+			registers space.
+
+Optional properties:
+
+- interrupts:		The interrupt line(s) the /IRQ signal(s) for the device is
+			connected to.
+
+- interrupt-parent:	The parent interrupt controller.
+
+Example:
+
+ext-cpld@1,0 {
+	compatible = "jnx,ptxpmb-ext-cpld";
+	reg = <0x1 0 0x1000>;
+	interrupt-parent = <&mpic>;
+	interrupts = <7 2>, <8 2>;
+
+	gpio_ext_cpld: cpld-ext-gpio {
+		compatible = "jnx,gpio-ptxpmb-ext-cpld";
+		#gpio-cells = <2>;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		interrupt-controller;
+	};
+};
-- 
1.9.1
