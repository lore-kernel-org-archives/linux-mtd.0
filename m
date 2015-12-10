Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6qWV-0003iy-6h
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 02:00:00 +0000
Received: by pacfl14 with SMTP id fl14so3983584pac.1
 for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2015 17:59:39 -0800 (PST)
From: Karl Zhang <shuangshuo@gmail.com>
To: computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org
Cc: peterpandong@micron.com, beanhuo@micron.com, zszubbocsev@micron.com,
 Karl Zhang <karlzhang@micron.com>
Subject: [PATCH 2/2] mtd: spi-nor: add new device MT35X
Date: Thu, 10 Dec 2015 01:59:00 +0000
Message-Id: <1449712740-22900-3-git-send-email-karlzhang@micron.com>
In-Reply-To: <1449712740-22900-1-git-send-email-karlzhang@micron.com>
References: <1449712740-22900-1-git-send-email-karlzhang@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Micron has announced a new SPI NOR device MT35X(XTRMFlash).
The device can support x1 or x8 bus I/O for high speed.

This patch is purpose to add MT35X into the arch, only
extended mode (x1) was enabled. Octal mode I/O will be done
in the futrue.

Signed-off-by: Karl Zhang <karlzhang@micron.com>
---
 drivers/mtd/devices/m25p80.c  | 1 +
 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index c9c3b7f..e57d391 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -259,6 +259,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{"mx25l4005a"},	{"mx25l1606e"},	{"mx25l6405d"},	{"mx25l12805d"},
 	{"mx25l25635e"},{"mx66l51235l"},
 	{"n25q064"},	{"n25q128a11"},	{"n25q128a13"},	{"n25q512a"},
+	{"mt35x512"},
 	{"s25fl256s1"},	{"s25fl512s"},	{"s25sl12801"},	{"s25fl008k"},
 	{"s25fl064k"},
 	{"sst25vf040b"},{"sst25vf016b"},{"sst25vf032b"},{"sst25wf040"},
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 3b2460e..34686b5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -192,6 +192,7 @@ static inline int set_4byte(struct spi_nor *nor, const struct flash_info *info,
 
 	switch (JEDEC_MFR(info)) {
 	case SNOR_MFR_MICRON:
+	case SNOR_MFR_MICRON_JEDEC:
 		/* Some Micron need WREN command; all will accept it */
 		need_wren = true;
 	case SNOR_MFR_MACRONIX:
@@ -756,6 +757,7 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
 	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+	{ "mt35x512",    INFO(0x2c5b1a, 0, 128 * 1024, 512, SECT_4K | USE_FSR) },
 
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
-- 
1.9.1
