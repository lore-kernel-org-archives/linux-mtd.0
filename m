Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fQUuc-0007l8-5i
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2018 09:39:31 +0000
From: Ritesh Harjani <riteshh@codeaurora.org>
To: linux-mtd@lists.infradead.org, richard@nod.at,
 david.oberhollenzer@sigma-star.at
Cc: Ritesh Harjani <riteshh@codeaurora.org>
Subject: [RFC PATCH 2/2] mkfs.ubifs: Implement selinux labelling support in
 mkfs.ubifs.
Date: Wed,  6 Jun 2018 15:09:00 +0530
Message-Id: <1528277940-30919-3-git-send-email-riteshh@codeaurora.org>
In-Reply-To: <1528277940-30919-1-git-send-email-riteshh@codeaurora.org>
References: <1528277940-30919-1-git-send-email-riteshh@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This implements/adds selinux labelling support to mkfs.ubifs
utility. It adds an extra option in configure to enable
selinux labelling support and then finally in mkfs.ubifs adds
an extra option to pass the file_contexts which is looked up
for filesystem file labels.

- Default behavior is kept without selinux so as to not break existing
support where selinux library/headers may not be present.

- If this is configured with --with-selinux then XATTR from the
file_contexts(passed with --selinux option while mkfs.ubifs)
will be taken and not from the host file's xattr.
This is done to avoid the problem where the host OS may have
selinux enabled and hence same xattr names will be present in both
host filesystem files and from the --selinux=file passed.
So the existing behavior is kept mutually exclusive and preference
is given to selinux xattrs (if configured with --with-selinux).

Signed-off-by: Ritesh Harjani <riteshh@codeaurora.org>
---
 Makefile.am                         |   4 ++
 configure.ac                        |  27 +++++++++
 ubifs-utils/Makemodule.am           |   4 +-
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 117 +++++++++++++++++++++++++++++++++++-
 4 files changed, 149 insertions(+), 3 deletions(-)

diff --git a/Makefile.am b/Makefile.am
index 5a6e77c..391edef 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -10,6 +10,10 @@ if WITHOUT_LZO
 AM_CPPFLAGS += -DWITHOUT_LZO
 endif
 
+if WITH_SELINUX
+AM_CPPFLAGS += -DWITH_SELINUX
+endif
+
 sbin_PROGRAMS =
 sbin_SCRIPTS =
 check_PROGRAMS =
diff --git a/configure.ac b/configure.ac
index 1ac45c7..2b1668f 100644
--- a/configure.ac
+++ b/configure.ac
@@ -59,6 +59,7 @@ need_zlib="no"
 need_lzo="no"
 need_xattr="no"
 need_cmocka="no"
+need_selinux="no"
 
 
 AM_COND_IF([UNIT_TESTS], [
@@ -144,6 +145,15 @@ AC_ARG_WITH([lzo],
 	*) AC_MSG_ERROR([bad value ${withval} for --without-lzo]) ;;
 	esac])
 
+AC_ARG_WITH([selinux],
+	[AS_HELP_STRING([--with-selinux],
+		[Enable support for selinux extended attributes])],
+	[case "${withval}" in
+	yes) need_selinux="yes";;
+	no) ;;
+	*) AC_MSG_ERROR([bad value ${withval} for --with-selinux]) ;;
+	esac])
+
 ##### search for dependencies #####
 
 clock_gettime_missing="no"
@@ -153,11 +163,16 @@ zlib_missing="no"
 lzo_missing="no"
 xattr_missing="no"
 cmocka_missing="no"
+selinux_missing="no"
 
 if test "x$need_zlib" = "xyes"; then
 	PKG_CHECK_MODULES(ZLIB, [zlib], [], [zlib_missing="yes"])
 fi
 
+if test "x$need_selinux" = "xyes"; then
+	PKG_CHECK_MODULES(LIBSELINUX, [libselinux], [], [selinux_missing="yes"])
+fi
+
 if test "x$need_uuid" = "xyes"; then
 	PKG_CHECK_MODULES(UUID, [uuid], [], [uuid_missing="yes"])
 fi
@@ -186,6 +201,11 @@ if test "x$need_xattr" = "xyes"; then
 	AC_CHECK_HEADERS([sys/acl.h], [], [xattr_missing="yes"])
 fi
 
+if test "x$need_selinux" = "xyes"; then
+	AC_CHECK_HEADERS([selinux/selinux.h], [], [selinux_missing="yes"])
+	AC_CHECK_HEADERS([selinux/label.h], [], [selinux_missing="yes"])
+fi
+
 if test "x$need_cmocka" = "xyes"; then
 	PKG_CHECK_MODULES(CMOCKA, [cmocka], [], [cmocka_missing="yes"])
 fi
