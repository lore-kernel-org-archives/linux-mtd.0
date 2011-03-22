Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q20NV-00063q-KM
	for linux-mtd@lists.infradead.org; Tue, 22 Mar 2011 12:08:02 +0000
Received: by bwz1 with SMTP id 1so6392051bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Mar 2011 05:07:58 -0700 (PDT)
Date: Tue, 22 Mar 2011 14:11:02 +0200
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] jffs2: unused variables cleanup in jffs2_lookup and
	jffs2_readdir
Message-ID: <20110322121102.GC5086@swordfish.minsk.epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

jffs2: cleanup unused jffs2_sb_info *c variable and JFFS2_SB_INFO call from jffs2_lookup 
and jffs2_readdir

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

---

 fs/jffs2/dir.c |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index 82faddd..4bca6a2 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -75,7 +75,6 @@ static struct dentry *jffs2_lookup(struct inode *dir_i, struct dentry *target,
 				   struct nameidata *nd)
 {
 	struct jffs2_inode_info *dir_f;
-	struct jffs2_sb_info *c;
 	struct jffs2_full_dirent *fd = NULL, *fd_list;
 	uint32_t ino = 0;
 	struct inode *inode = NULL;
@@ -86,7 +85,6 @@ static struct dentry *jffs2_lookup(struct inode *dir_i, struct dentry *target,
 		return ERR_PTR(-ENAMETOOLONG);
 
 	dir_f = JFFS2_INODE_INFO(dir_i);
-	c = JFFS2_SB_INFO(dir_i->i_sb);
 
 	mutex_lock(&dir_f->sem);
 
@@ -119,7 +117,6 @@ static struct dentry *jffs2_lookup(struct inode *dir_i, struct dentry *target,
 static int jffs2_readdir(struct file *filp, void *dirent, filldir_t filldir)
 {
 	struct jffs2_inode_info *f;
-	struct jffs2_sb_info *c;
 	struct inode *inode = filp->f_path.dentry->d_inode;
 	struct jffs2_full_dirent *fd;
 	unsigned long offset, curofs;
@@ -127,7 +124,6 @@ static int jffs2_readdir(struct file *filp, void *dirent, filldir_t filldir)
 	D1(printk(KERN_DEBUG "jffs2_readdir() for dir_i #%lu\n", filp->f_path.dentry->d_inode->i_ino));
 
 	f = JFFS2_INODE_INFO(inode);
-	c = JFFS2_SB_INFO(inode->i_sb);
 
 	offset = filp->f_pos;
 
