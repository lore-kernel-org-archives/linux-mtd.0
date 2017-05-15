Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAGrS-0000ln-N4
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 14:20:36 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, adrian.hunter@intel.com, dedekind1@gmail.com,
 Richard Weinberger <richard@nod.at>, stable@vger.kernel.org
Subject: [PATCH] ubifs: Fix inode leak in xattr code
Date: Mon, 15 May 2017 16:20:05 +0200
Message-Id: <1494858005-18439-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UBIFS handles extended attributes just like files, as consequence of
that, they also have inodes.
Therefore UBIFS does all the inode machinery also for xattrs. Since new
inodes have i_nlink of 1, a file or xattr inode will be evicted
if i_nlink goes down to 0 after an unlink. UBIFS assumes this model also
for xattrs, which is not correct.
One can create a file "foo" with xattr "user.test". By reading
"user.test" an inode will be created, and by deleting "user.test" it
will get evicted later. The assumption breaks if the file "foo", which
hosts the xattrs, will be removed. VFS nor UBIFS does not remove each
xattr via ubifs_xattr_remove(), it just removes the host inode from
the TNC and all underlying xattr nodes too.
The inode will stay in the system with i_count=0, i_nlink=1 and
i_state=I_REFERENCED until UBIFS is umounted.

To solve this problem, set i_nlink for all xattr inodes to 0, such that
the iput() in the UBIFS xattr code makes the temporary inode vanish
immediately.

Fixes: 1e51764a3c2ac05a ("UBIFS: add new flash file system")
Cc: <stable@vger.kernel.org>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/xattr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index efe00fcb8b75..7d23404d73dc 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -173,7 +173,7 @@ static int create_xattr(struct ubifs_info *c, struct inode *host,
 	mutex_unlock(&host_ui->ui_mutex);
 
 	ubifs_release_budget(c, &req);
-	insert_inode_hash(inode);
+	clear_nlink(inode);
 	iput(inode);
 	return 0;
 
@@ -272,8 +272,10 @@ static struct inode *iget_xattr(struct ubifs_info *c, ino_t inum)
 			  (int)PTR_ERR(inode));
 		return inode;
 	}
-	if (ubifs_inode(inode)->xattr)
+	if (ubifs_inode(inode)->xattr) {
+		clear_nlink(inode);
 		return inode;
+	}
 	ubifs_err(c, "corrupt extended attribute entry");
 	iput(inode);
 	return ERR_PTR(-EINVAL);
@@ -546,7 +548,6 @@ static int ubifs_xattr_remove(struct inode *host, const char *name)
 	}
 
 	ubifs_assert(inode->i_nlink == 1);
-	clear_nlink(inode);
 	err = remove_xattr(c, host, inode, &nm);
 	if (err)
 		set_nlink(inode, 1);
-- 
2.7.3
