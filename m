Received: from [45.249.212.189] (helo=dggrg03-dlp.huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cizyc-0007TF-Kt
 for linux-mtd@lists.infradead.org; Wed, 01 Mar 2017 08:51:23 +0000
To: <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: yangshukui <yangshukui@huawei.com>
Subject: Bug fix for uid/gid in jffs2
Message-ID: <58B689F1.3000000@huawei.com>
Date: Wed, 1 Mar 2017 16:44:33 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As we kown that uid is u32(__kernel_uid32_t)  in linux, but uid is 
u16(jint16_t) in jffs2 ，so jffs2 has the following problem,

mount -t jffs2 /dev/mtdblock0 /mnt
touch /mnt/a

chown 65535.65535 /mnt/a;ls -n /mnt
total 1
-rw-r--r-- 1 65535 65535 2 Mar  1 11:53 a

chown 65536.65536 /mnt/a;ls -n /mnt
total 1
-rw-r--r-- 1 0 0 2 Mar  1 11:53 a

chown 65537.65537 /mnt/a;ls -n /mnt
total 1
-rw-r--r-- 1 1 1 2 Mar  1 11:53 a

The patch bellow will fix it.

 From 0ab0c9a341e642345b8cf02a029ddc44421379c3 Mon Sep 17 00:00:00 2001
From: Shukui Yang <yangshukui@huawei.com>
Date: Wed, 1 Mar 2017 16:06:33 +0800
Subject: [PATCH] uid/gid use jint32_t in jffs2

Signed-off-by: Shukui Yang <yangshukui@huawei.com>
---
  fs/jffs2/debug.c           |  4 ++--
  fs/jffs2/file.c            |  8 ++++----
  fs/jffs2/fs.c              | 22 +++++++++++-----------
  fs/jffs2/gc.c              | 12 ++++++------
  fs/jffs2/readinode.c       |  4 ++--
  fs/jffs2/super.c           |  2 +-
  include/uapi/linux/jffs2.h |  4 ++--
  7 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/fs/jffs2/debug.c b/fs/jffs2/debug.c
index 9d26b1b9..5e37393 100644
--- a/fs/jffs2/debug.c
+++ b/fs/jffs2/debug.c
@@ -814,8 +814,8 @@ void __jffs2_dbg_superblock_counts(struct 
jffs2_sb_info *c)
          printk(JFFS2_DBG "ino:\t%#08x\n", je32_to_cpu(node.i.ino));
          printk(JFFS2_DBG "version:\t%#08x\n", 
je32_to_cpu(node.i.version));
          printk(JFFS2_DBG "mode:\t%#08x\n", node.i.mode.m);
-        printk(JFFS2_DBG "uid:\t%#04x\n", je16_to_cpu(node.i.uid));
-        printk(JFFS2_DBG "gid:\t%#04x\n", je16_to_cpu(node.i.gid));
+        printk(JFFS2_DBG "uid:\t%#08x\n", je32_to_cpu(node.i.uid));
+        printk(JFFS2_DBG "gid:\t%#08x\n", je32_to_cpu(node.i.gid));
          printk(JFFS2_DBG "isize:\t%#08x\n", je32_to_cpu(node.i.isize));
          printk(JFFS2_DBG "atime:\t%#08x\n", je32_to_cpu(node.i.atime));
          printk(JFFS2_DBG "mtime:\t%#08x\n", je32_to_cpu(node.i.mtime));
diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index c12476e..c5266ba 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -172,8 +172,8 @@ static int jffs2_write_begin(struct file *filp, 
struct address_space *mapping,
          ri.ino = cpu_to_je32(f->inocache->ino);
          ri.version = cpu_to_je32(++f->highest_version);
          ri.mode = cpu_to_jemode(inode->i_mode);
-        ri.uid = cpu_to_je16(i_uid_read(inode));
-        ri.gid = cpu_to_je16(i_gid_read(inode));
+        ri.uid = cpu_to_je32(i_uid_read(inode));
+        ri.gid = cpu_to_je32(i_gid_read(inode));
          ri.isize = cpu_to_je32(max((uint32_t)inode->i_size, pageofs));
          ri.atime = ri.ctime = ri.mtime = cpu_to_je32(get_seconds());
          ri.offset = cpu_to_je32(inode->i_size);
@@ -280,8 +280,8 @@ static int jffs2_write_end(struct file *filp, struct 
address_space *mapping,
      /* Set the fields that the generic jffs2_write_inode_range() code 
can't find */
      ri->ino = cpu_to_je32(inode->i_ino);
      ri->mode = cpu_to_jemode(inode->i_mode);
-    ri->uid = cpu_to_je16(i_uid_read(inode));
-    ri->gid = cpu_to_je16(i_gid_read(inode));
+    ri->uid = cpu_to_je32(i_uid_read(inode));
+    ri->gid = cpu_to_je32(i_gid_read(inode));
      ri->isize = cpu_to_je32((uint32_t)inode->i_size);
      ri->atime = ri->ctime = ri->mtime = cpu_to_je32(get_seconds());

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 567653f..f75ab395 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -99,9 +99,9 @@ int jffs2_do_setattr (struct inode *inode, struct 
iattr *iattr)
      ri->ino = cpu_to_je32(inode->i_ino);
      ri->version = cpu_to_je32(++f->highest_version);

-    ri->uid = cpu_to_je16((ivalid & ATTR_UID)?
+    ri->uid = cpu_to_je32((ivalid & ATTR_UID)?
          from_kuid(&init_user_ns, iattr->ia_uid):i_uid_read(inode));
-    ri->gid = cpu_to_je16((ivalid & ATTR_GID)?
+    ri->gid = cpu_to_je32((ivalid & ATTR_GID)?
          from_kgid(&init_user_ns, iattr->ia_gid):i_gid_read(inode));

      if (ivalid & ATTR_MODE)
@@ -149,8 +149,8 @@ int jffs2_do_setattr (struct inode *inode, struct 
iattr *iattr)
      inode->i_ctime = ITIME(je32_to_cpu(ri->ctime));
      inode->i_mtime = ITIME(je32_to_cpu(ri->mtime));
      inode->i_mode = jemode_to_cpu(ri->mode);
-    i_uid_write(inode, je16_to_cpu(ri->uid));
-    i_gid_write(inode, je16_to_cpu(ri->gid));
+    i_uid_write(inode, je32_to_cpu(ri->uid));
+    i_gid_write(inode, je32_to_cpu(ri->gid));


      old_metadata = f->metadata;
@@ -276,8 +276,8 @@ struct inode *jffs2_iget(struct super_block *sb, 
unsigned long ino)
          goto error;

      inode->i_mode = jemode_to_cpu(latest_node.mode);
-    i_uid_write(inode, je16_to_cpu(latest_node.uid));
-    i_gid_write(inode, je16_to_cpu(latest_node.gid));
+    i_uid_write(inode, je32_to_cpu(latest_node.uid));
+    i_gid_write(inode, je32_to_cpu(latest_node.gid));
      inode->i_size = je32_to_cpu(latest_node.isize);
      inode->i_atime = ITIME(je32_to_cpu(latest_node.atime));
      inode->i_mtime = ITIME(je32_to_cpu(latest_node.mtime));
@@ -441,14 +441,14 @@ struct inode *jffs2_new_inode (struct inode 
*dir_i, umode_t mode, struct jffs2_r

      memset(ri, 0, sizeof(*ri));
      /* Set OS-specific defaults for new inodes */
-    ri->uid = cpu_to_je16(from_kuid(&init_user_ns, current_fsuid()));
+    ri->uid = cpu_to_je32(from_kuid(&init_user_ns, current_fsuid()));

      if (dir_i->i_mode & S_ISGID) {
-        ri->gid = cpu_to_je16(i_gid_read(dir_i));
+        ri->gid = cpu_to_je32(i_gid_read(dir_i));
          if (S_ISDIR(mode))
              mode |= S_ISGID;
      } else {
-        ri->gid = cpu_to_je16(from_kgid(&init_user_ns, current_fsgid()));
+        ri->gid = cpu_to_je32(from_kgid(&init_user_ns, current_fsgid()));
      }

      /* POSIX ACLs have to be processed now, at least partly.
@@ -470,8 +470,8 @@ struct inode *jffs2_new_inode (struct inode *dir_i, 
umode_t mode, struct jffs2_r
      set_nlink(inode, 1);
      inode->i_ino = je32_to_cpu(ri->ino);
      inode->i_mode = jemode_to_cpu(ri->mode);
-    i_gid_write(inode, je16_to_cpu(ri->gid));
-    i_uid_write(inode, je16_to_cpu(ri->uid));
+    i_gid_write(inode, je32_to_cpu(ri->gid));
+    i_uid_write(inode, je32_to_cpu(ri->uid));
      inode->i_atime = inode->i_ctime = inode->i_mtime = 
current_time(inode);
      ri->atime = ri->mtime = ri->ctime = 
cpu_to_je32(I_SEC(inode->i_mtime));

diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 9ed0f26..ff43ea4 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -818,8 +818,8 @@ static int jffs2_garbage_collect_metadata(struct 
jffs2_sb_info *c, struct jffs2_
      ri.ino = cpu_to_je32(f->inocache->ino);
      ri.version = cpu_to_je32(++f->highest_version);
      ri.mode = cpu_to_jemode(JFFS2_F_I_MODE(f));
-    ri.uid = cpu_to_je16(JFFS2_F_I_UID(f));
-    ri.gid = cpu_to_je16(JFFS2_F_I_GID(f));
+    ri.uid = cpu_to_je32(JFFS2_F_I_UID(f));
+    ri.gid = cpu_to_je32(JFFS2_F_I_GID(f));
      ri.isize = cpu_to_je32(ilen);
      ri.atime = cpu_to_je32(JFFS2_F_I_ATIME(f));
      ri.ctime = cpu_to_je32(JFFS2_F_I_CTIME(f));
@@ -1089,8 +1089,8 @@ static int jffs2_garbage_collect_hole(struct 
jffs2_sb_info *c, struct jffs2_eras
          ilen = JFFS2_F_I_SIZE(f);

      ri.mode = cpu_to_jemode(JFFS2_F_I_MODE(f));
-    ri.uid = cpu_to_je16(JFFS2_F_I_UID(f));
-    ri.gid = cpu_to_je16(JFFS2_F_I_GID(f));
+    ri.uid = cpu_to_je32(JFFS2_F_I_UID(f));
+    ri.gid = cpu_to_je32(JFFS2_F_I_GID(f));
      ri.isize = cpu_to_je32(ilen);
      ri.atime = cpu_to_je32(JFFS2_F_I_ATIME(f));
      ri.ctime = cpu_to_je32(JFFS2_F_I_CTIME(f));
@@ -1363,8 +1363,8 @@ static int jffs2_garbage_collect_dnode(struct 
jffs2_sb_info *c, struct jffs2_era
          ri.ino = cpu_to_je32(f->inocache->ino);
          ri.version = cpu_to_je32(++f->highest_version);
          ri.mode = cpu_to_jemode(JFFS2_F_I_MODE(f));
-        ri.uid = cpu_to_je16(JFFS2_F_I_UID(f));
-        ri.gid = cpu_to_je16(JFFS2_F_I_GID(f));
+        ri.uid = cpu_to_je32(JFFS2_F_I_UID(f));
+        ri.gid = cpu_to_je32(JFFS2_F_I_GID(f));
          ri.isize = cpu_to_je32(JFFS2_F_I_SIZE(f));
          ri.atime = cpu_to_je32(JFFS2_F_I_ATIME(f));
          ri.ctime = cpu_to_je32(JFFS2_F_I_CTIME(f));
diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 06a71db..74306bb 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -1195,8 +1195,8 @@ static int jffs2_do_read_inode_internal(struct 
jffs2_sb_info *c,
          latest_node->version = cpu_to_je32(0);
          latest_node->atime = latest_node->ctime = latest_node->mtime = 
cpu_to_je32(0);
          latest_node->isize = cpu_to_je32(0);
-        latest_node->gid = cpu_to_je16(0);
-        latest_node->uid = cpu_to_je16(0);
+        latest_node->gid = cpu_to_je32(0);
+        latest_node->uid = cpu_to_je32(0);
          if (f->inocache->state == INO_STATE_READING)
              jffs2_set_inocache_state(c, f->inocache, INO_STATE_PRESENT);
          return 0;
diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 5ef21f4..2a29ba2 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -369,7 +369,7 @@ static int __init init_jffs2_fs(void)
         hope the structs are the right sizes, instead. */
      BUILD_BUG_ON(sizeof(struct jffs2_unknown_node) != 12);
      BUILD_BUG_ON(sizeof(struct jffs2_raw_dirent) != 40);
-    BUILD_BUG_ON(sizeof(struct jffs2_raw_inode) != 68);
+    BUILD_BUG_ON(sizeof(struct jffs2_raw_inode) != 72);
      BUILD_BUG_ON(sizeof(struct jffs2_raw_summary) != 32);

      pr_info("version 2.2."
diff --git a/include/uapi/linux/jffs2.h b/include/uapi/linux/jffs2.h
index a18b719..2d4f04f 100644
--- a/include/uapi/linux/jffs2.h
+++ b/include/uapi/linux/jffs2.h
@@ -146,8 +146,8 @@ struct jffs2_raw_inode
      jint32_t ino;        /* Inode number.  */
      jint32_t version;    /* Version number.  */
      jmode_t mode;       /* The file's type or mode.  */
-    jint16_t uid;        /* The file's owner.  */
-    jint16_t gid;        /* The file's group.  */
+    jint32_t uid;        /* The file's owner.  */
+    jint32_t gid;        /* The file's group.  */
      jint32_t isize;      /* Total resultant size of this inode (used 
for truncations)  */
      jint32_t atime;      /* Last access time.  */
      jint32_t mtime;      /* Last modification time.  */
-- 
1.9.1
