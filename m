Received: from smtp.movial.fi ([62.236.91.34])
	by casper.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1L4n78-000502-NF
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:53:21 +0000
From: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
To: dwmw2@infradead.org
Subject: [PATCH 04/20] [MTD] Make init_dbox2_flash static
Date: Tue, 25 Nov 2008 02:54:55 +0200
Message-Id: <1227574511-23879-5-git-send-email-dmitri.vorobiev@movial.fi>
In-Reply-To: <1227574511-23879-1-git-send-email-dmitri.vorobiev@movial.fi>
References: <1227574511-23879-1-git-send-email-dmitri.vorobiev@movial.fi>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The symbol init_dbox2_flash is not used outside of the file
drivers/mtd/maps/dbox2-flash.c, so make it static.

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
---
 drivers/mtd/maps/dbox2-flash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/dbox2-flash.c b/drivers/mtd/maps/dbox2-flash.c
index e115667..cfacfa6 100644
--- a/drivers/mtd/maps/dbox2-flash.c
+++ b/drivers/mtd/maps/dbox2-flash.c
@@ -69,7 +69,7 @@ struct map_info dbox2_flash_map = {
 	.phys		= WINDOW_ADDR,
 };
 
-int __init init_dbox2_flash(void)
+static int __init init_dbox2_flash(void)
 {
        	printk(KERN_NOTICE "D-Box 2 flash driver (size->0x%X mem->0x%X)\n", WINDOW_SIZE, WINDOW_ADDR);
 	dbox2_flash_map.virt = ioremap(WINDOW_ADDR, WINDOW_SIZE);
-- 
1.5.3
