Received: from smtp.gentoo.org ([140.211.166.183])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQIug-0002uY-Rk
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 17:37:07 +0000
From: Alexis Ballier <aballier@gentoo.org>
To: aballier@gentoo.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Marek Vasut <marex@denx.de>, Huang Shijie <shijie.huang@intel.com>,
 Gabor Juhos <juhosg@openwrt.org>, Ben Hutchings <ben@decadent.org.uk>,
 =?UTF-8?q?Bean=20Huo=20=E9=9C=8D=E6=96=8C=E6=96=8C=20=28beanhuo=29?=
 <beanhuo@micron.com>,
 linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: spi-nor: Add support for sst25wf020a.
Date: Fri, 14 Aug 2015 19:35:39 +0200
Message-Id: <1439573741-24491-1-git-send-email-aballier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is a 256KiB flash with 4 KiB erase sectors
and 64KiB overlay blocks.

This is the one available on Hardkernel's Odroid U3 shield.

Signed-off-by: Alexis Ballier <aballier@gentoo.org>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d78831b..e521b35 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -636,6 +636,7 @@ static const struct spi_device_id spi_nor_ids[] = {
 	{ "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1, SECT_4K | SST_WRITE) },
 	{ "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2, SECT_4K | SST_WRITE) },
 	{ "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4, SECT_4K | SST_WRITE) },
+	{ "sst25wf020a", INFO(0x621612, 0, 64 * 1024,  4, SECT_4K) },
 	{ "sst25wf040",  INFO(0xbf2504, 0, 64 * 1024,  8, SECT_4K | SST_WRITE) },
 	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
 
-- 
2.5.0