@@ -235,6 +255,12 @@ if test "x$xattr_missing" = "xyes"; then
 	need_xattr="no"
 fi
 
+if test "x$selinux_missing" = "xyes"; then
+	AC_MSG_WARN([cannot find headers for selinux library])
+	AC_MSG_WARN([disabling SELINUX support])
+	need_selinux="no"
+fi
+
 if test "x$cmocka_missing" = "xyes"; then
 	AC_MSG_WARN([cannot find CMocka library required for unit tests])
 	AC_MSG_NOTICE([unit tests can optionally be disabled])
@@ -249,6 +275,7 @@ fi
 
 AM_CONDITIONAL([WITHOUT_LZO], [test "x$need_lzo" != "xyes"])
 AM_CONDITIONAL([WITHOUT_XATTR], [test "x$need_xattr" != "xyes"])
+AM_CONDITIONAL([WITH_SELINUX], [test "x$need_selinux" == "xyes"])
 
 AC_CHECK_SIZEOF([off_t])
 AC_CHECK_SIZEOF([loff_t])
diff --git a/ubifs-utils/Makemodule.am b/ubifs-utils/Makemodule.am
index 5862afb..879f91a 100644
--- a/ubifs-utils/Makemodule.am
+++ b/ubifs-utils/Makemodule.am
@@ -16,8 +16,8 @@ mkfs_ubifs_SOURCES = \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable.c \
 	ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c \
 	ubifs-utils/mkfs.ubifs/devtable.c
-mkfs_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(UUID_LIBS) -lm
-mkfs_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(UUID_CFLAGS) \
+mkfs_ubifs_LDADD = libmtd.a libubi.a $(ZLIB_LIBS) $(LZO_LIBS) $(UUID_LIBS) $(LIBSELINUX_LIBS) -lm
+mkfs_ubifs_CPPFLAGS = $(AM_CPPFLAGS) $(ZLIB_CFLAGS) $(LZO_CFLAGS) $(UUID_CFLAGS) $(LIBSELINUX_CFLAGS)\
 	-I$(top_srcdir)/ubi-utils/include -I$(top_srcdir)/ubifs-utils/mkfs.ubifs/
 
 UBIFS_BINS = \
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index 2333dde..f0518b9 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -30,6 +30,11 @@
 #include <sys/xattr.h>
 #endif
 
+#ifdef WITH_SELINUX
+#include <selinux/selinux.h>
+#include <selinux/label.h>
+#endif
+
 /* Size (prime number) of hash table for link counting */
 #define HASH_TABLE_SIZE 10099
 
@@ -40,6 +45,13 @@
 /* Default time granularity in nanoseconds */
 #define DEFAULT_TIME_GRAN 1000000000
 
+
+#ifdef WITH_SELINUX
+#define XATTR_NAME_SELINUX "security.selinux"
+static struct selabel_handle *sehnd;
+static char *secontext;
+#endif
+
 /**
  * struct idx_entry - index entry.
  * @next: next index entry (NULL at end of list)
@@ -116,6 +128,9 @@ static int out_fd;
 static int out_ubi;
 static int squash_owner;
 static int do_create_inum_attr;
+static char *context;
+static int context_len;
+static struct stat context_st;
 
 /* The 'head' (position) which nodes are written */
 static int head_lnum;
@@ -163,6 +178,7 @@ static const struct option longopts[] = {
 	{"orph-lebs",          1, NULL, 'p'},
 	{"squash-uids" ,       0, NULL, 'U'},
 	{"set-inode-attr",     0, NULL, 'a'},
+	{"selinux",            1, NULL, 's'},
 	{NULL, 0, NULL, 0}
 };
 
@@ -206,6 +222,7 @@ static const char *helptext =
 "-a, --set-inum-attr      create user.image-inode-number extended attribute on files\n"
 "                         added to the image. The attribute will contain the inode\n"
 "                         number the file has in the generated image.\n"
+"-s, --selinux=FILE       Selinux context file\n"
 "-h, --help               display this help text\n\n"
 "Note, SIZE is specified in bytes, but it may also be specified in Kilobytes,\n"
 "Megabytes, and Gigabytes if a KiB, MiB, or GiB suffix is used.\n\n"
@@ -638,7 +655,18 @@ static int get_options(int argc, char**argv)
 		case 'a':
 			do_create_inum_attr = 1;
 			break;
