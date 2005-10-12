Received: from tyo201.gate.nec.co.jp ([202.32.8.214])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EPYDv-0002ES-48
	for linux-mtd@lists.infradead.org; Wed, 12 Oct 2005 00:28:42 -0400
Message-ID: <434C9056.4020600@ak.jp.nec.com>
Date: Wed, 12 Oct 2005 13:25:58 +0900
From: Kaigai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
	linux-mtd@lists.infradead.org
References: <20050823124649.GB30853@wohnheim.fh-wedel.de>	<1124801569.29448.13.camel@hades.cambridge.redhat.com>	<430C429B.6040500@ak.jp.nec.com>	<431E772B.9090004@ak.jp.nec.com>	<20050908194915.GG20668@wohnheim.fh-wedel.de>	<43210C7A.60109@ak.jp.nec.com>	<20050909072416.GA19251@wohnheim.fh-wedel.de>	<43225DEB.4070809@ak.jp.nec.com>	<20050911114642.GA11788@wohnheim.fh-wedel.de>	<4324E525.60805@ak.jp.nec.com>	<20050912064038.GA21304@wohnheim.fh-wedel.de>	<43255FF5.4020903@ak.jp.nec.com>
	<433A57D8.9030501@ak.jp.nec.com>
In-Reply-To: <433A57D8.9030501@ak.jp.nec.com>
Content-Type: multipart/mixed; boundary="------------020109040000000700020605"
Cc: James Morris <jmorris@redhat.com>, Ma Yun <sx_yunma@hotmail.com>,
	David Woodhouse <dwmw2@infradead.org>, Stephen Smalley <sds@tycho.nsa.gov>,
	Kaigai Kohei <kaigai@ak.jp.nec.com>
Subject: Re: [PATCH] XATTR issues on JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------020109040000000700020605
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

The attached patch adds an functionality for mkfs.jffs2.

'-A' or '--with-xattr' enables to stuff up any xattr-imforamations
for each files into JFFS2 image file.
This patch depends on 'jffs2_xattr_take-3.patch' I posted on 28-Sep.

In addition, some constants of JFFS2_XPREFIX_* are moved from
fs/jffs2/xattr.h to include/linux/jffs2.h, because I want to
use those constants in mkfs.jffs2. This change has no effects
in kernel-side.

Perhaps, another style like '--with-selinux' or '--with-acl' might
be better than '--with-xattr'.

Any comments please,
Thanks.

Kaigai Kohei wrote:
> Hi,
> 
> I revised the previous xattr patch in jffs2 based on some suggestions.
> 
> [1] scanning xattr related node for cleaned-up scan.c.
>     (jffs2_xattr_scan.c-cleanup.patch)
> [2] enables xattr support in jffs2.
>     (jffs2_xattr_take-3.patch)
> (*) We can apply jffs2_xattr_take-3.patch for current CVS independently.

-- 
Linux Promotion Center, NEC
KaiGai Kohei <kaigai@ak.jp.nec.com>

--------------020109040000000700020605
Content-Type: text/x-patch;
 name="mkfs.jffs2-xattr.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mkfs.jffs2-xattr.patch"

diff -prNU3 mtd-051011.xattr/fs/jffs2/xattr.c mtd-051011.xattr-mkfs/fs/jffs2/xattr.c
--- mtd-051011.xattr/fs/jffs2/xattr.c	2005-10-12 11:33:37.000000000 +0900
+++ mtd-051011.xattr-mkfs/fs/jffs2/xattr.c	2005-10-12 11:34:39.000000000 +0900
@@ -42,6 +42,7 @@ static int do_jffs2_setxattr(struct inod
 			     const char *buffer, size_t size, int flags);
 
 /* ---- XATTR Handler for "user.*" --------------------- */
+#define XATTR_USER_PREFIX	"user."
 static int jffs2_user_getxattr(struct inode *inode, const char *name,
                                void *buffer, size_t size)
 {
@@ -97,6 +98,7 @@ static struct xattr_handler jffs2_user_x
 };
 
 /* ---- XATTR Handler for "trusted.*" ------------------ */
