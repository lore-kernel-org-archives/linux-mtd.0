Received: from smtp07.smtpout.orange.fr ([80.12.242.129]
 helo=smtp.smtpout.orange.fr)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UNgfH-0000ig-EU
 for linux-mtd@lists.infradead.org; Thu, 04 Apr 2013 09:41:04 +0000
Message-ID: <515D4AA7.9080307@wanadoo.fr>
Date: Thu, 04 Apr 2013 11:40:55 +0200
From: Michel Stempin <michel.stempin@wanadoo.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: chips: Add support for PMC SPI Flash chips in m25p80.c
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for PMC (now Chingis, part of ISSI) Pm25LV512 (512 kBbit), Pm25LV010 (1 Mbit) (see datasheet http://www.geocities.jp/scottle556/pdf/Pm25LV512-010.pdf) and Pm25LQ032 (32 Mbit) (datasheet:http://www.chingistek.com/img/Product_Files/Pm25LQ032C%20datasheet%20v1.6.1.pdf) SPI Flash chips, used in various WiFi pocket routers.

Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
Signed-off-by: Michel Stempin <michel.stempin@wanadoo.fr>
--
 b/drivers/mtd/devices/m25p80.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 5b6b072..5fd7500 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -45,6 +45,7 @@
 #define	OPCODE_BE_4K		0x20	/* Erase 4KiB block */
 #define	OPCODE_BE_32K		0x52	/* Erase 32KiB block */
 #define	OPCODE_CHIP_ERASE	0xc7	/* Erase whole flash chip */
+#define	OPCODE_BE_4K_PMC	0xd7    /* Erase 4KiB block on PMC chips*/
 #define	OPCODE_SE		0xd8	/* Sector erase (usually 64KiB) */
 #define	OPCODE_RDID		0x9f	/* Read JEDEC ID */
 
@@ -681,6 +682,7 @@ struct flash_info {
 	u16		flags;
 #define	SECT_4K		0x01		/* OPCODE_BE_4K works uniformly */
 #define	M25P_NO_ERASE	0x02		/* No erase command needed */
+#define	SECT_4K_PMC	0x04            /* OPCODE_BE_4K_PMC works uniformly */
 };
 
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
@@ -759,6 +761,11 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024, 256, 0) },
 	{ "n25q256a", INFO(0x20ba19, 0, 64 * 1024, 512, SECT_4K) },
 
+	/* PMC -- pm25x "blocks" are 32K, sectors are 4K */
+	{ "pm25lv512", INFO(0, 0, 32 * 1024, 2, SECT_4K_PMC) },
+	{ "pm25lv010", INFO(0, 0, 32 * 1024, 4, SECT_4K_PMC) },
+	{ "pm25lq032", INFO(0x7F9D46, 0, 64 * 1024,  64, SECT_4K) },
+
 	/* Spansion -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
 	 */
@@ -1009,6 +1016,9 @@ static int m25p_probe(struct spi_device *spi)
 	if (info->flags & SECT_4K) {
 		flash->erase_opcode = OPCODE_BE_4K;
 		flash->mtd.erasesize = 4096;
+	} else if (info->flags & SECT_4K_PMC) {
+		flash->erase_opcode = OPCODE_BE_4K_PMC; 
+		flash->mtd.erasesize = 4096;
 	} else {
 		flash->erase_opcode = OPCODE_SE;
 		flash->mtd.erasesize = info->sector_size;
