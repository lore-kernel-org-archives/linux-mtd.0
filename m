Received: from mail-wg0-x22b.google.com ([2a00:1450:400c:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAyXb-00014k-NZ
 for linux-mtd@lists.infradead.org; Tue, 13 Jan 2015 10:17:41 +0000
Received: by mail-wg0-f43.google.com with SMTP id k14so1977516wgh.2
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jan 2015 02:17:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAF3KAoS=Hv25eUrHg2a5gRqMAhZZnZ8jgEY59U9hNk2vmioP1g@mail.gmail.com>
References: <CAF3KAoS=Hv25eUrHg2a5gRqMAhZZnZ8jgEY59U9hNk2vmioP1g@mail.gmail.com>
From: Bruno Vernay <brunovern.a@gmail.com>
Date: Tue, 13 Jan 2015 11:16:55 +0100
Message-ID: <CAF3KAoQyjkemBhAhQeuzZP402xs3-Ci_LWy=6FuEGXVB_wW65Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: mtd-utils: Support Capabilities (extended attributes)
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 10, 2014 at 10:45 AM, Bruno Vernay <brunovern.a@gmail.com> wrote:
>
> [PATCH]  mtd: mtd-utils: Support Capabilities (extended attributes)
>
> Write the files capabilities into the target image.
> Capabilities are a kind of security extended attributes (similar to SELinux)
> The extended attributes are writen in an additional inode.
> Note that we don't use the "capability" functions, but the raw
> Extended Attributes http://www.linuxhowtos.org/manpages/2/getxattr.htm
> Inspired from: http://patchwork.ozlabs.org/patch/321572/
> About Capabilities: http://www.friedhoff.org/posixfilecaps.html
>
> [From: Bruno VERNAY <brunovern.a@gmail.com>]

Patch inlined instead of being joined as attachment.


>From ead64714066a08a9a2f6bdee078a72d8503c4570 Mon Sep 17 00:00:00 2001
From: Bruno Vernay <Bruno.Vernay@Schneider-Electric.com>
Date: Wed, 10 Dec 2014 10:25:48 +0100
Subject: [PATCH] Support Capabilities

---
 Makefile                |   2 +-
 mkfs.ubifs/key.h        |  18 +++++
 mkfs.ubifs/mkfs.ubifs.c | 185 +++++++++++++++++++++++++++++++++++++++++++++++-
 mkfs.ubifs/ubifs.h      |   9 +++
 4 files changed, 211 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 0b57a3f..20a0dde 100644
--- a/Makefile
+++ b/Makefile
@@ -104,7 +104,7 @@ $(call _mkdep,lib/,libmtd.a)
 obj-mkfs.ubifs = crc16.o lpt.o compr.o devtable.o \
  hashtable/hashtable.o hashtable/hashtable_itr.o
 LDFLAGS_mkfs.ubifs = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
-LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid
+LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid -lcap
 $(call mkdep,mkfs.ubifs/,mkfs.ubifs,,ubi-utils/libubi.a)

 #
diff --git a/mkfs.ubifs/key.h b/mkfs.ubifs/key.h
index d3a02d4..8d9112c 100644
--- a/mkfs.ubifs/key.h
+++ b/mkfs.ubifs/key.h
@@ -119,6 +119,24 @@ static inline void dent_key_init(const struct
ubifs_info *c,
 }

 /**
+ * xent_key_init - initialize extended attribute entry key.
+ * @c: UBIFS file-system description object
+ * @key: key to initialize
+ * @inum: host inode number
+ * @nm: extended attribute entry name and length
+ */
+static inline void xent_key_init(const struct ubifs_info *c,
+             union ubifs_key *key, ino_t inum,
+             const struct qstr *nm)
+{
+   uint32_t hash = c->key_hash(nm->name, nm->len);
+
+   ubifs_assert(!(hash & ~UBIFS_S_KEY_HASH_MASK));
+   key->u32[0] = inum;
+   key->u32[1] = hash | (UBIFS_XENT_KEY << UBIFS_S_KEY_HASH_BITS);
+}
+
+/**
  * data_key_init - initialize data key.
  * @c: UBIFS file-system description object
  * @key: key to initialize
diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index ca17e2b..abde979 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -25,6 +25,9 @@
 #include "mkfs.ubifs.h"
 #include <crc32.h>
 #include "common.h"
+#include <sys/capability.h>
+#include <sys/types.h>
+#include <sys/xattr.h>

 /* Size (prime number) of hash table for link counting */
 #define HASH_TABLE_SIZE 10099
@@ -1054,6 +1057,163 @@ static int add_inode_with_data(struct stat
*st, ino_t inum, void *data,
 }

 /**
+ * add_inode_with_xattr - write an inode with xattr support.  much like the
+ *    with_data function above but creates 3 nodes: The inode for the file/
+ *    directory with xattr size set, the xent node with the same inum as the
+ *    previous inode and finally the inode with the actual capability data and
+ *    a new unique inum value.
+ * @st: stat information of source inode
+ * @inum: target inode number
+ * @data: inode data (for special inodes e.g. symlink path etc)
+ * @data_len: inode data length
+ * @flags: source inode flags
+ */
+static int add_inode_with_xattr(struct stat *st, ino_t inum, void *data,
+                               unsigned int data_len, int flags)
+{
+        struct ubifs_ino_node *ino = node_buf;
+        struct ubifs_dent_node *xent = node_buf;
+        union ubifs_key key, xkey, nkey;
+        int len, use_flags = 0, ret;
+        char *name;
+        struct qstr nm;
+
+        if (c->default_compr != UBIFS_COMPR_NONE)
+                use_flags |= UBIFS_COMPR_FL;
+        if (flags & FS_COMPR_FL)
+                use_flags |= UBIFS_COMPR_FL;
+        if (flags & FS_SYNC_FL)
+                use_flags |= UBIFS_SYNC_FL;
+        if (flags & FS_IMMUTABLE_FL)
+                use_flags |= UBIFS_IMMUTABLE_FL;
+        if (flags & FS_APPEND_FL)
+                use_flags |= UBIFS_APPEND_FL;
+        if (flags & FS_DIRSYNC_FL && S_ISDIR(st->st_mode))
+                use_flags |= UBIFS_DIRSYNC_FL;
+
+        // file inode
+        memset(ino, 0, UBIFS_INO_NODE_SZ);
+
+        ino_key_init(&key, inum);
+        ino->ch.node_type = UBIFS_INO_NODE;
+        key_write(&key, &ino->key);
+        ino->creat_sqnum = cpu_to_le64(creat_sqnum);
+        ino->size       = cpu_to_le64(st->st_size);
+        ino->nlink      = cpu_to_le32(st->st_nlink);
+        /*
+         * The time fields are updated assuming the default time granularity
+         * of 1 second. To support finer granularities, utime() would
be needed.
+         */
+        ino->atime_sec  = cpu_to_le64(st->st_atime);
+        ino->ctime_sec  = cpu_to_le64(st->st_ctime);
+        ino->mtime_sec  = cpu_to_le64(st->st_mtime);
+        ino->atime_nsec = 0;
+        ino->ctime_nsec = 0;
+        ino->mtime_nsec = 0;
+        ino->uid        = cpu_to_le32(st->st_uid);
+        ino->gid        = cpu_to_le32(st->st_gid);
+        ino->mode       = cpu_to_le32(st->st_mode);
+        ino->flags      = cpu_to_le32(use_flags);
+        ino->data_len   = 0;
+        ino->compr_type = cpu_to_le16(c->default_compr);
+
+        name = strdup(XATTR_NAME_CAPS);
+        if ( name == NULL ) printf("alloc failed\n");
+        nm.name = (void *)name;
+        nm.len = strlen(name);
+
+        ino->xattr_cnt = 1;
+        ino->xattr_size += CALC_DENT_SIZE(strlen(name));
+        ino->xattr_size += CALC_XATTR_BYTES(data_len);
+        ino->xattr_names += strlen(name);
+
+        len = UBIFS_INO_NODE_SZ;
+
+        ret = add_node(&key, name, ino, len) ;
+        if (ret) {
+                printf("host inode add failed\n");
+                return ret;
+        }
+
+        /* do xattr node */
+        memset(xent, 0, UBIFS_XENT_NODE_SZ);
+
+        xent_key_init(c, &xkey, inum, &nm);
+        xent->ch.node_type = UBIFS_XENT_NODE;
+        key_write(&xkey, &xent->key);
+
+        len = UBIFS_XENT_NODE_SZ + strlen(name) + 1;
+
+        xent->ch.len       = len;
+        xent->padding1 = 0;
+        xent->type = UBIFS_ITYPE_DIR;
+        xent->nlen = cpu_to_le16(strlen(name));
+
+        memcpy(xent->name, name, strlen(name) + 1);
+
+        /* unique inum for inode with xattr */
+        inum = ++c->highest_inum;
+        creat_sqnum = ++c->max_sqnum;
+
+        xent->inum = cpu_to_le64(inum);
+
+        ret = add_node(&xkey, name, xent, len);
+        if (ret) {
+                printf("xent inode add failed\n");
+                return ret;
+        }
+
+    /* add inode with xattr data */
+        memset(ino, 0, UBIFS_INO_NODE_SZ);
+
+        ino_key_init(&nkey, inum);
+        ino->ch.node_type = UBIFS_INO_NODE;
+        key_write(&nkey, &ino->key);
+        ino->creat_sqnum = cpu_to_le64(creat_sqnum);
+        ino->size       = cpu_to_le64(data_len);
+        /*
+         * The time fields are updated assuming the default time granularity
+         * of 1 second. To support finer granularities, utime() would
be needed.
+         */
+        ino->atime_sec  = cpu_to_le64(st->st_atime);
+        ino->ctime_sec  = cpu_to_le64(st->st_ctime);
+        ino->mtime_sec  = cpu_to_le64(st->st_mtime);
+        ino->atime_nsec = 0;
+        ino->ctime_nsec = 0;
+        ino->mtime_nsec = 0;
+        ino->uid        = cpu_to_le32(st->st_uid);
+        ino->gid        = cpu_to_le32(st->st_gid);
+        ino->mode       = cpu_to_le32((st->st_mode & (~S_IFDIR)) | (S_IFREG));
+        ino->flags      = cpu_to_le32(UBIFS_XATTR_FL);
+        ino->data_len   = cpu_to_le32(data_len);
+        ino->compr_type = cpu_to_le16(c->default_compr);
+
+        name = strdup(XATTR_NAME_CAPS);
+        if ( name == NULL ) printf("alloc failed\n");
+        nm.name = (void *)name;
+        nm.len = strlen(name);
+
+        ino->xattr_cnt = 1;
+        ino->xattr_size += CALC_DENT_SIZE(strlen(name));
+        ino->xattr_size += CALC_XATTR_BYTES(data_len);
+        ino->xattr_names += strlen(name);
+
+        if (data_len)
+                memcpy(&ino->data, data, data_len);
+
+        len = UBIFS_INO_NODE_SZ + data_len;
+
+        ret = add_node(&nkey, name, ino, len) ;
+        if (ret) {
+                printf("new inode add failed\n");
+                return ret;
+        }
+
+        return ret;
+}
+
+
+/**
  * add_inode - write an inode.
  * @st: stat information of source inode
  * @inum: target inode number
@@ -1234,17 +1394,36 @@ static int add_file(const char *path_name,
struct stat *st, ino_t inum,
     int flags)
 {
  struct ubifs_data_node *dn = node_buf;
- void *buf = block_buf;
+ void *buf = block_buf, *caps;
  loff_t file_size = 0;
- ssize_t ret, bytes_read;
+ ssize_t ret, bytes_read, xattr_len;
  union ubifs_key key;
  int fd, dn_len, err, compr_type, use_compr;
  unsigned int block_no = 0;
  size_t out_len;
+ char *cap_res, *cap_res_ptr, *cap_buf;

  fd = open(path_name, O_RDONLY | O_LARGEFILE);
  if (fd == -1)
  return sys_err_msg("failed to open file '%s'", path_name);
+ xattr_len = fgetxattr(fd, XATTR_NAME_CAPS, NULL, 0);
+ if (xattr_len > 0) {
+ caps = malloc(xattr_len);
+ xattr_len = fgetxattr(fd, XATTR_NAME_CAPS, caps, xattr_len);
+ if (debug_level >= 2) {
+ cap_buf = (char *)caps;
+                cap_res = (char*) malloc(3*xattr_len);
+                cap_res_ptr = cap_res;
+                int i;
+                for (i=0 ; i < xattr_len ; i++) {
+                        cap_res_ptr += sprintf(cap_res_ptr, "%02X:",
cap_buf[i]);
+                };
+                 sprintf(cap_res_ptr-1, "\n");
+                *(cap_res_ptr) = '\0';
+                printf("\n\t%s\tCapability: %s\n", path_name, cap_res);
+ free(cap_res);
+ }
+ };
  do {
  /* Read next block */
  bytes_read = 0;
@@ -1295,6 +1474,8 @@ static int add_file(const char *path_name,
struct stat *st, ino_t inum,
  if (file_size != st->st_size)
  return err_msg("file size changed during writing file '%s'",
        path_name);
+        if (xattr_len > 0)
+                return add_inode_with_xattr(st, inum, caps, xattr_len, flags);
  return add_inode(st, inum, flags);
 }

diff --git a/mkfs.ubifs/ubifs.h b/mkfs.ubifs/ubifs.h
index 434b651..2f080a8 100644
--- a/mkfs.ubifs/ubifs.h
+++ b/mkfs.ubifs/ubifs.h
@@ -42,6 +42,15 @@
  */
 #define UBIFS_TRUN_KEY UBIFS_KEY_TYPES_CNT

+/*
+ * How much a directory entry/extended attribute entry adds to the parent/host
+ * inode.
+ */
+#define CALC_DENT_SIZE(name_len) ALIGN(UBIFS_DENT_NODE_SZ + (name_len) + 1, 8)
+
+/* How much an extended attribute adds to the host inode */
+#define CALC_XATTR_BYTES(data_len) ALIGN(UBIFS_INO_NODE_SZ + (data_len) + 1, 8)
+
 /* The below union makes it easier to deal with keys */
 union ubifs_key
 {
-- 
1.9.1



-- 
Bruno VERNAY
