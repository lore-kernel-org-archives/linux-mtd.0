Received: from hermes.assurtech.com ([66.238.208.67] helo=Mail.Assurtech.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFo44-00064j-3z
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2014 17:02:38 +0000
Received: from Orosz by assurtech.com (MDaemon PRO v13.6.2)
 with ESMTP id md50008446229.msg for <linux-mtd@lists.infradead.org>;
 Tue, 18 Feb 2014 12:01:36 -0500
From: "John Orosz" <orosz@assurtech.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd-utils: SELinux context support for mkfs.ubifs
Date: Tue, 18 Feb 2014 12:02:09 -0500
Message-ID: <004501cf2ccb$28c5f940$7a51ebc0$@assurtech.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I don't expect this patch to be accepted given the requirement for SELinux
on the build machine.  That said, the reasons for submitting this patch are:
1. The next person that is interested in adding SELinux context support to
UBIFS images (mkfs.ubifs) will have a reference implementation.  

2. I'd like to get feedback about any shortcomings of this implementation.
This is really just a best effort hack at something that appears to never
have been tried (or at least shared).

--

This patch enables SELinux context to be added to a UBIFS image with
mkfs.ubifs.  The patch was based off the following commit in mtd-utils
master branch:

commit dcea43eba91642939c82739387147da26d572758
Author: Aaron Sierra <asierra@xes-inc.com>
Date:   Fri Sep 27 11:34:04 2013 -0500

The approach attempts to mirror that of Stephen Smalley with YAFFS2 in the
AOSP circa January 2012.  The context file is supplied/enabled by an
optional command line argument.  The following is a brief description of the
files changed:

Makefile: link to libselinux
mkfs.ubifs/key.h: added xent_key_init() from linux kernel
mkfs.ubifs/ubifs.h: added size macros from linux kernel
mkfs.ubifs/mkfs.ubifs.c: added SELinux context file support, mirrored 
   add_inode_with_data() in add_inode_with_xattr() to add XENT node and
xattr 
   inode.
   
This code has been tested on a Freescale p2040 processor (powerpc), linux
kernel 3.8.13+ with a 1GB Micron MT29F8G NAND flash chip.

Signed-off-by: John Orosz <orosz@assurtech.com>

diff --git a/Makefile b/Makefile
index 4ff8a49..d632cb2 100644
--- a/Makefile
+++ b/Makefile
@@ -105,7 +105,7 @@ $(call _mkdep,lib/,libmtd.a)
 obj-mkfs.ubifs = crc16.o lpt.o compr.o devtable.o \
 	hashtable/hashtable.o hashtable/hashtable_itr.o
 LDFLAGS_mkfs.ubifs = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
-LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid
+LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid -lselinux
 $(call mkdep,mkfs.ubifs/,mkfs.ubifs,,ubi-utils/libubi.a)
 
 #
diff --git a/mkfs.ubifs/key.h b/mkfs.ubifs/key.h
index d3a02d4..07037ac 100644
--- a/mkfs.ubifs/key.h
+++ b/mkfs.ubifs/key.h
@@ -119,6 +119,25 @@ static inline void dent_key_init(const struct
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
+
+/**
  * data_key_init - initialize data key.
  * @c: UBIFS file-system description object
  * @key: key to initialize
diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index f9977bc..8a312ea 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -37,6 +37,14 @@
 /* Default time granularity in nanoseconds */
 #define DEFAULT_TIME_GRAN 1000000000
 
+#define XATTR_NAME_SELINUX "security.selinux"
+#include <selinux/selinux.h>
+#include <selinux/label.h>
+
+static struct selabel_handle *sehnd;
+static unsigned int seprefixlen;
+static char *secontext = NULL;
+
 /**
  * struct idx_entry - index entry.
  * @next: next index entry (NULL at end of list)
@@ -113,6 +121,10 @@ static int out_fd;
 static int out_ubi;
 static int squash_owner;
 
+static char *context;
+static int context_len;
+static struct stat context_st;
+
 /* The 'head' (position) which nodes are written */
 static int head_lnum;
 static int head_offs;
@@ -134,7 +146,7 @@ static struct inum_mapping **hash_table;
 /* Inode creation sequence number */
 static unsigned long long creat_sqnum;
 
-static const char *optstring =
"d:r:m:o:D:yh?vVe:c:g:f:Fp:k:x:X:j:R:l:j:UQq";
+static const char *optstring =
"d:r:m:o:D:yh?vVe:c:g:f:Fp:k:x:X:j:R:l:j:UQqs:";
 
 static const struct option longopts[] = {
 	{"root",               1, NULL, 'r'},
@@ -158,6 +170,7 @@ static const struct option longopts[] = {
 	{"log-lebs",           1, NULL, 'l'},
 	{"orph-lebs",          1, NULL, 'p'},
 	{"squash-uids" ,       0, NULL, 'U'},
+	{"selinux",            1, NULL, 's'},
 	{NULL, 0, NULL, 0}
 };
 
@@ -198,6 +211,7 @@ static const char *helptext =
 "-V, --version            display version information\n"
 "-g, --debug=LEVEL        display debug information (0 - none, 1 -
statistics,\n"
 "                         2 - files, 3 - more details)\n"
+"-s, --selinux=FILE       SELinux context file\n"
 "-h, --help               display this help text\n\n"
 "Note, SIZE is specified in bytes, but it may also be specified in
Kilobytes,\n"
 "Megabytes, and Gigabytes if a KiB, MiB, or GiB suffix is used.\n\n"
@@ -623,6 +637,19 @@ static int get_options(int argc, char**argv)
 		case 'U':
 			squash_owner = 1;
 			break;
+		case 's':
+			context_len = strlen(optarg);
+			context = malloc(context_len + 1);
+			if (!context)
+				return err_msg("cannot allocate memory");
+
+			memcpy(context, optarg, context_len);
+
+			/* Make sure the root directory exists */
+			if (stat(context, &context_st))
+				return sys_err_msg("bad file context '%s'",
+						   context);
+			break;
 		}
 	}
 
@@ -630,7 +657,7 @@ static int get_options(int argc, char**argv)
 		output = xstrdup(argv[optind]);
 
 	if (!output)
-		return err_msg("not output device or file specified");
+		return err_msg("no output device or file specified");
 
 	out_ubi = !open_ubi(output);
 
@@ -1053,6 +1080,165 @@ static int add_inode_with_data(struct stat *st,
ino_t inum, void *data,
 	return add_node(&key, NULL, ino, len);
 }
 
+static int add_dent_node(ino_t dir_inum, const char *name, ino_t inum,
+			 unsigned char type);
+
+/**
+ * add_inode_with_xattr - write an inode with xattr support.  much like the
+ *    with_data function above but creates 3 nodes: The inode for the file/
+ *    directory with xattr size set, the xent node with the same inum as
the
+ *    previous inode and finally the inode with the actual context data and
+ *    a new unique inum value.
+ * @st: stat information of source inode
+ * @inum: target inode number
+ * @data: inode data (for special inodes e.g. symlink path etc)
+ * @data_len: inode data length
+ * @flags: source inode flags
+ */
+static int add_inode_with_xattr(struct stat *st, ino_t inum, void *data,
+			       unsigned int data_len, int flags)
+{
+	struct ubifs_ino_node *ino = node_buf;
+	struct ubifs_dent_node *xent = node_buf;
+	union ubifs_key key, xkey, nkey;
+	int len, use_flags = 0, ret;
+	char *name;
+	struct qstr nm;
+
+	if (c->default_compr != UBIFS_COMPR_NONE)
+		use_flags |= UBIFS_COMPR_FL;
+	if (flags & FS_COMPR_FL)
+		use_flags |= UBIFS_COMPR_FL;
+	if (flags & FS_SYNC_FL)
+		use_flags |= UBIFS_SYNC_FL;
+	if (flags & FS_IMMUTABLE_FL)
+		use_flags |= UBIFS_IMMUTABLE_FL;
+	if (flags & FS_APPEND_FL)
+		use_flags |= UBIFS_APPEND_FL;
+	if (flags & FS_DIRSYNC_FL && S_ISDIR(st->st_mode))
+		use_flags |= UBIFS_DIRSYNC_FL;
+   
+	// file inode
+	memset(ino, 0, UBIFS_INO_NODE_SZ);
+
+	ino_key_init(&key, inum);
+	ino->ch.node_type = UBIFS_INO_NODE;
+	key_write(&key, &ino->key);
+	ino->creat_sqnum = cpu_to_le64(creat_sqnum);
+	ino->size       = cpu_to_le64(st->st_size);
+	ino->nlink      = cpu_to_le32(st->st_nlink);
+	/*
+	 * The time fields are updated assuming the default time granularity
+	 * of 1 second. To support finer granularities, utime() would be
needed.
+	 */
+	ino->atime_sec  = cpu_to_le64(st->st_atime);
+	ino->ctime_sec  = cpu_to_le64(st->st_ctime);
+	ino->mtime_sec  = cpu_to_le64(st->st_mtime);
+	ino->atime_nsec = 0;
+	ino->ctime_nsec = 0;
+	ino->mtime_nsec = 0;
+	ino->uid        = cpu_to_le32(st->st_uid);
+	ino->gid        = cpu_to_le32(st->st_gid);
+	ino->mode       = cpu_to_le32(st->st_mode);
+	ino->flags      = cpu_to_le32(use_flags);
+	ino->data_len   = 0;
+	ino->compr_type = cpu_to_le16(c->default_compr);
+ 
+	name = strdup(XATTR_NAME_SELINUX);
+	if ( name == NULL ) printf("alloc failed\n");
+	nm.name = (void *)name;
+	nm.len = strlen(name);
+
+	ino->xattr_cnt = 1;
+	ino->xattr_size += CALC_DENT_SIZE(strlen(name));
+	ino->xattr_size += CALC_XATTR_BYTES(data_len);
+	ino->xattr_names += strlen(name);
+
+	len = UBIFS_INO_NODE_SZ;
+ 
+	ret = add_node(&key, name, ino, len) ;
+	if (ret) {
+		printf("host inode add failed\n");
+		return ret;
+	}
+
+	/* do xattr node */
+	memset(xent, 0, UBIFS_XENT_NODE_SZ);
+
+	xent_key_init(c, &xkey, inum, &nm);
+	xent->ch.node_type = UBIFS_XENT_NODE;
+	key_write(&xkey, &xent->key);
+	
+	len = UBIFS_XENT_NODE_SZ + strlen(name) + 1;
+   
+	xent->ch.len       = len;
+	xent->padding1 = 0;
+	xent->type = UBIFS_ITYPE_DIR;
+	xent->nlen = cpu_to_le16(strlen(name));
+ 
+	memcpy(xent->name, name, strlen(name) + 1);
+ 
+	/* unique inum for inode with xattr */
+	inum = ++c->highest_inum;
+	creat_sqnum = ++c->max_sqnum;
+	
+	xent->inum = cpu_to_le64(inum);
+ 
+	ret = add_node(&xkey, name, xent, len);
+	if (ret) {
+		printf("xent inode add failed\n");
+		return ret;
+	}
+
+    /* add inode with xattr data */
+	memset(ino, 0, UBIFS_INO_NODE_SZ);
+
+	ino_key_init(&nkey, inum);
+	ino->ch.node_type = UBIFS_INO_NODE;
+	key_write(&nkey, &ino->key);
+	ino->creat_sqnum = cpu_to_le64(creat_sqnum);
+	ino->size       = cpu_to_le64(data_len);
+	/*
+	 * The time fields are updated assuming the default time granularity
+	 * of 1 second. To support finer granularities, utime() would be
needed.
+	 */
+	ino->atime_sec  = cpu_to_le64(st->st_atime);
+	ino->ctime_sec  = cpu_to_le64(st->st_ctime);
+	ino->mtime_sec  = cpu_to_le64(st->st_mtime);
+	ino->atime_nsec = 0;
+	ino->ctime_nsec = 0;
+	ino->mtime_nsec = 0;
+	ino->uid        = cpu_to_le32(st->st_uid);
+	ino->gid        = cpu_to_le32(st->st_gid);
+	ino->mode       = cpu_to_le32((st->st_mode & (~S_IFDIR)) |
(S_IFREG));
+	ino->flags      = cpu_to_le32(UBIFS_XATTR_FL);
+	ino->data_len   = cpu_to_le32(data_len);
+	ino->compr_type = cpu_to_le16(c->default_compr);
+ 
+	name = strdup(XATTR_NAME_SELINUX);
+	if ( name == NULL ) printf("alloc failed\n");
+	nm.name = (void *)name;
+	nm.len = strlen(name);
+
+	ino->xattr_cnt = 1;
+	ino->xattr_size += CALC_DENT_SIZE(strlen(name));
+	ino->xattr_size += CALC_XATTR_BYTES(data_len);
+	ino->xattr_names += strlen(name);
+
+	if (data_len)
+		memcpy(&ino->data, data, data_len);
+	
+	len = UBIFS_INO_NODE_SZ + data_len;
+
+	ret = add_node(&nkey, name, ino, len) ;
+	if (ret) {
+		printf("new inode add failed\n");
+		return ret;
+	}
+
+	return ret;
+}
+
 /**
  * add_inode - write an inode.
  * @st: stat information of source inode
@@ -1078,9 +1264,9 @@ static int add_inode(struct stat *st, ino_t inum, int
flags)
  * the device table.
  */
 static int add_dir_inode(DIR *dir, ino_t inum, loff_t size, unsigned int
nlink,
-			 struct stat *st)
+			 struct stat *st, const char *path_name)
 {
-	int fd, flags = 0;
+	int fd, flags = 0, con_size;
 
 	st->st_size = size;
 	st->st_nlink = nlink;
@@ -1093,7 +1279,37 @@ static int add_dir_inode(DIR *dir, ino_t inum, loff_t
size, unsigned int nlink,
 			flags = 0;
 	}
 
-	return add_inode(st, inum, flags);
+   // special case for root inode, no xattr
+   if( inum == UBIFS_ROOT_INO)
+	   return add_inode(st, inum, flags);
+   
+   if ( context ) {
+      char *sepath = NULL;
+      if (path_name[0] == '/')
+              sepath = strdup(&path_name[strlen(root)]);
+      else if (asprintf(&sepath, "/%s", &path_name[strlen(root)]) < 0)
+                                       sepath = NULL;
+
+      if (!sepath) {
+         return sys_err_msg("malloc");
+      }
+
+      if (selabel_lookup(sehnd, &secontext,
+               sepath,
+               st->st_mode) < 0) {
+
+         /* failed to lookup context, assume undefined */
+         secontext = strdup("system_u:object_r:undefined_t");
+         printf("missing context: %s\t%s\t%d\n", secontext, sepath,
st->st_mode);
+      }
+      free(sepath);
+
+      con_size = strlen(secontext)+1;
+   } else {
+      secontext = NULL;
+      con_size = 0;
+   }
+	return add_inode_with_xattr(st, inum, secontext, con_size, flags);
 }
 
 /**
@@ -1238,7 +1454,7 @@ static int add_file(const char *path_name, struct stat
*st, ino_t inum,
 	loff_t file_size = 0;
 	ssize_t ret, bytes_read;
 	union ubifs_key key;
-	int fd, dn_len, err, compr_type, use_compr;
+	int fd, dn_len, err, compr_type, use_compr, con_size;
 	unsigned int block_no = 0;
 	size_t out_len;
 
@@ -1295,7 +1511,34 @@ static int add_file(const char *path_name, struct
stat *st, ino_t inum,
 	if (file_size != st->st_size)
 		return err_msg("file size changed during writing file '%s'",
 			       path_name);
-	return add_inode(st, inum, flags);
+
+   if ( context ) {
+      char *sepath = NULL;
+      if (path_name[0] == '/')
+              sepath = strdup(&path_name[strlen(root)]);
+      else if (asprintf(&sepath, "/%s", &path_name[strlen(root)]) < 0)
+                                       sepath = NULL;
+
+      if (!sepath) {
+         return sys_err_msg("malloc");
+      }
+
+      if (selabel_lookup(sehnd, &secontext,
+               sepath,
+               st->st_mode) < 0) {
+
+         /* failed to lookup context, assume undefined */
+         secontext = strdup("system_u:object_r:undefined_t");
+         printf("missing context: %s\t%s\t%d\n", secontext, sepath,
st->st_mode);
+      }
+      free(sepath);
+
+      con_size = strlen(secontext)+1;
+   } else {
+      secontext = NULL;
+      con_size = 0;
+   }
+	return add_inode_with_xattr(st, inum, secontext, con_size, flags);
 }
 
 /**
@@ -1307,7 +1550,7 @@ static int add_file(const char *path_name, struct stat
*st, ino_t inum,
  * @st: struct stat object containing inode attributes which should be use
when
  *      creating the UBIFS inode
  */
