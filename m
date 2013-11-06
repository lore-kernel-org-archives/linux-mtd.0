Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve4DO-0001nS-Ms
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2013 14:36:15 +0000
From: Sourav Poddar <sourav.poddar@ti.com>
To: <computersforpeace@gmail.com>
Subject: [PATCH 1/2] drivers: mtd: m25p80: convert "bool" read check into an
 enum
Date: Wed, 6 Nov 2013 20:05:34 +0530
Message-ID: <1383748535-20462-2-git-send-email-sourav.poddar@ti.com>
In-Reply-To: <1383748535-20462-1-git-send-email-sourav.poddar@ti.com>
References: <1383748535-20462-1-git-send-email-sourav.poddar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: marex@denx.de, Sourav Poddar <sourav.poddar@ti.com>,
 linux-mtd@lists.infradead.org, balbi@ti.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a cleanup prior to adding quad read support. This will fecilitate 
easy addition of more read commands check under an enum rather that defining a 
seperate bool for it.

Signed-off-by: Sourav Poddar <sourav.poddar@ti.com>
Suggested-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/m25p80.c |   71 +++++++++++++++++++++++++++++++++--------
 1 files changed, 57 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 7eda71d..cfafdce 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -84,6 +84,11 @@
 
 /****************************************************************************/
 
+enum read_type {
+	M25P80_NORMAL = 0,
+	M25P80_FAST,
+};
+
 struct m25p {
 	struct spi_device	*spi;
 	struct mutex		lock;
@@ -94,7 +99,7 @@ struct m25p {
 	u8			read_opcode;
 	u8			program_opcode;
 	u8			*command;
-	bool			fast_read;
+	enum read_type		flash_read;
 };
 
 static inline struct m25p *mtd_to_m25p(struct mtd_info *mtd)
@@ -350,6 +355,24 @@ static int m25p80_erase(struct mtd_info *mtd, struct erase_info *instr)
 }
 
 /*
+ * Dummy Cycle calculation for different type of read.
+ * It can be used to support more commands with
+ * different dummy cycle requirement.
+ */
+static inline int m25p80_dummy_cycles_read(struct m25p *flash)
+{
+	switch (flash->flash_read) {
+	case M25P80_FAST:
+		return 1;
+	case M25P80_NORMAL:
+		return 0;
+	default:
+		dev_err(&flash->spi->dev, "No valid read type supported");
+		return -1;
+	}
+}
+
+/*
  * Read an address range from the flash chip.  The address range
  * may be any size provided it is within the physical boundaries.
  */
@@ -360,6 +383,7 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	struct spi_transfer t[2];
 	struct spi_message m;
 	uint8_t opcode;
+	int dummy;
 
 	pr_debug("%s: %s from 0x%08x, len %zd\n", dev_name(&flash->spi->dev),
 			__func__, (u32)from, len);
@@ -367,8 +391,14 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 	spi_message_init(&m);
 	memset(t, 0, (sizeof t));
 
+	dummy =  m25p80_dummy_cycles_read(flash);
+	if (dummy < 0) {
+		dev_err(&flash->spi->dev, "No valid read command supported");
+		return -EINVAL;
+	}
+
 	t[0].tx_buf = flash->command;
-	t[0].len = m25p_cmdsz(flash) + (flash->fast_read ? 1 : 0);
+	t[0].len = m25p_cmdsz(flash) + dummy;
 	spi_message_add_tail(&t[0], &m);
 
 	t[1].rx_buf = buf;
@@ -391,8 +421,7 @@ static int m25p80_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	spi_sync(flash->spi, &m);
 
-	*retlen = m.actual_length - m25p_cmdsz(flash) -
-			(flash->fast_read ? 1 : 0);
+	*retlen = m.actual_length - m25p_cmdsz(flash) - dummy;
 
 	mutex_unlock(&flash->lock);
 
@@ -1051,22 +1080,31 @@ static int m25p_probe(struct spi_device *spi)
 	flash->page_size = info->page_size;
 	flash->mtd.writebufsize = flash->page_size;
 
-	if (np)
+	if (np) {
 		/* If we were instantiated by DT, use it */
-		flash->fast_read = of_property_read_bool(np, "m25p,fast-read");
-	else
+		if (of_property_read_bool(np, "m25p,fast-read"))
+			flash->flash_read = M25P80_FAST;
+	} else {
 		/* If we weren't instantiated by DT, default to fast-read */
-		flash->fast_read = true;
+		flash->flash_read = M25P80_FAST;
+	}
 
 	/* Some devices cannot do fast-read, no matter what DT tells us */
 	if (info->flags & M25P_NO_FR)
-		flash->fast_read = false;
+		flash->flash_read = M25P80_NORMAL;
 
 	/* Default commands */
-	if (flash->fast_read)
+	switch (flash->flash_read) {
+	case M25P80_FAST:
 		flash->read_opcode = OPCODE_FAST_READ;
-	else
+		break;
+	case M25P80_NORMAL:
 		flash->read_opcode = OPCODE_NORM_READ;
+		break;
+	default:
+		dev_err(&flash->spi->dev, "No Read opcode defined");
+		return -EINVAL;
+	}
 
 	flash->program_opcode = OPCODE_PP;
 
@@ -1077,9 +1115,14 @@ static int m25p_probe(struct spi_device *spi)
 		flash->addr_width = 4;
 		if (JEDEC_MFR(info->jedec_id) == CFI_MFR_AMD) {
 			/* Dedicated 4-byte command set */
-			flash->read_opcode = flash->fast_read ?
-				OPCODE_FAST_READ_4B :
-				OPCODE_NORM_READ_4B;
+			switch (flash->flash_read) {
+			case M25P80_FAST:
+				flash->read_opcode = OPCODE_FAST_READ_4B;
+				break;
+			case M25P80_NORMAL:
+				flash->read_opcode = OPCODE_NORM_READ_4B;
+				break;
+			}
 			flash->program_opcode = OPCODE_PP_4B;
 			/* No small sector erase for 4-byte command set */
 			flash->erase_opcode = OPCODE_SE_4B;
-- 
1.7.1
