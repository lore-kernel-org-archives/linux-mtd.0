Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dL1qL-0004ph-Jv
 for linux-mtd@lists.infradead.org; Wed, 14 Jun 2017 06:31:55 +0000
Subject: [PATCH] fs/jffs2: Fix a Invalid argument error when mkdir in jffs2
 which is mounted as overlayfs
From: yangshukui <yangshukui@huawei.com>
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <58B689F1.3000000@huawei.com>
Message-ID: <3b8362cf-da22-fbb0-de80-9f9bf8ec4326@huawei.com>
Date: Wed, 14 Jun 2017 14:30:30 +0800
MIME-Version: 1.0
In-Reply-To: <58B689F1.3000000@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In jffs2 filesystem, I mount a overlayfs, after rmdir  and mkdir, 
'Invalid argument' error will appear.
It can be reproduced like this,

[root@localhost mnt]# mkdir -p overlay-mkdir
[root@localhost overlay-mkdir]# pwd;mount|grep jffs2
/root/mnt/overlay-mkdir
/dev/mtdblock0 on /root/mnt type jffs2 (rw,relatime)

[root@localhost mnt]# cd overlay-mkdir/
[root@localhost overlay-mkdir]# mkdir -p merged  lower/hello  upper work
[root@localhost overlay-mkdir]# mount -t overlay overlay 
-olowerdir=lower,upperdir=upper,workdir=work merged
[root@localhost overlay-mkdir]# rmdir merged/hello
[root@localhost overlay-mkdir]# mkdir merged/hello
mkdir: cannot create directory merged/hello Invalid argument

From: Shukui Yang <yangshukui@huawei.com>
Date: Wed, 14 Jun 2017 14:03:51 +0800
Subject: [PATCH] fs/jffs2: fix a Invalid argument error when mkdir in 
jffs2 which is
  mounted as overlayfs

Signed-off-by:  Shukui Yang <yangshukui@huawei.com>
---
  fs/jffs2/dir.c | 11 ++++++++---
  1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
index cfbceb1..9a95d98 100644
--- a/fs/jffs2/dir.c
+++ b/fs/jffs2/dir.c
@@ -34,8 +34,8 @@ static int jffs2_symlink (struct inode *,struct dentry 
*,const char *);
  static int jffs2_mkdir (struct inode *,struct dentry *,umode_t);
  static int jffs2_rmdir (struct inode *,struct dentry *);
  static int jffs2_mknod (struct inode *,struct dentry *,umode_t,dev_t);
-static int jffs2_rename (struct inode *, struct dentry *,
-                        struct inode *, struct dentry *);
+static int jffs2_rename2 (struct inode *, struct dentry *,
+                        struct inode *, struct dentry *, unsigned int);

  const struct file_operations jffs2_dir_operations =
  {
@@ -57,7 +57,7 @@ const struct inode_operations jffs2_dir_inode_operations =
         .mkdir =        jffs2_mkdir,
         .rmdir =        jffs2_rmdir,
         .mknod =        jffs2_mknod,
-       .rename =       jffs2_rename,
+       .rename2 =      jffs2_rename2,
         .get_acl =      jffs2_get_acl,
         .set_acl =      jffs2_set_acl,
         .setattr =      jffs2_setattr,
@@ -865,3 +865,8 @@ static int jffs2_rename (struct inode *old_dir_i, 
struct dentry *old_dentry,
         return 0;
  }

+static int jffs2_rename2 (struct inode *old_dir_i, struct dentry 
*old_dentry,
+                        struct inode *new_dir_i, struct dentry 
*new_dentry, unsigned int flags)
+{
+       return jffs2_rename(old_dir_i, old_dentry, new_dir_i, new_dentry);
+}
-- 
2.6.2
