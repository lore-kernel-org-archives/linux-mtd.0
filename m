Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8I8T-0004kr-J3
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2015 01:41:10 +0000
Received: by pfee66 with SMTP id e66so286271pfe.1
 for <linux-mtd@lists.infradead.org>; Sun, 13 Dec 2015 17:40:50 -0800 (PST)
From: Karl Zhang <shuangshuo@gmail.com>
To: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, paul.gortmaker@windriver.com,
 artem.bityutskiy@linux.intel.com, linux-kernel@vger.kernel.org
Cc: peterpandong@micron.com, beanhuo@micron.com,
 Karl Zhang <karlzhang@micron.com>
Subject: [PATCH v2 2/2] mtd: spi-nor: add new device MT35X
Date: Mon, 14 Dec 2015 01:40:01 +0000
Message-Id: <1450057201-28419-3-git-send-email-karlzhang@micron.com>
In-Reply-To: <1450057201-28419-1-git-send-email-karlzhang@micron.com>
References: <1450057201-28419-1-git-send-email-karlzhang@micron.com>
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
 v2: remove change line for m25p_ids[]

 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

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
