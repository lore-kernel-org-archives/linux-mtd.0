Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fa6fT-00063G-9r
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 21:47:32 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Kees Cook <keescook@chromium.org>
Subject: [PATCH] ubifs: Use kmalloc_array()
Date: Mon,  2 Jul 2018 23:47:13 +0200
Message-Id: <20180702214713.2769-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since commit 6da2ec56059c ("treewide: kmalloc() -> kmalloc_array()")
we use kmalloc_array() for kmalloc() that computes the length with
a multiplication.

Cc: Kees Cook <keescook@chromium.org>
Suggested-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/journal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index eea12d25a58b..95acc0c04bca 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1285,7 +1285,7 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
 	int err, dlen, compr_type, out_len, old_dlen;
 
 	out_len = le32_to_cpu(dn->size);
-	buf = kmalloc(out_len * WORST_COMPR_FACTOR, GFP_NOFS);
+	buf = kmalloc_array(out_len, WORST_COMPR_FACTOR, GFP_NOFS);
 	if (!buf)
 		return -ENOMEM;
 
-- 
2.18.0
