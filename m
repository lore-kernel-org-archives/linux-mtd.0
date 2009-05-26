Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M8tF0-0004fg-Df
	for linux-mtd@lists.infradead.org; Tue, 26 May 2009 09:46:45 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mtd/maps: uclinux: fix building when partition support is
	disabled
Date: Tue, 26 May 2009 05:46:30 -0400
Message-Id: <1243331191-11445-1-git-send-email-vapier@gentoo.org>
Cc: uclinux-dev@uclinux.org, Timofei Bondarenko <tim@ipi.ac.ru>,
	linux-mtd@lists.infradead.org, Greg Ungerer <gerg@uclinux.org>,
	uclinux-dist-devel@blackfin.uclinux.org,
	Sonic Zhang <sonic.zhang@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Timofei Bondarenko <tim@ipi.ac.ru>

The uClinux map driver doesn't even use partitions, so we shouldn't require
it in order to work properly.

Signed-off-by: Timofei Bondarenko <tim@ipi.ac.ru>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
CC: Greg Ungerer <gerg@uclinux.org>
CC: uclinux-dev@uclinux.org
CC: linux-mtd@lists.infradead.org
---
 drivers/mtd/maps/uclinux.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index 81756e3..57699c2 100644
--- a/drivers/mtd/maps/uclinux.c
+++ b/drivers/mtd/maps/uclinux.c
@@ -87,7 +87,11 @@ static int __init uclinux_mtd_init(void)
 	mtd->priv = mapp;
 
 	uclinux_ram_mtdinfo = mtd;
+#ifdef CONFIG_MTD_PARTITIONS
 	add_mtd_partitions(mtd, uclinux_romfs, NUM_PARTITIONS);
+#else
+	add_mtd_device(mtd);
+#endif
 
 	return(0);
 }
@@ -97,7 +101,11 @@ static int __init uclinux_mtd_init(void)
 static void __exit uclinux_mtd_cleanup(void)
 {
 	if (uclinux_ram_mtdinfo) {
+#ifdef CONFIG_MTD_PARTITIONS
 		del_mtd_partitions(uclinux_ram_mtdinfo);
+#else
+		del_mtd_device(uclinux_ram_mtdinfo);
+#endif
 		map_destroy(uclinux_ram_mtdinfo);
 		uclinux_ram_mtdinfo = NULL;
 	}
-- 
1.6.3.1
