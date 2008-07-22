Received: from mail51.messagelabs.com ([216.82.244.179])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KLCSh-0006Wo-HB
	for linux-mtd@lists.infradead.org; Tue, 22 Jul 2008 07:39:07 +0000
From: =?utf-8?q?Uwe=20Kleine-K=C3=B6nig?= <Uwe.Kleine-Koenig@digi.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/4] [MTD] remove bogus warning about missing boot bank
	location
Date: Tue, 22 Jul 2008 09:38:58 +0200
Message-ID: <1216712341-25869-2-git-send-email-Uwe.Kleine-Koenig@digi.com>
In-Reply-To: <1216712341-25869-1-git-send-email-Uwe.Kleine-Koenig@digi.com>
References: <1216712341-25869-1-git-send-email-Uwe.Kleine-Koenig@digi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After the deleted block bootloc is only used once as follows:

	if (bootloc == 3 && something_else) {
		...

So setting bootloc = 2 doesn't change anything.  Taking that the warning is
wrong and missleading.

Signed-off-by: Uwe Kleine-König <Uwe.Kleine-Koenig@digi.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index f7fcc63..8b5b554 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -344,11 +344,6 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 #endif
 
 		bootloc = extp->TopBottom;
-		if ((bootloc != 2) && (bootloc != 3)) {
-			printk(KERN_WARNING "%s: CFI does not contain boot "
-			       "bank location. Assuming top.\n", map->name);
-			bootloc = 2;
-		}
 
 		if (bootloc == 3 && cfi->cfiq->NumEraseRegions > 1) {
 			printk(KERN_WARNING "%s: Swapping erase regions for broken CFI table.\n", map->name);
-- 
1.5.6.3
