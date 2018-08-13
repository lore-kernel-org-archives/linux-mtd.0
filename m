Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fpCgj-0005ng-JB
 for linux-mtd@lists.infradead.org; Mon, 13 Aug 2018 13:15:15 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH] ubifs: Add comment on c->commit_sem
Date: Mon, 13 Aug 2018 15:14:45 +0200
Message-Id: <20180813131445.5656-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Every single time I come across that code, I get confused
because it looks like a possible dead lock.
Help myself by adding a comment.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/journal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 95665eba2b70..c913f36d6c21 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -328,6 +328,7 @@ again:
 	down_read(&c->commit_sem);
 	err = reserve_space(c, jhead, len);
 	if (!err)
+		/* c->commit_sem will get released via finish_reservation(). */
 		return 0;
 	up_read(&c->commit_sem);
 
-- 
2.18.0