+#define XATTR_TRUSTED_PREFIX	"trusted."
 static int jffs2_trusted_getxattr(struct inode *inode, const char *name,
 				  void *buffer, size_t size)
 {
diff -prNU3 mtd-051011.xattr/fs/jffs2/xattr.h mtd-051011.xattr-mkfs/fs/jffs2/xattr.h
--- mtd-051011.xattr/fs/jffs2/xattr.h	2005-10-12 11:33:37.000000000 +0900
+++ mtd-051011.xattr-mkfs/fs/jffs2/xattr.h	2005-10-12 11:34:39.000000000 +0900
@@ -14,16 +14,6 @@
 #include <linux/xattr.h>
 
 #define XATTRINDEX_HASHSIZE (57)
-#define XATTR_USER_PREFIX		"user."
-#define XATTR_TRUSTED_PREFIX		"trusted."
-
-#define JFFS2_XPREFIX_USER		1	/* for "user.*" */
-#define JFFS2_XPREFIX_SECURITY		2	/* for "security.*" */
-#define JFFS2_XPREFIX_ACL_ACCESS	3	/* for "system.posix_acl_access" */
-#define JFFS2_XPREFIX_ACL_DEFAULT	4	/* for "system.posix_acl_default" */
-#define JFFS2_XPREFIX_TRUSTED		5	/* for "trusted.*" */
-#define JFFS2_XPREFIX_INVALID		6
-
 #define JFFS2_XDATUM_FLAGS_HOT		0x01	/* This is hot xattr_datum */
 
 #define RAWNODE_CLASS_INODE_CACHE	0
diff -prNU3 mtd-051011.xattr/include/linux/jffs2.h mtd-051011.xattr-mkfs/include/linux/jffs2.h
--- mtd-051011.xattr/include/linux/jffs2.h	2005-10-12 11:33:37.000000000 +0900
+++ mtd-051011.xattr-mkfs/include/linux/jffs2.h	2005-10-12 11:34:39.000000000 +0900
@@ -68,6 +68,13 @@
 #define JFFS2_NODETYPE_XATTR (JFFS2_FEATURE_INCOMPAT | JFFS2_NODE_ACCURATE | 8)
 #define JFFS2_NODETYPE_XREF (JFFS2_FEATURE_INCOMPAT | JFFS2_NODE_ACCURATE | 9)
 
+/* XATTR Related */
+#define JFFS2_XPREFIX_USER		1	/* for "user." */
+#define JFFS2_XPREFIX_SECURITY		2	/* for "security." */
+#define JFFS2_XPREFIX_ACL_ACCESS	3	/* for "system.posix_acl_access" */
+#define JFFS2_XPREFIX_ACL_DEFAULT	4	/* for "system.posix_acl_default" */
+#define JFFS2_XPREFIX_TRUSTED		5	/* for "trusted.*" */
+
 // Maybe later...
 //#define JFFS2_NODETYPE_CHECKPOINT (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 3)
 //#define JFFS2_NODETYPE_OPTIONS (JFFS2_FEATURE_RWCOMPAT_COPY | JFFS2_NODE_ACCURATE | 4)
diff -prNU3 mtd-051011.xattr/util/mkfs.jffs2.1 mtd-051011.xattr-mkfs/util/mkfs.jffs2.1
--- mtd-051011.xattr/util/mkfs.jffs2.1	2005-09-15 21:18:43.000000000 +0900
+++ mtd-051011.xattr-mkfs/util/mkfs.jffs2.1	2005-10-12 11:34:39.000000000 +0900
@@ -49,6 +49,9 @@ mkfs.jffs2 \- Create a JFFS2 file system
 .B -P,--squash-perms
 ]
 [
+.B -A,--with-xattr
+]
+[
 .B -m,--compression-mode=MODE
 ]
 [
@@ -178,6 +181,9 @@ Squash owners making all files be owned 
 .B -P, --squash-perms
 Squash permissions, removing write permission for \'group\' and \'other\'.
 .TP
+.B -A, --with-xattr
+Include XATTR meta information. It's necessary for SELinux or ACL support.
+.TP
 .B -m, --compression-mode=MODE
 Set the default compression mode. The default mode is 
 .B priority 
diff -prNU3 mtd-051011.xattr/util/mkfs.jffs2.c mtd-051011.xattr-mkfs/util/mkfs.jffs2.c
--- mtd-051011.xattr/util/mkfs.jffs2.c	2005-09-15 21:18:43.000000000 +0900
+++ mtd-051011.xattr-mkfs/util/mkfs.jffs2.c	2005-10-12 11:55:09.000000000 +0900
@@ -7,6 +7,7 @@
  *           2002 Axis Communications AB
  *           2001, 2002 Erik Andersen <andersen@codepoet.org>
  *           2004 University of Szeged, Hungary
+ *           2005 KaiGai Kohei <kaigai@ak.jp.nec.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -63,6 +64,7 @@
 #include <ctype.h>
 #include <time.h>
 #include <getopt.h>
+#include <attr/xattr.h>
 #include <byteswap.h>
 #define crc32 __complete_crap
 #include <zlib.h>
@@ -1018,6 +1020,166 @@ static void write_special_file(struct fi
 	padword();
 }
 
+struct xattr_entry {
+	struct xattr_entry *next;
+	uint32_t xid;
+	int xprefix;
+	char *xname;
+	char *xvalue;
+	int value_len;
+};
+static int enable_xattr = 0;
+static uint32_t xseqno = 0;
+static struct {
+	int code;
+	char *string;
+	int length;
+} xprefix_tbl[] = {
+	{ JFFS2_XPREFIX_USER, "user.", sizeof("user.")-1 },
+	{ JFFS2_XPREFIX_SECURITY, "security.", sizeof("security.")-1 },
+//	{ JFFS2_XPREFIX_ACL_ACCESS, "system.posix_acl_access", sizeof("system.posix_acl_access")-1 },
+//	{ JFFS2_XPREFIX_ACL_DEFAULT, "system.posix_acl_default", sizeof("system.posix_acl_default")-1 },
+	{ JFFS2_XPREFIX_TRUSTED, "trusted.", sizeof("trusted")-1 },
+	{ 0, NULL, 0 }
+};
+
+static struct xattr_entry *create_xattr_entry(int xprefix, char *xname, char *xvalue, int value_len)
+{
+	struct xattr_entry *xe;
+	struct jffs2_raw_xattr rx;
+	int name_len, data_len;
+
+	name_len = strlen(xname);
+	data_len = name_len + 1 + value_len;
+	xe = xcalloc(1, sizeof(struct xattr_entry) + data_len);
+	xe->xid = ++xseqno;
+	xe->xprefix = xprefix;
+	xe->xname = (char *)(xe + 1);
+	xe->xvalue = xe->xname + name_len + 1;
+	xe->value_len = value_len;
+	strcpy(xe->xname, xname);
+	memcpy(xe->xvalue, xvalue, value_len);
+
+	memset(&rx, 0, sizeof(rx));
+	rx.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	rx.nodetype = cpu_to_je16(JFFS2_NODETYPE_XATTR);
+	rx.totlen = cpu_to_je32(sizeof(rx) + data_len);
+	rx.hdr_crc = cpu_to_je32(crc32(0, &rx, sizeof(struct jffs2_unknown_node) - 4));
+
+	rx.xid = cpu_to_je32(xe->xid);
+	rx.xprefix = xprefix;	/* 8bit width */
+	rx.name_len = name_len;	/* 8bit width */
+	rx.value_len = cpu_to_je16(value_len);
+	rx.data_crc = cpu_to_je32(crc32(0, xe->xname, data_len));
+	rx.node_crc = cpu_to_je32(crc32(0, &rx, sizeof(rx) - 8));
+
+	pad_block_if_less_than(sizeof(rx) + data_len);
+	full_write(out_fd, &rx, sizeof(rx));
+	full_write(out_fd, xe->xname, data_len);
+	padword();
+
+	return xe;
+}
+
+#define XATTRENTRY_HASHSIZE  (256)
+static struct xattr_entry *find_xattr_entry(char *xname, char *xvalue, int value_len)
+{
+	static struct xattr_entry **xentry_hash = NULL;
+	struct xattr_entry *xe;
+	int i, name_len, xprefix, index;
+
+	/* -- lookup xprefix -- */
+	for (xprefix=0, i=0; xprefix_tbl[i].string; i++) {
+		char *prstr = xprefix_tbl[i].string;
+		int prlen = xprefix_tbl[i].length;
+		if (!strncmp(xname, prstr, prlen)) {
+			xprefix = xprefix_tbl[i].code;
+			xname += prlen;
+			break;
+		}
+	}
+	if (xprefix == 0)
+		return NULL;
+
+	/* -- find or create xattr entry -- */
+	if (!xentry_hash)
+		xentry_hash = xcalloc(1, sizeof(struct xattr_entry *) * XATTRENTRY_HASHSIZE);
+
+	name_len = strlen(xname) + 1;
+	index = (crc32(0, xname, name_len) ^ crc32(0, xvalue, value_len)) & XATTRENTRY_HASHSIZE;
+	for (xe = xentry_hash[index]; xe; xe = xe->next) {
+		if (xe->xprefix == xprefix
+		    && xe->value_len == value_len
+		    && !strcmp(xe->xname, xname)
+		    && !memcmp(xe->xvalue, xvalue, value_len))
+			break;
+	}
+	if (!xe) {
+		xe = create_xattr_entry(xprefix, xname, xvalue, value_len);
+		xe->next = xentry_hash[index];
+		xentry_hash[index] = xe;
+	}
+
+	return xe;
+}
+
+#define XATTR_BUFSZ  65536
+static void write_xattr_entry(struct filesystem_entry *e)
+{
+	struct jffs2_raw_xref ref;
+	struct xattr_entry *xe;
+	char xlist[XATTR_BUFSZ], xvalue[XATTR_BUFSZ], filepath[PATH_MAX+1];
+	char *xname;
+	int list_sz, offset, name_len, value_len;
+
+	if (!enable_xattr)
+		return;
+
+	sprintf(filepath, "%s%s", rootdir, e->fullname);
+
+	list_sz = llistxattr(filepath, xlist, XATTR_BUFSZ);
+	if (list_sz < 0) {
+		if (verbose)
+			printf("llistxattr(\"%s\") returned %d:%s\n",
+			       e->fullname, errno, strerror(errno));
+		return;
+	}
+
+	for (offset = 0; offset < list_sz; offset += name_len) {
+		xname = xlist+offset;
+		name_len = strlen(xname) + 1;
+
+		value_len = lgetxattr(filepath, xname, xvalue, XATTR_BUFSZ);
+		if (value_len < 0) {
+			if (verbose)
+				printf("lgetxattr(\"%s\", \"%s\") returned %d:%s\n",
+				       e->fullname, xname, errno, strerror(errno));
+			continue;
+		}
+
+		xe = find_xattr_entry(xname, xvalue, value_len);
+		if (!xe) {
+			if (verbose)
+				printf("XATTR \"%s\" -- Not supported on \"%s\"\n", xname, e->fullname);
+			continue;
+		}
+
+		memset(&ref, 0, sizeof(ref));
+		ref.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+		ref.nodetype = cpu_to_je16(JFFS2_NODETYPE_XREF);		
+		ref.totlen = cpu_to_je32(sizeof(ref));
+		ref.hdr_crc = cpu_to_je32(crc32(0, &ref, sizeof(struct jffs2_unknown_node) - 4));
+		ref.seqno = cpu_to_je32(++xseqno);
+		ref.ino = cpu_to_je32(e->sb.st_ino);
+		ref.xid = cpu_to_je32(xe->xid);
+		ref.node_crc = cpu_to_je32(crc32(0, &ref, sizeof(ref) - 4));
+
+		pad_block_if_less_than(sizeof(ref));
+		full_write(out_fd, &ref, sizeof(ref));
+		padword();
+	}
+}
+
 static void recursive_populate_directory(struct filesystem_entry *dir)
 {
 	struct filesystem_entry *e;
@@ -1025,9 +1187,10 @@ static void recursive_populate_directory
 	if (verbose) {
 		printf("%s\n", dir->fullname);
 	}
+	write_xattr_entry(dir);		/* for '/' */
+
 	e = dir->files;
 	while (e) {
-
 		switch (e->sb.st_mode & S_IFMT) {
 			case S_IFDIR:
 				if (verbose) {
@@ -1037,6 +1200,7 @@ static void recursive_populate_directory
 							e->name);
 				}
 				write_pipe(e);
+				write_xattr_entry(e);
 				break;
 			case S_IFSOCK:
 				if (verbose) {
@@ -1045,6 +1209,7 @@ static void recursive_populate_directory
 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
 				}
 				write_pipe(e);
+				write_xattr_entry(e);
 				break;
 			case S_IFIFO:
 				if (verbose) {
@@ -1053,6 +1218,7 @@ static void recursive_populate_directory
 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
 				}
 				write_pipe(e);
+				write_xattr_entry(e);
 				break;
 			case S_IFCHR:
 				if (verbose) {
@@ -1062,6 +1228,7 @@ static void recursive_populate_directory
 							(int) e->sb.st_gid, e->name);
 				}
 				write_special_file(e);
+				write_xattr_entry(e);
 				break;
 			case S_IFBLK:
 				if (verbose) {
@@ -1071,6 +1238,7 @@ static void recursive_populate_directory
 							(int) e->sb.st_gid, e->name);
 				}
 				write_special_file(e);
+				write_xattr_entry(e);
 				break;
 			case S_IFLNK:
 				if (verbose) {
@@ -1080,6 +1248,7 @@ static void recursive_populate_directory
 							e->link);
 				}
 				write_symlink(e);
