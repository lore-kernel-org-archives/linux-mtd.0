Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O5hov-0006HL-IW
	for linux-mtd@lists.infradead.org; Sat, 24 Apr 2010 16:03:07 +0000
Subject: [PATCH v5 5/9] [MTD] remove bogus warning about missing boot
	bank	location
To: linux-mtd <linux-mtd@lists.infradead.org>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Sat, 24 Apr 2010 17:58:12 +0200
Message-ID: <20100424155812.14723.66554.stgit@shiryu.yomgui.biz>
In-Reply-To: <20100424155751.14723.46761.stgit@shiryu.yomgui.biz>
References: <20100424155751.14723.46761.stgit@shiryu.yomgui.biz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Wolfram Sang <w.sang@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>,
	Chris Moore <moore@free.fr>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Uwe Kleine-König <Uwe.Kleine-Koenigi@digi.com>

After the deleted block bootloc is only used once as follows:

	if (bootloc == 3 && something_else) {
		...

So setting bootloc = 2 doesn't change anything.  Taking that the warning is
wrong and missleading.

Signed-off-by: Uwe Kleine-König <Uwe.Kleine-Koenig@digi.com>
Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
Acked-by: Christopher Moore <moore@free.fr>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index ea2a7f6..8da8655 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -391,11 +391,6 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 #endif
 
 		bootloc = extp->TopBottom;
-		if ((bootloc != 2) && (bootloc != 3)) {
-			printk(KERN_WARNING "%s: CFI does not contain boot "
-			       "bank location. Assuming top.\n", map->name);
-			bootloc = 2;
-		}
 
 		if (bootloc == 3 && cfi->cfiq->NumEraseRegions > 1) {
 			printk(KERN_WARNING "%s: Swapping erase regions for broken CFI table.\n", map->name);
