Received: from dec59.ruk.cuni.cz ([2001:718:1e03:4::11])
 by bombadil.infradead.org with smtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNnq4-0002b1-C6
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 20:02:03 +0000
Date: 7 Aug 2015 20:01:31 -0000
Message-Id: <731125a19451465a1e74b16e7f0b5889cdb3da11.1438977111.git.hramrach@gmail.com>
In-Reply-To: <cover.1438977111.git.hramrach@gmail.com>
References: <cover.1438977111.git.hramrach@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH v3 1/6] mtd: spi-nor: change return value of read/write
To: David Woodhouse <dwmw2@infradead.org>,
  Brian Norris <computersforpeace@gmail.com>, Han Xu <han.xu@freescale.com>,
  "Rafał Miłecki" <zajec5@gmail.com>, Michal Suchanek <hramrach@gmail.com>,
  Alison Chaiken <alison_chaiken@mentor.com>, Marek Vasut <marex@denx.de>,
  Ben Hutchings <ben@decadent.org.uk>, Huang Shijie <b32955@freescale.com>,
  Gabor Juhos <juhosg@openwrt.org>, "Bean Huo 霍斌斌" <beanhuo@micron.com>,
  linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, ,
  Hou Zhiqiang <B48286@freescale.com>, shijie.huang@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Change the return value of spi-nor device read and write methods to
allow returning amount of data transferred and errors as
read(2)/write(2) does.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---

 - avoid compiler warning
---
 drivers/mtd/devices/m25p80.c      | 5 +++--
 drivers/mtd/spi-nor/fsl-quadspi.c | 5 +++--
 include/linux/mtd/spi-nor.h       | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index d313f948b..b2fafc9 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -75,7 +75,7 @@ static int m25p80_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
 	return spi_write(spi, flash->command, len + 1);
 }
 
-static void m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
+static ssize_t m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 			size_t *retlen, const u_char *buf)
 {
 	struct m25p *flash = nor->priv;
@@ -103,6 +103,7 @@ static void m25p80_write(struct spi_nor *nor, loff_t to, size_t len,
 	spi_sync(spi, &m);
 
 	*retlen += m.actual_length - cmd_sz;
+	return 0;
 }
 
 static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
@@ -121,7 +122,7 @@ static inline unsigned int m25p80_rx_nbits(struct spi_nor *nor)
  * Read an address range from the nor chip.  The address range
  * may be any size provided it is within the physical boundaries.
  */
-static int m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
+static ssize_t m25p80_read(struct spi_nor *nor, loff_t from, size_t len,
 			size_t *retlen, u_char *buf)
 {
 	struct m25p *flash = nor->priv;
diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 52a872f..4ad2a68 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -712,7 +712,7 @@ static int fsl_qspi_write_reg(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
 	return ret;
 }
 
-static void fsl_qspi_write(struct spi_nor *nor, loff_t to,
+static ssize_t fsl_qspi_write(struct spi_nor *nor, loff_t to,
 		size_t len, size_t *retlen, const u_char *buf)
 {
 	struct fsl_qspi *q = nor->priv;
@@ -722,9 +722,10 @@ static void fsl_qspi_write(struct spi_nor *nor, loff_t to,
 
 	/* invalid the data in the AHB buffer. */
 	fsl_qspi_invalid(q);
+	return 0;
 }
 
-static int fsl_qspi_read(struct spi_nor *nor, loff_t from,
+static ssize_t fsl_qspi_read(struct spi_nor *nor, loff_t from,
 		size_t len, size_t *retlen, u_char *buf)
 {
 	struct fsl_qspi *q = nor->priv;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index e540952..7d782cb 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -185,9 +185,9 @@ struct spi_nor {
 	int (*write_reg)(struct spi_nor *nor, u8 opcode, u8 *buf, int len,
 			int write_enable);
 
-	int (*read)(struct spi_nor *nor, loff_t from,
+	ssize_t (*read)(struct spi_nor *nor, loff_t from,
 			size_t len, size_t *retlen, u_char *read_buf);
-	void (*write)(struct spi_nor *nor, loff_t to,
+	ssize_t (*write)(struct spi_nor *nor, loff_t to,
 			size_t len, size_t *retlen, const u_char *write_buf);
 	int (*erase)(struct spi_nor *nor, loff_t offs);
 
-- 
2.1.4
