Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by casper.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bsWwq-00082z-46
 for linux-mtd@lists.infradead.org; Fri, 07 Oct 2016 15:20:32 +0000
Received: by mail-wm0-x229.google.com with SMTP id i130so45833856wmg.1
 for <linux-mtd@lists.infradead.org>; Fri, 07 Oct 2016 08:20:13 -0700 (PDT)
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
Subject: [PATCH 10/10] mtd: ngpmb_nvram: Add bindings for Juniper's ngpmb NVRAM
Date: Fri,  7 Oct 2016 18:17:31 +0300
Message-Id: <1475853451-22121-11-git-send-email-pantelis.antoniou@konsulko.com>
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

Add device tree binging document for the ngpmb NVRAM device.

Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 .../devicetree/bindings/mtd/ngpmb-nvram.txt        | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/ngpmb-nvram.txt

diff --git a/Documentation/devicetree/bindings/mtd/ngpmb-nvram.txt b/Documentation/devicetree/bindings/mtd/ngpmb-nvram.txt
new file mode 100644
index 0000000..297ad0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ngpmb-nvram.txt
@@ -0,0 +1,22 @@
+Non Volatile RAM device on a Juniper NG PMB FPGA
+
+These devices are found in the PTX series of Juniper routers.
+
+Required properties:
+- compatible : must be "jnx,ngpmb-nvram"
+
+Optional properties:
+- reg : memory address for the RAM, note that this is not
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
+ngpmb_nvram {
+	compatible = "jnx,ngpmb-nvram";
+};
-- 
1.9.1
