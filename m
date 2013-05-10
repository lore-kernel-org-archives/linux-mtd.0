Received: from smtp07.smtpout.orange.fr ([80.12.242.129]
 helo=smtp.smtpout.orange.fr)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UauWN-0004eO-Ui
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 21:06:33 +0000
Message-ID: <518D6138.2090009@wanadoo.fr>
Date: Fri, 10 May 2013 23:06:00 +0200
From: Michel Stempin <michel.stempin@wanadoo.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: chips: Add support for PMC SPI Flash chips in m25p80.c
References: <1368195520.26780.169.camel@sauron.fi.intel.com>
In-Reply-To: <1368195520.26780.169.camel@sauron.fi.intel.com>
Content-Type: multipart/mixed; boundary="------------090600030700070800060104"
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------090600030700070800060104
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

    Add support for PMC (now Chingis, part of ISSI) Pm25LV512 (512 kBbit), Pm25LV010 (1 Mbit) (see datasheet http://www.geocities.jp/scottle556/pdf/Pm25LV512-010.pdf) and Pm25LQ032 (32 Mbit) (datasheet:http://www.

    This patch is resent in order to take into account this upstream patch:

    commit e534ee4f9ca29fdb38eea4b0c53f2154fbd8c1ee
    Author: Krzysztof Mazur <krzysiek@podlesie.net>
    Date:   Fri Feb 22 15:51:05 2013 +0100

        mtd: m25p80: introduce SST_WRITE flag for SST byte programming

        Not all SST devices implement the SST byte programming command.
        Some devices (like SST25VF064C) implement only standard m25p80 page
        write command.

        Now SPI flash devices that need sst_write() are explicitly marked
        with new SST_WRITE flag and the decision to use sst_write() is based
        on this flag instead of manufacturer id.

        Signed-off-by: Krzysztof Mazur <krzysiek@podlesie.net>
        Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

    Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
    Signed-off-by: Michel Stempin <michel.stempin@wanadoo.fr>
---
 drivers/mtd/devices/m25p80.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 2f3d2a5..4d45ce4 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -45,6 +45,7 @@
 #define	OPCODE_BE_4K		0x20	/* Erase 4KiB block */
 #define	OPCODE_BE_32K		0x52	/* Erase 32KiB block */
 #define	OPCODE_CHIP_ERASE	0xc7	/* Erase whole flash chip */
+#define	OPCODE_BE_4K_PMC	0xd7	/* Erase 4KiB block on PMC chips*/
 #define	OPCODE_SE		0xd8	/* Sector erase (usually 64KiB) */
 #define	OPCODE_RDID		0x9f	/* Read JEDEC ID */
 
@@ -682,6 +683,7 @@ struct flash_info {
 #define	SECT_4K		0x01		/* OPCODE_BE_4K works uniformly */
 #define	M25P_NO_ERASE	0x02		/* No erase command needed */
 #define	SST_WRITE	0x04		/* use SST byte programming */
+#define	SECT_4K_PMC	0x08		/* OPCODE_BE_4K_PMC works uniformly */
 };
 
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
@@ -762,6 +764,11 @@ static const struct spi_device_id m25p_ids[] = {
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
@@ -1014,6 +1021,9 @@ static int m25p_probe(struct spi_device *spi)
 	if (info->flags & SECT_4K) {
 		flash->erase_opcode = OPCODE_BE_4K;
 		flash->mtd.erasesize = 4096;
+	} else if (info->flags & SECT_4K_PMC) {
+		flash->erase_opcode = OPCODE_BE_4K_PMC;
+		flash->mtd.erasesize = 4096;
 	} else {
 		flash->erase_opcode = OPCODE_SE;
 		flash->mtd.erasesize = info->sector_size;
-- 
1.7.10.4


--------------090600030700070800060104
Content-Type: text/plain; charset=UTF-8;
 name="Portion de message joint"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="Portion de message joint"


--------------090600030700070800060104--