+				write_xattr_entry(e);
 				break;
 			case S_IFREG:
 				if (verbose) {
@@ -1088,6 +1257,7 @@ static void recursive_populate_directory
 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
 				}
 				write_regular_file(e);
+				write_xattr_entry(e);
 				break;
 			default:
 				error_msg("Unknown mode %o for %s", e->sb.st_mode,
@@ -1165,6 +1335,7 @@ static struct option long_options[] = {
 	{"test-compression", 0, NULL, 't'},
 	{"compressor-priority", 1, NULL, 'y'},
 	{"incremental", 1, NULL, 'i'},
+	{"with-xattr", 0, NULL, 'A'},
 	{NULL, 0, NULL, 0}
 };
 
@@ -1200,7 +1371,8 @@ static char *helptext =
 	"  -h, --help              Display this help text\n"
 	"  -v, --verbose           Verbose operation\n"
 	"  -V, --version           Display version information\n"
-	"  -i, --incremental=FILE  Parse FILE and generate appendage output for it\n\n";
+	"  -i, --incremental=FILE  Parse FILE and generate appendage output for it\n"
+	"  -A, --with-xattr        include XATTR meta informatin.\n\n";
 
 static char *revtext = "$Revision: 1.45 $";
 
@@ -1353,7 +1525,7 @@ int main(int argc, char **argv)
         jffs2_compressors_init();
 
 	while ((opt = getopt_long(argc, argv, 
-					"D:d:r:s:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:i:", long_options, &c)) >= 0) 
+					"D:d:r:s:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:i:A", long_options, &c)) >= 0) 
 	{
 		switch (opt) {
 			case 'D':
@@ -1515,6 +1687,9 @@ int main(int argc, char **argv)
 					perror_msg_and_die("cannot open (incremental) file");
 				}
 				break;
+			case 'A':
+				enable_xattr = 1;
+				break;
 		}
 	}
 	if (out_fd == -1) {

--------------020109040000000700020605--
