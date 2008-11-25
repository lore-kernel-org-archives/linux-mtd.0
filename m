Received: from smtp.movial.fi ([62.236.91.34])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L4n75-000645-RT
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 01:53:17 +0000
From: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
To: dwmw2@infradead.org
Subject: [PATCH 18/20] [MTD] Make uclinux_mtd_cleanup and uclinux_mtd_init
	static
Date: Tue, 25 Nov 2008 02:55:09 +0200
Message-Id: <1227574511-23879-19-git-send-email-dmitri.vorobiev@movial.fi>
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

The functions uclinux_mtd_cleanup and uclinux_mtd_init do
not heed to be global. Add the needed keyword to the file
drivers/mtd/maps/uclinux.c to make these functions static.

Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.fi>
---
 drivers/mtd/maps/uclinux.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index 0dc645f..81756e3 100644
--- a/drivers/mtd/maps/uclinux.c
+++ b/drivers/mtd/maps/uclinux.c
@@ -51,7 +51,7 @@ int uclinux_point(struct mtd_info *mtd, loff_t from, size_t len,
 
 /****************************************************************************/
 
-int __init uclinux_mtd_init(void)
+static int __init uclinux_mtd_init(void)
 {
 	struct mtd_info *mtd;
 	struct map_info *mapp;
@@ -94,7 +94,7 @@ int __init uclinux_mtd_init(void)
 
 /****************************************************************************/
 
-void __exit uclinux_mtd_cleanup(void)
+static void __exit uclinux_mtd_cleanup(void)
 {
 	if (uclinux_ram_mtdinfo) {
 		del_mtd_partitions(uclinux_ram_mtdinfo);
-- 
1.5.3
