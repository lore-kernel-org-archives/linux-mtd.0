Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byiGc-0003mG-7A
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 16:38:35 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 <marex@denx.de>, <richard@nod.at>, <linux-kernel@vger.kernel.org>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v3 9/9] mtd: spi-nor: add support to SST sst26* QSPI memories
Date: Mon, 24 Oct 2016 18:34:46 +0200
Message-ID: <74fedab98fba683d3563ac8c93d1fac6108ba278.1477325128.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1477325128.git.cyrille.pitchen@atmel.com>
References: <cover.1477325128.git.cyrille.pitchen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds support to the SST sst26* QSPI memories.
It also adds a new SST_BLOCK_PROTECT flag so spi_nor_scan() sends
a SST Global Block Protection Unlock (98h) command once for all
otherwise later Sector Erase and Page Program commands would fail.

It was tested with sst26vf016b, sst26vf032b, sst26vf032ba and sst26vf064b
on a sama5d2 xplained board at 55.3MHz and 3.3V.

sst26wf040b and sst26wf080b were not tested since they are 1.8V memories
hence don't fit the sama5d2 xplained board requirements.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 20 ++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index eb21d3d4e4e6..300ee38f4e9a 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -81,6 +81,7 @@ struct flash_info {
 					 * to support memory size above 128Mib.
 					 */
 #define SPI_NOR_SKIP_SFDP	BIT(11) /* Skip read of SFDP tables */
+#define SST_BLOCK_PROTECT	BIT(12)	/* use SST Unlock Block-Protection */
 };
 
 #define JEDEC_MFR(info)	((info)->id[0])
@@ -999,6 +1000,11 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "sst25wf040b", INFO(0x621613, 0, 64 * 1024,  8, SECT_4K) },
 	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
 	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
+	{ "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32, SECT_4K | SST_BLOCK_PROTECT) },
+	{ "sst26vf032b", INFO(0xbf2642, 0, 64 * 1024, 64, SECT_4K | SST_BLOCK_PROTECT) },
+	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128, SECT_4K | SST_BLOCK_PROTECT) },
+	{ "sst26wf040b", INFO(0xbf2654, 0, 64 * 1024,  8, SECT_4K | SST_BLOCK_PROTECT) },
+	{ "sst26wf080b", INFO(0xbf2658, 0, 64 * 1024, 16, SECT_4K | SST_BLOCK_PROTECT) },
 
 	/* ST Microelectronics -- newer production may have feature updates */
 	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
@@ -1135,6 +1141,14 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
 	return ret;
 }
 
+static int sst_unlock_block_protection(struct spi_nor *nor)
+{
+	int ret;
+
+	ret = write_enable(nor);
+	return ret ? ret : nor->write_reg(nor, SPINOR_OP_ULBPR, NULL, 0);
+}
+
 static int sst_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
@@ -2321,6 +2335,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		return -EINVAL;
 	}
 
+	if (info->flags & SST_BLOCK_PROTECT) {
+		ret = sst_unlock_block_protection(nor);
+		if (ret)
+			return ret;
+	}
+
 	dev_info(dev, "%s (%lld Kbytes)\n", info->name,
 			(long long)mtd->size >> 10);
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 8fd9619dabff..c8f7e231a25c 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -80,6 +80,7 @@
 #define SPINOR_OP_BP		0x02	/* Byte program */
 #define SPINOR_OP_WRDI		0x04	/* Write disable */
 #define SPINOR_OP_AAI_WP	0xad	/* Auto address increment word program */
+#define SPINOR_OP_ULBPR		0x98	/* Global Block Protection Unlock */
 
 /* Used for Macronix and Winbond flashes. */
 #define SPINOR_OP_EN4B		0xb7	/* Enter 4-byte mode */
-- 
2.7.4
