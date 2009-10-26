Received: from mba.ocn.ne.jp ([122.28.14.163] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1N2P31-0003N7-09
	for linux-mtd@lists.infradead.org; Mon, 26 Oct 2009 12:51:48 +0000
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd/maps: Fix accidental removal in Makefile
Date: Mon, 26 Oct 2009 21:51:40 +0900
Message-Id: <1256561500-8036-1-git-send-email-anemo@mba.ocn.ne.jp>
Cc: Mike Frysinger <vapier@gentoo.org>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The commit d79c326 ("gpio-addr-flash: new driver for GPIO assisted
flash addressing") removed two lines from the Makefile by accident.
Though I'm not sure how this accident happened, this patch reverts the
removal.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
 drivers/mtd/maps/Makefile |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 1d5cf86..ae2f6db 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -58,4 +58,6 @@ obj-$(CONFIG_MTD_PLATRAM)	+= plat-ram.o
 obj-$(CONFIG_MTD_OMAP_NOR)	+= omap_nor.o
 obj-$(CONFIG_MTD_INTEL_VR_NOR)	+= intel_vr_nor.o
 obj-$(CONFIG_MTD_BFIN_ASYNC)	+= bfin-async-flash.o
+obj-$(CONFIG_MTD_RBTX4939)	+= rbtx4939-flash.o
+obj-$(CONFIG_MTD_VMU)		+= vmu-flash.o
 obj-$(CONFIG_MTD_GPIO_ADDR)	+= gpio-addr-flash.o
-- 
1.5.6.5
