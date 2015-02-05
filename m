Received: from mail-we0-f179.google.com ([74.125.82.179])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJGSG-0007yV-77
 for linux-mtd@lists.infradead.org; Thu, 05 Feb 2015 07:02:25 +0000
Received: by mail-we0-f179.google.com with SMTP id u56so362915wes.10
 for <linux-mtd@lists.infradead.org>; Wed, 04 Feb 2015 23:01:56 -0800 (PST)
Message-ID: <54D3155E.5020805@gmail.com>
Date: Thu, 05 Feb 2015 08:01:50 +0100
From: Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2] mtd: spi-nor: support for SPI NOR deep power down
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Incorporated the feedback regarding v1.

The reboot hook is necessary to reset the SPI NOR to a state where it's
accessible by commands supported by all chips.
SoC's like i.mx6 have internal boot rom code which can read the actual
bootloader from SPI NOR. The SoC doesn't know which SPI NOR is used and
therefore can't use chip-specific commands.
Also the board design can't be blamed as lots of SPI NOR's don't have
a reset pin.

A new DT property determines whether deep power down is used if supported
by the chip. Default is not to use deep power down.
In addition to the DT property a new flag whether deep power down is
supported is introduced to spi_nor_ids.
We dont' rely on the DT property only as DT might not care about the chip
type and provide a generic chip name.
Not sure whether the majority of chips supports deep power down.
Then it might be better to define the flag as "does not support DPD".

So far the flag is only set for chips I own devices with.
Many more may support DPD.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 Documentation/devicetree/bindings/mtd/m25p80.txt |  5 ++
 drivers/mtd/spi-nor/spi-nor.c                    | 61 ++++++++++++++++++++----
 include/linux/mtd/spi-nor.h                      |  5 ++
 3 files changed, 63 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/m25p80.txt b/Documentation/devicetree/bindings/mtd/m25p80.txt
index 4611aa8..0462d47 100644
--- a/Documentation/devicetree/bindings/mtd/m25p80.txt
+++ b/Documentation/devicetree/bindings/mtd/m25p80.txt
@@ -16,6 +16,10 @@ Optional properties:
                    all chips and support for it can not be detected at runtime.
                    Refer to your chips' datasheet to check if this is supported
                    by your chip.
+- m25p,deep-power-down : Set chip to deep power down if idle. Opcodes for
+                         entering (0xb9) and leaving (0xab) deep power down mode
+                         are not supported by all chips. Property is ignored if
+                         chip doesn't support deep power down.
 
 Example:
 
@@ -26,4 +30,5 @@ Example:
 		reg = <0>;
 		spi-max-frequency = <40000000>;
 		m25p,fast-read;
+		m25p,deep-power-down;
 	};
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index b6a5a0c..a615ec3 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -55,6 +55,7 @@ struct flash_info {
 #define	SPI_NOR_DUAL_READ	0x20    /* Flash supports Dual Read */
 #define	SPI_NOR_QUAD_READ	0x40    /* Flash supports Quad Read */
 #define	USE_FSR			0x80	/* use flag status register */
+#define	DEEP_POWER_DOWN         0x100   /* supports deep power down */
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -268,6 +269,21 @@ static int erase_chip(struct spi_nor *nor)
 	return nor->write_reg(nor, SPINOR_OP_CHIP_ERASE, NULL, 0, 0);
 }
 
+static int spi_nor_suspend_dp(struct spi_nor *nor)
+{
+	return nor->write_reg(nor, SPINOR_OP_DP, NULL, 0, 0);
+}
+
+static int spi_nor_resume_dp(struct spi_nor *nor)
+{
+	int ret;
+
+	ret = nor->write_reg(nor, SPINOR_OP_RES, NULL, 0, 0);
+	usleep_range(30, 50);
+
+	return ret;
+}
+
 static int spi_nor_lock_and_prep(struct spi_nor *nor, enum spi_nor_ops ops)
 {
 	int ret = 0;
@@ -276,17 +292,33 @@ static int spi_nor_lock_and_prep(struct spi_nor *nor, enum spi_nor_ops ops)
 
 	if (nor->prepare) {
 		ret = nor->prepare(nor, ops);
-		if (ret) {
-			dev_err(nor->dev, "failed in the preparation.\n");
-			mutex_unlock(&nor->lock);
-			return ret;
-		}
+		if (ret)
+			goto err;
 	}
+	if (nor->deep_power_down) {
+		ret = spi_nor_resume_dp(nor);
+		if (ret)
+			goto err;
+	}
+	return 0;
+err:
+	dev_err(nor->dev, "failed in the preparation.\n");
+	mutex_unlock(&nor->lock);
 	return ret;
 }
 
 static void spi_nor_unlock_and_unprep(struct spi_nor *nor, enum spi_nor_ops ops)
 {
+	int ret;
+
+	if (nor->deep_power_down) {
+		ret = spi_nor_suspend_dp(nor);
+		if (ret) {
+			dev_err(nor->dev, "failed in the unpreparation.\n");
+			mutex_unlock(&nor->lock);
+			return;
+		}
+	}
 	if (nor->unprepare)
 		nor->unprepare(nor, ops);
 	mutex_unlock(&nor->lock);
@@ -521,7 +553,7 @@ static const struct spi_device_id spi_nor_ids[] = {
 	{ "en25p32",    INFO(0x1c2016, 0, 64 * 1024,   64, 0) },
 	{ "en25q32b",   INFO(0x1c3016, 0, 64 * 1024,   64, 0) },
 	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
-	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
+	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K | DEEP_POWER_DOWN) },
 	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256, 0) },
 	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
 
