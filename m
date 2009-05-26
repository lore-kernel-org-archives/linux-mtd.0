Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M9694-0000xO-Mi
	for linux-mtd@lists.infradead.org; Tue, 26 May 2009 23:33:29 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] mtd/maps: uclinux: mark local stuff static
Date: Tue, 26 May 2009 19:33:17 -0400
Message-Id: <1243380798-10089-2-git-send-email-vapier@gentoo.org>
In-Reply-To: <20090526231902.GA6295@linux-sh.org>
References: <20090526231902.GA6295@linux-sh.org>
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

The uclinux_ram_mtdinfo, uclinux_romfs, and uclinux_point symbols do not
need to be visible outside of this module, so mark them static.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
CC: Greg Ungerer <gerg@uclinux.org>
CC: uclinux-dev@uclinux.org
CC: linux-mtd@lists.infradead.org
---
 drivers/mtd/maps/uclinux.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index 61d4087..d4314fb 100644
--- a/drivers/mtd/maps/uclinux.c
+++ b/drivers/mtd/maps/uclinux.c
@@ -30,11 +30,11 @@ struct map_info uclinux_ram_map = {
 	.size = 0,
 };
 
-struct mtd_info *uclinux_ram_mtdinfo;
+static struct mtd_info *uclinux_ram_mtdinfo;
 
 /****************************************************************************/
 
-struct mtd_partition uclinux_romfs[] = {
+static struct mtd_partition uclinux_romfs[] = {
 	{ .name = "ROMfs" }
 };
 
@@ -42,7 +42,7 @@ struct mtd_partition uclinux_romfs[] = {
 
 /****************************************************************************/
 
-int uclinux_point(struct mtd_info *mtd, loff_t from, size_t len,
+static int uclinux_point(struct mtd_info *mtd, loff_t from, size_t len,
 	size_t *retlen, void **virt, resource_size_t *phys)
 {
 	struct map_info *map = mtd->priv;
-- 
1.6.3.1
