Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHyBm-0004jk-4z
 for linux-mtd@lists.infradead.org; Sun, 01 Feb 2015 17:20:02 +0000
Received: by mail-wg0-f42.google.com with SMTP id x13so35026728wgg.1
 for <linux-mtd@lists.infradead.org>; Sun, 01 Feb 2015 09:19:39 -0800 (PST)
Message-ID: <54CE5F98.1090704@gmail.com>
Date: Sun, 01 Feb 2015 18:17:12 +0100
From: Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] spi-nor: add chip_name to struct spi_nor
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The caller of spi_nor_scan might be interested in the exact chip type.
This especially applies to these cases:
- spi_nor_scan is called with a null name parameter and auto-detects the chip
- spi_nor_scan detects a chipset which is different from the provided one

Therefore add chip_name to struct spi_nor.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 include/linux/mtd/spi-nor.h   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index b6a5a0c..712b47b 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1160,6 +1160,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	}
 
 	nor->read_dummy = spi_nor_read_dummy_cycles(nor);
+	nor->chip_name = id->name;
 
 	dev_info(dev, "%s (%lld Kbytes)\n", id->name,
 			(long long)mtd->size >> 10);
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 4720b86..468098a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -143,6 +143,7 @@ enum spi_nor_option_flags {
  * @flags:		flag options for the current SPI-NOR (SNOR_F_*)
  * @cfg:		used by the read_xfer/write_xfer
  * @cmd_buf:		used by the write_reg
+ * @chip_name:		the name of the SPI NOR chip
  * @prepare:		[OPTIONAL] do some preparations for the
  *			read/write/erase/lock/unlock operations
  * @unprepare:		[OPTIONAL] do some post work after the
@@ -172,6 +173,7 @@ struct spi_nor {
 	u32			flags;
 	struct spi_nor_xfer_cfg	cfg;
 	u8			cmd_buf[SPI_NOR_MAX_CMD_SIZE];
+	const char		*chip_name;
 
 	int (*prepare)(struct spi_nor *nor, enum spi_nor_ops ops);
 	void (*unprepare)(struct spi_nor *nor, enum spi_nor_ops ops);
-- 
2.2.2
