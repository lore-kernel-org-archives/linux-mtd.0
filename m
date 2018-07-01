Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZjmW-0000vX-7r
 for linux-mtd@lists.infradead.org; Sun, 01 Jul 2018 21:21:18 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Kees Cook <keescook@chromium.org>, Silvio Cesare <silvio.cesare@gmail.com>,
 stable@vger.kernel.org
Subject: [PATCH 1/2] Revert "UBIFS: Fix potential integer overflow in
 allocation"
Date: Sun,  1 Jul 2018 23:20:50 +0200
Message-Id: <20180701212051.29486-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This reverts commit 353748a359f1821ee934afc579cf04572406b420.
It bypassed the linux-mtd review process and fixes the issue not as it
should.

Cc: Kees Cook <keescook@chromium.org>
Cc: Silvio Cesare <silvio.cesare@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/journal.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 07b4956e0425..da8afdfccaa6 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1282,11 +1282,10 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
 			      int *new_len)
 {
 	void *buf;
-	int err, compr_type;
-	u32 dlen, out_len, old_dlen;
+	int err, dlen, compr_type, out_len, old_dlen;
 
 	out_len = le32_to_cpu(dn->size);
-	buf = kmalloc_array(out_len, WORST_COMPR_FACTOR, GFP_NOFS);
+	buf = kmalloc(out_len * WORST_COMPR_FACTOR, GFP_NOFS);
 	if (!buf)
 		return -ENOMEM;
 
-- 
2.18.0
