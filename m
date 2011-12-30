Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgeRM-0006Mi-JB
 for linux-mtd@lists.infradead.org; Fri, 30 Dec 2011 15:32:17 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] mtd: remove unused default_mtd_readv prototype
Date: Fri, 30 Dec 2011 17:34:11 +0200
Message-Id: <1325259254-21208-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 include/linux/mtd/mtd.h |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 3ee9e1b..770982d 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -512,9 +512,6 @@ extern int unregister_mtd_user (struct mtd_notifier *old);
 int default_mtd_writev(struct mtd_info *mtd, const struct kvec *vecs,
 		       unsigned long count, loff_t to, size_t *retlen);
 
-int default_mtd_readv(struct mtd_info *mtd, struct kvec *vecs,
-		      unsigned long count, loff_t from, size_t *retlen);
-
 void *mtd_kmalloc_up_to(const struct mtd_info *mtd, size_t *size);
 
 void mtd_erase_callback(struct erase_info *instr);
-- 
1.7.7.3
