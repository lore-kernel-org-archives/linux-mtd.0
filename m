Received: from mail-ie0-x22b.google.com ([2607:f8b0:4001:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZD253-0004p3-6J
 for linux-mtd@lists.infradead.org; Thu, 09 Jul 2015 03:00:58 +0000
Received: by iecvh10 with SMTP id vh10so168598954iec.3
 for <linux-mtd@lists.infradead.org>; Wed, 08 Jul 2015 20:00:35 -0700 (PDT)
From: Nicholas Krause <xerofoify@gmail.com>
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] jffs2:Remove reductant error paths in the function
 jffs2_sum_scan_sumnode
Date: Wed,  8 Jul 2015 23:00:29 -0400
Message-Id: <1436410831-29257-1-git-send-email-xerofoify@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This removes reductant error paths in the function
jffs2_sum_scan_sumnode after calling the function
jffs2_scan_dirty_space due to this function always
running successfully and only ever returning the
value of zero.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 fs/jffs2/summary.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index bc53854..39075fe 100644
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -624,13 +624,11 @@ int jffs2_sum_scan_sumnode(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb
 		if (je32_to_cpu(summary->cln_mkr) != c->cleanmarker_size) {
 			dbg_summary("CLEANMARKER node has totlen 0x%x != normal 0x%x\n",
 				je32_to_cpu(summary->cln_mkr), c->cleanmarker_size);
-			if ((ret = jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(summary->cln_mkr)))))
-				return ret;
+			jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(summary->cln_mkr)));
 		} else if (jeb->first_node) {
 			dbg_summary("CLEANMARKER node not first node in block "
 					"(0x%08x)\n", jeb->offset);
-			if ((ret = jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(summary->cln_mkr)))))
-				return ret;
+			jffs2_scan_dirty_space(c, jeb, PAD(je32_to_cpu(summary->cln_mkr)));
 		} else {
 			jffs2_link_node_ref(c, jeb, jeb->offset | REF_NORMAL,
 					    je32_to_cpu(summary->cln_mkr), NULL);
-- 
2.1.4
