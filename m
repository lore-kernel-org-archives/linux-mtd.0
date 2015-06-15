Received: from mail-lb0-x231.google.com ([2a00:1450:4010:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4apl-0006Rj-7j
 for linux-mtd@lists.infradead.org; Mon, 15 Jun 2015 20:18:18 +0000
Received: by lbbwc1 with SMTP id wc1so8752125lbb.2
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jun 2015 13:17:53 -0700 (PDT)
From: Antony Pavlov <antonynpavlov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: m25p80: add Spansion S25FL204K support
Date: Mon, 15 Jun 2015 23:20:06 +0300
Message-Id: <1434399606-19228-1-git-send-email-antonynpavlov@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Spansion S25FL204K is a 4-Mbit 3.0V Serial Flash Memory
with Uniform 4 kB Sectors.

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
---
 drivers/mtd/devices/m25p80.c  | 2 +-
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 3af137f..85be835 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -281,7 +281,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{"s25fl512s"},	{"s70fl01gs"},	{"s25sl12800"},	{"s25sl12801"},
 	{"s25fl129p0"},	{"s25fl129p1"},	{"s25sl004a"},	{"s25sl008a"},
 	{"s25sl016a"},	{"s25sl032a"},	{"s25sl064a"},	{"s25fl008k"},
-	{"s25fl016k"},	{"s25fl064k"},	{"s25fl132k"},
+	{"s25fl016k"},	{"s25fl064k"},	{"s25fl132k"},	{"s25fl204k"},
 	{"sst25vf040b"},{"sst25vf080b"},{"sst25vf016b"},{"sst25vf032b"},
 	{"sst25vf064c"},{"sst25wf512"},	{"sst25wf010"},	{"sst25wf020"},
 	{"sst25wf040"},
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 14a5d23..274083c 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -614,6 +614,7 @@ static const struct spi_device_id spi_nor_ids[] = {
 	{ "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K) },
 	{ "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
 	{ "s25fl132k",  INFO(0x014016,      0,  64 * 1024,  64, 0) },
+	{ "s25fl204k",  INFO(0x014013,      0,  64 * 1024,   8, SECT_4K) },
 
 	/* SST -- large erase sizes are "overlays", "sectors" are 4K */
 	{ "sst25vf040b", INFO(0xbf258d, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
-- 
2.1.4
