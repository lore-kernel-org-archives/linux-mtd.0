Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MGTqu-00012c-3E
	for linux-mtd@lists.infradead.org; Tue, 16 Jun 2009 08:17:15 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: m25p80: add SST WF SPI flash device information
Date: Tue, 16 Jun 2009 04:16:51 -0400
Message-Id: <1245140211-24589-2-git-send-email-vapier@gentoo.org>
In-Reply-To: <1245140211-24589-1-git-send-email-vapier@gentoo.org>
References: <1245140211-24589-1-git-send-email-vapier@gentoo.org>
Cc: Graf Yang <graf.yang@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Graf Yang <graf.yang@analog.com>

Support SST25WF{512,010,020,040} SPI flashes.

Signed-off-by: Graf Yang <graf.yang@analog.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/devices/m25p80.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9a0788a..8e4a945 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -628,6 +628,10 @@ static struct flash_info __devinitdata m25p_data [] = {
 	{ "sst25vf080b", 0xbf258e, 0, 64 * 1024, 16, SECT_4K, },
 	{ "sst25vf016b", 0xbf2541, 0, 64 * 1024, 32, SECT_4K, },
 	{ "sst25vf032b", 0xbf254a, 0, 64 * 1024, 64, SECT_4K, },
+	{ "sst25wf512",  0xbf2501, 0, 64 * 1024, 1, SECT_4K, },
+	{ "sst25wf010",  0xbf2502, 0, 64 * 1024, 2, SECT_4K, },
+	{ "sst25wf020",  0xbf2503, 0, 64 * 1024, 4, SECT_4K, },
+	{ "sst25wf040",  0xbf2504, 0, 64 * 1024, 8, SECT_4K, },
 
 	/* ST Microelectronics -- newer production may have feature updates */
 	{ "m25p05",  0x202010,  0, 32 * 1024, 2, },
-- 
1.6.3.1
