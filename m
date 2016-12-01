Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCYo2-00036R-Ie
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 21:22:18 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 21/24] ubifs: Use a random number for cookies
Date: Thu,  1 Dec 2016 22:21:08 +0100
Message-Id: <1480627271-10441-22-git-send-email-richard@nod.at>
In-Reply-To: <1480627271-10441-1-git-send-email-richard@nod.at>
References: <1480627271-10441-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/journal.c | 3 +++
 fs/ubifs/ubifs.h   | 1 +
 2 files changed, 4 insertions(+)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 0698cccc6223..88d33775f18b 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -589,6 +589,7 @@ int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
 	dent->nlen = cpu_to_le16(fname_len(nm));
 	memcpy(dent->name, fname_name(nm), fname_len(nm));
 	dent->name[fname_len(nm)] = '\0';
+	dent->cookie = prandom_u32();
 
 	zero_dent_node_unused(dent);
 	ubifs_prep_grp_node(c, dent, dlen, 0);
@@ -1124,6 +1125,7 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 	dent->nlen = cpu_to_le16(fname_len(new_nm));
 	memcpy(dent->name, fname_name(new_nm), fname_len(new_nm));
 	dent->name[fname_len(new_nm)] = '\0';
+	dent->cookie = prandom_u32();
 	zero_dent_node_unused(dent);
 	ubifs_prep_grp_node(c, dent, dlen1, 0);
 
@@ -1142,6 +1144,7 @@ int ubifs_jnl_rename(struct ubifs_info *c, const struct inode *old_dir,
 	dent2->nlen = cpu_to_le16(fname_len(old_nm));
 	memcpy(dent2->name, fname_name(old_nm), fname_len(old_nm));
 	dent2->name[fname_len(old_nm)] = '\0';
+	dent2->cookie = prandom_u32();
 	zero_dent_node_unused(dent2);
 	ubifs_prep_grp_node(c, dent2, dlen2, 0);
 
diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
index ca33efcb4335..85c74ad98898 100644
--- a/fs/ubifs/ubifs.h
+++ b/fs/ubifs/ubifs.h
@@ -39,6 +39,7 @@
 #include <linux/security.h>
 #include <linux/xattr.h>
 #include <linux/fscrypto.h>
+#include <linux/random.h>
 #include "ubifs-media.h"
 
 /* Version of this UBIFS implementation */
-- 
2.7.3
