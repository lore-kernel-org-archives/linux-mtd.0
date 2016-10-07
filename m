Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bsX10-000169-VW
 for linux-mtd@lists.infradead.org; Fri, 07 Oct 2016 15:25:14 +0000
Received: by mail-wm0-x22e.google.com with SMTP id b201so46158128wmb.0
 for <linux-mtd@lists.infradead.org>; Fri, 07 Oct 2016 08:24:30 -0700 (PDT)
From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
To: Lee Jones <lee.jones@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Wim Van Sebroeck <wim@iguana.be>, Jean Delvare <jdelvare@suse.com>,
 Georgi Vlaev <gvlaev@juniper.net>, Guenter Roeck <linux@roeck-us.net>,
 JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>,
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org
Subject: [PATCH 6/7] mtd: ptx1kbf: Bindings for Juniper's PTX1K Boot FPGA
Date: Fri,  7 Oct 2016 18:22:03 +0300
Message-Id: <1475853724-22557-7-git-send-email-pantelis.antoniou@konsulko.com>
In-Reply-To: <1475853724-22557-1-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853724-22557-1-git-send-email-pantelis.antoniou@konsulko.com>
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
in the PTX1K Boot FPGA on PTX series of routers.

Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 .../devicetree/bindings/mtd/ptx1kbf-mtd.txt        | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/ptx1kbf-mtd.txt

diff --git a/Documentation/devicetree/bindings/mtd/ptx1kbf-mtd.txt b/Documentation/devicetree/bindings/mtd/ptx1kbf-mtd.txt
new file mode 100644
index 0000000..4e25060
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ptx1kbf-mtd.txt
@@ -0,0 +1,23 @@
+Flash device on a PTX1K Boot FPGA
+
+These flash chips are found in the PTX series of Juniper routers.
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
+ptx1kbf_mtd {
+	compatible = "jnx,ptx1kbf-mtd";
+	/* usually the whole flash is used */
+};
-- 
1.9.1
