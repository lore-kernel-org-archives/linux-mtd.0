Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PkWbE-0004Lk-PV
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2011 06:53:57 +0000
Received: from eru.research.nokia.com (helruo-dhcp021230.ntc.nokia.com
	[172.21.21.230])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p126rroB011982
	for <linux-mtd@lists.infradead.org>; Wed, 2 Feb 2011 08:53:54 +0200
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: mtdram: initialize writebufsize field
Date: Wed,  2 Feb 2011 08:56:14 +0200
Message-Id: <1296629774-22498-1-git-send-email-Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Set the 'mtd->writebufsize' field to 64 to mimic modern CFI flashes.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/devices/mtdram.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 26a6e80..1483e18 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -121,6 +121,7 @@ int mtdram_init_device(struct mtd_info *mtd, void *mapped_address,
 	mtd->flags = MTD_CAP_RAM;
 	mtd->size = size;
 	mtd->writesize = 1;
+	mtd->writebufsize = 64; /* Mimic CFI NOR flashes */
 	mtd->erasesize = MTDRAM_ERASE_SIZE;
 	mtd->priv = mapped_address;
 
-- 
1.7.2.3