@@ -588,7 +620,7 @@ static const struct spi_device_id spi_nor_ids[] = {
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
 	{ "s25fl128s",	INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_QUAD_READ) },
 	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, 0) },
-	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, 0) },
+	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, DEEP_POWER_DOWN) },
 	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
 	{ "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16, 0) },
 	{ "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32, 0) },
@@ -640,7 +672,7 @@ static const struct spi_device_id spi_nor_ids[] = {
 	{ "m25pe80", INFO(0x208014,  0, 64 * 1024, 16,       0) },
 	{ "m25pe16", INFO(0x208015,  0, 64 * 1024, 32, SECT_4K) },
 
-	{ "m25px16",    INFO(0x207115,  0, 64 * 1024, 32, SECT_4K) },
+	{ "m25px16",    INFO(0x207115,  0, 64 * 1024, 32, SECT_4K | DEEP_POWER_DOWN) },
 	{ "m25px32",    INFO(0x207116,  0, 64 * 1024, 64, SECT_4K) },
 	{ "m25px32-s0", INFO(0x207316,  0, 64 * 1024, 64, SECT_4K) },
 	{ "m25px32-s1", INFO(0x206316,  0, 64 * 1024, 64, SECT_4K) },
@@ -971,6 +1003,13 @@ static int spi_nor_check(struct spi_nor *nor)
 	return 0;
 }
 
+static void spi_nor_reboot(struct mtd_info *mtd)
+{
+	struct spi_nor *nor = mtd_to_spi_nor(mtd);
+
+	spi_nor_resume_dp(nor);
+}
+
 int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 {
 	const struct spi_device_id	*id = NULL;
@@ -1086,6 +1125,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 			nor->flash_read = SPI_NOR_FAST;
 		else
 			nor->flash_read = SPI_NOR_NORMAL;
+
+		if (of_property_read_bool(np, "m25p,deep-power-down") &&
+		    info->flags & DEEP_POWER_DOWN) {
+			nor->deep_power_down = true;
+			mtd->_reboot = spi_nor_reboot;
+		}
 	} else {
 		/* If we weren't instantiated by DT, default to fast-read */
 		nor->flash_read = SPI_NOR_FAST;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 4720b86..98616a9 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -60,6 +60,9 @@
 #define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
 #define SPINOR_OP_WD_EVCR      0x61    /* Write EVCR register */
 
+#define SPINOR_OP_DP		0xb9	/* deep power down */
+#define SPINOR_OP_RES		0xab	/* resume from deep power down */
+
 /* Status Register bits. */
 #define SR_WIP			1	/* Write in progress */
 #define SR_WEL			2	/* Write enable latch */
@@ -143,6 +146,7 @@ enum spi_nor_option_flags {
  * @flags:		flag options for the current SPI-NOR (SNOR_F_*)
  * @cfg:		used by the read_xfer/write_xfer
  * @cmd_buf:		used by the write_reg
+ * @deep_power_down:	deep power down mode supported and enabled
  * @prepare:		[OPTIONAL] do some preparations for the
  *			read/write/erase/lock/unlock operations
  * @unprepare:		[OPTIONAL] do some post work after the
@@ -172,6 +176,7 @@ struct spi_nor {
 	u32			flags;
 	struct spi_nor_xfer_cfg	cfg;
 	u8			cmd_buf[SPI_NOR_MAX_CMD_SIZE];
+	bool			deep_power_down;
 
 	int (*prepare)(struct spi_nor *nor, enum spi_nor_ops ops);
 	void (*unprepare)(struct spi_nor *nor, enum spi_nor_ops ops);
-- 
2.2.2
