Received: from mail-ea0-f174.google.com ([209.85.215.174])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U9b9B-0001Xe-JW
 for linux-mtd@lists.infradead.org; Sun, 24 Feb 2013 12:57:42 +0000
Received: by mail-ea0-f174.google.com with SMTP id 1so878144eaa.33
 for <linux-mtd@lists.infradead.org>; Sun, 24 Feb 2013 04:57:38 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH] mtd: m25p80: add entry for w25q128
Date: Sun, 24 Feb 2013 13:57:26 +0100
Message-Id: <1361710646-11731-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>, Felix Fietkau <nbd@openwrt.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This device was reported over a year ago on OpenWrt mailing list in the
thread [OpenWrt-Devel] RedBoot partition table with winbond m25q128vb
(unfortunately, I can't find message id). Macpaul seemed to have
problems with partition driver, but it seems the device was working OK.

Reported-by: Macpaul Lin <macpaul@gmail.com>
Cc: Felix Fietkau <nbd@openwrt.org>
Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
Felix: I've asked you for upstreaming this patch about a month ago, but
I didn't receive any answer, hope it's fine.
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 5b6b072..1baf80b 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -838,6 +838,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
+	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
 	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K) },
 
 	/* Catalyst / On Semiconductor -- non-JEDEC */
-- 
1.7.10.4
