Received: from avon.wwwdotorg.org ([2001:470:1f0f:bd7::2])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TY09V-0003Ok-DC
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 19:58:38 +0000
From: Stephen Warren <swarren@wwwdotorg.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: m25p80: add support for the Winbond w25q80bl chip
Date: Mon, 12 Nov 2012 12:58:28 -0700
Message-Id: <1352750308-1095-1-git-send-email-swarren@wwwdotorg.org>
Cc: Stephen Warren <swarren@nvidia.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Stephen Warren <swarren@nvidia.com>

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 drivers/mtd/devices/m25p80.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 7e2d8f9..1518324 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -742,6 +742,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "w25x64", INFO(0xef3017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "w25q64", INFO(0xef4017, 0, 64 * 1024, 128, SECT_4K) },
 	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
+	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K) },
 
 	/* Catalyst / On Semiconductor -- non-JEDEC */
-- 
1.7.0.4
