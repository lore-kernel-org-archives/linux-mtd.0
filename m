Received: from moutng.kundenserver.de ([212.227.126.187])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1It1Gt-0000iM-8A
	for linux-mtd@lists.infradead.org; Fri, 16 Nov 2007 08:30:18 -0500
From: Andre Haupt <andre@bitwigglers.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] cfi: make cfi_staa_erase_varsize static to shut up sparse
Date: Fri, 16 Nov 2007 14:29:55 +0100
Message-Id: <11952197951426-git-send-email-andre@bitwigglers.org>
Cc: Andre Haupt <andre@bitwigglers.org>, joern@wh.fh-wedel.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

should this be static?


From: Andre Haupt <andre@bitwigglers.org>
Signed-off-by: Andre Haupt <andre@bitwigglers.org>
---
 drivers/mtd/chips/cfi_cmdset_0020.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index b344ff8..07a3dd4 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -893,7 +893,7 @@ retry:
 	return ret;
 }
 
-int cfi_staa_erase_varsize(struct mtd_info *mtd, struct erase_info *instr)
+static int cfi_staa_erase_varsize(struct mtd_info *mtd, struct erase_info *instr)
 {	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long adr, len;
-- 
1.4.4.4
