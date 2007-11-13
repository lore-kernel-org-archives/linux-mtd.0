Received: from tecon.ru ([86.111.13.98] helo=mail.tecon.ru)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Irsvd-0006jd-GE
	for linux-mtd@lists.infradead.org; Tue, 13 Nov 2007 05:23:41 -0500
Date: Tue, 13 Nov 2007 13:23:23 +0300
From: Damir Shayhutdinov <lost404@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [JFFS2] Fix free space leaking
Message-ID: <20071113102323.GA5933@damir.rnd.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch is addressed to fix very-long-standing problem in JFFS2,
first described in 2004:
http://lists.infradead.org/pipermail/linux-mtd/2004-March/009456.html

jffs2_link_node_ref() decreases c->free_size by
c->cleanmarker_size but the clean marker space can't
be accounted as free space! So we just compensate
the difference.

Signed-off-by: Alexander Yurchenko <grange@tecon.ru>
Signed-off-by: Damir Shayhutdinov <damir@tecon.ru>
---
 fs/jffs2/erase.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index a1db918..c574fa3 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -454,6 +454,17 @@ static void jffs2_mark_erased_block(struct jffs2_sb_info *c, struct jffs2_eraseb
 		jeb->free_size = c->sector_size;
 		/* FIXME Special case for cleanmarker in empty block */
 		jffs2_link_node_ref(c, jeb, jeb->offset | REF_NORMAL, c->cleanmarker_size, NULL);
+		/*
+		 * XXX: I'm not sure this is correct but it prevents
+		 * c->free_size from slow leaking under a frequent file
+		 * overwriting.
+		 * jffs2_link_node_ref() decreases c->free_size by
+		 * c->cleanmarker_size but the clean marker space can't
+		 * be accounted as free space! So we just compensate
+		 * the difference.
+		 */
+		c->free_size += c->cleanmarker_size;
+		c->used_size -= c->cleanmarker_size;
 	}
 
 	down(&c->erase_free_sem);
-- 
1.5.3.4.GIT
