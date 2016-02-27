Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aZnhI-0004HM-UW
 for linux-mtd@lists.infradead.org; Sat, 27 Feb 2016 22:50:50 +0000
Received: by mail-wm0-x243.google.com with SMTP id p65so4104716wmp.1
 for <linux-mtd@lists.infradead.org>; Sat, 27 Feb 2016 14:50:27 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 2/2] mtd: m25p80: consider max_transfer_size when reading
To: Brian Norris <computersforpeace@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
Message-ID: <56D22823.7090005@gmail.com>
Date: Sat, 27 Feb 2016 23:50:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some controllers have transfer size limits. To allow to deal with this
max_transfer_size was introduced in the SPI core recently.
Use this new feature to read in chunks if needed.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mtd/devices/m25p80.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index c2d1f65..69f3acf 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -119,7 +119,7 @@ static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
  * Read an address range from the nor chip.  The address range
  * may be any size provided it is within the physical boundaries.
  */
-static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
+static int _m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 			size_t *retlen, u_char *buf)
 {
 	struct m25p *flash = nor->priv;
@@ -153,6 +153,34 @@ static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 	return ret;
 }
 
+/* Read in max_read_len chunks if len > max_read_len */
+static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
+		       size_t *retlen, u_char *buf)
+{
+	struct m25p *flash = nor->priv;
+	/*
+	 * The controller transfer size limit refers to the overall transfer
+	 * including read command + actually read data. Therefore subtract
+	 * the command size when calculating the max read length.
+	 */
+	size_t max_read_len = spi_max_transfer_size(flash->spi) -
+			      (m25p_cmdsz(nor) + nor->read_dummy / 8);
+	size_t read_len;
+	int ret;
+
+	while (len > 0) {
+		read_len = min(len, max_read_len);
+		ret = _m25p80_read(nor, from, read_len, retlen, buf);
+		if (ret)
+			return ret;
+		from += read_len;
+		buf += read_len;
+		len -= read_len;
+	}
+
+	return 0;
+}
+
 /*
  * board specific setup should have ensured the SPI clock used here
  * matches what the READ command supports, at least until this driver
-- 
2.7.1
