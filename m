Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkGoq-00082A-LJ
 for linux-mtd@lists.infradead.org; Wed, 14 Sep 2016 20:30:10 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, richard@nod.at, dedekind1@gmail.com,
 adrian.hunter@intel.com, nbd@nbd.name
Subject: [PATCH 4/4] ubifs: Use move variable in ubifs_rename()
Date: Wed, 14 Sep 2016 22:28:52 +0200
Message-Id: <1473884932-23689-5-git-send-email-richard@nod.at>
In-Reply-To: <1473884932-23689-1-git-send-email-richard@nod.at>
References: <1473884932-23689-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

...to make the code more consistent since we use
move already in other places.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/journal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 8e07f13..91bc76dc 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1100,7 +1100,7 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 	aligned_dlen1 = ALIGN(dlen1, 8);
 	aligned_dlen2 = ALIGN(dlen2, 8);
 	len = aligned_dlen1 + aligned_dlen2 + ALIGN(ilen, 8) + ALIGN(plen, 8);
-	if (old_dir != new_dir)
+	if (move)
 		len += plen;
 	dent = kmalloc(len, GFP_NOFS);
 	if (!dent)
@@ -1216,7 +1216,7 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 	if (err)
 		goto out_ro;
 
-	if (old_dir != new_dir) {
+	if (move) {
 		offs += ALIGN(plen, 8);
 		ino_key_init(c, &key, new_dir->i_ino);
 		err = ubifs_tnc_add(c, &key, lnum, offs, plen);
-- 
2.7.3
