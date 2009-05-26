Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M8tF0-0004fw-Ec
	for linux-mtd@lists.infradead.org; Tue, 26 May 2009 09:46:45 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] mtd/maps: uclinux: support Blackfin systems
Date: Tue, 26 May 2009 05:46:31 -0400
Message-Id: <1243331191-11445-2-git-send-email-vapier@gentoo.org>
In-Reply-To: <1243331191-11445-1-git-send-email-vapier@gentoo.org>
References: <1243331191-11445-1-git-send-email-vapier@gentoo.org>
Cc: uclinux-dist-devel@blackfin.uclinux.org, linux-mtd@lists.infradead.org,
	uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>
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
As such, we need to tweak the initial filesystem address for Blackfin
systems.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
CC: Greg Ungerer <gerg@uclinux.org>
CC: uclinux-dev@uclinux.org
CC: linux-mtd@lists.infradead.org
---
 drivers/mtd/maps/uclinux.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index 57699c2..dcb552f 100644
--- a/drivers/mtd/maps/uclinux.c
+++ b/drivers/mtd/maps/uclinux.c
@@ -55,8 +55,13 @@ static int __init uclinux_mtd_init(void)
 {
 	struct mtd_info *mtd;
 	struct map_info *mapp;
+#ifdef CONFIG_BLACKFIN
+	extern unsigned long memory_mtd_start;
+	unsigned long addr = (unsigned long) memory_mtd_start;
+#else
 	extern char _ebss;
 	unsigned long addr = (unsigned long) &_ebss;
+#endif
 
 	mapp = &uclinux_ram_map;
 	mapp->phys = addr;
-- 
1.6.3.1
