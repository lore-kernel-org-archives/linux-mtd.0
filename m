Received: from ebi0.eke.fi ([213.140.179.212] helo=smtp.ebi)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pa2Th-0007Wn-Rv
	for linux-mtd@lists.infradead.org; Tue, 04 Jan 2011 08:42:51 +0000
From: Aleksandr Koltsoff <aleksandr.koltsoff@ebts.fi>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] m25p80: Fix JEDEC ID for AT26DF321
Date: Tue,  4 Jan 2011 10:42:35 +0200
Message-Id: <1294130555-12762-1-git-send-email-aleksandr.koltsoff@ebts.fi>
Cc: g.chen@freescale.com, Aleksandr Koltsoff <aleksandr.koltsoff@ebts.fi>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The last byte of the ID should be zero for this chip. Was added in
commit d0e8c47c58575b9131e786edb488fd029eba443e . Reported by Tomi
Varjo.

Signed-off-by: Aleksandr Koltsoff <aleksandr.koltsoff@ebts.fi>
---
 drivers/mtd/devices/m25p80.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index bf5a002..513b202 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -635,7 +635,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8, SECT_4K) },
 	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16, SECT_4K) },
 	{ "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32, SECT_4K) },
-	{ "at26df321",  INFO(0x1f4701, 0, 64 * 1024, 64, SECT_4K) },
+	{ "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64, SECT_4K) },
 
 	/* EON -- en25pxx */
 	{ "en25p32", INFO(0x1c2016, 0, 64 * 1024,  64, 0) },
-- 
1.7.3.4
