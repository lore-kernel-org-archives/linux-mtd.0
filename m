Received: from smtp03.smtpout.orange.fr ([80.12.242.125]
 helo=smtp.smtpout.orange.fr)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TrdL2-0006eI-8e
 for linux-mtd@lists.infradead.org; Sat, 05 Jan 2013 23:39:41 +0000
Message-ID: <50E8B9B8.2020701@wanadoo.fr>
Date: Sun, 06 Jan 2013 00:39:36 +0100
From: Michel Stempin <michel.stempin@wanadoo.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: chips: Add support for GigaDevice GD25Q32/GD25Q64 SPI
 Flash in m25p80.c
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

Add support for GigaDevice GD25Q32 32 Mbit (4 MB) SPI Flash (see datasheet: http://www.gigadevice.com/UserFiles/GD25Q32_Rev0.2(1).pdf) used in Hame MPR-A1 and clones, and for GigaDevice GD25Q64 64 Mbit (8 MB) SPI Flash used in 
Hame MPR-A2 devices (datasheet: http://www.gigadevice.com/UserFiles/GD25Q64.pdf).

Signed-off-by: Michel Stempin <michel.stempin@wanadoo.fr>
---
 b/drivers/mtd/devices/m25p80.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 4eeeb2d..566471e 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -642,6 +642,10 @@ static const struct spi_device_id m25p_ids[] = {
 	/* Everspin */
 	{ "mr25h256", CAT25_INFO(  32 * 1024, 1, 256, 2) },
 
+	/* GigaDevice */
+	{ "gd25q32", INFO(0xc84016, 0, 64 * 1024,  64, SECT_4K) },
+	{ "gd25q64", INFO(0xc84017, 0, 64 * 1024, 128, SECT_4K) },
+
 	/* Intel/Numonyx -- xxxs33b */
 	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
 	{ "320s33b",  INFO(0x898912, 0, 64 * 1024,  64, 0) },
