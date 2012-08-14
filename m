Received: from mail.savoirfairelinux.com ([209.172.62.77])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T1Miu-0004x5-J7
 for linux-mtd@lists.infradead.org; Tue, 14 Aug 2012 19:24:18 +0000
From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: m25p80: add support for Micron N25Q256A
Date: Tue, 14 Aug 2012 15:24:07 -0400
Message-Id: <1344972247-23583-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The manufacturer datasheet can be found on the Micron website,
under the name n25q_256mb_3v_65nm.pdf:

http://www.micron.com/search?source=ps&q=n25q_256mb_3v_65nm

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 drivers/mtd/devices/m25p80.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9f9982f..0a23f23 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -686,6 +686,9 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
 	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
 
+	/* Micron */
+	{ "n25q256a", INFO(0x20ba19, 0, 64 * 1024, 512, SECT_4K) },
+
 	/* Spansion -- single (large) sector size only, at least
 	 * for the chips listed here (without boot sectors).
 	 */
-- 
1.7.11.2
