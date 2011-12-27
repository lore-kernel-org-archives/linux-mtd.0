Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RfZXN-0001G1-Dh
 for linux-mtd@lists.infradead.org; Tue, 27 Dec 2011 16:06:02 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: lpddr: drop unnecessary zeroing
Date: Tue, 27 Dec 2011 18:07:36 +0200
Message-Id: <1325002056-6479-1-git-send-email-dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

We allocate the "mtd" structure using kzalloc which means we do not have
to initialize unused MTD function pointers to NULL, since it is safe to
assume in Linux that NULL contains all zeroes.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/lpddr/lpddr_cmds.c |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index 1dca31d..536bbce 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -70,19 +70,12 @@ struct mtd_info *lpddr_cmdset(struct map_info *map)
 	mtd->erase = lpddr_erase;
 	mtd->write = lpddr_write_buffers;
 	mtd->writev = lpddr_writev;
-	mtd->read_oob = NULL;
-	mtd->write_oob = NULL;
-	mtd->sync = NULL;
 	mtd->lock = lpddr_lock;
 	mtd->unlock = lpddr_unlock;
-	mtd->suspend = NULL;
-	mtd->resume = NULL;
 	if (map_is_linear(map)) {
 		mtd->point = lpddr_point;
 		mtd->unpoint = lpddr_unpoint;
 	}
-	mtd->block_isbad = NULL;
-	mtd->block_markbad = NULL;
 	mtd->size = 1 << lpddr->qinfo->DevSizeShift;
 	mtd->erasesize = 1 << lpddr->qinfo->UniformBlockSizeShift;
 	mtd->writesize = 1 << lpddr->qinfo->BufSizeShift;
-- 
1.7.7.3