-
+		case 's':
+			context_len = strlen(optarg);
+			context = (char *) xmalloc(context_len + 1);
+			if (!context)
+				return err_msg("xmalloc failed\n");
+			memcpy(context, optarg, context_len);
+
+			/* Make sure root directory exists */
+			if (stat(context, &context_st))
+				return sys_err_msg("bad file context %s\n",
+								   context);
+			break;
 		}
 	}
 
@@ -725,6 +753,7 @@ static int get_options(int argc, char**argv)
 		printf("\tfanout:       %d\n", c->fanout);
 		printf("\torph_lebs:    %d\n", c->orph_lebs);
 		printf("\tspace_fixup:  %d\n", c->space_fixup);
+		printf("\tselinux file: %s\n", context);
 	}
 
 	if (validate_options())
@@ -1202,6 +1231,70 @@ out_free:
 }
 #endif
 
+#ifdef WITH_SELINUX
+static int inode_add_selinux_xattr(struct ubifs_ino_node *host_ino,
+			   const char *path_name, struct stat *st, ino_t inum)
+{
+	int ret;
+	char *sepath = NULL;
+	char *name;
+	struct qstr nm;
+	unsigned int con_size;
+
+	if (!context || !sehnd) {
+		secontext = NULL;
+		con_size = 0;
+		return 0;
+	}
+
+	if (path_name[strlen(root)] == '/')
+		sepath = strdup(&path_name[strlen(root)]);
+
+	else if (asprintf(&sepath, "/%s", &path_name[strlen(root)]) < 0)
+		sepath = NULL;
+
+	if (!sepath)
+		return sys_err_msg("could not get sepath\n");
+
+	if (selabel_lookup(sehnd, &secontext, sepath, st->st_mode) < 0) {
+		/* Failed to lookup context, assume unlabeled */
+		secontext = strdup("system_u:object_r:unlabeled_t:s0");
+		dbg_msg(2, "missing context: %s\t%s\t%d\n", secontext, sepath,
+				st->st_mode);
+	}
+
+	dbg_msg(2, "appling selinux context on sepath=%s, secontext=%s\n",
+			sepath, secontext);
+	free(sepath);
+	con_size = strlen(secontext) + 1;
+	name = strdup(XATTR_NAME_SELINUX);
+
+	nm.name = name;
+	nm.len = strlen(name);
+	host_ino->xattr_cnt++;
+	host_ino->xattr_size += CALC_DENT_SIZE(nm.len);
+	host_ino->xattr_size += CALC_XATTR_BYTES(con_size);
+	host_ino->xattr_names += nm.len;
+
+	ret = add_xattr(st, inum, secontext, con_size, &nm);
+	if (ret < 0)
+		dbg_msg(2, "add_xattr failed %d\n", ret);
+	return ret;
+}
+
+#else
+static inline int inode_add_selinux_xattr(struct ubifs_ino_node *host_ino,
+			   const char *path_name, struct stat *st, ino_t inum)
+{
+	(void)host_ino;
+	(void)path_name;
+	(void)st;
+	(void)inum;
+
+	return 0;
+}
+#endif
+
 /**
  * add_inode - write an inode.
  * @st: stat information of source inode
@@ -1260,7 +1353,11 @@ static int add_inode(struct stat *st, ino_t inum, void *data,
 	len = UBIFS_INO_NODE_SZ + data_len;
 
 	if (xattr_path) {
+#ifdef WITH_SELINUX
+		ret = inode_add_selinux_xattr(ino, xattr_path, st, inum);
+#else
 		ret = inode_add_xattr(ino, xattr_path, st, inum);
+#endif
 		if (ret < 0)
 			return ret;
 	}
@@ -2415,6 +2512,18 @@ static int init(void)
 	if (err)
 		return err;
 
+#ifdef WITH_SELINUX
+	if (context) {
+		struct selinux_opt seopts[] = {
+			{ SELABEL_OPT_PATH, context }
+		};
+
+		sehnd = selabel_open(SELABEL_CTX_FILE, seopts, 1);
+		if (!sehnd)
+			return err_msg("could not open selinux context\n");
+	}
+#endif
+
 	return 0;
 }
 
@@ -2439,6 +2548,12 @@ static void destroy_hash_table(void)
  */
 static void deinit(void)
 {
+
+#ifdef WITH_SELINUX
+	if (sehnd)
+		selabel_close(sehnd);
+#endif
+
 	free(c->lpt);
 	free(c->ltab);
 	free(leb_buf);
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, 
a Linux Foundation Collaborative Project.
