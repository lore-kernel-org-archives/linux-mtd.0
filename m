Received: from [2002:5db3:e134::1] (helo=shrek.podlesie.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U8tz7-0005sc-8q
 for linux-mtd@lists.infradead.org; Fri, 22 Feb 2013 14:52:26 +0000
From: Krzysztof Mazur <krzysiek@podlesie.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: m25p80: add support for SST25VF064C
Date: Fri, 22 Feb 2013 15:51:06 +0100
Message-Id: <1361544666-7148-2-git-send-email-krzysiek@podlesie.net>
In-Reply-To: <1361544666-7148-1-git-send-email-krzysiek@podlesie.net>
References: <1361544666-7148-1-git-send-email-krzysiek@podlesie.net>
Cc: artem.bityutskiy@linux.intel.com, Krzysztof Mazur <krzysiek@podlesie.net>,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Krzysztof Mazur <krzysiek@podlesie.net>
---
 drivers/mtd/devices/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index e533bf1..0501f5f 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -692,6 +692,7 @@ static const struct spi_device_id m25p_ids[] = {
 	{ "sst25vf080b", INFO(0xbf258e, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
 	{ "sst25vf016b", INFO(0xbf2541, 0, 64 * 1024, 32, SECT_4K | SST_WRITE) },
 	{ "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64, SECT_4K | SST_WRITE) },
+	{ "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128, SECT_4K) },
 	{ "sst25wf512",  INFO(0xbf2501, 0, 64 * 1024,  1, SECT_4K | SST_WRITE) },
 	{ "sst25wf010",  INFO(0xbf2502, 0, 64 * 1024,  2, SECT_4K | SST_WRITE) },
 	{ "sst25wf020",  INFO(0xbf2503, 0, 64 * 1024,  4, SECT_4K | SST_WRITE) },
-- 
1.8.2.rc0.238.g01e6e4a
