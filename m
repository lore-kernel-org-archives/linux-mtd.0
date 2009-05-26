Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M9694-0000wo-Mb
	for linux-mtd@lists.infradead.org; Tue, 26 May 2009 23:33:29 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] mtd/maps: uclinux: allow systems to override map addr/size
Date: Tue, 26 May 2009 19:33:16 -0400
Message-Id: <1243380798-10089-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <20090526231902.GA6295@linux-sh.org>
References: <20090526231902.GA6295@linux-sh.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, Paul Mundt <lethal@linux-sh.org>,
	linux-mtd@lists.infradead.org, uclinux-dev@uclinux.org,
	Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Due to a processor anomaly (05000263 to be exact), most Blackfin parts
cannot keep the embedded filesystem image directly after the kernel in
RAM.  Instead, the filesystem needs to be relocated to the end of memory.
As such, we need to tweak the map addr/size during boot for Blackfin
systems.  This can be done in any early arch/board init code.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
CC: Paul Mundt <lethal@linux-sh.org>
CC: Greg Ungerer <gerg@uclinux.org>
CC: uclinux-dev@uclinux.org
CC: linux-mtd@lists.infradead.org
---
 drivers/mtd/maps/uclinux.c |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index 81756e3..61d4087 100644
--- a/drivers/mtd/maps/uclinux.c
+++ b/drivers/mtd/maps/uclinux.c
@@ -22,8 +22,12 @@
 
 /****************************************************************************/
 
+extern char _ebss;
+
 struct map_info uclinux_ram_map = {
 	.name = "RAM",
+	.phys = (unsigned long)&_ebss,
+	.size = 0,
 };
 
 struct mtd_info *uclinux_ram_mtdinfo;
@@ -55,12 +59,10 @@ static int __init uclinux_mtd_init(void)
 {
 	struct mtd_info *mtd;
 	struct map_info *mapp;
-	extern char _ebss;
-	unsigned long addr = (unsigned long) &_ebss;
 
 	mapp = &uclinux_ram_map;
-	mapp->phys = addr;
-	mapp->size = PAGE_ALIGN(ntohl(*((unsigned long *)(addr + 8))));
+	if (!mapp->size)
+		mapp->size = PAGE_ALIGN(ntohl(*((unsigned long *)(mapp->phys + 8))));
 	mapp->bankwidth = 4;
 
 	printk("uclinux[mtd]: RAM probe address=0x%x size=0x%x\n",
-- 
1.6.3.1