-static int add_non_dir(const char *path_name, ino_t *inum, unsigned int
nlink,
+static int add_non_dir(const char *path_name, ino_t inum, unsigned int
nlink,
 		       unsigned char *type, struct stat *st)
 {
 	int fd, flags = 0;
@@ -1353,7 +1596,7 @@ static int add_non_dir(const char *path_name, ino_t
*inum, unsigned int nlink,
 			return err_msg("out of memory");
 		if (im->use_nlink == 0) {
 			/* New entry */
-			im->use_inum = *inum;
+			im->use_inum = inum;
 			im->use_nlink = 1;
 			im->path_name = malloc(strlen(path_name) + 1);
 			if (!im->path_name)
@@ -1361,10 +1604,8 @@ static int add_non_dir(const char *path_name, ino_t
*inum, unsigned int nlink,
 			strcpy(im->path_name, path_name);
 		} else {
 			/* Existing entry */
-			*inum = im->use_inum;
+			inum = im->use_inum;
 			im->use_nlink += 1;
-			/* Return unused inode number */
-			c->highest_inum -= 1;
 		}
 
 		memcpy(&im->st, st, sizeof(struct stat));
@@ -1375,17 +1616,17 @@ static int add_non_dir(const char *path_name, ino_t
*inum, unsigned int nlink,
 	creat_sqnum = ++c->max_sqnum;
 
 	if (S_ISREG(st->st_mode))
-		return add_file(path_name, st, *inum, flags);
+		return add_file(path_name, st, inum, flags);
 	if (S_ISCHR(st->st_mode))
-		return add_dev_inode(st, *inum, flags);
+		return add_dev_inode(st, inum, flags);
 	if (S_ISBLK(st->st_mode))
-		return add_dev_inode(st, *inum, flags);
+		return add_dev_inode(st, inum, flags);
 	if (S_ISLNK(st->st_mode))
-		return add_symlink_inode(path_name, st, *inum, flags);
+		return add_symlink_inode(path_name, st, inum, flags);
 	if (S_ISSOCK(st->st_mode))
-		return add_inode(st, *inum, flags);
+		return add_inode(st, inum, flags);
 	if (S_ISFIFO(st->st_mode))
-		return add_inode(st, *inum, flags);
+		return add_inode(st, inum, flags);
 
 	return err_msg("file '%s' has unknown inode type", path_name);
 }
@@ -1498,7 +1739,7 @@ static int add_directory(const char *dir_name, ino_t
dir_inum, struct stat *st,
 			nlink += 1;
 			type = UBIFS_ITYPE_DIR;
 		} else {
-			err = add_non_dir(name, &inum, 0, &type, &dent_st);
+			err = add_non_dir(name, inum, 0, &type, &dent_st);
 			if (err)
 				goto out_free;
 		}
@@ -1550,7 +1791,7 @@ static int add_directory(const char *dir_name, ino_t
dir_inum, struct stat *st,
 			nlink += 1;
 			type = UBIFS_ITYPE_DIR;
 		} else {
-			err = add_non_dir(name, &inum, 0, &type, &fake_st);
+			err = add_non_dir(name, inum, 0, &type, &fake_st);
 			if (err)
 				goto out_free;
 		}
@@ -1565,7 +1806,7 @@ static int add_directory(const char *dir_name, ino_t
dir_inum, struct stat *st,
 
 	creat_sqnum = dir_creat_sqnum;
 
-	err = add_dir_inode(dir, dir_inum, size, nlink, st);
+	err = add_dir_inode(dir, dir_inum, size, nlink, st, dir_name);
 	if (err)
 		goto out_free;
 
@@ -1595,7 +1836,7 @@ static int add_multi_linked_files(void)
 
 		for (im = hash_table[i]; im; im = im->next) {
 			dbg_msg(2, "%s", im->path_name);
-			err = add_non_dir(im->path_name, &im->use_inum,
+			err = add_non_dir(im->path_name, im->use_inum,
 					  im->use_nlink, &type, &im->st);
 			if (err)
 				return err;
@@ -2204,6 +2445,21 @@ static int init(void)
 	if (err)
 		return err;
 
+   if( context ) {
+      seprefixlen = strlen(root);
+      struct selinux_opt seopts[] = {
+         { SELABEL_OPT_PATH, context }
+      };
+
+      sehnd = selabel_open(SELABEL_CTX_FILE, seopts, 1);
+
+      if (!sehnd)
+      {
+         return err_msg("could not open context");
+      }
+
+   }
+
 	return 0;
 }
 
@@ -2228,6 +2484,9 @@ static void destroy_hash_table(void)
  */
 static void deinit(void)
 {
+   if ( sehnd )
+      selabel_close(sehnd);
+
 	free(c->lpt);
 	free(c->ltab);
 	free(leb_buf);
diff --git a/mkfs.ubifs/ubifs.h b/mkfs.ubifs/ubifs.h
index 434b651..2f080a8 100644
--- a/mkfs.ubifs/ubifs.h
+++ b/mkfs.ubifs/ubifs.h
@@ -42,6 +42,15 @@
  */
 #define UBIFS_TRUN_KEY UBIFS_KEY_TYPES_CNT
 
+/*
+ * How much a directory entry/extended attribute entry adds to the
parent/host
+ * inode.
+ */
+#define CALC_DENT_SIZE(name_len) ALIGN(UBIFS_DENT_NODE_SZ + (name_len) + 1,
8)
+
+/* How much an extended attribute adds to the host inode */
+#define CALC_XATTR_BYTES(data_len) ALIGN(UBIFS_INO_NODE_SZ + (data_len) +
1, 8)
+
 /* The below union makes it easier to deal with keys */
 union ubifs_key
 {
