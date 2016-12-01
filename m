Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCYnw-000362-CI
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 21:22:11 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david@sigma-star.at, tytso@mit.edu, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dengler@linutronix.de,
 sbabic@denx.de, wd@denx.de, Richard Weinberger <richard@nod.at>
Subject: [PATCH 08/24] ubifs: Enforce crypto policy in ->link and ->rename
Date: Thu,  1 Dec 2016 22:20:55 +0100
Message-Id: <1480627271-10441-9-git-send-email-richard@nod.at>
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

When a file is moved or linked into another directory
its current crypto policy has to be compatible with the
target policy.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/dir.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
index 477817567971..bd0af4e9ca0b 100644
--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -639,6 +639,10 @@ static int ubifs_link(struct dentry *old_dentry, struct inode *dir,
 	ubifs_assert(inode_is_locked(dir));
 	ubifs_assert(inode_is_locked(inode));
 
+	if (ubifs_crypt_is_encrypted(dir) &&
+	    !fscrypt_has_permitted_context(dir, inode))
+		return -EPERM;
+
 	err = dbg_check_synced_i_size(c, inode);
 	if (err)
 		return err;
@@ -1133,6 +1137,12 @@ static int do_rename(struct inode *old_dir, struct dentry *old_dentry,
 	if (unlink)
 		ubifs_assert(inode_is_locked(new_inode));
 
+	if (old_dir != new_dir) {
+		if (ubifs_crypt_is_encrypted(new_dir) &&
+		    !fscrypt_has_permitted_context(new_dir, old_inode))
+			return -EPERM;
+	}
+
 	if (unlink && is_dir) {
 		err = ubifs_check_dir_empty(new_inode);
 		if (err)
@@ -1327,6 +1337,13 @@ static int ubifs_xrename(struct inode *old_dir, struct dentry *old_dentry,
 
 	ubifs_assert(fst_inode && snd_inode);
 
+	if ((ubifs_crypt_is_encrypted(old_dir) ||
+	    ubifs_crypt_is_encrypted(new_dir)) &&
+	    (old_dir != new_dir) &&
+	    (!fscrypt_has_permitted_context(new_dir, fst_inode) ||
+	     !fscrypt_has_permitted_context(old_dir, snd_inode)))
+		return -EPERM;
+
 	lock_4_inodes(old_dir, new_dir, NULL, NULL);
 
 	time = ubifs_current_time(old_dir);
-- 
2.7.3
