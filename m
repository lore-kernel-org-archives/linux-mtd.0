Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by merlin.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bsWwh-0005VF-BI
 for linux-mtd@lists.infradead.org; Fri, 07 Oct 2016 15:20:24 +0000
Received: by mail-wm0-x229.google.com with SMTP id b201so45874856wmb.0
 for <linux-mtd@lists.infradead.org>; Fri, 07 Oct 2016 08:20:01 -0700 (PDT)
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, Wolfram Sang <wsa@the-dreams.de>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>,
 Peter Rosin <peda@axentia.se>, Debjit Ghosh <dghosh@juniper.net>,
 Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <groeck@juniper.net>,
 JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>,
 Rajat Jain <rajatjain@juniper.net>,
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 06/10] i2c: i2c-mux-ptxpmb-cpld: Add device tree bindings
Date: Fri,  7 Oct 2016 18:17:27 +0300
Message-Id: <1475853451-22121-7-git-send-email-pantelis.antoniou@konsulko.com>
In-Reply-To: <1475853451-22121-1-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853451-22121-1-git-send-email-pantelis.antoniou@konsulko.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Georgi Vlaev <gvlaev@juniper.net>

Add binding document for the i2c driver of PTXPMB CPLD.

Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 .../bindings/i2c/jnx,i2c-mux-ptxpmb-cpld.txt       | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/jnx,i2c-mux-ptxpmb-cpld.txt

diff --git a/Documentation/devicetree/bindings/i2c/jnx,i2c-mux-ptxpmb-cpld.txt b/Documentation/devicetree/bindings/i2c/jnx,i2c-mux-ptxpmb-cpld.txt
new file mode 100644
index 0000000..3b201f7
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/jnx,i2c-mux-ptxpmb-cpld.txt
@@ -0,0 +1,50 @@
+* Juniper PTXPMB CPLD I2C Mux
+
+I2C mux on the PTXPMB CPLD on Juniper series of routers.
+
+Required properties:
+
+  - compatible: Must contain one of the following.
+    "jnx,i2c-mux-ptxpmb-cpld", "jnx,i2c-mux-ngpmb-bcpld"
+  - num-enable: Number of muxes to enable.
+
+  The following required properties are defined externally:
+
+  - Standard I2C mux properties. See i2c-mux.txt in this directory.
+  - I2C child bus nodes. See i2c-mux.txt in this directory.
+
+Optional Properties:
+
+  - num-channels: Number of channels. If not present the default is 8.
+  - base-bus-num: Base bus number. If not present it is 0.
+  - use-force: Use the force method of the controller.
+
+
+Example:
+
+cpld-i2c-mux {
+	compatible = "jnx,i2c-mux-ptxpmb-cpld";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	i2c-parent = <&i2c1>;
+
+	num-enable = <1>;
+
+	i2c@0 {
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* PMB devices are accessed through FPC */
+
+		temp-sensor@1a { /* FPC */
+			compatible = "maxim,max6697";
+			reg = <0x1a>;
+			smbus-timeout-disable;
+			resistance-cancellation;
+			alert-mask = <0xff>;
+			over-temperature-mask = <0xff>;
+		};
+	};
+};
-- 
1.9.1
