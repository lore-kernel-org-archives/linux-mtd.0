Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSUhL-0004hd-Q9
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 13:46:05 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-sa01.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p53Djuqf013884
	for <linux-mtd@lists.infradead.org>; Fri, 3 Jun 2011 16:45:56 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 02/10] UBIFS: introduce a "grouped" journal head flag
Date: Fri,  3 Jun 2011 16:49:53 +0300
Message-Id: <1307109001-19761-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1307109001-19761-1-git-send-email-dedekind1@gmail.com>
References: <1307109001-19761-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Journal heads are different in a way how UBIFS writes nodes there. All normal
journal heads receive grouped nodes, while the GC journal heads receives
ungrouped nodes. This patch adds a 'grouped' flag to 'struct ubifs_jhead' which
describes this property.

This patch is a preparation to a further recovery fix.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/super.c |    5 ++++-
 fs/ubifs/ubifs.h |    2 ++
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 1ab0d22..1e40db7 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -811,15 +811,18 @@ static int alloc_wbufs(struct ubifs_info *c)
 
 		c->jheads[i].wbuf.sync_callback = &bud_wbuf_callback;
 		c->jheads[i].wbuf.jhead = i;
+		c->jheads[i].grouped = 1;
 	}
 
 	c->jheads[BASEHD].wbuf.dtype = UBI_SHORTTERM;
 	/*
 	 * Garbage Collector head likely contains long-term data and
-	 * does not need to be synchronized by timer.
+	 * does not need to be synchronized by timer. Also GC head nodes are
+	 * not grouped.
 	 */
 	c->jheads[GCHD].wbuf.dtype = UBI_LONGTERM;
 	c->jheads[GCHD].wbuf.no_timer = 1;
+	c->jheads[GCHD].grouped = 0;
 
 	return 0;
 }
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index a70d7b4..adeca14 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -722,12 +722,14 @@ struct ubifs_bud {
  * struct ubifs_jhead - journal head.
  * @wbuf: head's write-buffer
  * @buds_list: list of bud LEBs belonging to this journal head
+ * @grouped: non-zero if UBIFS groups nodes when writing to this journal head
  *
  * Note, the @buds list is protected by the @c->buds_lock.
  */
 struct ubifs_jhead {
 	struct ubifs_wbuf wbuf;
 	struct list_head buds_list;
+	unsigned int grouped:1;
 };
 
 /**
-- 
1.7.2.3
