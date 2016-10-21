Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxZGk-0004Wq-R3
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 12:50:03 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, tytso@mit.edu,
 jaegeuk@kernel.org, david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 10/26] ubifs: Enforce crypto policy in ->link and ->rename
Date: Fri, 21 Oct 2016 14:48:25 +0200
Message-Id: <1477054121-10198-11-git-send-email-richard@nod.at>
In-Reply-To: <1477054121-10198-1-git-send-email-richard@nod.at>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When a file is moved or linked into another directory
its current crypto policy has to be compatible with the
target policy.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index e80de3852c3e..a77edc5ca5c9 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -544,6 +544,10 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
 	ubifs_assert(inode_is_locked(dir));
 	ubifs_assert(inode_is_locked(inode));
 
+	if (ubifs_crypt_is_encrypted(dir) &&
+	    !fscrypt_has_permitted_context(dir, inode))
+		return -EPERM;
+
 	err = dbg_check_synced_i_size(c, inode);
 	if (err)
 		return err;
@@ -1027,6 +1031,11 @@ static int ubifs_rename(struct inode *old_dir, struct dentry *old_dentry,
 	if (unlink)
 		ubifs_assert(inode_is_locked(new_inode));
 
+	if (old_dir != new_dir) {
+		if (ubifs_crypt_is_encrypted(new_dir) &&
+		    !fscrypt_has_permitted_context(new_dir, old_inode))
+			return -EPERM;
+	}
 
 	if (unlink && is_dir) {
 		err = ubifs_check_dir_empty(new_inode);
-- 
2.7.3
