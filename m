Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dLs8o-0004sr-93
 for linux-mtd@lists.infradead.org; Fri, 16 Jun 2017 14:22:29 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>, stable@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] ubifs: Don't leak kernel memory to the MTD
Date: Fri, 16 Jun 2017 16:21:44 +0200
Message-Id: <20170616142144.4244-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When UBIFS prepares data structures which will be written to the MTD it
ensues that their lengths are multiple of 8. Since it uses kmalloc() the
padded bytes are left uninitialized and we leak a few bytes of kernel
memory to the MTD.
To make sure that all bytes are initialized, let's switch to kzalloc().
Kzalloc() is fine in this case because the buffers are not huge and in
the IO path the performance bottleneck is anyway the MTD.

Cc: stable@vger.kernel.org
Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/journal.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 294519b98874..981a7ea86674 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -574,7 +574,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 	/* Make sure to also account for extended attributes */
 	len += host_ui->data_len;
 
-	dent = kmalloc(len, GFP_NOFS);
+	dent = kzalloc(len, GFP_NOFS);
 	if (!dent)
 		return -ENOMEM;
 
@@ -967,7 +967,7 @@ int ubifs_jnl_xrename(struct ubifs_info *c, const struct inode *fst_dir,
 	if (twoparents)
 		len += plen;
 
-	dent1 = kmalloc(len, GFP_NOFS);
+	dent1 = kzalloc(len, GFP_NOFS);
 	if (!dent1)
 		return -ENOMEM;
 
@@ -1117,7 +1117,7 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 	len = aligned_dlen1 + aligned_dlen2 + ALIGN(ilen, 8) + ALIGN(plen, 8);
 	if (move)
 		len += plen;
-	dent = kmalloc(len, GFP_NOFS);
+	dent = kzalloc(len, GFP_NOFS);
 	if (!dent)
 		return -ENOMEM;
 
@@ -1500,7 +1500,7 @@ int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
 	hlen = host_ui->data_len + UBIFS_INO_NODE_SZ;
 	len = aligned_xlen + UBIFS_INO_NODE_SZ + ALIGN(hlen, 8);
 
-	xent = kmalloc(len, GFP_NOFS);
+	xent = kzalloc(len, GFP_NOFS);
 	if (!xent)
 		return -ENOMEM;
 
@@ -1607,7 +1607,7 @@ int ubifs_jnl_change_xattr(struct ubifs_info *c, const struct inode *inode,
 	aligned_len1 = ALIGN(len1, 8);
 	aligned_len = aligned_len1 + ALIGN(len2, 8);
 
-	ino = kmalloc(aligned_len, GFP_NOFS);
+	ino = kzalloc(aligned_len, GFP_NOFS);
 	if (!ino)
 		return -ENOMEM;
 
-- 
2.12.3
