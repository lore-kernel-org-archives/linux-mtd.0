Received: from smtp.movial.fi ([62.236.91.34])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L4n77-0006D2-VE
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:53:18 +0000
From: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
To: dwmw2@infradead.org
Subject: [PATCH 14/20] [MTD] Make init_rpxlite function static
Date: Tue, 25 Nov 2008 02:55:05 +0200
Message-Id: <1227574511-23879-15-git-send-email-dmitri.vorobiev@movial.fi>
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

The function init_rpxlite, which is not used outside of
drivers/mtd/maps/rpxlite.c, can become static. Add the
needed keyword.

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
---
 drivers/mtd/maps/rpxlite.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/rpxlite.c b/drivers/mtd/maps/rpxlite.c
index 14d90ed..3e3ef53 100644
--- a/drivers/mtd/maps/rpxlite.c
+++ b/drivers/mtd/maps/rpxlite.c
@@ -23,7 +23,7 @@ static struct map_info rpxlite_map = {
 	.phys = WINDOW_ADDR,
 };
 
-int __init init_rpxlite(void)
+static int __init init_rpxlite(void)
 {
 	printk(KERN_NOTICE "RPX Lite or CLLF flash device: %x at %x\n", WINDOW_SIZE*4, WINDOW_ADDR);
 	rpxlite_map.virt = ioremap(WINDOW_ADDR, WINDOW_SIZE * 4);
-- 
1.5.3
