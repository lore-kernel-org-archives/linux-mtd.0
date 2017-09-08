Received: from mail-pg0-x234.google.com ([2607:f8b0:400e:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dq6un-0006o5-DR
 for linux-mtd@lists.infradead.org; Fri, 08 Sep 2017 00:13:00 +0000
Received: by mail-pg0-x234.google.com with SMTP id 188so2116140pgb.2
 for <linux-mtd@lists.infradead.org>; Thu, 07 Sep 2017 17:12:35 -0700 (PDT)
From: Michael Halcrow <mhalcrow@google.com>
To: linux-fscrypt@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] F2FS crypto: Return -EXDEV for link, rename,
 and cross-rename between incompat contexts
Date: Thu,  7 Sep 2017 17:12:03 -0700
Message-Id: <20170908001204.18174-3-mhalcrow@google.com>
In-Reply-To: <20170908001204.18174-1-mhalcrow@google.com>
References: <20170908001204.18174-1-mhalcrow@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gives user space the opportunity to fall back to copy-and-delete.

Signed-off-by: Michael Halcrow <mhalcrow@google.com>
---
 fs/f2fs/namei.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 760d85223c81..689c671cf8b8 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -202,7 +202,7 @@ static int f2fs_link(struct dentry *old_dentry, struct inode *dir,
 
 	if (f2fs_encrypted_inode(dir) &&
 			!fscrypt_has_permitted_context(dir, inode))
-		return -EPERM;
+		return -EXDEV;
 
 	err = dquot_initialize(dir);
 	if (err)
@@ -720,7 +720,7 @@ static int f2fs_rename(struct inode *old_dir, struct dentry *old_dentry,
 
 	if ((old_dir != new_dir) && f2fs_encrypted_inode(new_dir) &&
 			!fscrypt_has_permitted_context(new_dir, old_inode)) {
-		err = -EPERM;
+		err = -EXDEV;
 		goto out;
 	}
 
@@ -910,7 +910,7 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 			(old_dir != new_dir) &&
 			(!fscrypt_has_permitted_context(new_dir, old_inode) ||
 			 !fscrypt_has_permitted_context(old_dir, new_inode)))
-		return -EPERM;
+		return -EXDEV;
 
 	err = dquot_initialize(old_dir);
 	if (err)
-- 
2.14.1.581.gf28d330327-goog
