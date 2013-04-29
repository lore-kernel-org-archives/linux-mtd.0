Received: from eu1sys200aog113.obsmtp.com ([207.126.144.135])
 by merlin.infradead.org with smtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UWmt3-00088h-HG
 for linux-mtd@lists.infradead.org; Mon, 29 Apr 2013 12:08:55 +0000
From: Linus Walleij <linus.walleij@stericsson.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: nand: fsmc: update of OF support
Date: Mon, 29 Apr 2013 14:07:48 +0200
Message-ID: <1367237268-21694-1-git-send-email-linus.walleij@stericsson.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Anmar Oueja <anmar.oueja@linaro.org>, Vipin Kumar <vipin.kumar@st.com>,
 Mian Yousaf Kaukab <mian.yousaf.kaukab@stericsson.com>,
 Stefan Roese <sr@denx.de>, Linus Walleij <linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mian Yousaf Kaukab <mian.yousaf.kaukab@stericsson.com>

Add nand bank selection and timings to the device tree bindings.

Cc: Stefan Roese <sr@denx.de>
Cc: Vipin Kumar <vipin.kumar@st.com>
Signed-off-by: Mian Yousaf Kaukab <mian.yousaf.kaukab@stericsson.com>
[Added some documentation]
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/mtd/fsmc-nand.txt          | 25 +++++++++++++++++++++-
 drivers/mtd/nand/fsmc_nand.c                       | 18 ++++++++++++++++
 include/linux/mtd/fsmc.h                           |  1 +
 3 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/fsmc-nand.txt b/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
index 2240ac0..ec42935 100644
--- a/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
@@ -1,4 +1,5 @@
-* FSMC NAND
+ST Microelectronics Flexible Static Memory Controller (FSMC)
+NAND Interface
 
 Required properties:
 - compatible : "st,spear600-fsmc-nand", "stericsson,fsmc-nand"
@@ -9,6 +10,26 @@ Optional properties:
 - bank-width : Width (in bytes) of the device.  If not present, the width
   defaults to 1 byte
 - nand-skip-bbtscan: Indicates the the BBT scanning should be skipped
+- timings: array of 6 bytes for NAND timings. The meanings of these bytes
+  are:
+  byte 0 TCLR  : CLE to RE delay in number of AHB clock cycles, only 4 bits
+                 are valid. Zero means one clockcycle, 15 means 16 clock
+                 cycles.
+  byte 1 TAR   : ALE to RE delay, 4 bits are valid. Same format as TCLR.
+  byte 2 THIZ  : number of HCLK clock cycles during which the data bus is
+                 kept in Hi-Z (tristate) after the start of a write access.
+                 Only valid for write transactions. Zero means zero cycles,
+                 255 means 255 cycles.
+  byte 3 THOLD : number of HCLK clock cycles to hold the address (and data
+                 when writing) after the command deassertation. Zero means
+                 one cycle, 255 means 256 cycles.
+  byte 4 TWAIT : number of HCLK clock cycles to assert the command to the
+                 NAND flash in response to SMWAITn. Zero means 1 cycle,
+                 255 means 256 cycles.
+  byte 5 TSET  : number of HCLK clock cycles to assert the address before the
+                 command is asserted. Zero means one cycle, 255 means 256
+                 cycles.
+- bank: default NAND bank to use (0-3 are valid, 0 is the default).
 
 Example:
 
@@ -24,6 +45,8 @@ Example:
 
 		bank-width = <1>;
 		nand-skip-bbtscan;
+		timings = /bits/ 8 <0 0 0 2 3 0>;
+		bank = <1>;
 
 		partition@0 {
 			...
diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index 05ba3f0..a4ca95c 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -889,6 +889,24 @@ static int fsmc_nand_probe_config_dt(struct platform_device *pdev,
 	if (of_get_property(np, "nand-skip-bbtscan", NULL))
 		pdata->options = NAND_SKIP_BBTSCAN;
 
+	pdata->nand_timings = devm_kzalloc(&pdev->dev,
+				sizeof(*pdata->nand_timings), GFP_KERNEL);
+	if (!pdata->nand_timings) {
+		dev_err(&pdev->dev, "no memory for nand_timing\n");
+		return -ENOMEM;
+	}
+	of_property_read_u8_array(np, "timings", (u8 *)pdata->nand_timings,
+						sizeof(*pdata->nand_timings));
+
+	/* Set default NAND bank to 0 */
+	pdata->bank = 0;
+	if (!of_property_read_u32(np, "bank", &val)) {
+		if (val > 3) {
+			dev_err(&pdev->dev, "invalid bank %u\n", val);
+			return -EINVAL;
+		}
+		pdata->bank = val;
+	}
 	return 0;
 }
 #else
diff --git a/include/linux/mtd/fsmc.h b/include/linux/mtd/fsmc.h
index d6ed61e..c8be32e 100644
--- a/include/linux/mtd/fsmc.h
+++ b/include/linux/mtd/fsmc.h
@@ -137,6 +137,7 @@ enum access_mode {
 
 /**
  * fsmc_nand_platform_data - platform specific NAND controller config
+ * @nand_timings: timing setup for the physical NAND interface
  * @partitions: partition table for the platform, use a default fallback
  * if this is NULL
  * @nr_partitions: the number of partitions in the previous entry
-- 
1.7.11.3
