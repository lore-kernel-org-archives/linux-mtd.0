Received: from mail1-relais-roc.national.inria.fr ([192.134.164.82])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1So8NS-0005Hr-7A
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2012 07:27:32 +0000
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] fs/ubifs/orphan.c: remove invalid reference to list iterator
 variable
Date: Mon,  9 Jul 2012 09:27:14 +0200
Message-Id: <1341818834-2101-1-git-send-email-Julia.Lawall@lip6.fr>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Julia Lawall <Julia.Lawall@lip6.fr>

If list_for_each_entry, etc complete a traversal of the list, the iterator
variable ends up pointing to an address at an offset from the list head,
and not a meaningful structure.  Thus this value should not be used after
the end of the iterator.  Replace a field access from orphan by NULL in two
places.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier c;
expression E;
iterator name list_for_each_entry;
statement S;
@@

list_for_each_entry(c,...) { ... when != break;
                                 when forall
                                 when strict
}
...
(
c = E
|
*c
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/ubifs/orphan.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index b02734d..cebf17e 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -176,7 +176,7 @@ int ubifs_orphan_start_commit(struct ubifs_info *c)
 		*last = orphan;
 		last = &orphan->cnext;
 	}
-	*last = orphan->cnext;
+	*last = NULL;
 	c->cmt_orphans = c->new_orphans;
 	c->new_orphans = 0;
 	dbg_cmt("%d orphans to commit", c->cmt_orphans);
@@ -382,7 +382,7 @@ static int consolidate(struct ubifs_info *c)
 			last = &orphan->cnext;
 			cnt += 1;
 		}
-		*last = orphan->cnext;
+		*last = NULL;
 		ubifs_assert(cnt == c->tot_orphans - c->new_orphans);
 		c->cmt_orphans = cnt;
 		c->ohead_lnum = c->orph_first;
