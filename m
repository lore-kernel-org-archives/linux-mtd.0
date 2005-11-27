Received: from www346.sakura.ne.jp ([202.181.99.66])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EgGX4-0003IC-3r
	for linux-mtd@lists.infradead.org; Sun, 27 Nov 2005 02:01:08 -0500
Message-ID: <43895906.3040705@ak.jp.nec.com>
Date: Sun, 27 Nov 2005 15:58:14 +0900
From: KaiGai Kohei <kaigai@ak.jp.nec.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <43210C7A.60109@ak.jp.nec.com>	<20050909072416.GA19251@wohnheim.fh-wedel.de>	<43225DEB.4070809@ak.jp.nec.com>	<20050911114642.GA11788@wohnheim.fh-wedel.de>	<4324E525.60805@ak.jp.nec.com>	<20050912064038.GA21304@wohnheim.fh-wedel.de>	<43255FF5.4020903@ak.jp.nec.com>
	<433A57D8.9030501@ak.jp.nec.com>	<20050929074500.GA16687@wohnheim.fh-wedel.de>	<435647A8.6090103@ak.jp.nec.com>
	<20051019142438.GA32362@wohnheim.fh-wedel.de>
In-Reply-To: <20051019142438.GA32362@wohnheim.fh-wedel.de>
Content-Type: multipart/mixed; boundary="------------030702060801050301020401"
Cc: James Morris <jmorris@redhat.com>, Kaigai Kohei <kaigai@ak.jp.nec.com>,
	Stephen Smalley <sds@tycho.nsa.gov>,
	linux-mtd@lists.infradead.org, lorenzohgh@gmail.com,
	David Woodhouse <dwmw2@infradead.org>, Andreas Gruenbacher <agruen@suse.de>
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
--------------030702060801050301020401
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

This attached patches are enables XATTR support on JFFS2.
some new functionalities are added from take-3 patches.

# Sorry for slowing update.

[NOTICE]
     We can test this patch with ONLY 2.6.14 kernel.
     The previous versions of kernel do not support an new LSM hook.

[1/2] jffs2_xattr_take-4.patch
   * CONFIG_JFFS2_XATTR was renamed to CONFIG_JFFS2_FS_XATTR
     The XATTR configuration switch are named CONFIG_<fsname>_FS_XATTR
     on another some filesystems which support XATTR.
     I also follow this manner.

   * CONFIG_JFFS2_FS_POSIX_ACL and JFFS2_FS_SECURITY are selectable.
     this follows another FS's manner.

   * POSIX-ACL support was added.
     This functionality is implemented in acl.c, acl.h.
     I implemented the most part of this functionalities by referring
     the Ext2/3's implementation of POSIX-ACL.
     If I took bad manner or misunderstanding for implementation,
     notice me please.

   * jffs2_init_security() was added for inode initialization.
     At 2.6.14, new LSM hook(security_inode_init_security) was added.
     Because of this, any filesystems obtain security attribtues must
     call this this hook to set the security label for new inode.
     It's deployed in jffs2_create(), jffs2_symlink(), jffs2_mkdir()
     and jffs2_mknod().

   * Some patch conflicts were fixed.
     We can apply this patches for latest MTD-CVS without incident.

   * An obvious bug was fixed.
     In jffs2_build_xattr_subsystem(), NULL checking was omitted.

[2/2] mkfs.jffs2-xattr.patch
   * --with-{xattr|selinux|posix-acl} options are added.
     --with-xattr enables to pack all xattr-entries into jffs2 image file.
     --with-selinux enables to pack security related xattr-entries which
       are named as 'security.*' into jffs2 image file.
     --with-posix-acl enables to pack ACL related xattr-entries which
       are names as 'system.posix_acl_access' or 'system.posix_acl_default'.

I hope to merge those functionalities into MTD's CVS tree.
Thanks,
-- 
KaiGai Kohei <kaigai@ak.jp.nec.com>

--------------030702060801050301020401
Content-Type: text/plain;
 name="mkfs.jffs2-xattr.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mkfs.jffs2-xattr.patch"

diff -rpNU3 mtd-20051127.xattr/util/mkfs.jffs2.1 mtd-20051127.mkfs/util/mkfs.jffs2.1
--- mtd-20051127.xattr/util/mkfs.jffs2.1	2005-11-27 00:00:13.000000000 -0500
+++ mtd-20051127.mkfs/util/mkfs.jffs2.1	2005-11-27 00:00:36.000000000 -0500
@@ -49,6 +49,15 @@ mkfs.jffs2 \- Create a JFFS2 file system
 .B -P,--squash-perms
 ]
 [
+.B --with-xattr
+]
+[
+.B --with-selinux
+]
+[
+.B --with-posix-acl
+]
+[
 .B -m,--compression-mode=MODE
 ]
 [
@@ -178,6 +187,15 @@ Squash owners making all files be owned 
 .B -P, --squash-perms
 Squash permissions, removing write permission for \'group\' and \'other\'.
 .TP
+.B --with-xattr
+Enables xattr, stuff all xattr entries into jffs2 image file.
+.TP
+.B --with-selinux
+Enables xattr, stuff only SELinux Labels into jffs2 image file.
+.TP
+.B --with-posix-acl
+Enable xattr, stuff only POSIX ACL entries into jffs2 image file.
+.TP
 .B -m, --compression-mode=MODE
 Set the default compression mode. The default mode is 
 .B priority 
diff -rpNU3 mtd-20051127.xattr/util/mkfs.jffs2.c mtd-20051127.mkfs/util/mkfs.jffs2.c
--- mtd-20051127.xattr/util/mkfs.jffs2.c	2005-11-27 00:00:13.000000000 -0500
+++ mtd-20051127.mkfs/util/mkfs.jffs2.c	2005-11-27 00:00:36.000000000 -0500
@@ -7,6 +7,7 @@
  *           2002 Axis Communications AB
  *           2001, 2002 Erik Andersen <andersen@codepoet.org>
  *           2004 University of Szeged, Hungary
+ *           2005 KaiGai Kohei <kaigai@ak.jp.nec.com>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -63,6 +64,8 @@
 #include <ctype.h>
 #include <time.h>
 #include <getopt.h>
+#include <attr/xattr.h>
+#include <sys/acl.h>
 #include <byteswap.h>
 #define crc32 __complete_crap
 #include <zlib.h>
@@ -1018,6 +1021,282 @@ static void write_special_file(struct fi
 	padword();
 }
 
+#include "../fs/jffs2/acl.h"
+#define XATTR_BUFFER_SIZE	65536
+typedef struct {
+	uint16_t		e_tag;
+	uint16_t		e_perm;
+	uint32_t		e_id;
+} posix_acl_xattr_entry;
+
+typedef struct {
+	uint32_t		a_version;
+	posix_acl_xattr_entry	a_entries[0];
+} posix_acl_xattr_header;
+
+typedef struct xattr_entry {
+	struct xattr_entry *next;
+	uint32_t xid;
+	int xprefix;
+	char *xname;
+	char *xvalue;
+	int name_len;
+	int value_len;
+} xattr_entry_t;
+
+#define le16_to_cpu(x)	(__BYTE_ORDER==__LITTLE_ENDIAN ? (x) : bswap_16(x))
+#define le32_to_cpu(x)	(__BYTE_ORDER==__LITTLE_ENDIAN ? (x) : bswap_32(x))
+
+static uint32_t enable_xattr = 0;
+static uint32_t xseqno = 0;
+
+static struct {
+	int xprefix;
+	char *string;
+	int strict;
+} xprefix_tbl[] = {
+	{ JFFS2_XPREFIX_USER,		"user.", 			0 },
+	{ JFFS2_XPREFIX_SECURITY,	"security.",			0 },
+	{ JFFS2_XPREFIX_ACL_ACCESS,	"system.posix_acl_access",	1 },
+	{ JFFS2_XPREFIX_ACL_DEFAULT,	"system.posix_acl_default",	1 },
+	{ JFFS2_XPREFIX_TRUSTED,	"trusted.",			0 },
+	{ 0,				NULL,				0 }
+};
+
+static void write_xattr_normal(xattr_entry_t *xe)
+{
+	struct jffs2_raw_xattr rx;
+
+	memset(&rx, 0, sizeof(rx));
+	rx.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	rx.nodetype = cpu_to_je16(JFFS2_NODETYPE_XATTR);
+	rx.totlen = cpu_to_je32(sizeof(rx) + xe->name_len + 1 + xe->value_len);
+	rx.hdr_crc = cpu_to_je32(crc32(0, &rx, sizeof(struct jffs2_unknown_node) - 4));
+
+	rx.xid = cpu_to_je32(xe->xid);
+	rx.xprefix = xe->xprefix;
+	rx.name_len = xe->name_len;
+	rx.value_len = cpu_to_je16(xe->value_len);
+	rx.data_crc = cpu_to_je32(crc32(0, xe->xname, xe->name_len + 1 + xe->value_len));
+	rx.node_crc = cpu_to_je32(crc32(0, &rx, sizeof(rx) - 8));
+
+	pad_block_if_less_than(sizeof(rx) + xe->name_len + 1 + xe->value_len);
+	full_write(out_fd, &rx, sizeof(rx));
+	full_write(out_fd, xe->xname, xe->name_len + 1 + xe->value_len);
+	padword();
+}
+
+static void write_xattr_acl(xattr_entry_t *xe)
+{
+	struct jffs2_raw_xattr rx;
+	posix_acl_xattr_header *header;
+	posix_acl_xattr_entry *entry, *end;
+	jffs2_acl_header *jheader;
+	jffs2_acl_entry *jent;
+	jffs2_acl_entry_short *jent_s;
+	char buffer[XATTR_BUFFER_SIZE];
+	int i, offset = 0;
+
+	header = (posix_acl_xattr_header *)xe->xvalue;
+	entry  = header->a_entries;
+	end = (posix_acl_xattr_entry *)(xe->xvalue + xe->value_len);
+
+	buffer[offset++] = '\0';	/* termination char of xname */
+	jheader = (jffs2_acl_header *)(buffer + offset);
+	jheader->a_version = cpu_to_je32(JFFS2_ACL_VERSION);
+	offset += sizeof(jffs2_acl_header);
+
+	for (i=0; i < xe->value_len; i+=sizeof(unsigned long)) {
+		unsigned long *value = (unsigned long *)(xe->xvalue + i);
+		printf(" %08lx", *value);
+	}
+	putchar('\n');
+
+	while (entry < end) {
+		switch (le16_to_cpu(entry->e_tag)) {
+		case ACL_USER_OBJ:
+		case ACL_GROUP_OBJ:
+		case ACL_MASK:
+		case ACL_OTHER:
+			jent_s = (jffs2_acl_entry_short *)(buffer + offset);
+			offset += sizeof(jffs2_acl_entry_short);
+			jent_s->e_tag = cpu_to_je16(le16_to_cpu(entry->e_tag));
+			jent_s->e_perm = cpu_to_je16(le16_to_cpu(entry->e_perm));
+			break;
+		case ACL_USER:
+		case ACL_GROUP:
+			jent = (jffs2_acl_entry *)(buffer + offset);
+			offset += sizeof(jffs2_acl_entry);
+			jent->e_tag = cpu_to_je16(le16_to_cpu(entry->e_tag));
+			jent->e_perm = cpu_to_je16(le16_to_cpu(entry->e_perm));
+			jent->e_id = cpu_to_je32(le32_to_cpu(entry->e_id));
+			break;
+		default:
+			printf("%04x : Unknown XATTR entry tag.\n", le16_to_cpu(entry->e_tag));
+		}
+		entry++;
+	}
+	
+	memset(&rx, 0, sizeof(rx));
+	rx.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	rx.nodetype = cpu_to_je16(JFFS2_NODETYPE_XATTR);
+	rx.totlen = cpu_to_je32(sizeof(rx) + 1 + offset);
+	rx.hdr_crc = cpu_to_je32(crc32(0, &rx, sizeof(struct jffs2_unknown_node) - 4));
+
+	rx.xid = cpu_to_je32(xe->xid);
+	rx.xprefix = xe->xprefix;
+	rx.name_len = 0;
+	rx.value_len = cpu_to_je16(offset - 1);
+	rx.data_crc = cpu_to_je32(crc32(0, buffer, offset));
+	rx.node_crc = cpu_to_je32(crc32(0, &rx, sizeof(rx) - 8));
+
+	pad_block_if_less_than(sizeof(rx) + offset);
+	full_write(out_fd, &rx, sizeof(rx));
+	full_write(out_fd, buffer, offset);
+	padword();
+
+	for (i=0; i < offset; i+= sizeof(unsigned long)) {
+		unsigned long *value = (unsigned long *)(buffer + 1 + i);
+		printf(" %08lx", *value);
+	}
+	putchar('\n');
+	printf("wrote-a: xid = %u xprefix = %d dlen = %d hcrc = %08x dcrc = %08x\n", xe->xid, xe->xprefix, offset, je32_to_cpu(rx.node_crc), je32_to_cpu(rx.data_crc));
+}
+
+static xattr_entry_t *create_xattr_entry(int xprefix, char *xname, char *xvalue, int value_len)
+{
+	xattr_entry_t *xe;
+	int name_len;
+
+	name_len = strlen(xname);
+	xe = xcalloc(1, sizeof(struct xattr_entry) + name_len + 1 + value_len);
+	xe->xid = ++xseqno;
+	xe->xprefix = xprefix;
+	xe->xname = (char *)(xe + 1);
+	xe->xvalue = xe->xname + name_len + 1;
+	xe->name_len = name_len;
+	xe->value_len = value_len;
+	strcpy(xe->xname, xname);
+	memcpy(xe->xvalue, xvalue, value_len);
+
+	switch (xprefix) {
+	case JFFS2_XPREFIX_ACL_ACCESS:
+	case JFFS2_XPREFIX_ACL_DEFAULT:
+		write_xattr_acl(xe);
+		break;
+	default:
+		write_xattr_normal(xe);
+		break;
+	}
+	return xe;
+}
+
+#define XATTRENTRY_HASHSIZE	37
+static xattr_entry_t *find_xattr_entry(int xprefix, char *xname, char *xvalue, int value_len)
+{
+	static xattr_entry_t **xentry_hash = NULL;
+	xattr_entry_t *xe;
+	int name_len, index;
+
+	if ((enable_xattr & (1 << xprefix)) == 0)
+		return NULL;
+
+	/* find or create xattr entry */
+	if (!xentry_hash)
+		xentry_hash = xcalloc(1, sizeof(struct xattr_entry *) * XATTRENTRY_HASHSIZE);
+
+	name_len = strlen(xname) + 1;
+	index = (crc32(0, xname, name_len) ^ crc32(0, xvalue, value_len)) % XATTRENTRY_HASHSIZE;
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
+static void write_xattr_entry(struct filesystem_entry *e)
+{
+	struct jffs2_raw_xref ref;
+	struct xattr_entry *xe;
+	char xlist[XATTR_BUFFER_SIZE], xvalue[XATTR_BUFFER_SIZE];
+	char *xname;
+	int list_sz, offset, name_len, value_len;
+
+	if (!enable_xattr)
+		return;
+
+	list_sz = llistxattr(e->hostname, xlist, XATTR_BUFFER_SIZE);
+	if (list_sz < 0) {
+		if (verbose)
+			printf("llistxattr('%s') = %d : %s\n",
+			       e->hostname, errno, strerror(errno));
+		return;
+	}
+
+	for (offset = 0; offset < list_sz; offset += name_len) {
+		int i, xprefix, prefix_len;
+		char *prefix_str;
+
+		xname = xlist + offset;
+		name_len = strlen(xname) + 1;
+
+		for (i = 0; (xprefix = xprefix_tbl[i].xprefix); i++) {
+			prefix_str = xprefix_tbl[i].string;
+			prefix_len = strlen(prefix_str);
+
+			if (xprefix_tbl[i].strict) {
+				if (!strcmp(xname, prefix_str))
+					break;
+			} else {
+				if (!strncmp(xname, prefix_str, prefix_len))
+					break;
+			}
+		}
+		if (!xprefix) {
+			if (verbose)
+				printf("%s : XATTR '%s' was not supported.\n", e->hostname, xname);
+			continue;
+		}
+		value_len = lgetxattr(e->hostname, xname, xvalue, XATTR_BUFFER_SIZE);
+		if (value_len < 0) {
+			if (verbose)
+				printf("lgetxattr('%s', '%s') = %d : %s\n",
+				       e->hostname, xname, errno, strerror(errno));
+			continue;
+		}
+		xe = find_xattr_entry(xprefix, xname + prefix_len, xvalue, value_len);
+		if (!xe) {
+			if (verbose)
+				printf("%s : XATTR '%s' was ignored.\n",
+				       e->hostname, xname);
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
@@ -1025,6 +1304,8 @@ static void recursive_populate_directory
 	if (verbose) {
 		printf("%s\n", dir->fullname);
 	}
+	write_xattr_entry(dir);		/* for '/' */
+
 	e = dir->files;
 	while (e) {
 
@@ -1037,6 +1318,7 @@ static void recursive_populate_directory
 							e->name);
 				}
 				write_pipe(e);
+				write_xattr_entry(e);
 				break;
 			case S_IFSOCK:
 				if (verbose) {
@@ -1045,6 +1327,7 @@ static void recursive_populate_directory
 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
 				}
 				write_pipe(e);
+				write_xattr_entry(e);
 				break;
 			case S_IFIFO:
 				if (verbose) {
@@ -1053,6 +1336,7 @@ static void recursive_populate_directory
 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
 				}
 				write_pipe(e);
+				write_xattr_entry(e);
 				break;
 			case S_IFCHR:
 				if (verbose) {
@@ -1062,6 +1346,7 @@ static void recursive_populate_directory
 							(int) e->sb.st_gid, e->name);
 				}
 				write_special_file(e);
+				write_xattr_entry(e);
 				break;
 			case S_IFBLK:
 				if (verbose) {
@@ -1071,6 +1356,7 @@ static void recursive_populate_directory
 							(int) e->sb.st_gid, e->name);
 				}
 				write_special_file(e);
+				write_xattr_entry(e);
 				break;
 			case S_IFLNK:
 				if (verbose) {
@@ -1080,6 +1366,7 @@ static void recursive_populate_directory
 							e->link);
 				}
 				write_symlink(e);
+				write_xattr_entry(e);
 				break;
 			case S_IFREG:
 				if (verbose) {
@@ -1088,6 +1375,7 @@ static void recursive_populate_directory
 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
 				}
 				write_regular_file(e);
+				write_xattr_entry(e);
 				break;
 			default:
 				error_msg("Unknown mode %o for %s", e->sb.st_mode,
@@ -1172,6 +1460,9 @@ static struct option long_options[] = {
 	{"test-compression", 0, NULL, 't'},
 	{"compressor-priority", 1, NULL, 'y'},
 	{"incremental", 1, NULL, 'i'},
+	{"with-xattr", 0, NULL, 1000 },
+	{"with-selinux", 0, NULL, 1001 },
+	{"with-posix-acl", 0, NULL, 1002 },
 	{NULL, 0, NULL, 0}
 };
 
@@ -1204,6 +1495,9 @@ static char *helptext =
 	"  -q, --squash            Squash permissions and owners making all files be owned by root\n"
 	"  -U, --squash-uids       Squash owners making all files be owned by root\n"
 	"  -P, --squash-perms      Squash permissions on all files\n"
+	"      --with-xattr        stuff all xattr entries into image\n"
+	"      --with-selinux      stuff only SELinux Labels into jffs2 image\n"
+	"      --with-posix-acl    stuff only POSIX ACL entries into jffs2 image\n"
 	"  -h, --help              Display this help text\n"
 	"  -v, --verbose           Verbose operation\n"
 	"  -V, --version           Display version information\n"
@@ -1531,6 +1825,20 @@ int main(int argc, char **argv)
 					perror_msg_and_die("cannot open (incremental) file");
 				}
 				break;
+			case 1000:	/* --with-xattr  */
+				enable_xattr |= (1 << JFFS2_XPREFIX_USER)
+						| (1 << JFFS2_XPREFIX_SECURITY)
+						| (1 << JFFS2_XPREFIX_ACL_ACCESS)
+						| (1 << JFFS2_XPREFIX_ACL_DEFAULT)
+						| (1 << JFFS2_XPREFIX_TRUSTED);
+				break;
+			case 1001:	/*  --with-selinux  */
+				enable_xattr |= (1 << JFFS2_XPREFIX_SECURITY);
+				break;
+			case 1002:	/*  --with-posix-acl  */
+				enable_xattr |= (1 << JFFS2_XPREFIX_ACL_ACCESS)
+						| (1 << JFFS2_XPREFIX_ACL_DEFAULT);
+				break;
 		}
 	}
 	if (out_fd == -1) {

--------------030702060801050301020401
Content-Type: text/plain;
 name="jffs2_xattr_take-4.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="jffs2_xattr_take-4.patch"

diff -prNU3 mtd-20051127/fs/jffs2/acl.c mtd-20051127.xattr/fs/jffs2/acl.c
--- mtd-20051127/fs/jffs2/acl.c	1969-12-31 19:00:00.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/acl.c	2005-11-27 00:00:13.000000000 -0500
@@ -0,0 +1,484 @@
+/*-------------------------------------------------------------------------*
+ *  File: fs/jffs2/acl.c
+ *  POSIX ACL support on JFFS2 FileSystem
+ *
+ *  Implemented by KaiGai Kohei <kaigai@ak.jp.nec.com>
+ *  Copyright (C) 2005 NEC Corporation
+ *
+ *  For licensing information, see the file 'LICENCE' in the jffs2 directory.
+ *-------------------------------------------------------------------------*/
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/fs.h>
+#include <linux/time.h>
+#include <linux/pagemap.h>
+#include <linux/highmem.h>
+#include <linux/crc32.h>
+#include <linux/jffs2.h>
+#include <linux/xattr.h>
+#include <linux/posix_acl_xattr.h>
+#include <linux/mtd/mtd.h>
+#include "nodelist.h"
+
+static size_t jffs2_acl_size(int count)
+{
+	if (count <= 4) {
+		return sizeof(jffs2_acl_header)
+		       + count * sizeof(jffs2_acl_entry_short);
+	} else {
+		return sizeof(jffs2_acl_header)
+		       + 4 * sizeof(jffs2_acl_entry_short)
+		       + (count - 4) * sizeof(jffs2_acl_entry);
+	}
+}
+
+static int jffs2_acl_count(size_t size)
+{
+	size_t s;
+
+	size -= sizeof(jffs2_acl_header);
+	s = size - 4 * sizeof(jffs2_acl_entry_short);
+	if (s < 0) {
+		if (size % sizeof(jffs2_acl_entry_short))
+			return -1;
+		return size / sizeof(jffs2_acl_entry_short);
+	} else {
+		if (s % sizeof(jffs2_acl_entry))
+			return -1;
+		return s / sizeof(jffs2_acl_entry) + 4;
+	}
+}
+
+static struct posix_acl *jffs2_acl_from_medium(const void *value, size_t size)
+{
+	const char *end = (char *)value + size;
+	struct posix_acl *acl;
+	int i, count;
+
+	if (!value)
+		return NULL;
+	if (size < sizeof(jffs2_acl_header))
+		return ERR_PTR(-EINVAL);
+	if (je32_to_cpu(((jffs2_acl_header *)value)->a_version) != JFFS2_ACL_VERSION) {
+		D1(printk(KERN_NOTICE "%s:%d invalid ACL version.\n", __FUNCTION__, __LINE__));
+		return ERR_PTR(-EINVAL);
+	}
+
+	value = (char *)value + sizeof(jffs2_acl_header);
+	count = jffs2_acl_count(size);
+	if (count < 0)
+		return ERR_PTR(-EINVAL);
+	if (count == 0)
+		return NULL;
+
+	acl = posix_acl_alloc(count, GFP_KERNEL);
+	if (!acl)
+		return ERR_PTR(-ENOMEM);
+
+	for (i=0; i < count; i++) {
+		jffs2_acl_entry *entry = (jffs2_acl_entry *)value;
+		if ((char *)value + sizeof(jffs2_acl_entry_short) > end)
+			goto fail;
+		acl->a_entries[i].e_tag = je16_to_cpu(entry->e_tag);
+		acl->a_entries[i].e_perm = je16_to_cpu(entry->e_perm);
+		switch (acl->a_entries[i].e_tag) {
+			case ACL_USER_OBJ:
+			case ACL_GROUP_OBJ:
+			case ACL_MASK:
+			case ACL_OTHER:
+				value = (char *)value + sizeof(jffs2_acl_entry_short);
+				acl->a_entries[i].e_id = ACL_UNDEFINED_ID;
+				break;
+
+			case ACL_USER:
+			case ACL_GROUP:
+				value = (char *)value + sizeof(jffs2_acl_entry);
+				if ((char *)value > end)
+					goto fail;
+				acl->a_entries[i].e_id = je32_to_cpu(entry->e_id);
+				break;
+
+			default:
+				goto fail;
+		}
+	}
+	if (value != end)
+		goto fail;
+	return acl;
+ fail:
+	posix_acl_release(acl);
+	return ERR_PTR(-EINVAL);
+}
+
+static void *jffs2_acl_to_medium(const struct posix_acl *acl, size_t *size)
+{
+	jffs2_acl_header *jffs2_acl;
+	char *e;
+	size_t i;
+
+	*size = jffs2_acl_size(acl->a_count);
+	jffs2_acl = (jffs2_acl_header *)kmalloc(sizeof(jffs2_acl_header)
+						+ acl->a_count * sizeof(jffs2_acl_entry),
+						GFP_KERNEL);
+	if (!jffs2_acl)
+		return ERR_PTR(-ENOMEM);
+	jffs2_acl->a_version = cpu_to_je32(JFFS2_ACL_VERSION);
+	e = (char *)jffs2_acl + sizeof(jffs2_acl_header);
+	for (i=0; i < acl->a_count; i++) {
+		jffs2_acl_entry *entry = (jffs2_acl_entry *)e;
+		entry->e_tag = cpu_to_je16(acl->a_entries[i].e_tag);
+		entry->e_perm = cpu_to_je16(acl->a_entries[i].e_perm);
+		switch(acl->a_entries[i].e_tag) {
+			case ACL_USER:
+			case ACL_GROUP:
+				entry->e_id = cpu_to_je32(acl->a_entries[i].e_id);
+				e += sizeof(jffs2_acl_entry);
+				break;
+
+			case ACL_USER_OBJ:
+			case ACL_GROUP_OBJ:
+			case ACL_MASK:
+			case ACL_OTHER:
+				e += sizeof(jffs2_acl_entry_short);
+				break;
+
+			default:
+				goto fail;
+		}
+	}
+	return (char *)jffs2_acl;
+ fail:
+	kfree(jffs2_acl);
+	return ERR_PTR(-EINVAL);
+}
+
+static struct posix_acl *jffs2_iget_acl(struct inode *inode, struct posix_acl **i_acl)
+{
+	struct posix_acl *acl = JFFS2_ACL_NOT_CACHED;
+
+	spin_lock(&inode->i_lock);
+	if (*i_acl != JFFS2_ACL_NOT_CACHED)
+		acl = posix_acl_dup(*i_acl);
+	spin_unlock(&inode->i_lock);
+	return acl;
+}
+
+static void jffs2_iset_acl(struct inode *inode, struct posix_acl **i_acl, struct posix_acl *acl)
+{
+	spin_lock(&inode->i_lock);
+	if (*i_acl != JFFS2_ACL_NOT_CACHED)
+		posix_acl_release(*i_acl);
+	*i_acl = posix_acl_dup(acl);
+	spin_unlock(&inode->i_lock);
+}
+
+static struct posix_acl *jffs2_get_acl(struct inode *inode, int type)
+{
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+	struct posix_acl *acl;
+	char *value = NULL;
+	int rc, xprefix;
+
+	switch (type) {
+	case ACL_TYPE_ACCESS:
+		acl = jffs2_iget_acl(inode, &f->i_acl_access);
+		if (acl != JFFS2_ACL_NOT_CACHED)
+			return acl;
+		xprefix = JFFS2_XPREFIX_ACL_ACCESS;
+		break;
+	case ACL_TYPE_DEFAULT:
+		acl = jffs2_iget_acl(inode, &f->i_acl_default);
+		if (acl != JFFS2_ACL_NOT_CACHED)
+			return acl;
+		xprefix = JFFS2_XPREFIX_ACL_DEFAULT;
+		break;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+	rc = do_jffs2_getxattr(inode, xprefix, "", NULL, 0);
+	if (rc > 0) {
+		value = kmalloc(rc, GFP_KERNEL);
+		if (!value)
+			return ERR_PTR(-ENOMEM);
+		rc = do_jffs2_getxattr(inode, xprefix, "", value, rc);
+	}
+	if (rc > 0) {
+		acl = jffs2_acl_from_medium(value, rc);
+	} else if (rc == -ENODATA || rc == -ENOSYS) {
+		acl = NULL;
+	} else {
+		acl = ERR_PTR(rc);
+	}
+	if (value)
+		kfree(value);
+	if (!IS_ERR(acl)) {
+		switch (type) {
+		case ACL_TYPE_ACCESS:
+			jffs2_iset_acl(inode, &f->i_acl_access, acl);
+			break;
+		case ACL_TYPE_DEFAULT:
+			jffs2_iset_acl(inode, &f->i_acl_default, acl);
+			break;
+		}
+	}
+	return acl;
+}
+
+static int jffs2_set_acl(struct inode *inode, int type, struct posix_acl *acl)
+{
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+	size_t size;
+	char *value = NULL;
+	int rc, xprefix;
+
+	if (S_ISLNK(inode->i_mode))
+		return -EOPNOTSUPP;
+
+	switch (type) {
+	case ACL_TYPE_ACCESS:
+		xprefix = JFFS2_XPREFIX_ACL_ACCESS;
+		if (acl) {
+			mode_t mode = inode->i_mode;
+			rc = posix_acl_equiv_mode(acl, &mode);
+			if (rc < 0)
+				return rc;
+			if (inode->i_mode != mode) {
+				inode->i_mode = mode;
+				jffs2_dirty_inode(inode);
+			}
+			if (rc == 0)
+				acl = NULL;
+		}
+		break;
+	case ACL_TYPE_DEFAULT:
+		xprefix = JFFS2_XPREFIX_ACL_DEFAULT;
+		if (!S_ISDIR(inode->i_mode))
+			return acl ? -EACCES : 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+	if (acl) {
+		value = jffs2_acl_to_medium(acl, &size);
+		if (IS_ERR(value))
+			return PTR_ERR(value);
+	}
+
+	rc = do_jffs2_setxattr(inode, xprefix, "", value, size, 0);
+
+	if (value)
+		kfree(value);
+	if (!rc) {
+		switch(type) {
+		case ACL_TYPE_ACCESS:
+			jffs2_iset_acl(inode, &f->i_acl_access, acl);
+			break;
+		case ACL_TYPE_DEFAULT:
+			jffs2_iset_acl(inode, &f->i_acl_default, acl);
+			break;
+		}
+	}
+	return rc;
+}
+
+static int jffs2_check_acl(struct inode *inode, int mask)
+{
+	struct posix_acl *acl;
+	int rc;
+
+	acl = jffs2_get_acl(inode, ACL_TYPE_ACCESS);
+	if (IS_ERR(acl))
+		return PTR_ERR(acl);
+	if (acl) {
+		rc = posix_acl_permission(inode, acl, mask);
+		posix_acl_release(acl);
+		return rc;
+	}
+	return -EAGAIN;
+}
+
+int jffs2_permission(struct inode *inode, int mask, struct nameidata *nd)
+{
+	return generic_permission(inode, mask, jffs2_check_acl);
+}
+
+int jffs2_init_acl(struct inode *inode, struct inode *dir)
+{
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+	struct posix_acl *acl = NULL, *clone;
+	mode_t mode;
+	int rc = 0;
+
+	f->i_acl_access = JFFS2_ACL_NOT_CACHED;
+	f->i_acl_default = JFFS2_ACL_NOT_CACHED;
+	if (!S_ISLNK(inode->i_mode)) {
+		acl = jffs2_get_acl(dir, ACL_TYPE_DEFAULT);
+		if (IS_ERR(acl))
+			return PTR_ERR(acl);
+		if (!acl)
+			inode->i_mode &= ~current->fs->umask;
+	}
+	if (acl) {
+		if (S_ISDIR(inode->i_mode)) {
+			rc = jffs2_set_acl(inode, ACL_TYPE_DEFAULT, acl);
+			if (rc)
+				goto cleanup;
+		}
+		clone = posix_acl_clone(acl, GFP_KERNEL);
+		rc = -ENOMEM;
+		if (!clone)
+			goto cleanup;
+		mode = inode->i_mode;
+		rc = posix_acl_create_masq(clone, &mode);
+		if (rc >= 0) {
+			inode->i_mode = mode;
+			if (rc > 0)
+				rc = jffs2_set_acl(inode, ACL_TYPE_ACCESS, clone);
+		}
+		posix_acl_release(clone);
+	}
+ cleanup:
+	posix_acl_release(acl);
+	return rc;
+}
+
+void jffs2_clear_acl(struct inode *inode)
+{
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+
+	if (f->i_acl_access && f->i_acl_access != JFFS2_ACL_NOT_CACHED) {
+		posix_acl_release(f->i_acl_access);
+		f->i_acl_access = JFFS2_ACL_NOT_CACHED;
+	}
+	if (f->i_acl_default && f->i_acl_default != JFFS2_ACL_NOT_CACHED) {
+		posix_acl_release(f->i_acl_default);
+		f->i_acl_default = JFFS2_ACL_NOT_CACHED;
+	}
+}
+
+int jffs2_acl_chmod(struct inode *inode)
+{
+	struct posix_acl *acl, *clone;
+	int rc;
+
+	if (S_ISLNK(inode->i_mode))
+		return -EOPNOTSUPP;
+	acl = jffs2_get_acl(inode, ACL_TYPE_ACCESS);
+	if (IS_ERR(acl) || !acl)
+		return PTR_ERR(acl);
+	clone = posix_acl_clone(acl, GFP_KERNEL);
+	posix_acl_release(acl);
+	if (!clone)
+		return -ENOMEM;
+	rc = posix_acl_chmod_masq(clone, inode->i_mode);
+	if (!rc)
+		rc = jffs2_set_acl(inode, ACL_TYPE_ACCESS, clone);
+	posix_acl_release(clone);
+	return rc;
+}
+
+static size_t jffs2_acl_access_listxattr(struct inode *inode, char *list, size_t list_size,
+					 const char *name, size_t name_len)
+{
+	const int retlen = sizeof(POSIX_ACL_XATTR_ACCESS);
+
+	if (list && retlen <= list_size)
+		strcpy(list, POSIX_ACL_XATTR_ACCESS);
+	return retlen;
+}
+
+static size_t jffs2_acl_default_listxattr(struct inode *inode, char *list, size_t list_size,
+					  const char *name, size_t name_len)
+{
+	const int retlen = sizeof(POSIX_ACL_XATTR_DEFAULT);
+
+	if (list && retlen <= list_size)
+		strcpy(list, POSIX_ACL_XATTR_DEFAULT);
+	return retlen;
+}
+
+static int jffs2_acl_getxattr(struct inode *inode, int type, void *buffer, size_t size)
+{
+	struct posix_acl *acl;
+	int rc;
+
+	acl = jffs2_get_acl(inode, type);
+	if (IS_ERR(acl))
+		return PTR_ERR(acl);
+	if (!acl)
+		return -ENODATA;
+	rc = posix_acl_to_xattr(acl, buffer, size);
+	posix_acl_release(acl);
+
+	return rc;
+}
+
+static int jffs2_acl_access_getxattr(struct inode *inode, const char *name, void *buffer, size_t size)
+{
+	if (name[0] != '\0')
+		return -EINVAL;
+	return jffs2_acl_getxattr(inode, ACL_TYPE_ACCESS, buffer, size);
+}
+
+static int jffs2_acl_default_getxattr(struct inode *inode, const char *name, void *buffer, size_t size)
+{
+	if (name[0] != '\0')
+		return -EINVAL;
+	return jffs2_acl_getxattr(inode, ACL_TYPE_DEFAULT, buffer, size);
+}
+
+static int jffs2_acl_setxattr(struct inode *inode, int type, const void *value, size_t size)
+{
+	struct posix_acl *acl;
+	int rc;
+
+	if ((current->fsuid != inode->i_uid) && !capable(CAP_FOWNER))
+		return -EPERM;
+
+	if (value) {
+		acl = posix_acl_from_xattr(value, size);
+		if (IS_ERR(acl))
+			return PTR_ERR(acl);
+		if (acl) {
+			rc = posix_acl_valid(acl);
+			if (rc)
+				goto out;
+		}
+	} else {
+		acl = NULL;
+	}
+	rc = jffs2_set_acl(inode, type, acl);
+ out:
+	posix_acl_release(acl);
+	return rc;
+}
+
+static int jffs2_acl_access_setxattr(struct inode *inode, const char *name,
+				     const void *buffer, size_t size, int flags)
+{
+	if (name[0] != '\0')
+		return -EINVAL;
+	return jffs2_acl_setxattr(inode, ACL_TYPE_ACCESS, buffer, size);
+}
+
+static int jffs2_acl_default_setxattr(struct inode *inode, const char *name,
+				      const void *buffer, size_t size, int flags)
+{
+	if (name[0] != '\0')
+		return -EINVAL;
+	return jffs2_acl_setxattr(inode, ACL_TYPE_DEFAULT, buffer, size);
+}
+
+struct xattr_handler jffs2_acl_access_xattr_handler = {
+	.prefix	= POSIX_ACL_XATTR_ACCESS,
+	.list	= jffs2_acl_access_listxattr,
+	.get	= jffs2_acl_access_getxattr,
+	.set	= jffs2_acl_access_setxattr,
+};
+
+struct xattr_handler jffs2_acl_default_xattr_handler = {
+	.prefix	= POSIX_ACL_XATTR_DEFAULT,
+	.list	= jffs2_acl_default_listxattr,
+	.get	= jffs2_acl_default_getxattr,
+	.set	= jffs2_acl_default_setxattr,
+};
diff -prNU3 mtd-20051127/fs/jffs2/acl.h mtd-20051127.xattr/fs/jffs2/acl.h
--- mtd-20051127/fs/jffs2/acl.h	1969-12-31 19:00:00.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/acl.h	2005-11-27 00:00:13.000000000 -0500
@@ -0,0 +1,46 @@
+/*-------------------------------------------------------------------------*
+ *  File: fs/jffs2/acl.h
+ *  POSIX ACL support on JFFS2 FileSystem
+ *
+ *  Implemented by KaiGai Kohei <kaigai@ak.jp.nec.com>
+ *  Copyright (C) 2005 NEC Corporation
+ *
+ *  For licensing information, see the file 'LICENCE' in the jffs2 directory.
+ *-------------------------------------------------------------------------*/
+typedef struct {
+	jint16_t	e_tag;
+	jint16_t	e_perm;
+	jint32_t	e_id;
+} jffs2_acl_entry;
+
+typedef struct {
+	jint16_t	e_tag;
+	jint16_t	e_perm;
+} jffs2_acl_entry_short;
+
+typedef struct {
+	jint32_t	a_version;
+} jffs2_acl_header;
+
+#ifdef CONFIG_JFFS2_FS_POSIX_ACL
+
+#define JFFS2_ACL_NOT_CACHED ((void *)-1)
+
+extern int jffs2_permission(struct inode *, int, struct nameidata *);
+extern int jffs2_acl_chmod(struct inode *);
+extern int jffs2_init_acl(struct inode *, struct inode *);
+extern void jffs2_clear_acl(struct inode *);
+
+extern struct xattr_handler jffs2_acl_access_xattr_handler;
+extern struct xattr_handler jffs2_acl_default_xattr_handler;
+
+#else
+
+#define jffs2_permission NULL
+static inline int jffs2_acl_chmod(struct inode *inode) { return 0; }
+static inline int jffs2_init_acl(struct inode *inode, struct inode *dir) { return 0; }
+static inline void jffs2_clear_acl(struct inode *inode) {}
+
+#endif
+
+
diff -prNU3 mtd-20051127/fs/jffs2/build.c mtd-20051127.xattr/fs/jffs2/build.c
--- mtd-20051127/fs/jffs2/build.c	2005-11-18 20:02:12.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/build.c	2005-11-27 00:00:13.000000000 -0500
@@ -160,6 +160,7 @@ static int jffs2_build_filesystem(struct
 		ic->scan_dents = NULL;
 		cond_resched();
 	}
+	jffs2_build_xattr_subsystem(c);
 	c->flags &= ~JFFS2_SB_FLAG_BUILDING;
 
 	dbg_fsbuild("FS build complete\n");
@@ -178,6 +179,7 @@ exit:
 				jffs2_free_full_dirent(fd);
 			}
 		}
+		jffs2_clear_xattr_subsystem(c);
 	}
 
 	return ret;
diff -prNU3 mtd-20051127/fs/jffs2/dir.c mtd-20051127.xattr/fs/jffs2/dir.c
--- mtd-20051127/fs/jffs2/dir.c	2005-11-07 20:02:14.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/dir.c	2005-11-27 00:00:13.000000000 -0500
@@ -57,7 +57,12 @@ struct inode_operations jffs2_dir_inode_
 	.rmdir =	jffs2_rmdir,
 	.mknod =	jffs2_mknod,
 	.rename =	jffs2_rename,
+	.permission =	jffs2_permission,
 	.setattr =	jffs2_setattr,
+	.setxattr =	jffs2_setxattr,
+	.getxattr =	jffs2_getxattr,
+	.listxattr =	jffs2_listxattr,
+	.removexattr =	jffs2_removexattr
 };
 
 /***********************************************************************/
@@ -206,12 +211,15 @@ static int jffs2_create(struct inode *di
 	ret = jffs2_do_create(c, dir_f, f, ri,
 			      dentry->d_name.name, dentry->d_name.len);
 
-	if (ret) {
-		make_bad_inode(inode);
-		iput(inode);
-		jffs2_free_raw_inode(ri);
-		return ret;
-	}
+	if (ret)
+		goto fail;
+
+	ret = jffs2_init_security(inode, dir_i);
+	if (ret)
+		goto fail;
+	ret = jffs2_init_acl(inode, dir_i);
+	if (ret)
+		goto fail;
 
 	dir_i->i_mtime = dir_i->i_ctime = ITIME(je32_to_cpu(ri->ctime));
 
@@ -221,6 +229,12 @@ static int jffs2_create(struct inode *di
 	D1(printk(KERN_DEBUG "jffs2_create: Created ino #%lu with mode %o, nlink %d(%d). nrpages %ld\n",
 		  inode->i_ino, inode->i_mode, inode->i_nlink, f->inocache->nlink, inode->i_mapping->nrpages));
 	return 0;
+
+ fail:
+	make_bad_inode(inode);
+	iput(inode);
+	jffs2_free_raw_inode(ri);
+	return ret;
 }
 
 /***********************************************************************/
@@ -371,6 +385,18 @@ static int jffs2_symlink (struct inode *
 	up(&f->sem);
 
 	jffs2_complete_reservation(c);
+
+	ret = jffs2_init_security(inode, dir_i);
+	if (ret) {
+		jffs2_clear_inode(inode);
+		return ret;
+	}
+	ret = jffs2_init_acl(inode, dir_i);
+	if (ret) {
+		jffs2_clear_inode(inode);
+		return ret;
+	}
+
 	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen,
 				ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
 	if (ret) {
@@ -501,6 +527,18 @@ static int jffs2_mkdir (struct inode *di
 	up(&f->sem);
 
 	jffs2_complete_reservation(c);
+
+	ret = jffs2_init_security(inode, dir_i);
+	if (ret) {
+		jffs2_clear_inode(inode);
+		return ret;
+	}
+	ret = jffs2_init_acl(inode, dir_i);
+	if (ret) {
+		jffs2_clear_inode(inode);
+		return ret;
+	}
+
 	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen,
 				ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
 	if (ret) {
@@ -657,6 +695,18 @@ static int jffs2_mknod (struct inode *di
 	up(&f->sem);
 
 	jffs2_complete_reservation(c);
+
+	ret = jffs2_init_security(inode, dir_i);
+	if (ret) {
+		jffs2_clear_inode(inode);
+		return ret;
+	}
+	ret = jffs2_init_acl(inode, dir_i);
+	if (ret) {
+		jffs2_clear_inode(inode);
+		return ret;
+	}
+
 	ret = jffs2_reserve_space(c, sizeof(*rd)+namelen, &phys_ofs, &alloclen,
 				ALLOC_NORMAL, JFFS2_SUMMARY_DIRENT_SIZE(namelen));
 	if (ret) {
diff -prNU3 mtd-20051127/fs/jffs2/file.c mtd-20051127.xattr/fs/jffs2/file.c
--- mtd-20051127/fs/jffs2/file.c	2005-11-07 20:02:14.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/file.c	2005-11-27 00:00:13.000000000 -0500
@@ -54,7 +54,12 @@ struct file_operations jffs2_file_operat
 
 struct inode_operations jffs2_file_inode_operations =
 {
-	.setattr =	jffs2_setattr
+	.permission =	jffs2_permission,
+	.setattr =	jffs2_setattr,
+	.setxattr =	jffs2_setxattr,
+	.getxattr =	jffs2_getxattr,
+	.listxattr =	jffs2_listxattr,
+	.removexattr =	jffs2_removexattr
 };
 
 struct address_space_operations jffs2_file_address_operations =
diff -prNU3 mtd-20051127/fs/jffs2/fs.c mtd-20051127.xattr/fs/jffs2/fs.c
--- mtd-20051127/fs/jffs2/fs.c	2005-11-24 20:02:10.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/fs.c	2005-11-27 00:00:13.000000000 -0500
@@ -179,7 +179,12 @@ static int jffs2_do_setattr (struct inod
 
 int jffs2_setattr(struct dentry *dentry, struct iattr *iattr)
 {
-	return jffs2_do_setattr(dentry->d_inode, iattr);
+	int rc;
+
+	rc = jffs2_do_setattr(dentry->d_inode, iattr);
+	if (!rc)
+		rc = jffs2_acl_chmod(dentry->d_inode);
+	return rc;
 }
 
 int jffs2_statfs(struct super_block *sb, struct kstatfs *buf)
@@ -218,6 +223,7 @@ void jffs2_clear_inode (struct inode *in
 
 	D1(printk(KERN_DEBUG "jffs2_clear_inode(): ino #%lu mode %o\n", inode->i_ino, inode->i_mode));
 
+	jffs2_xattr_delete_inode(c, f->inocache);
 	jffs2_do_clear_inode(c, f);
 }
 
@@ -492,9 +498,12 @@ int jffs2_do_fill_super(struct super_blo
 	}
 	memset(c->inocache_list, 0, INOCACHE_HASHSIZE * sizeof(struct jffs2_inode_cache *));
 
-	if ((ret = jffs2_do_mount_fs(c)))
+	if ((ret = jffs2_init_xattr_subsystem(c)))
 		goto out_inohash;
 
+	if ((ret = jffs2_do_mount_fs(c)))
+		goto out_xattr;
+
 	ret = -EINVAL;
 
 	D1(printk(KERN_DEBUG "jffs2_do_fill_super(): Getting root inode\n"));
@@ -522,6 +531,8 @@ int jffs2_do_fill_super(struct super_blo
 	jffs2_free_ino_caches(c);
 	jffs2_free_raw_node_refs(c);
 	jffs2_free_eraseblocks(c);
+ out_xattr:
+	jffs2_clear_xattr_subsystem(c);
  out_inohash:
 	kfree(c->inocache_list);
  out_wbuf:
diff -prNU3 mtd-20051127/fs/jffs2/fs.c.orig mtd-20051127.xattr/fs/jffs2/fs.c.orig
--- mtd-20051127/fs/jffs2/fs.c.orig	1969-12-31 19:00:00.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/fs.c.orig	2005-11-27 00:00:13.000000000 -0500
@@ -0,0 +1,683 @@
+/*
+ * JFFS2 -- Journalling Flash File System, Version 2.
+ *
+ * Copyright (C) 2001-2003 Red Hat, Inc.
+ *
+ * Created by David Woodhouse <dwmw2@infradead.org>
+ *
+ * For licensing information, see the file 'LICENCE' in this directory.
+ *
+ * $Id: fs.c,v 1.70 2005/11/24 16:13:24 dedekind Exp $
+ *
+ */
+
+#include <linux/config.h>
+#include <linux/kernel.h>
+#include <linux/sched.h>
+#include <linux/fs.h>
+#include <linux/list.h>
+#include <linux/mtd/mtd.h>
+#include <linux/pagemap.h>
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+#include <linux/vfs.h>
+#include <linux/crc32.h>
+#include "nodelist.h"
+
+static int jffs2_flash_setup(struct jffs2_sb_info *c);
+
+static int jffs2_do_setattr (struct inode *inode, struct iattr *iattr)
+{
+	struct jffs2_full_dnode *old_metadata, *new_metadata;
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+	struct jffs2_raw_inode *ri;
+	unsigned short dev;
+	unsigned char *mdata = NULL;
+	int mdatalen = 0;
+	unsigned int ivalid;
+	uint32_t phys_ofs, alloclen;
+	int ret;
+	D1(printk(KERN_DEBUG "jffs2_setattr(): ino #%lu\n", inode->i_ino));
+	ret = inode_change_ok(inode, iattr);
+	if (ret)
+		return ret;
+
+	/* Special cases - we don't want more than one data node
+	   for these types on the medium at any time. So setattr
+	   must read the original data associated with the node
+	   (i.e. the device numbers or the target name) and write
+	   it out again with the appropriate data attached */
+	if (S_ISBLK(inode->i_mode) || S_ISCHR(inode->i_mode)) {
+		/* For these, we don't actually need to read the old node */
+		dev = old_encode_dev(inode->i_rdev);
+		mdata = (char *)&dev;
+		mdatalen = sizeof(dev);
+		D1(printk(KERN_DEBUG "jffs2_setattr(): Writing %d bytes of kdev_t\n", mdatalen));
+	} else if (S_ISLNK(inode->i_mode)) {
+		mdatalen = f->metadata->size;
+		mdata = kmalloc(f->metadata->size, GFP_USER);
+		if (!mdata)
+			return -ENOMEM;
+		ret = jffs2_read_dnode(c, f, f->metadata, mdata, 0, mdatalen);
+		if (ret) {
+			kfree(mdata);
+			return ret;
+		}
+		D1(printk(KERN_DEBUG "jffs2_setattr(): Writing %d bytes of symlink target\n", mdatalen));
+	}
+
+	ri = jffs2_alloc_raw_inode();
+	if (!ri) {
+		if (S_ISLNK(inode->i_mode))
+			kfree(mdata);
+		return -ENOMEM;
+	}
+
+	ret = jffs2_reserve_space(c, sizeof(*ri) + mdatalen, &phys_ofs, &alloclen,
+				ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
+	if (ret) {
+		jffs2_free_raw_inode(ri);
+		if (S_ISLNK(inode->i_mode & S_IFMT))
+			 kfree(mdata);
+		return ret;
+	}
+	down(&f->sem);
+	ivalid = iattr->ia_valid;
+
+	ri->magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	ri->nodetype = cpu_to_je16(JFFS2_NODETYPE_INODE);
+	ri->totlen = cpu_to_je32(sizeof(*ri) + mdatalen);
+	ri->hdr_crc = cpu_to_je32(crc32(0, ri, sizeof(struct jffs2_unknown_node)-4));
+
+	ri->ino = cpu_to_je32(inode->i_ino);
+	ri->version = cpu_to_je32(++f->highest_version);
+
+	ri->uid = cpu_to_je16((ivalid & ATTR_UID)?iattr->ia_uid:inode->i_uid);
+	ri->gid = cpu_to_je16((ivalid & ATTR_GID)?iattr->ia_gid:inode->i_gid);
+
+	if (ivalid & ATTR_MODE)
+		if (iattr->ia_mode & S_ISGID &&
+		    !in_group_p(je16_to_cpu(ri->gid)) && !capable(CAP_FSETID))
+			ri->mode = cpu_to_jemode(iattr->ia_mode & ~S_ISGID);
+		else
+			ri->mode = cpu_to_jemode(iattr->ia_mode);
+	else
+		ri->mode = cpu_to_jemode(inode->i_mode);
+
+
+	ri->isize = cpu_to_je32((ivalid & ATTR_SIZE)?iattr->ia_size:inode->i_size);
+	ri->atime = cpu_to_je32(I_SEC((ivalid & ATTR_ATIME)?iattr->ia_atime:inode->i_atime));
+	ri->mtime = cpu_to_je32(I_SEC((ivalid & ATTR_MTIME)?iattr->ia_mtime:inode->i_mtime));
+	ri->ctime = cpu_to_je32(I_SEC((ivalid & ATTR_CTIME)?iattr->ia_ctime:inode->i_ctime));
+
+	ri->offset = cpu_to_je32(0);
+	ri->csize = ri->dsize = cpu_to_je32(mdatalen);
+	ri->compr = JFFS2_COMPR_NONE;
+	if (ivalid & ATTR_SIZE && inode->i_size < iattr->ia_size) {
+		/* It's an extension. Make it a hole node */
+		ri->compr = JFFS2_COMPR_ZERO;
+		ri->dsize = cpu_to_je32(iattr->ia_size - inode->i_size);
+		ri->offset = cpu_to_je32(inode->i_size);
+	}
+	ri->node_crc = cpu_to_je32(crc32(0, ri, sizeof(*ri)-8));
+	if (mdatalen)
+		ri->data_crc = cpu_to_je32(crc32(0, mdata, mdatalen));
+	else
+		ri->data_crc = cpu_to_je32(0);
+
+	new_metadata = jffs2_write_dnode(c, f, ri, mdata, mdatalen, phys_ofs, ALLOC_NORMAL);
+	if (S_ISLNK(inode->i_mode))
+		kfree(mdata);
+
+	if (IS_ERR(new_metadata)) {
+		jffs2_complete_reservation(c);
+		jffs2_free_raw_inode(ri);
+		up(&f->sem);
+		return PTR_ERR(new_metadata);
+	}
+	/* It worked. Update the inode */
+	inode->i_atime = ITIME(je32_to_cpu(ri->atime));
+	inode->i_ctime = ITIME(je32_to_cpu(ri->ctime));
+	inode->i_mtime = ITIME(je32_to_cpu(ri->mtime));
+	inode->i_mode = jemode_to_cpu(ri->mode);
+	inode->i_uid = je16_to_cpu(ri->uid);
+	inode->i_gid = je16_to_cpu(ri->gid);
+
+
+	old_metadata = f->metadata;
+
+	if (ivalid & ATTR_SIZE && inode->i_size > iattr->ia_size)
+		jffs2_truncate_fragtree (c, &f->fragtree, iattr->ia_size);
+
+	if (ivalid & ATTR_SIZE && inode->i_size < iattr->ia_size) {
+		jffs2_add_full_dnode_to_inode(c, f, new_metadata);
+		inode->i_size = iattr->ia_size;
+		f->metadata = NULL;
+	} else {
+		f->metadata = new_metadata;
+	}
+	if (old_metadata) {
+		jffs2_mark_node_obsolete(c, old_metadata->raw);
+		jffs2_free_full_dnode(old_metadata);
+	}
+	jffs2_free_raw_inode(ri);
+
+	up(&f->sem);
+	jffs2_complete_reservation(c);
+
+	/* We have to do the vmtruncate() without f->sem held, since
+	   some pages may be locked and waiting for it in readpage().
+	   We are protected from a simultaneous write() extending i_size
+	   back past iattr->ia_size, because do_truncate() holds the
+	   generic inode semaphore. */
+	if (ivalid & ATTR_SIZE && inode->i_size > iattr->ia_size)
+		vmtruncate(inode, iattr->ia_size);
+
+	return 0;
+}
+
+int jffs2_setattr(struct dentry *dentry, struct iattr *iattr)
+{
+	return jffs2_do_setattr(dentry->d_inode, iattr);
+}
+
+int jffs2_statfs(struct super_block *sb, struct kstatfs *buf)
+{
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
+	unsigned long avail;
+
+	buf->f_type = JFFS2_SUPER_MAGIC;
+	buf->f_bsize = 1 << PAGE_SHIFT;
+	buf->f_blocks = c->flash_size >> PAGE_SHIFT;
+	buf->f_files = 0;
+	buf->f_ffree = 0;
+	buf->f_namelen = JFFS2_MAX_NAME_LEN;
+
+	spin_lock(&c->erase_completion_lock);
+	avail = c->dirty_size + c->free_size;
+	if (avail > c->sector_size * c->resv_blocks_write)
+		avail -= c->sector_size * c->resv_blocks_write;
+	else
+		avail = 0;
+	spin_unlock(&c->erase_completion_lock);
+
+	buf->f_bavail = buf->f_bfree = avail >> PAGE_SHIFT;
+
+	return 0;
+}
+
+
+void jffs2_clear_inode (struct inode *inode)
+{
+	/* We can forget about this inode for now - drop all
+	 *  the nodelists associated with it, etc.
+	 */
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+
+	D1(printk(KERN_DEBUG "jffs2_clear_inode(): ino #%lu mode %o\n", inode->i_ino, inode->i_mode));
+
+	jffs2_do_clear_inode(c, f);
+}
+
+void jffs2_read_inode (struct inode *inode)
+{
+	struct jffs2_inode_info *f;
+	struct jffs2_sb_info *c;
+	struct jffs2_raw_inode latest_node;
+	int ret;
+
+	D1(printk(KERN_DEBUG "jffs2_read_inode(): inode->i_ino == %lu\n", inode->i_ino));
+
+	f = JFFS2_INODE_INFO(inode);
+	c = JFFS2_SB_INFO(inode->i_sb);
+
+	jffs2_init_inode_info(f);
+	down(&f->sem);
+
+	ret = jffs2_do_read_inode(c, f, inode->i_ino, &latest_node);
+
+	if (ret) {
+		make_bad_inode(inode);
+		up(&f->sem);
+		return;
+	}
+	inode->i_mode = jemode_to_cpu(latest_node.mode);
+	inode->i_uid = je16_to_cpu(latest_node.uid);
+	inode->i_gid = je16_to_cpu(latest_node.gid);
+	inode->i_size = je32_to_cpu(latest_node.isize);
+	inode->i_atime = ITIME(je32_to_cpu(latest_node.atime));
+	inode->i_mtime = ITIME(je32_to_cpu(latest_node.mtime));
+	inode->i_ctime = ITIME(je32_to_cpu(latest_node.ctime));
+
+	inode->i_nlink = f->inocache->nlink;
+
+	inode->i_blksize = PAGE_SIZE;
+	inode->i_blocks = (inode->i_size + 511) >> 9;
+
+	switch (inode->i_mode & S_IFMT) {
+		jint16_t rdev;
+
+	case S_IFLNK:
+		inode->i_op = &jffs2_symlink_inode_operations;
+		break;
+
+	case S_IFDIR:
+	{
+		struct jffs2_full_dirent *fd;
+
+		for (fd=f->dents; fd; fd = fd->next) {
+			if (fd->type == DT_DIR && fd->ino)
+				inode->i_nlink++;
+		}
+		/* and '..' */
+		inode->i_nlink++;
+		/* Root dir gets i_nlink 3 for some reason */
+		if (inode->i_ino == 1)
+			inode->i_nlink++;
+
+		inode->i_op = &jffs2_dir_inode_operations;
+		inode->i_fop = &jffs2_dir_operations;
+		break;
+	}
+	case S_IFREG:
+		inode->i_op = &jffs2_file_inode_operations;
+		inode->i_fop = &jffs2_file_operations;
+		inode->i_mapping->a_ops = &jffs2_file_address_operations;
+		inode->i_mapping->nrpages = 0;
+		break;
+
+	case S_IFBLK:
+	case S_IFCHR:
+		/* Read the device numbers from the media */
+		D1(printk(KERN_DEBUG "Reading device numbers from flash\n"));
+		if (jffs2_read_dnode(c, f, f->metadata, (char *)&rdev, 0, sizeof(rdev)) < 0) {
+			/* Eep */
+			printk(KERN_NOTICE "Read device numbers for inode %lu failed\n", (unsigned long)inode->i_ino);
+			up(&f->sem);
+			jffs2_do_clear_inode(c, f);
+			make_bad_inode(inode);
+			return;
+		}
+
+	case S_IFSOCK:
+	case S_IFIFO:
+		inode->i_op = &jffs2_file_inode_operations;
+		init_special_inode(inode, inode->i_mode,
+				   old_decode_dev((je16_to_cpu(rdev))));
+		break;
+
+	default:
+		printk(KERN_WARNING "jffs2_read_inode(): Bogus imode %o for ino %lu\n", inode->i_mode, (unsigned long)inode->i_ino);
+	}
+
+	up(&f->sem);
+
+	D1(printk(KERN_DEBUG "jffs2_read_inode() returning\n"));
+}
+
+void jffs2_dirty_inode(struct inode *inode)
+{
+	struct iattr iattr;
+
+	if (!(inode->i_state & I_DIRTY_DATASYNC)) {
+		D2(printk(KERN_DEBUG "jffs2_dirty_inode() not calling setattr() for ino #%lu\n", inode->i_ino));
+		return;
+	}
+
+	D1(printk(KERN_DEBUG "jffs2_dirty_inode() calling setattr() for ino #%lu\n", inode->i_ino));
+
+	iattr.ia_valid = ATTR_MODE|ATTR_UID|ATTR_GID|ATTR_ATIME|ATTR_MTIME|ATTR_CTIME;
+	iattr.ia_mode = inode->i_mode;
+	iattr.ia_uid = inode->i_uid;
+	iattr.ia_gid = inode->i_gid;
+	iattr.ia_atime = inode->i_atime;
+	iattr.ia_mtime = inode->i_mtime;
+	iattr.ia_ctime = inode->i_ctime;
+
+	jffs2_do_setattr(inode, &iattr);
+}
+
+int jffs2_remount_fs (struct super_block *sb, int *flags, char *data)
+{
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
+
+	if (c->flags & JFFS2_SB_FLAG_RO && !(sb->s_flags & MS_RDONLY))
+		return -EROFS;
+
+	/* We stop if it was running, then restart if it needs to.
+	   This also catches the case where it was stopped and this
+	   is just a remount to restart it.
+	   Flush the writebuffer, if neccecary, else we loose it */
+	if (!(sb->s_flags & MS_RDONLY)) {
+		jffs2_stop_garbage_collect_thread(c);
+		down(&c->alloc_sem);
+		jffs2_flush_wbuf_pad(c);
+		up(&c->alloc_sem);
+	}
+
+	if (!(*flags & MS_RDONLY))
+		jffs2_start_garbage_collect_thread(c);
+
+	*flags |= MS_NOATIME;
+
+	return 0;
+}
+
+void jffs2_write_super (struct super_block *sb)
+{
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(sb);
+	sb->s_dirt = 0;
+
+	if (sb->s_flags & MS_RDONLY)
+		return;
+
+	D1(printk(KERN_DEBUG "jffs2_write_super()\n"));
+	jffs2_garbage_collect_trigger(c);
+	jffs2_erase_pending_blocks(c, 0);
+	jffs2_flush_wbuf_gc(c, 0);
+}
+
+
+/* jffs2_new_inode: allocate a new inode and inocache, add it to the hash,
+   fill in the raw_inode while you're at it. */
+struct inode *jffs2_new_inode (struct inode *dir_i, int mode, struct jffs2_raw_inode *ri)
+{
+	struct inode *inode;
+	struct super_block *sb = dir_i->i_sb;
+	struct jffs2_sb_info *c;
+	struct jffs2_inode_info *f;
+	int ret;
+
+	D1(printk(KERN_DEBUG "jffs2_new_inode(): dir_i %ld, mode 0x%x\n", dir_i->i_ino, mode));
+
+	c = JFFS2_SB_INFO(sb);
+
+	inode = new_inode(sb);
+
+	if (!inode)
+		return ERR_PTR(-ENOMEM);
+
+	f = JFFS2_INODE_INFO(inode);
+	jffs2_init_inode_info(f);
+	down(&f->sem);
+
+	memset(ri, 0, sizeof(*ri));
+	/* Set OS-specific defaults for new inodes */
+	ri->uid = cpu_to_je16(current->fsuid);
+
+	if (dir_i->i_mode & S_ISGID) {
+		ri->gid = cpu_to_je16(dir_i->i_gid);
+		if (S_ISDIR(mode))
+			mode |= S_ISGID;
+	} else {
+		ri->gid = cpu_to_je16(current->fsgid);
+	}
+	ri->mode =  cpu_to_jemode(mode);
+	ret = jffs2_do_new_inode (c, f, mode, ri);
+	if (ret) {
+		make_bad_inode(inode);
+		iput(inode);
+		return ERR_PTR(ret);
+	}
+	inode->i_nlink = 1;
+	inode->i_ino = je32_to_cpu(ri->ino);
+	inode->i_mode = jemode_to_cpu(ri->mode);
+	inode->i_gid = je16_to_cpu(ri->gid);
+	inode->i_uid = je16_to_cpu(ri->uid);
+	inode->i_atime = inode->i_ctime = inode->i_mtime = CURRENT_TIME_SEC;
+	ri->atime = ri->mtime = ri->ctime = cpu_to_je32(I_SEC(inode->i_mtime));
+
+	inode->i_blksize = PAGE_SIZE;
+	inode->i_blocks = 0;
+	inode->i_size = 0;
+
+	insert_inode_hash(inode);
+
+	return inode;
+}
+
+
+int jffs2_do_fill_super(struct super_block *sb, void *data, int silent)
+{
+	struct jffs2_sb_info *c;
+	struct inode *root_i;
+	int ret;
+	size_t blocks;
+
+	c = JFFS2_SB_INFO(sb);
+
+#ifndef CONFIG_JFFS2_FS_WRITEBUFFER
+	if (c->mtd->type == MTD_NANDFLASH) {
+		printk(KERN_ERR "jffs2: Cannot operate on NAND flash unless jffs2 NAND support is compiled in.\n");
+		return -EINVAL;
+	}
+	if (c->mtd->type == MTD_DATAFLASH) {
+		printk(KERN_ERR "jffs2: Cannot operate on DataFlash unless jffs2 DataFlash support is compiled in.\n");
+		return -EINVAL;
+	}
+#endif
+
+	c->flash_size = c->mtd->size;
+	c->sector_size = c->mtd->erasesize;
+	blocks = c->flash_size / c->sector_size;
+
+	/*
+	 * Size alignment check
+	 */
+	if ((c->sector_size * blocks) != c->flash_size) {
+		c->flash_size = c->sector_size * blocks;
+		printk(KERN_INFO "jffs2: Flash size not aligned to erasesize, reducing to %dKiB\n",
+			c->flash_size / 1024);
+	}
+
+	if (c->flash_size < 5*c->sector_size) {
+		printk(KERN_ERR "jffs2: Too few erase blocks (%d)\n", c->flash_size / c->sector_size);
+		return -EINVAL;
+	}
+
+	c->cleanmarker_size = sizeof(struct jffs2_unknown_node);
+	c->ebh_size = PAD(sizeof(struct jffs2_raw_ebh));
+
+	/* NAND (or other bizarre) flash... do setup accordingly */
+	ret = jffs2_flash_setup(c);
+	if (ret)
+		return ret;
+
+	c->inocache_list = kmalloc(INOCACHE_HASHSIZE * sizeof(struct jffs2_inode_cache *), GFP_KERNEL);
+	if (!c->inocache_list) {
+		ret = -ENOMEM;
+		goto out_wbuf;
+	}
+	memset(c->inocache_list, 0, INOCACHE_HASHSIZE * sizeof(struct jffs2_inode_cache *));
+
+	if ((ret = jffs2_do_mount_fs(c)))
+		goto out_inohash;
+
+	ret = -EINVAL;
+
+	D1(printk(KERN_DEBUG "jffs2_do_fill_super(): Getting root inode\n"));
+	root_i = iget(sb, 1);
+	if (is_bad_inode(root_i)) {
+		D1(printk(KERN_WARNING "get root inode failed\n"));
+		goto out_root_i;
+	}
+
+	D1(printk(KERN_DEBUG "jffs2_do_fill_super(): d_alloc_root()\n"));
+	sb->s_root = d_alloc_root(root_i);
+	if (!sb->s_root)
+		goto out_root_i;
+
+	sb->s_maxbytes = 0xFFFFFFFF;
+	sb->s_blocksize = PAGE_CACHE_SIZE;
+	sb->s_blocksize_bits = PAGE_CACHE_SHIFT;
+	sb->s_magic = JFFS2_SUPER_MAGIC;
+	if (!(sb->s_flags & MS_RDONLY))
+		jffs2_start_garbage_collect_thread(c);
+	return 0;
+
+ out_root_i:
+	iput(root_i);
+	jffs2_free_ino_caches(c);
+	jffs2_free_raw_node_refs(c);
+	jffs2_free_eraseblocks(c);
+ out_inohash:
+	kfree(c->inocache_list);
+ out_wbuf:
+	jffs2_flash_cleanup(c);
+
+	return ret;
+}
+
+void jffs2_gc_release_inode(struct jffs2_sb_info *c,
+				   struct jffs2_inode_info *f)
+{
+	iput(OFNI_EDONI_2SFFJ(f));
+}
+
+struct jffs2_inode_info *jffs2_gc_fetch_inode(struct jffs2_sb_info *c,
+						     int inum, int nlink)
+{
+	struct inode *inode;
+	struct jffs2_inode_cache *ic;
+	if (!nlink) {
+		/* The inode has zero nlink but its nodes weren't yet marked
+		   obsolete. This has to be because we're still waiting for
+		   the final (close() and) iput() to happen.
+
+		   There's a possibility that the final iput() could have
+		   happened while we were contemplating. In order to ensure
+		   that we don't cause a new read_inode() (which would fail)
+		   for the inode in question, we use ilookup() in this case
+		   instead of iget().
+
+		   The nlink can't _become_ zero at this point because we're
+		   holding the alloc_sem, and jffs2_do_unlink() would also
+		   need that while decrementing nlink on any inode.
+		*/
+		inode = ilookup(OFNI_BS_2SFFJ(c), inum);
+		if (!inode) {
+			D1(printk(KERN_DEBUG "ilookup() failed for ino #%u; inode is probably deleted.\n",
+				  inum));
+
+			spin_lock(&c->inocache_lock);
+			ic = jffs2_get_ino_cache(c, inum);
+			if (!ic) {
+				D1(printk(KERN_DEBUG "Inode cache for ino #%u is gone.\n", inum));
+				spin_unlock(&c->inocache_lock);
+				return NULL;
+			}
+			if (ic->state != INO_STATE_CHECKEDABSENT) {
+				/* Wait for progress. Don't just loop */
+				D1(printk(KERN_DEBUG "Waiting for ino #%u in state %d\n",
+					  ic->ino, ic->state));
+				sleep_on_spinunlock(&c->inocache_wq, &c->inocache_lock);
+			} else {
+				spin_unlock(&c->inocache_lock);
+			}
+
+			return NULL;
+		}
+	} else {
+		/* Inode has links to it still; they're not going away because
+		   jffs2_do_unlink() would need the alloc_sem and we have it.
+		   Just iget() it, and if read_inode() is necessary that's OK.
+		*/
+		inode = iget(OFNI_BS_2SFFJ(c), inum);
+		if (!inode)
+			return ERR_PTR(-ENOMEM);
+	}
+	if (is_bad_inode(inode)) {
+		printk(KERN_NOTICE "Eep. read_inode() failed for ino #%u. nlink %d\n",
+		       inum, nlink);
+		/* NB. This will happen again. We need to do something appropriate here. */
+		iput(inode);
+		return ERR_PTR(-EIO);
+	}
+
+	return JFFS2_INODE_INFO(inode);
+}
+
+unsigned char *jffs2_gc_fetch_page(struct jffs2_sb_info *c,
+				   struct jffs2_inode_info *f,
+				   unsigned long offset,
+				   unsigned long *priv)
+{
+	struct inode *inode = OFNI_EDONI_2SFFJ(f);
+	struct page *pg;
+
+	pg = read_cache_page(inode->i_mapping, offset >> PAGE_CACHE_SHIFT,
+			     (void *)jffs2_do_readpage_unlock, inode);
+	if (IS_ERR(pg))
+		return (void *)pg;
+
+	*priv = (unsigned long)pg;
+	return kmap(pg);
+}
+
+void jffs2_gc_release_page(struct jffs2_sb_info *c,
+			   unsigned char *ptr,
+			   unsigned long *priv)
+{
+	struct page *pg = (void *)*priv;
+
+	kunmap(pg);
+	page_cache_release(pg);
+}
+
+static int jffs2_flash_setup(struct jffs2_sb_info *c) {
+	int ret = 0;
+
+	if (jffs2_ebh_oob(c)) {
+		/* NAND flash... do setup accordingly */
+		ret = jffs2_nand_flash_setup(c);
+		if (ret)
+			return ret;
+	}
+
+	/* add setups for other bizarre flashes here... */
+	if (jffs2_nor_ecc(c)) {
+		ret = jffs2_nor_ecc_flash_setup(c);
+		if (ret)
+			return ret;
+	}
+
+	/* and Dataflash */
+	if (jffs2_dataflash(c)) {
+		ret = jffs2_dataflash_setup(c);
+		if (ret)
+			return ret;
+	}
+
+	/* and Intel "Sibley" flash */
+	if (jffs2_nor_wbuf_flash(c)) {
+		ret = jffs2_nor_wbuf_flash_setup(c);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+void jffs2_flash_cleanup(struct jffs2_sb_info *c) {
+
+	if (jffs2_ebh_oob(c)) {
+		jffs2_nand_flash_cleanup(c);
+	}
+
+	/* add cleanups for other bizarre flashes here... */
+	if (jffs2_nor_ecc(c)) {
+		jffs2_nor_ecc_flash_cleanup(c);
+	}
+
+	/* and DataFlash */
+	if (jffs2_dataflash(c)) {
+		jffs2_dataflash_cleanup(c);
+	}
+
+	/* and Intel "Sibley" flash */
+	if (jffs2_nor_wbuf_flash(c)) {
+		jffs2_nor_wbuf_flash_cleanup(c);
+	}
+}
diff -prNU3 mtd-20051127/fs/jffs2/gc.c mtd-20051127.xattr/fs/jffs2/gc.c
--- mtd-20051127/fs/jffs2/gc.c	2005-11-18 20:02:12.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/gc.c	2005-11-27 00:00:13.000000000 -0500
@@ -312,6 +312,16 @@ int jffs2_garbage_collect_pass(struct jf
 
 	ic = jffs2_raw_ref_to_ic(raw);
 
+	/* When 'ic' refers xattr_datum/xattr_ref, this node is GCed as xattr.
+	   We can decide whether this node is inode or xattr by ic->class.
+	   ret = 0 : ic is xattr_datum/xattr_ref, and GC was SUCCESSED.
+	   ret < 0 : ic is xattr_datum/xattr_ref, but GC was FAILED.
+	   ret > 0 : ic is NOT xattr_datum/xattr_ref.
+	*/
+	ret = jffs2_garbage_collect_xattr(c, ic);
+	if (ret <= 0)
+		goto release_sem;
+
 	/* We need to hold the inocache. Either the erase_completion_lock or
 	   the inocache_lock are sufficient; we trade down since the inocache_lock
 	   causes less contention. */
diff -prNU3 mtd-20051127/fs/jffs2/Makefile.common mtd-20051127.xattr/fs/jffs2/Makefile.common
--- mtd-20051127/fs/jffs2/Makefile.common	2005-11-18 20:02:12.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/Makefile.common	2005-11-27 00:00:13.000000000 -0500
@@ -12,6 +12,9 @@ jffs2-y	+= symlink.o build.o erase.o bac
 jffs2-y	+= super.o debug.o wear_leveling.o
 
 jffs2-$(CONFIG_JFFS2_FS_WRITEBUFFER)	+= wbuf.o
+jffs2-$(CONFIG_JFFS2_FS_XATTR)		+= xattr.o
+jffs2-$(CONFIG_JFFS2_FS_SECURITY)	+= security.o
+jffs2-$(CONFIG_JFFS2_FS_POSIX_ACL)	+= acl.o
 jffs2-$(CONFIG_JFFS2_RUBIN)	+= compr_rubin.o
 jffs2-$(CONFIG_JFFS2_RTIME)	+= compr_rtime.o
 jffs2-$(CONFIG_JFFS2_ZLIB)	+= compr_zlib.o
diff -prNU3 mtd-20051127/fs/jffs2/malloc.c mtd-20051127.xattr/fs/jffs2/malloc.c
--- mtd-20051127/fs/jffs2/malloc.c	2005-11-18 20:02:12.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/malloc.c	2005-11-27 00:00:13.000000000 -0500
@@ -28,6 +28,10 @@ static kmem_cache_t *raw_node_ref_slab;
 static kmem_cache_t *node_frag_slab;
 static kmem_cache_t *inode_cache_slab;
 static kmem_cache_t *eraseblock_slab;
+#ifdef CONFIG_JFFS2_FS_XATTR
+static kmem_cache_t *xattr_datum_cache;
+static kmem_cache_t *xattr_ref_cache;
+#endif
 
 static inline int jffs2_blocks_use_vmalloc(struct jffs2_sb_info *c)
 {
@@ -81,8 +85,24 @@ int __init jffs2_create_slab_caches(void
 	inode_cache_slab = kmem_cache_create("jffs2_inode_cache",
 					     sizeof(struct jffs2_inode_cache),
 					     0, 0, NULL, NULL);
-	if (inode_cache_slab)
-		return 0;
+	if (!inode_cache_slab)
+		goto err;
+
+#ifdef CONFIG_JFFS2_FS_XATTR
+	xattr_datum_cache = kmem_cache_create("jffs2_xattr_datum",
+					     sizeof(struct jffs2_xattr_datum),
+					     0, 0, NULL, NULL);
+	if (!xattr_datum_cache)
+		goto err;
+
+	xattr_ref_cache = kmem_cache_create("jffs2_xattr_ref",
+					   sizeof(struct jffs2_xattr_ref),
+					   0, 0, NULL, NULL);
+	if (!xattr_ref_cache)
+		goto err;
+#endif
+
+	return 0;
  err:
 	jffs2_destroy_slab_caches();
 	return -ENOMEM;
@@ -106,6 +126,12 @@ void jffs2_destroy_slab_caches(void)
 		kmem_cache_destroy(inode_cache_slab);
 	if (eraseblock_slab)
 		kmem_cache_destroy(eraseblock_slab);
+#ifdef CONFIG_JFFS2_FS_XATTR
+	if(xattr_datum_cache)
+		kmem_cache_destroy(xattr_datum_cache);
+	if(xattr_ref_cache)
+		kmem_cache_destroy(xattr_ref_cache);
+#endif
 }
 
 struct jffs2_full_dirent *jffs2_alloc_full_dirent(int namesize)
@@ -275,3 +301,33 @@ void jffs2_free_eraseblocks(struct jffs2
 		kfree(c->blocks);
 }
 
+#ifdef CONFIG_JFFS2_FS_XATTR
+struct jffs2_xattr_datum *jffs2_alloc_xattr_datum(void)
+{
+	struct jffs2_xattr_datum *xd;
+	xd = kmem_cache_alloc(xattr_datum_cache, GFP_KERNEL);
+	dbg_memalloc("%p\n", xd);
+	return xd;
+}
+
+void jffs2_free_xattr_datum(struct jffs2_xattr_datum *xd)
+{
+	dbg_memalloc("%p\n", xd);
+	kmem_cache_free(xattr_datum_cache, xd);
+}
+
+struct jffs2_xattr_ref *jffs2_alloc_xattr_ref(void)
+{
+	struct jffs2_xattr_ref *ref;
+	ref = kmem_cache_alloc(xattr_ref_cache, GFP_KERNEL);
+	dbg_memalloc("%p\n", ref);
+	return ref;
+}
+
+void jffs2_free_xattr_ref(struct jffs2_xattr_ref *ref)
+{
+	dbg_memalloc("%p\n", ref);
+	kmem_cache_free(xattr_ref_cache, ref);
+}
+
+#endif
diff -prNU3 mtd-20051127/fs/jffs2/nodelist.c mtd-20051127.xattr/fs/jffs2/nodelist.c
--- mtd-20051127/fs/jffs2/nodelist.c	2005-11-13 20:03:03.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/nodelist.c	2005-11-27 00:00:13.000000000 -0500
@@ -919,6 +919,7 @@ void jffs2_free_ino_caches(struct jffs2_
 		this = c->inocache_list[i];
 		while (this) {
 			next = this->next;
+			jffs2_xattr_free_inode(c, this);
 			jffs2_free_inode_cache(this);
 			this = next;
 		}
diff -prNU3 mtd-20051127/fs/jffs2/nodelist.h mtd-20051127.xattr/fs/jffs2/nodelist.h
--- mtd-20051127/fs/jffs2/nodelist.h	2005-11-18 20:02:12.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/nodelist.h	2005-11-27 00:00:13.000000000 -0500
@@ -20,6 +20,8 @@
 #include <linux/jffs2.h>
 #include <linux/jffs2_fs_sb.h>
 #include <linux/jffs2_fs_i.h>
+#include "xattr.h"
+#include "acl.h"
 #include "summary.h"
 
 #ifdef __ECOS
@@ -107,11 +109,16 @@ struct jffs2_inode_cache {
 		temporary lists of dirents, and later must be set to
 		NULL to mark the end of the raw_node_ref->next_in_ino
 		chain. */
+	u8 class;	/* It's used for identification */
+	u8 flags;
+	uint16_t state;
 	struct jffs2_inode_cache *next;
 	struct jffs2_raw_node_ref *nodes;
 	uint32_t ino;
 	int nlink;
-	int state;
+#ifdef CONFIG_JFFS2_FS_XATTR
+	struct list_head ilist;
+#endif
 };
 
 /* Inode states for 'state' above. We need the 'GC' state to prevent
@@ -125,6 +132,8 @@ struct jffs2_inode_cache {
 #define INO_STATE_READING	5	/* In read_inode() */
 #define INO_STATE_CLEARING	6	/* In clear_inode() */
 
+#define INO_FLAGS_XATTR_CHECKED	0x01	/* has no duplicate xattr_ref */
+
 #define INOCACHE_HASHSIZE 128
 
 /*
@@ -388,6 +397,13 @@ struct jffs2_inode_cache *jffs2_alloc_in
 void jffs2_free_inode_cache(struct jffs2_inode_cache *);
 int jffs2_alloc_eraseblocks(struct jffs2_sb_info *c);
 void jffs2_free_eraseblocks(struct jffs2_sb_info *c);
+#ifdef CONFIG_JFFS2_FS_XATTR
+struct jffs2_xattr_datum *jffs2_alloc_xattr_datum(void);
+void jffs2_free_xattr_datum(struct jffs2_xattr_datum *);
+struct jffs2_xattr_ref *jffs2_alloc_xattr_ref(void);
+void jffs2_free_xattr_ref(struct jffs2_xattr_ref *);
+#endif /* CONFIG_JFFS2_FS_XATTR */
+
 /* gc.c */
 int jffs2_garbage_collect_pass(struct jffs2_sb_info *c);
 
diff -prNU3 mtd-20051127/fs/jffs2/os-linux.h mtd-20051127.xattr/fs/jffs2/os-linux.h
--- mtd-20051127/fs/jffs2/os-linux.h	2005-11-11 20:02:11.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/os-linux.h	2005-11-27 00:00:13.000000000 -0500
@@ -60,6 +60,10 @@ static inline void jffs2_init_inode_info
 	f->target = NULL;
 	f->flags = 0;
 	f->usercompr = 0;
+#ifdef CONFIG_JFFS2_FS_POSIX_ACL
+	f->i_acl_access = JFFS2_ACL_NOT_CACHED;
+	f->i_acl_default = JFFS2_ACL_NOT_CACHED;
+#endif
 }
 
 
diff -prNU3 mtd-20051127/fs/jffs2/readinode.c mtd-20051127.xattr/fs/jffs2/readinode.c
--- mtd-20051127/fs/jffs2/readinode.c	2005-11-11 20:02:11.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/readinode.c	2005-11-27 00:00:13.000000000 -0500
@@ -891,6 +891,7 @@ int jffs2_do_read_inode(struct jffs2_sb_
 		f->inocache->ino = f->inocache->nlink = 1;
 		f->inocache->nodes = (struct jffs2_raw_node_ref *)f->inocache;
 		f->inocache->state = INO_STATE_READING;
+		init_xattr_inode_cache(f->inocache);
 		jffs2_add_ino_cache(c, f->inocache);
 	}
 	if (!f->inocache) {
diff -prNU3 mtd-20051127/fs/jffs2/scan.c mtd-20051127.xattr/fs/jffs2/scan.c
--- mtd-20051127/fs/jffs2/scan.c	2005-11-18 20:02:13.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/scan.c	2005-11-27 00:11:16.000000000 -0500
@@ -299,6 +299,159 @@ int jffs2_scan_classify_jeb(struct jffs2
 		return BLK_STATE_ALLDIRTY;
 }
 
+#ifdef CONFIG_JFFS2_FS_XATTR
+
+#if 1	/* In cleaned up scan.c, this section is not necessary. */
+static inline uint32_t dirty_space(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+				   uint32_t unpadded_space)
+{
+	DIRTY_SPACE(PAD(unpadded_space));
+
+	return PAD(unpadded_space);;
+}
+
+static inline uint32_t used_space(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+				  uint32_t unpadded_space)
+{
+	USED_SPACE(PAD(unpadded_space));
+
+	return PAD(unpadded_space);
+}
+
+#endif	/* In cleaned up scan.c, this section is not necessary. */
+
+static int jffs2_scan_xattr_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+				 struct jffs2_raw_xattr *rx, uint32_t ofs, struct jffs2_summary *s)
+{
+	struct jffs2_xattr_datum *xd;
+	struct jffs2_raw_node_ref *raw;
+	uint32_t crc;
+
+	crc = crc32(0, rx, sizeof(struct jffs2_raw_xattr)-8);
+	if (crc != je32_to_cpu(rx->node_crc)) {
+		printk(KERN_NOTICE "%s node CRC failed on node at 0x%08x: "
+		       "Read 0x%08x, calculated 0x%08x\n",
+		       __FUNCTION__, ofs, je32_to_cpu(rx->node_crc), crc);
+		dirty_space(c, jeb, je32_to_cpu(rx->totlen));
+		return 0;
+	}
+
+	xd = jffs2_find_xattr_datum(c, je32_to_cpu(rx->xid));
+	if (xd) {
+		printk(KERN_NOTICE "%s() duplicate xid=%u found. "
+		       "on node at 0x%08x, later one is ignored.\n",
+		       __FUNCTION__, je32_to_cpu(rx->xid), ofs);
+		dirty_space(c, jeb, je32_to_cpu(rx->totlen));
+		return 0;
+	}
+
+	crc = crc32(0, rx->data, rx->name_len + 1 + je16_to_cpu(rx->value_len));
+	if (crc != je32_to_cpu(rx->data_crc)) {
+		printk(KERN_NOTICE "%s data CRC failed on node at 0x%08x: "
+		       "Read 0x%08x, calculated 0x%08x\n",
+		       __FUNCTION__, ofs, je32_to_cpu(rx->data_crc), crc);
+		dirty_space(c, jeb, je32_to_cpu(rx->totlen));
+		return 0;
+	}
+
+	xd = jffs2_alloc_xattr_datum();
+	if (!xd)
+		return -ENOMEM;
+	init_xattr_datum(xd);
+
+	raw = jffs2_alloc_raw_node_ref();
+	if (!raw) {
+		jffs2_free_xattr_datum(xd);
+		return -ENOMEM;
+	}
+
+	xd->xid = je32_to_cpu(rx->xid);
+	if (xd->xid > c->highest_xseqno)
+		c->highest_xseqno = xd->xid;
+	xd->xprefix = rx->xprefix;	/* 8bit width */
+	xd->name_len = rx->name_len;	/* 8bit width */
+	xd->value_len = je16_to_cpu(rx->value_len);
+	xd->data_crc = je32_to_cpu(rx->data_crc);
+	xd->node = raw;
+
+	raw->__totlen = PAD(je32_to_cpu(rx->totlen));
+	raw->flash_offset = ofs | REF_PRISTINE;
+	raw->next_phys = NULL;
+	raw->next_in_ino = (void *)xd;
+	if (!jeb->first_node)
+		jeb->first_node = raw;
+	if (jeb->last_node)
+		jeb->last_node->next_phys = raw;
+	jeb->last_node = raw;
+
+	used_space(c, jeb, je32_to_cpu(rx->totlen));
+
+	jffs2_attach_xattr_datum(c, xd);
+
+	return 0;
+}
+
+static int jffs2_scan_xref_node(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
+				struct jffs2_raw_xref *rr, uint32_t ofs, struct jffs2_summary *s)
+{
+	struct jffs2_xattr_ref *ref;
+	struct jffs2_raw_node_ref *raw;
+	uint32_t crc;
+
+	crc = crc32(0, rr, sizeof(*rr)-4);
+	if (crc != je32_to_cpu(rr->node_crc)) {
+		printk(KERN_NOTICE "%s node CRC failed on node at 0x%08x: "
+		       "Read 0x%08x, calculated 0x%08x\n",
+		       __FUNCTION__, ofs, je32_to_cpu(rr->node_crc), crc);
+		dirty_space(c, jeb, je32_to_cpu(rr->totlen));
+		return 0;
+	}
+
+	ref = jffs2_alloc_xattr_ref();
+	if (!ref)
+		return -ENOMEM;
+	init_xattr_ref(ref);
+
+	raw = jffs2_alloc_raw_node_ref();
+	if (!raw) {
+		jffs2_free_xattr_ref(ref);
+		return -ENOMEM;
+	}
+
+	/* BEFORE jffs2_build_xattr_subsystem() called, 
+	 * ref->xid is used to store 32bit xid, xd is not used
+	 * ref->ino is used to store 32bit inode-number, ic is not used
+	 * Thoes variables are declared as union, thus using those
+	 * are exclusive. In a similar way, ref->ilist is temporarily
+	 * used to chain all xattr_ref object. It's re-chained to
+	 * jffs2_inode_cache in jffs2_build_xattr_subsystem() correctly.
+	 */
+
+	ref->seqno = je32_to_cpu(rr->seqno);
+	if (ref->seqno > c->highest_xseqno)
+		c->highest_xseqno = ref->seqno;
+	ref->ino = je32_to_cpu(rr->ino);
+	ref->xid = je32_to_cpu(rr->xid);
+	ref->node = raw;
+
+	raw->__totlen = PAD(je32_to_cpu(rr->totlen));
+	raw->flash_offset = ofs | REF_PRISTINE;
+	raw->next_phys = NULL;
+	raw->next_in_ino = (void *)ref;
+	if (!jeb->first_node)
+		jeb->first_node = raw;
+	if (jeb->last_node)
+		jeb->last_node->next_phys = raw;
+	jeb->last_node = raw;
+
+	used_space(c, jeb, je32_to_cpu(rr->totlen));
+
+	list_add_tail(&ref->ilist, &c->xattr_temp);
+
+	return 0;
+}
+#endif
+
 static int jffs2_scan_eraseblock (struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb,
 				unsigned char *buf, uint32_t buf_size, struct jffs2_summary *s) {
 	struct jffs2_unknown_node *node;
@@ -614,6 +767,43 @@ scan_more:
 			ofs += PAD(je32_to_cpu(node->totlen));
 			break;
 
+#ifdef CONFIG_JFFS2_FS_XATTR
+		case JFFS2_NODETYPE_XATTR:
+			if (buf_ofs + buf_len < ofs + je32_to_cpu(node->totlen)) {
+				/* FIXME: In cleaned-up scan.c, this If-block is not necessary. */
+				buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size - ofs);
+				D1(printk(KERN_DEBUG "Fewer than %d bytes (xattr node) left to end of buf."
+					  " Reading 0x%x at 0x%08x\n",je32_to_cpu(node->totlen), buf_len, ofs));
+				err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
+				if (err)
+					return err;
+				buf_ofs = ofs;
+				node = (void *)buf;
+			}
+			err = jffs2_scan_xattr_node(c, jeb, (void *)node, ofs, s);
+			if (err)
+				return err;
+			ofs += PAD(je32_to_cpu(node->totlen));
+			break;
+		case JFFS2_NODETYPE_XREF:
+			if (buf_ofs + buf_len < ofs + je32_to_cpu(node->totlen)) {
+				/* FIXME: In cleaned-up scan.c, this If-block is not necessary. */
+				buf_len = min_t(uint32_t, buf_size, jeb->offset + c->sector_size - ofs);
+				D1(printk(KERN_DEBUG "Fewer than %d bytes (xref node) left to end of buf."
+					  " Reading 0x%x at 0x%08x\n",je32_to_cpu(node->totlen), buf_len, ofs));
+				err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
+				if (err)
+					return err;
+				buf_ofs = ofs;
+				node = (void *)buf;
+			}
+			err = jffs2_scan_xref_node(c, jeb, (void *)node, ofs, s);
+			if (err)
+				return err;
+			ofs += PAD(je32_to_cpu(node->totlen));
+			break;
+#endif	/* CONFIG_JFFS2_FS_XATTR */
+
 		case JFFS2_NODETYPE_CLEANMARKER:
 			D1(printk(KERN_DEBUG "CLEANMARKER node found at 0x%08x\n", ofs));
 			if (je32_to_cpu(node->totlen) != c->cleanmarker_size) {
@@ -741,6 +931,7 @@ struct jffs2_inode_cache *jffs2_scan_mak
 
 	ic->ino = ino;
 	ic->nodes = (void *)ic;
+	init_xattr_inode_cache(ic);
 	jffs2_add_ino_cache(c, ic);
 	if (ino == 1)
 		ic->nlink = 1;
diff -prNU3 mtd-20051127/fs/jffs2/security.c mtd-20051127.xattr/fs/jffs2/security.c
--- mtd-20051127/fs/jffs2/security.c	1969-12-31 19:00:00.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/security.c	2005-11-27 00:00:13.000000000 -0500
@@ -0,0 +1,82 @@
+/*-------------------------------------------------------------------------*
+ *  File: fs/jffs2/security.c
+ *  Security Labels support on JFFS2 FileSystem
+ *
+ *  Implemented by KaiGai Kohei <kaigai@ak.jp.nec.com>
+ *  Copyright (C) 2005 NEC Corporation
+ *
+ *  For licensing information, see the file 'LICENCE' in the jffs2 directory.
+ *-------------------------------------------------------------------------*/
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/fs.h>
+#include <linux/time.h>
+#include <linux/pagemap.h>
+#include <linux/highmem.h>
+#include <linux/crc32.h>
+#include <linux/jffs2.h>
+#include <linux/xattr.h>
+#include <linux/mtd/mtd.h>
+#include <linux/security.h>
+#include "nodelist.h"
+
+/* ---- Initial Security Label Attachment -------------- */
+int jffs2_init_security(struct inode *inode, struct inode *dir)
+{
+	int rc;
+	size_t len;
+	void *value;
+	char *name;
+
+	rc = security_inode_init_security(inode, dir, &name, &value, &len);
+	if (rc) {
+		if (rc == -EOPNOTSUPP)
+			return 0;
+		return rc;
+	}
+	rc = do_jffs2_setxattr(inode, JFFS2_XPREFIX_SECURITY, name, value, len, 0);
+
+        kfree(name);
+        kfree(value);
+        return rc;
+}
+
+/* ---- XATTR Handler for "security.*" ----------------- */
+static int jffs2_security_getxattr(struct inode *inode, const char *name,
+				   void *buffer, size_t size)
+{
+	if (!strcmp(name, ""))
+		return -EINVAL;
+
+	return do_jffs2_getxattr(inode, JFFS2_XPREFIX_SECURITY, name, buffer, size);
+}
+
+static int jffs2_security_setxattr(struct inode *inode, const char *name, const void *buffer,
+				   size_t size, int flags)
+{
+	if (!strcmp(name, ""))
+		return -EINVAL;
+
+	return do_jffs2_setxattr(inode, JFFS2_XPREFIX_SECURITY, name, buffer, size, flags);
+}
+
+static size_t jffs2_security_listxattr(struct inode *inode, char *list, size_t list_size,
+				       const char *name, size_t name_len)
+{
+	size_t retlen = sizeof(XATTR_SECURITY_PREFIX) + name_len;
+
+	if (list && retlen <= list_size) {
+		strcpy(list, XATTR_SECURITY_PREFIX);
+		strcpy(list+sizeof(XATTR_SECURITY_PREFIX)-1, name);
+	}
+
+	return retlen;
+}
+
+struct xattr_handler jffs2_security_xattr_handler = {
+	.prefix = XATTR_SECURITY_PREFIX,
+	.list = jffs2_security_listxattr,
+	.set = jffs2_security_setxattr,
+	.get = jffs2_security_getxattr
+};
diff -prNU3 mtd-20051127/fs/jffs2/super.c mtd-20051127.xattr/fs/jffs2/super.c
--- mtd-20051127/fs/jffs2/super.c	2005-11-24 20:02:11.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/super.c	2005-11-27 00:00:13.000000000 -0500
@@ -151,7 +151,10 @@ static struct super_block *jffs2_get_sb_
 
 	sb->s_op = &jffs2_super_operations;
 	sb->s_flags = flags | MS_NOATIME;
-
+	sb->s_xattr = jffs2_xattr_handlers;
+#ifdef CONFIG_JFFS2_FS_POSIX_ACL
+	sb->s_flags |= MS_POSIXACL;
+#endif
 	ret = jffs2_do_fill_super(sb, data, (flags&MS_VERBOSE)?1:0);
 
 	if (ret) {
@@ -290,6 +293,7 @@ static void jffs2_put_super (struct supe
 	jffs2_free_eraseblocks(c);
 	jffs2_flash_cleanup(c);
 	kfree(c->inocache_list);
+	jffs2_clear_xattr_subsystem(c);
 	if (c->mtd->sync)
 		c->mtd->sync(c->mtd);
 
diff -prNU3 mtd-20051127/fs/jffs2/symlink.c mtd-20051127.xattr/fs/jffs2/symlink.c
--- mtd-20051127/fs/jffs2/symlink.c	2005-11-07 20:02:15.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/symlink.c	2005-11-27 00:00:13.000000000 -0500
@@ -24,7 +24,12 @@ struct inode_operations jffs2_symlink_in
 {
 	.readlink =	generic_readlink,
 	.follow_link =	jffs2_follow_link,
-	.setattr =	jffs2_setattr
+	.permission =	jffs2_permission,
+	.setattr =	jffs2_setattr,
+	.setxattr =	jffs2_setxattr,
+	.getxattr =	jffs2_getxattr,
+	.listxattr =	jffs2_listxattr,
+	.removexattr =	jffs2_removexattr
 };
 
 static void *jffs2_follow_link(struct dentry *dentry, struct nameidata *nd)
diff -prNU3 mtd-20051127/fs/jffs2/write.c mtd-20051127.xattr/fs/jffs2/write.c
--- mtd-20051127/fs/jffs2/write.c	2005-11-11 20:02:11.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/write.c	2005-11-27 00:00:13.000000000 -0500
@@ -36,7 +36,7 @@ int jffs2_do_new_inode(struct jffs2_sb_i
 	f->inocache->nlink = 1;
 	f->inocache->nodes = (struct jffs2_raw_node_ref *)f->inocache;
 	f->inocache->state = INO_STATE_PRESENT;
-
+	init_xattr_inode_cache(f->inocache);
 
 	jffs2_add_ino_cache(c, f->inocache);
 	D1(printk(KERN_DEBUG "jffs2_do_new_inode(): Assigned ino# %d\n", f->inocache->ino));
diff -prNU3 mtd-20051127/fs/jffs2/xattr.c mtd-20051127.xattr/fs/jffs2/xattr.c
--- mtd-20051127/fs/jffs2/xattr.c	1969-12-31 19:00:00.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/xattr.c	2005-11-27 00:00:13.000000000 -0500
@@ -0,0 +1,1021 @@
+/*-------------------------------------------------------------------------*
+ *  File: fs/jffs2/xattr.c
+ *  XATTR support on JFFS2 FileSystem
+ *
+ *  Implemented by KaiGai Kohei <kaigai@ak.jp.nec.com>
+ *  Copyright (C) 2005 NEC Corporation
+ *
+ *  For licensing information, see the file 'LICENCE' in the jffs2 directory.
+ *-------------------------------------------------------------------------*/
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/fs.h>
+#include <linux/time.h>
+#include <linux/pagemap.h>
+#include <linux/highmem.h>
+#include <linux/crc32.h>
+#include <linux/jffs2.h>
+#include <linux/xattr.h>
+#include <linux/mtd/mtd.h>
+#include "nodelist.h"
+
+/* ---- decralation of internal use functions ----------------- */
+static void reclaim_xattr_datum(struct jffs2_sb_info *c);
+static void unload_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd);
+
+static struct jffs2_xattr_datum *create_xattr_datum(struct jffs2_sb_info *c,
+						    int xprefix, const char *xname,
+						    const char *xvalue, int xsize,
+						    uint32_t phys_ofs);
+static void delete_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd);
+
+static struct jffs2_xattr_ref *create_xattr_ref(struct jffs2_sb_info *c,
+						struct jffs2_inode_cache *ic,
+						struct jffs2_xattr_datum *xd,
+						uint32_t phys_ofs);
+static void delete_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref);
+
+/* ---- XATTR Handler for "user.*" --------------------- */
+#define XATTR_USER_PREFIX	"user."
+static int jffs2_user_getxattr(struct inode *inode, const char *name,
+                               void *buffer, size_t size)
+{
+	int ret;
+
+	if (!strcmp(name, ""))
+		return -EINVAL;
+
+	ret = permission(inode, MAY_WRITE, NULL);
+	if (ret)
+		return ret;
+
+	return do_jffs2_getxattr(inode, JFFS2_XPREFIX_USER, name, buffer, size);
+}
+
+static int jffs2_user_setxattr(struct inode *inode, const char *name, const void *buffer,
+                               size_t size, int flags)
+{
+	int ret;
+
+	if (!strcmp(name, "") == 0)
+		return -EINVAL;
+
+	if ( !S_ISREG(inode->i_mode) &&
+	    (!S_ISDIR(inode->i_mode) || inode->i_mode & S_ISVTX))
+		return -EPERM;
+
+	ret = permission(inode, MAY_WRITE, NULL);
+	if (ret)
+		return ret;
+
+	return do_jffs2_setxattr(inode, JFFS2_XPREFIX_USER, name, buffer, size, flags);
+}
+
+static size_t jffs2_user_listxattr(struct inode *inode, char *list, size_t list_size,
+				   const char *name, size_t name_len)
+{
+	int retlen = sizeof(XATTR_USER_PREFIX) + name_len;
+
+	if (list && retlen <= list_size) {
+		strcpy(list, XATTR_USER_PREFIX);
+		strcpy(list+sizeof(XATTR_USER_PREFIX)-1, name);
+	}
+
+	return retlen;
+}
+
+static struct xattr_handler jffs2_user_xattr_handler = {
+	.prefix = XATTR_USER_PREFIX,
+	.list = jffs2_user_listxattr,
+	.set = jffs2_user_setxattr,
+	.get = jffs2_user_getxattr
+};
+
+/* ---- XATTR Handler for "trusted.*" ------------------ */
+#define XATTR_TRUSTED_PREFIX	"trusted."
+static int jffs2_trusted_getxattr(struct inode *inode, const char *name,
+				  void *buffer, size_t size)
+{
+	if (!strcmp(name, ""))
+		return -EINVAL;
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	return do_jffs2_getxattr(inode, JFFS2_XPREFIX_TRUSTED, name, buffer, size);
+}
+
+static int jffs2_trusted_setxattr(struct inode *inode, const char *name, const void *buffer,
+				  size_t size, int flags)
+{
+	if (!strcmp(name, ""))
+		return -EINVAL;
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	return do_jffs2_setxattr(inode, JFFS2_XPREFIX_TRUSTED, name, buffer, size, flags);
+}
+
+static size_t jffs2_trusted_listxattr(struct inode *inode, char *list, size_t list_size,
+				      const char *name, size_t name_len)
+{
+	int retlen = sizeof(XATTR_TRUSTED_PREFIX) + name_len;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return 0; /* ignore this entry */
+
+	if (list && retlen<=list_size) {
+		strcpy(list, XATTR_TRUSTED_PREFIX);
+		strcpy(list+sizeof(XATTR_TRUSTED_PREFIX)-1, name);
+	}
+
+	return retlen;
+}
+
+static struct xattr_handler jffs2_trusted_xattr_handler = {
+	.prefix = XATTR_TRUSTED_PREFIX,
+	.list = jffs2_trusted_listxattr,
+	.set = jffs2_trusted_setxattr,
+	.get = jffs2_trusted_getxattr
+};
+
+/* ----------------------------------------------------- */
+struct xattr_handler *jffs2_xattr_handlers[] = {
+	&jffs2_user_xattr_handler,
+#ifdef CONFIG_JFFS2_FS_SECURITY
+	&jffs2_security_xattr_handler,
+#endif
+#ifdef CONFIG_JFFS2_FS_POSIX_ACL
+	&jffs2_acl_access_xattr_handler,
+	&jffs2_acl_default_xattr_handler,
+#endif
+	&jffs2_trusted_xattr_handler,
+	NULL
+};
+
+static struct xattr_handler *xprefix_to_handler(int xprefix) {
+	struct xattr_handler *ret;
+
+	switch (xprefix) {
+	case JFFS2_XPREFIX_USER:
+		ret = &jffs2_user_xattr_handler;
+		break;
+#ifdef CONFIG_JFFS2_FS_SECURITY
+	case JFFS2_XPREFIX_SECURITY:
+		ret = &jffs2_security_xattr_handler;
+		break;
+#endif
+#ifdef CONFIG_JFFS2_FS_POSIX_ACL
+	case JFFS2_XPREFIX_ACL_ACCESS:
+		ret = &jffs2_acl_access_xattr_handler;
+		break;
+	case JFFS2_XPREFIX_ACL_DEFAULT:
+		ret = &jffs2_acl_default_xattr_handler;
+		break;
+#endif
+	case JFFS2_XPREFIX_TRUSTED:
+		ret = &jffs2_trusted_xattr_handler;
+		break;
+	default:
+		ret = NULL;
+		break;
+	}
+	return ret;
+}
+
+static uint32_t jffs2_xattr_datum_hashkey(int xprefix, const char *xname, const char *xvalue, int xsize)
+{
+	int name_len = strlen(xname);
+
+	return crc32(xprefix, xname, name_len) ^ crc32(xprefix, xvalue, xsize);
+}
+/* ---- Build-up and Destruct XATTR-Cache functions ----------- */
+int jffs2_init_xattr_subsystem(struct jffs2_sb_info *c)
+{
+	int i;
+
+	c->xattrindex = kmalloc((XATTRINDEX_HASHSIZE+1)*sizeof(struct list_head), GFP_KERNEL);
+	if (!c->xattrindex)
+		return -ENOMEM;
+
+	init_rwsem(&c->xattr_sem);
+
+	for (i=0; i<=XATTRINDEX_HASHSIZE; i++)
+		INIT_LIST_HEAD(&c->xattrindex[i]);
+
+	//c->xdatum_mem_threshold = 20 * 1024;	/* Default 20KB */
+	c->xdatum_mem_threshold = 32 * 1024;	/* Default 32KB */
+
+	return 0;
+}
+
+void jffs2_clear_xattr_subsystem(struct jffs2_sb_info *c)
+{
+	struct jffs2_xattr_datum *xd, *_xd;
+	struct jffs2_xattr_ref *ref, *_ref;
+	int i;
+
+	if (!c->xattrindex)
+		return;		/* not initialized */
+
+	list_for_each_entry_safe(ref, _ref, &c->xattr_temp, ilist)
+		jffs2_free_xattr_ref(ref);
+
+	for (i=0; i<XATTRINDEX_HASHSIZE; i++) {
+		list_for_each_entry_safe(xd, _xd, &c->xattrindex[i], xindex) {
+			list_del(&xd->xindex);
+			if (xd->xname)
+				kfree(xd->xname);
+			jffs2_free_xattr_datum(xd);
+		}
+	}
+
+	kfree(c->xattrindex);
+	c->xattrindex = NULL;
+}
+
+void jffs2_build_xattr_subsystem(struct jffs2_sb_info *c)
+{
+	struct jffs2_xattr_ref *ref, *_ref;
+	struct jffs2_xattr_datum *xd, *_xd;
+	struct jffs2_inode_cache *ic;
+	int i;
+
+	BUG_ON(!(c->flags & JFFS2_SB_FLAG_BUILDING));
+
+	/* Phase.1 */
+	list_for_each_entry_safe(ref, _ref, &c->xattr_temp, ilist) {
+		list_del_init(&ref->ilist);
+		/* At this point, ref->xid and ref->ino contain XID and inode number.
+		   ref->xd and ref->ic are not valid yet. */
+		xd = jffs2_find_xattr_datum(c, ref->xid);
+		ic = jffs2_get_ino_cache(c, ref->ino);
+		if (!xd || !ic) {
+			printk(KERN_NOTICE "building xref {ino=%u, xid=%u} is not found.\n",
+			       ref->xid, ref->ino);
+			ref->node->next_in_ino = NULL;
+			jffs2_mark_node_obsolete(c, ref->node);
+			jffs2_free_xattr_ref(ref);
+			continue;
+		}
+		ref->xd = xd;
+		ref->ic = ic;
+		xd->refcnt++;
+		list_add_tail(&ref->ilist, &ic->ilist);
+		D1(printk(KERN_NOTICE "bind XREF{ino=%u, xid=%u}\n", ic->ino, xd->xid));
+	}
+	/* After this, ref->xid/ino are never used. */
+
+	/* Phase.2 */
+	for (i=0; i<XATTRINDEX_HASHSIZE; i++) {
+		list_for_each_entry_safe(xd, _xd, &c->xattrindex[i], xindex) {
+			list_del_init(&xd->xindex);
+			if (!xd->refcnt) {
+				printk(KERN_NOTICE "unrefered xattr_datum found xid=%u\n", xd->xid);
+				delete_xattr_datum(c, xd);
+			}
+		}
+	}
+	/* build complete */
+	D1(printk(KERN_NOTICE "%s complete.\n", __FUNCTION__));
+}
+
+struct jffs2_xattr_datum *jffs2_find_xattr_datum(struct jffs2_sb_info *c, uint32_t xid)
+{
+	struct jffs2_xattr_datum *xd;
+	int i = xid % XATTRINDEX_HASHSIZE;
+
+	/* It's only used in scanning/building process. */
+	BUG_ON(!(c->flags & (JFFS2_SB_FLAG_SCANNING|JFFS2_SB_FLAG_BUILDING)));
+
+	list_for_each_entry(xd, &c->xattrindex[i], xindex) {
+		if (xd->xid==xid)
+			return xd;
+	}
+	return NULL;
+}
+
+void jffs2_attach_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
+{
+	int i = xd->xid % XATTRINDEX_HASHSIZE;
+
+	/* It's only used in scanning process. */
+	BUG_ON(!(c->flags & JFFS2_SB_FLAG_SCANNING));
+
+	list_add_tail(&xd->xindex, &c->xattrindex[i]);
+}
+
+/* ---- Internal XATTR related functions ------------------------------------ */
+static void reclaim_xattr_datum(struct jffs2_sb_info *c)
+{
+	/* must be called under down_write(xattr_sem) */
+	struct jffs2_xattr_datum *xd, *_xd;
+	uint32_t target, before;
+	static int index = 0;
+
+	before = c->xdatum_mem_usage;
+	target = c->xdatum_mem_usage * 4 / 5; /* 20% reduction */
+	while(1) {
+		list_for_each_entry_safe(xd, _xd, &c->xattrindex[index], xindex) {
+			if (xd->flags & JFFS2_XDATUM_FLAGS_HOT) {
+				xd->flags &= ~JFFS2_XDATUM_FLAGS_HOT;
+			} else {
+				unload_xattr_datum(c, xd);
+			}
+			if (c->xdatum_mem_usage <= target)
+				goto out;
+		}
+		index = (index+1) % XATTRINDEX_HASHSIZE;
+	}
+ out:
+	printk(KERN_NOTICE "JFFS2: reclaim_xattr_cache() before: %d Byte  after: %d Byte\n",
+			   before, c->xdatum_mem_usage);
+}
+
+static int do_load_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
+{
+	/* must be called under down_write(xattr_sem) */
+	char *data;
+	size_t readlen;
+	uint32_t crc, length;
+	int i, ret, retry = 0;
+
+	D1(printk(KERN_NOTICE "%s xid=%u xprefix=%d\n", __FUNCTION__, xd->xid, xd->xprefix));
+ retry:
+	length = xd->name_len + 1 + xd->value_len;
+	data = kmalloc(length, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	BUG_ON(!xd->node);
+	ret = jffs2_flash_read(c, ref_offset(xd->node)+sizeof(struct jffs2_raw_xattr),
+			       length, &readlen, data);
+
+	if (ret || length!=readlen) {
+		printk(KERN_WARNING "jffs2_flash_read()=%d, request: %d, readlen: %d, at 0x%08x\n",
+		       ret, length, readlen, ref_offset(xd->node));
+		kfree(data);
+		return ret ? ret : -EIO;
+	}
+
+	data[xd->name_len] = '\0';
+	crc = crc32(0, data, length);
+	if (crc != xd->data_crc) {
+		printk(KERN_WARNING "node CRC failed (JFFS2_NODETYPE_XREF)"
+				    " at 0x%08x, read: 0x%08x calculated: 0x%08x\n",
+				    ref_offset(xd->node), xd->data_crc, crc);
+		kfree(data);
+		return -EIO;
+	}
+
+	xd->flags = JFFS2_XDATUM_FLAGS_HOT;
+	xd->xname = data;
+	xd->xvalue = data+xd->name_len+1;
+
+	c->xdatum_mem_usage += length;
+
+	xd->hashkey = jffs2_xattr_datum_hashkey(xd->xprefix, xd->xname, xd->xvalue, xd->value_len);
+	i = xd->hashkey % XATTRINDEX_HASHSIZE;
+	list_add(&xd->xindex, &c->xattrindex[i]);
+
+	if (c->xdatum_mem_usage > c->xdatum_mem_threshold && retry==0) {
+		reclaim_xattr_datum(c);
+		if (!xd->xname) {
+			retry = 1;
+			goto retry;
+		}
+	}
+
+	return 0;
+}
+
+static inline int load_xattr_datum_nolock(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
+{
+	/* must be called under down_write(xattr_sem); */
+	if (unlikely(!xd->xname))
+		return do_load_xattr_datum(c, xd);
+	return 0;
+}
+
+static inline int load_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
+{
+	/* must be called under down_read(xattr_sem); */
+	int ret;
+
+	if (likely(xd->xname))
+		return 0;
+
+	up_read(&c->xattr_sem);
+	down_write(&c->xattr_sem);
+	ret = load_xattr_datum_nolock(c, xd);
+	downgrade_write(&c->xattr_sem);
+
+	return ret;
+}
+
+static void unload_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
+{
+	/* must be called under down_write(xattr_sem) */
+	D1(printk(KERN_NOTICE "%s xid=%u xprefix=%d\n", __FUNCTION__, xd->xid, xd->xprefix));
+
+	if (xd->xname) {
+		c->xdatum_mem_usage -= (xd->name_len + 1 + xd->value_len);
+		kfree(xd->xname);
+	}
+
+	list_del_init(&xd->xindex);
+	xd->hashkey = 0;
+	xd->xname = NULL;
+	xd->xvalue = NULL;
+}
+
+static int save_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd, uint32_t phys_ofs)
+{
+	/* must be called under down_write(xattr_sem) */
+	struct jffs2_raw_xattr rx;
+	struct jffs2_raw_node_ref *raw;
+	struct kvec vecs[2];
+	uint32_t length;
+	int ret, totlen;
+
+	ret = load_xattr_datum_nolock(c, xd);
+	if (ret)
+		return ret;
+
+	vecs[0].iov_base = &rx;
+	vecs[0].iov_len = PAD(sizeof(rx));
+	vecs[1].iov_base = xd->xname;
+	vecs[1].iov_len = xd->name_len + 1 + xd->value_len;
+	totlen = vecs[0].iov_len + vecs[1].iov_len;
+
+	raw = jffs2_alloc_raw_node_ref();
+	if (!raw)
+		return -ENOMEM;
+	raw->flash_offset = phys_ofs;
+	raw->__totlen = PAD(totlen);
+	raw->next_phys = NULL;
+	raw->next_in_ino = (void *)xd;
+
+	/* Setup raw-xattr */
+	rx.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	rx.nodetype = cpu_to_je16(JFFS2_NODETYPE_XATTR);
+	rx.totlen = cpu_to_je32(totlen);
+	rx.hdr_crc = cpu_to_je32(crc32(0, &rx, sizeof(struct jffs2_unknown_node)-4));
+
+	rx.xid = cpu_to_je32(xd->xid);
+	rx.xprefix = xd->xprefix;
+	rx.name_len = xd->name_len;
+	rx.value_len = cpu_to_je16(xd->value_len);
+	rx.data_crc = cpu_to_je32(crc32(0, vecs[1].iov_base, vecs[1].iov_len));
+	rx.node_crc = cpu_to_je32(crc32(0, &rx, sizeof(struct jffs2_raw_xattr)-8));
+
+	ret = jffs2_flash_writev(c, vecs, 2, phys_ofs, &length, 0);
+	if (ret || totlen!=length) {
+		printk(KERN_NOTICE "%s:%d Write of %d bytes at 0x%08x failed. returned %d, retlen %d\n",
+		       __FILE__, __LINE__, totlen, phys_ofs, ret, length);
+		ret = ret ? ret : -EIO;
+		if (length) {
+			raw->flash_offset |= REF_OBSOLETE;
+			raw->next_in_ino = NULL;
+			jffs2_add_physical_node_ref(c, raw);
+			jffs2_mark_node_obsolete(c, raw);
+		} else {
+			jffs2_free_raw_node_ref(raw);
+		}
+		return ret;
+	}
+	/* success */
+	raw->flash_offset |= REF_PRISTINE;
+	jffs2_add_physical_node_ref(c, raw);
+	if (xd->node) {
+		xd->node->next_in_ino = NULL;
+		jffs2_mark_node_obsolete(c, xd->node);
+	}
+	xd->node = raw;
+
+	return 0;
+}
+
+static struct jffs2_xattr_datum *create_xattr_datum(struct jffs2_sb_info *c,
+						    int xprefix, const char *xname,
+						    const char *xvalue, int xsize,
+						    uint32_t phys_ofs)
+{
+	/* must be called under down_write(xattr_sem) */
+	struct jffs2_xattr_datum *xd;
+	uint32_t hashkey, nlen;
+	char *data;
+	int i, rc;
+
+	/* Search xattr_datum has same xname/xvalue by index */
+	hashkey = jffs2_xattr_datum_hashkey(xprefix, xname, xvalue, xsize);
+	i = hashkey % XATTRINDEX_HASHSIZE;
+	list_for_each_entry(xd, &c->xattrindex[i], xindex) {
+		if (xd->hashkey==hashkey
+		    && xd->xprefix==xprefix
+		    && xd->value_len==xsize
+		    && !strcmp(xd->xname, xname)
+		    && !memcmp(xd->xvalue, xvalue, xsize)) {
+			xd->refcnt++;
+			return xd;
+		}
+	}
+
+	/* Not found, Create NEW XATTR-Cache */
+	nlen = strlen(xname);
+
+	xd = jffs2_alloc_xattr_datum();
+	if (!xd)
+		return ERR_PTR(-ENOMEM);
+	init_xattr_datum(xd);   /* class = RAWNODE_CLASS_XATTR_DATUM, refcnt = 0 */
+
+	data = kmalloc(nlen + 1 + xsize, GFP_KERNEL);
+	if (!data) {
+		jffs2_free_xattr_datum(xd);
+		return ERR_PTR(-ENOMEM);
+	}
+	strcpy(data, xname);
+	data[nlen] = '\0';
+	memcpy(data + nlen + 1, xvalue, xsize);
+
+	xd->refcnt++;	/* refcnt = 1 */
+	xd->flags = JFFS2_XDATUM_FLAGS_HOT;
+	xd->xprefix = xprefix;
+	xd->xid = ++c->highest_xseqno;
+
+	xd->hashkey = hashkey;
+	xd->xname = data;
+	xd->xvalue = data + nlen + 1;
+	xd->name_len = nlen;
+	xd->value_len = xsize;
+	xd->data_crc = crc32(0, data, xd->name_len + 1 + xd->value_len);
+
+	rc = save_xattr_datum(c, xd, phys_ofs);
+	if (rc) {
+		kfree(xd->xname);
+		jffs2_free_xattr_datum(xd);
+		return ERR_PTR(rc);
+	}
+
+	/* Insert Hash Index */
+	i = hashkey % XATTRINDEX_HASHSIZE;
+	list_add(&xd->xindex, &c->xattrindex[i]);
+
+	c->xdatum_mem_usage += xd->name_len + 1 + xd->value_len;
+	if (c->xdatum_mem_usage > c->xdatum_mem_threshold)
+		reclaim_xattr_datum(c);
+
+	return xd;
+}
+
+static void delete_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
+{
+	/* must be called under down_write(xattr_sem) */
+	BUG_ON(xd->refcnt);
+
+	unload_xattr_datum(c, xd);
+	if (xd->node) {
+		xd->node->next_in_ino = NULL;
+		jffs2_mark_node_obsolete(c, xd->node);
+	}
+	jffs2_free_xattr_datum(xd);
+}
+
+static int save_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref, uint32_t phys_ofs)
+{
+	/* must be called under down_write(xattr_sem) */
+	struct jffs2_raw_node_ref *raw;
+	struct jffs2_raw_xref rr;
+	uint32_t length;
+	int ret;
+
+	raw = jffs2_alloc_raw_node_ref();
+	if (!raw)
+		return -ENOMEM;
+	raw->flash_offset = phys_ofs;
+	raw->__totlen = PAD(sizeof(rr));
+	raw->next_phys = NULL;
+	raw->next_in_ino = (void *)ref;
+
+	rr.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+	rr.nodetype = cpu_to_je16(JFFS2_NODETYPE_XREF);
+	rr.totlen = cpu_to_je32(sizeof(rr));
+	rr.hdr_crc = cpu_to_je32(crc32(0, &rr, sizeof(struct jffs2_unknown_node)-4));
+
+	rr.seqno = cpu_to_je32(ref->seqno);
+	rr.ino = cpu_to_je32(ref->ic->ino);
+	rr.xid = cpu_to_je32(ref->xd->xid);
+	rr.node_crc = cpu_to_je32(crc32(0, &rr, sizeof(struct jffs2_raw_xref)-4));
+
+	ret = jffs2_flash_write(c, phys_ofs, sizeof(rr), &length, (char *)&rr);
+	if (ret || sizeof(rr)!=length) {
+		printk(KERN_NOTICE "%s:%d Write of %zd bytes at 0x%08x failed. returned %d, retlen %zd\n",
+		       __FILE__, __LINE__, sizeof(rr), phys_ofs, ret, length);
+		ret = ret ? ret : -EIO;
+		if (length) {
+			raw->flash_offset |= REF_OBSOLETE;
+			raw->next_in_ino = NULL;
+			jffs2_add_physical_node_ref(c, raw);
+			jffs2_mark_node_obsolete(c, raw);
+		} else {
+			jffs2_free_raw_node_ref(raw);
+		}
+		return ret;
+	}
+	raw->flash_offset |= REF_PRISTINE;
+
+	jffs2_add_physical_node_ref(c, raw);
+	if (ref->node) {
+		ref->node->next_in_ino = NULL;
+		jffs2_mark_node_obsolete(c, ref->node);
+	}
+	ref->node = raw;
+
+	return 0;
+}
+
+static struct jffs2_xattr_ref *create_xattr_ref(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic,
+						struct jffs2_xattr_datum *xd, uint32_t phys_ofs)
+{
+	/* must be called under down_write(xattr_sem) */
+	struct jffs2_xattr_ref *ref;
+	int ret;
+
+	/* Duplication Check */
+	list_for_each_entry(ref, &ic->ilist, ilist) {
+		if (ref->xd == xd)
+			return ERR_PTR(-EINVAL);
+	}
+
+	ref = jffs2_alloc_xattr_ref();
+	if (!ref)
+		return ERR_PTR(-ENOMEM);
+	init_xattr_ref(ref);	/* class = RAWNODE_CLASS_XATTR_REF */
+	
+	ref->seqno = ++c->highest_xseqno;
+	ref->ic = ic;
+	ref->xd = xd;
+
+	ret = save_xattr_ref(c, ref, phys_ofs);
+	if (ret) {
+		jffs2_free_xattr_ref(ref);
+		return ERR_PTR(ret);
+	}
+
+	/* Chain to inode */
+	list_add(&ref->ilist, &ic->ilist);
+
+	return ref; /* success */
+}
+
+static void delete_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref)
+{
+	/* must be called under down_write(xattr_sem) */
+	struct jffs2_xattr_datum *xd;
+
+	BUG_ON(!ref->node);
+	ref->node->next_in_ino = NULL;
+	jffs2_mark_node_obsolete(c, ref->node);
+
+	list_del(&ref->ilist);
+	xd = ref->xd;
+	xd->refcnt--;
+	if (!xd->refcnt)
+		delete_xattr_datum(c, xd);
+
+	jffs2_free_xattr_ref(ref);
+}
+
+void jffs2_xattr_delete_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
+{
+	struct jffs2_xattr_ref *ref, *_ref;
+
+	if (!ic || ic->nlink > 0)
+		return;
+
+	down_write(&c->xattr_sem);
+	list_for_each_entry_safe(ref, _ref, &ic->ilist, ilist)
+		delete_xattr_ref(c, ref);
+	up_write(&c->xattr_sem);
+}
+
+void jffs2_xattr_free_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
+{
+	/* It's called from jffs2_free_ino_caches() */
+	struct jffs2_xattr_datum *xd;
+	struct jffs2_xattr_ref *ref, *_ref;
+
+	down_write(&c->xattr_sem);
+	list_for_each_entry_safe(ref, _ref, &ic->ilist, ilist) {
+		list_del(&ref->ilist);
+		xd = ref->xd;
+		xd->refcnt--;
+		if (!xd->refcnt) {
+			unload_xattr_datum(c, xd);
+			jffs2_free_xattr_datum(xd);
+		}
+		jffs2_free_xattr_ref(ref);
+	}
+	up_write(&c->xattr_sem);
+}
+
+static int do_check_xattr_ref_ilist(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
+{
+	struct jffs2_xattr_ref *ref, *cmp;
+	int ret = 0;
+
+	down_write(&c->xattr_sem);
+ retry:
+	list_for_each_entry(ref, &ic->ilist, ilist) {
+		ret = load_xattr_datum_nolock(c, ref->xd);
+		if (ret)
+			goto out;
+		cmp = ref;
+		list_for_each_entry_continue(cmp, &ic->ilist, ilist) {
+			ret = load_xattr_datum_nolock(c, cmp->xd);
+			if (ret)
+				goto out;
+			if (ref->xd->xprefix == cmp->xd->xprefix
+			    && !strcmp(ref->xd->xname, cmp->xd->xname)) {
+				delete_xattr_ref(c, ref->seqno > cmp->seqno ? cmp : ref);
+				goto retry;
+			}
+		}
+	}
+ out:
+	up_write(&c->xattr_sem);
+
+	if (!ret)
+		ic->flags |= INO_FLAGS_XATTR_CHECKED;
+
+	return ret;
+}
+
+static inline int check_xattr_ref_ilist(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
+{
+	if (likely(ic->flags & INO_FLAGS_XATTR_CHECKED))
+		return 0;
+	return do_check_xattr_ref_ilist(c, ic);
+}
+
+ssize_t jffs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
+{
+	struct inode *inode = dentry->d_inode;
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+	struct jffs2_inode_cache *ic = f->inocache;
+	struct jffs2_xattr_ref *ref;
+	struct jffs2_xattr_datum *xd;
+	struct xattr_handler *xhandle;
+	int len, ret;
+
+	ret = check_xattr_ref_ilist(c, ic);
+	if (unlikely(ret))
+		return ret;
+
+	down_read(&c->xattr_sem);
+	len = 0;
+	list_for_each_entry(ref, &ic->ilist, ilist) {
+		BUG_ON(ref->ic!=ic);
+		xd = ref->xd;
+		ret = load_xattr_datum(c, xd);
+		if (ret<0)
+			goto out;
+
+		xhandle = xprefix_to_handler(xd->xprefix);
+		if (!xhandle)
+			continue;
+
+		if (buffer) {
+			ret = xhandle->list(inode, buffer+len, size-len, xd->xname, xd->name_len);
+		} else {
+			ret = xhandle->list(inode, NULL, 0, xd->xname, xd->name_len);
+		}
+		if (ret < 0)
+			goto out;
+		len += ret;
+	}
+ out:
+	up_read(&c->xattr_sem);
+	return ret;
+}
+
+int do_jffs2_getxattr(struct inode *inode, int xprefix, const char *xname,
+		      char *buffer, size_t size)
+{
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+	struct jffs2_inode_cache *ic = f->inocache;
+	struct jffs2_xattr_datum *xd;
+	struct jffs2_xattr_ref *ref;
+	int ret;
+
+	ret = check_xattr_ref_ilist(c, ic);
+	if (unlikely(ret))
+		return ret;
+
+	down_read(&c->xattr_sem);
+	list_for_each_entry(ref, &ic->ilist, ilist) {
+		BUG_ON(ref->ic!=ic);
+
+		xd = ref->xd;
+		if (xd->xprefix != xprefix)
+			continue;
+
+		ret = load_xattr_datum(c, xd);
+		if (ret)
+			goto out;
+
+		if (!strcmp(xname, xd->xname)) {
+			ret = xd->value_len;
+			if (buffer) {
+				if (size < ret) {
+					ret = -ERANGE;
+				} else {
+					memcpy(buffer, xd->xvalue, xd->value_len);
+				}
+			}
+			goto out;
+		}
+	}
+	ret = -ENODATA;
+ out:
+	up_read(&c->xattr_sem);
+	return ret;
+}
+
+int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
+		      const char *buffer, size_t size, int flags)
+{
+	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+	struct jffs2_inode_cache *ic = f->inocache;
+	struct jffs2_xattr_datum *xd;
+	struct jffs2_xattr_ref *ref, *nref;
+	uint32_t phys_ofs, length, request;
+	int ret;
+
+	ret = check_xattr_ref_ilist(c, ic);
+	if (unlikely(ret))
+		return ret;
+
+	request = PAD(sizeof(*xd) + strlen(xname) + 1 + size);
+	ret = jffs2_reserve_space(c, request, &phys_ofs, &length, ALLOC_NORMAL, JFFS2_SUMMARY_NOSUM_SIZE);
+	if (ret) {
+		printk(KERN_NOTICE "%s:%d jffs2_reserve_space()=%d length=%d request=%d at 0x%08x\n",
+		       __FILE__, __LINE__, ret, length, request, phys_ofs);
+		return ret;
+	}
+
+	/* Find existing xattr */
+	down_write(&c->xattr_sem);
+	list_for_each_entry(ref, &ic->ilist, ilist) {
+		xd = ref->xd;
+		if (xd->xprefix != xprefix)
+			continue;
+
+		ret = load_xattr_datum(c, xd);
+		if (ret)
+			goto out;
+
+		if (!strcmp(xd->xname, xname)) {
+			if (flags & XATTR_CREATE) {
+				ret = -EEXIST;
+				goto out;
+			}
+			goto found;
+		}
+	}
+	/* not found */
+	ref = NULL;
+	if (flags & XATTR_REPLACE) {
+		ret = -ENODATA;
+		goto out;
+	}
+	if (!buffer) {
+		ret = -EINVAL;
+		goto out;
+	}
+ found:
+	xd = create_xattr_datum(c, xprefix, xname, buffer, size, phys_ofs);
+	if (IS_ERR(xd)) {
+		ret = PTR_ERR(xd);
+		goto out;
+	}
+	up_write(&c->xattr_sem);
+	jffs2_complete_reservation(c);
+
+	/* create xattr_ref */
+	request = PAD(sizeof(*nref));
+	ret = jffs2_reserve_space(c, request, &phys_ofs, &length, ALLOC_NORMAL, JFFS2_SUMMARY_NOSUM_SIZE);
+	if (ret) {
+		printk(KERN_NOTICE "%s:%d jffs2_reserve_space()=%d length=%d request=%d at 0x%08x\n",
+		       __FILE__, __LINE__, ret, length, request, phys_ofs);
+		down_write(&c->xattr_sem);
+		xd->refcnt--;
+		if (!xd->refcnt)
+			delete_xattr_datum(c, xd);
+		up_write(&c->xattr_sem);
+		return ret;
+	}
+	down_write(&c->xattr_sem);
+	nref = create_xattr_ref(c, ic, xd, phys_ofs);
+	if (IS_ERR(nref)) {
+		ret = PTR_ERR(nref);
+		xd->refcnt--;
+		if (!xd->refcnt)
+			delete_xattr_datum(c, xd);
+		goto out;
+	} else if (ref) {
+		/* If replaced xattr_ref exists */
+		delete_xattr_ref(c, ref);
+	}
+ out:
+	up_write(&c->xattr_sem);
+	jffs2_complete_reservation(c);
+
+	return ret;
+}
+
+static int jffs2_garbage_collect_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd)
+{
+	/* must be called under down_write(xattr_sem), and called from GC thread */
+	uint32_t phys_ofs, totlen, length;
+	int ret;
+
+	BUG_ON(!xd->node);
+
+	totlen = ref_totlen(c, c->gcblock, xd->node);
+	if (totlen < sizeof(struct jffs2_raw_xattr))
+		return -EINVAL;
+
+	ret = jffs2_reserve_space_gc(c, totlen, &phys_ofs, &length, JFFS2_SUMMARY_NOSUM_SIZE);
+	if (ret || length < totlen) {
+		printk(KERN_WARNING "jffs2_reserve_space_gc() = %d "
+				    "request: %d byte reserved: %d byte",
+				    ret, totlen, length);
+		return ret ? ret : -EBADFD;
+	}
+
+	ret = load_xattr_datum_nolock(c, xd);
+	if (!ret)
+		ret = save_xattr_datum(c, xd, phys_ofs);
+
+	return ret;
+}
+
+
+static int jffs2_garbage_collect_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref)
+{
+	/* must be called under down(alloc_sem) */
+	uint32_t phys_ofs, totlen, length;
+	int ret;
+
+	BUG_ON(!ref->node);
+
+	totlen = ref_totlen(c, c->gcblock, ref->node);
+	if (totlen != sizeof(struct jffs2_raw_xref))
+		return -EINVAL;
+
+	ret = jffs2_reserve_space_gc(c, totlen, &phys_ofs, &length, JFFS2_SUMMARY_NOSUM_SIZE);
+	if (ret || length < totlen) {
+		printk(KERN_WARNING "jffs2_reserve_space_gc() = %d"
+		       " request: %d byte reserved: %d byte", ret, totlen, length);
+		return ret ? ret : -EBADFD;
+	}
+
+	ret = save_xattr_ref(c, ref, phys_ofs);
+
+	return ret;
+}
+
+int jffs2_garbage_collect_xattr(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic)
+{
+	struct jffs2_xattr_datum *xd;
+	struct jffs2_xattr_ref *ref;
+	int ret;
+
+	switch (ic->class) {
+	case RAWNODE_CLASS_XATTR_DATUM:
+		spin_unlock(&c->erase_completion_lock);
+
+		down_write(&c->xattr_sem);
+		xd = (struct jffs2_xattr_datum *)ic;
+		ret = xd ? jffs2_garbage_collect_xattr_datum(c, xd) : 0;
+		up_write(&c->xattr_sem);
+		break;
+	case RAWNODE_CLASS_XATTR_REF:
+		spin_unlock(&c->erase_completion_lock);
+
+		down_write(&c->xattr_sem);
+		ref = (struct jffs2_xattr_ref *)ic;
+		ret = ref ? jffs2_garbage_collect_xattr_ref(c, ref) : 0;
+		up_write(&c->xattr_sem);
+		break;
+	default:
+		/* This node is not xattr_datum/xattr_ref */
+		ret = 1;
+		break;
+	}
+	return ret;
+}
diff -prNU3 mtd-20051127/fs/jffs2/xattr.h mtd-20051127.xattr/fs/jffs2/xattr.h
--- mtd-20051127/fs/jffs2/xattr.h	1969-12-31 19:00:00.000000000 -0500
+++ mtd-20051127.xattr/fs/jffs2/xattr.h	2005-11-27 00:00:13.000000000 -0500
@@ -0,0 +1,144 @@
+/*-------------------------------------------------------------------------*
+ *  File: fs/jffs2/xattr.c
+ *  XATTR support on JFFS2 FileSystem
+ *
+ *  Implemented by KaiGai Kohei <kaigai@ak.jp.nec.com>
+ *  Copyright (C) 2005 NEC Corporation
+ *
+ *  For licensing information, see the file 'LICENCE' in the jffs2 directory.
+ *-------------------------------------------------------------------------*/
+
+#ifndef _JFFS2_FS_XATTR_H_
+#define _JFFS2_FS_XATTR_H_
+
+#include <linux/xattr.h>
+
+#define XATTRINDEX_HASHSIZE (57)
+#define JFFS2_XDATUM_FLAGS_HOT		0x01	/* This is hot xattr_datum */
+
+#define RAWNODE_CLASS_INODE_CACHE	0
+#define RAWNODE_CLASS_XATTR_DATUM	1
+#define RAWNODE_CLASS_XATTR_REF		2
+
+struct jffs2_xattr_datum
+{
+	void *always_null;
+	u8 class;
+	u8 flags;
+	u16 xprefix;			/* see JFFS2_XATTR_PREFIX_* */
+
+	struct jffs2_raw_node_ref *node;
+	struct list_head xindex;	/* chained from c->xattrindex[n] */
+	uint32_t refcnt;		/* # of xattr_ref refers this */
+	uint32_t xid;
+
+	uint32_t data_crc;
+	uint32_t hashkey;
+	char *xname;		/* XATTR name without prefix */
+	uint32_t name_len;	/* length of xname */
+	char *xvalue;		/* XATTR value */
+	uint32_t value_len;	/* length of xvalue */
+};
+
+struct jffs2_inode_cache;	/* forward refence */
+struct jffs2_xattr_ref
+{
+	void *always_null;
+	u8 class;
+	u8 flags;		/* Currently unused */
+	u16 unused;
+
+	uint32_t seqno;
+	struct jffs2_raw_node_ref *node;
+	union {
+		struct jffs2_inode_cache *ic;	/* reference to jffs2_inode_cache */
+		uint32_t ino;			/* only used in scanning/building  */
+	};
+	union {
+		struct jffs2_xattr_datum *xd;	/* reference to jffs2_xattr_datum */
+		uint32_t xid;			/* only used in sccanning/building */
+	};
+	struct list_head ilist;			/* chained from ic->ilist */
+};
+
+#ifdef CONFIG_JFFS2_FS_XATTR
+
+extern int jffs2_init_xattr_subsystem(struct jffs2_sb_info *c);
+extern void jffs2_build_xattr_subsystem(struct jffs2_sb_info *c);
+extern void jffs2_clear_xattr_subsystem(struct jffs2_sb_info *c);
+
+extern struct jffs2_xattr_datum *jffs2_find_xattr_datum(struct jffs2_sb_info *c, uint32_t xid);
+extern void jffs2_attach_xattr_datum(struct jffs2_sb_info *c, struct jffs2_xattr_datum *xd);
+
+extern void jffs2_xattr_delete_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic);
+extern void jffs2_xattr_free_inode(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic);
+extern int jffs2_garbage_collect_xattr(struct jffs2_sb_info *c, struct jffs2_inode_cache *ic);
+
+extern int do_jffs2_getxattr(struct inode *inode, int xprefix, const char *xname,
+			     char *buffer, size_t size);
+extern int do_jffs2_setxattr(struct inode *inode, int xprefix, const char *xname,
+			     const char *buffer, size_t size, int flags);
+
+extern struct xattr_handler *jffs2_xattr_handlers[];
+extern ssize_t jffs2_listxattr(struct dentry *, char *, size_t);
+#define jffs2_getxattr		generic_getxattr
+#define jffs2_setxattr		generic_setxattr
+#define jffs2_removexattr	generic_removexattr
+
+/*---- Any inline initialize functions ----*/
+#define init_xattr_inode_cache(x) INIT_LIST_HEAD(&((x)->ilist))
+
+static inline void init_xattr_datum(struct jffs2_xattr_datum *xd)
+{
+	memset(xd, 0, sizeof(struct jffs2_xattr_datum));
+	xd->class = RAWNODE_CLASS_XATTR_DATUM;
+	INIT_LIST_HEAD(&xd->xindex);
+}
+
+static inline void init_xattr_ref(struct jffs2_xattr_ref *ref)
+{
+	memset(ref, 0, sizeof(struct jffs2_xattr_ref));
+	ref->class = RAWNODE_CLASS_XATTR_REF;
+	INIT_LIST_HEAD(&ref->ilist);
+}
+
+#else
+
+static inline int jffs2_init_xattr_subsystem(struct jffs2_sb_info *c) { return 0; }
+static inline void jffs2_build_xattr_subsystem(struct jffs2_sb_info *c) {}
+static inline void jffs2_clear_xattr_subsystem(struct jffs2_sb_info *c) {}
+
+static inline void *jffs2_find_xattr_datum(void *c, uint32_t xid) { return NULL; }
+static inline void jffs2_attach_xattr_datum(void *c, void *xd) {}
+
+static inline void jffs2_xattr_delete_inode(void *c, void *ic) {}
+static inline void jffs2_xattr_free_inode(void *c, void *ic) {}
+static inline int jffs2_garbage_collect_xattr(void *c, void *ic) { return 1; }
+
+#define jffs2_xattr_handlers	NULL
+#define jffs2_listxattr		NULL
+#define jffs2_getxattr		NULL
+#define jffs2_setxattr		NULL
+#define jffs2_removexattr	NULL
+
+#define init_xattr_inode_cache(x)
+static inline void init_xattr_datum(void *xd) {}
+static inline void init_xattr_ref(void *ref) {}
+
+#endif /* CONFIG_JFFS2_FS_XATTR */
+
+#ifdef CONFIG_JFFS2_FS_SECURITY
+
+extern int jffs2_init_security(struct inode *inode, struct inode *dir);
+extern struct xattr_handler jffs2_security_xattr_handler;
+
+#else
+
+static inline int jffs2_init_security(struct inode *inode, struct inode *dir)
+{
+	return 0;
+}
+
+#endif /* CONFIG_JFFS2_FS_SECURITY */
+
+#endif /* _JFFS2_FS_XATTR_H_ */
diff -prNU3 mtd-20051127/fs/Kconfig mtd-20051127.xattr/fs/Kconfig
--- mtd-20051127/fs/Kconfig	2005-11-26 23:48:43.000000000 -0500
+++ mtd-20051127.xattr/fs/Kconfig	2005-11-27 00:27:08.000000000 -0500
@@ -65,8 +65,8 @@ config JFFS2_FS_WRITEBUFFER
 	    - DataFlash
 
 config JFFS2_FS_XATTR
-	bool "JFFS2 XATTR support (EXPERIMENTAL)"
-	depends on JFFS2_FS && EXPERIMENTAL
+	bool "JFFS2 XATTR support"
+	depends on JFFS2_FS
 	default n
 	help
 	  Extended attributes are name:value pairs associated with inodes by
diff -prNU3 mtd-20051127/include/linux/jffs2_fs_i.h mtd-20051127.xattr/include/linux/jffs2_fs_i.h
--- mtd-20051127/include/linux/jffs2_fs_i.h	2005-11-07 20:02:17.000000000 -0500
+++ mtd-20051127.xattr/include/linux/jffs2_fs_i.h	2005-11-27 00:00:13.000000000 -0500
@@ -5,6 +5,7 @@
 
 #include <linux/version.h>
 #include <linux/rbtree.h>
+#include <linux/posix_acl.h>
 #include <asm/semaphore.h>
 
 struct jffs2_inode_info {
@@ -45,6 +46,10 @@ struct jffs2_inode_info {
 	struct inode vfs_inode;
 #endif
 #endif
+#ifdef CONFIG_JFFS2_FS_POSIX_ACL
+	struct posix_acl *i_acl_access;
+	struct posix_acl *i_acl_default;
+#endif
 };
 
 #endif /* _JFFS2_FS_I */
diff -prNU3 mtd-20051127/include/linux/jffs2_fs_sb.h mtd-20051127.xattr/include/linux/jffs2_fs_sb.h
--- mtd-20051127/include/linux/jffs2_fs_sb.h	2005-11-18 20:02:14.000000000 -0500
+++ mtd-20051127.xattr/include/linux/jffs2_fs_sb.h	2005-11-27 00:00:13.000000000 -0500
@@ -140,6 +140,14 @@ struct jffs2_sb_info {
 	struct jffs2_blocks_bucket used_blocks[HASH_SIZE]; /* The hash table for both dirty and clean erase blocks */
 	struct jffs2_blocks_bucket free_blocks[HASH_SIZE]; /* The hash table for free erase blocks */
 
+#ifdef CONFIG_JFFS2_FS_XATTR
+	uint32_t highest_xseqno;
+	struct list_head *xattrindex;
+#define xattr_temp xattrindex[XATTRINDEX_HASHSIZE]
+	struct rw_semaphore xattr_sem;
+	uint32_t xdatum_mem_usage;
+	uint32_t xdatum_mem_threshold;
+#endif
 	/* OS-private pointer for getting back to master superblock info */
 	void *os_priv;
 };
diff -prNU3 mtd-20051127/include/linux/jffs2.h mtd-20051127.xattr/include/linux/jffs2.h
--- mtd-20051127/include/linux/jffs2.h	2005-11-07 20:02:17.000000000 -0500
+++ mtd-20051127.xattr/include/linux/jffs2.h	2005-11-27 00:00:13.000000000 -0500
@@ -71,6 +71,18 @@
 #define JFFS2_NODETYPE_ERASEBLOCK_HEADER (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 5)
 #define JFFS2_NODETYPE_SUMMARY (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 6)
 
+#define JFFS2_NODETYPE_XATTR (JFFS2_FEATURE_INCOMPAT | JFFS2_NODE_ACCURATE | 8)
+#define JFFS2_NODETYPE_XREF (JFFS2_FEATURE_INCOMPAT | JFFS2_NODE_ACCURATE | 9)
+
+/* XATTR Related */
+#define JFFS2_XPREFIX_USER		1	/* for "user." */
+#define JFFS2_XPREFIX_SECURITY		2	/* for "security." */
+#define JFFS2_XPREFIX_ACL_ACCESS	3	/* for "system.posix_acl_access" */
+#define JFFS2_XPREFIX_ACL_DEFAULT	4	/* for "system.posix_acl_default" */
+#define JFFS2_XPREFIX_TRUSTED		5	/* for "trusted.*" */
+
+#define JFFS2_ACL_VERSION		0x0001
+
 // Maybe later...
 //#define JFFS2_NODETYPE_CHECKPOINT (JFFS2_FEATURE_RWCOMPAT_DELETE | JFFS2_NODE_ACCURATE | 3)
 //#define JFFS2_NODETYPE_OPTIONS (JFFS2_FEATURE_RWCOMPAT_COPY | JFFS2_NODE_ACCURATE | 4)
@@ -157,6 +169,32 @@ struct jffs2_raw_inode
 	uint8_t data[0];
 } __attribute__((packed));
 
+struct jffs2_raw_xattr {
+	jint16_t magic;
+	jint16_t nodetype;	/* = JFFS2_NODETYPE_XATTR */
+	jint32_t totlen;
+	jint32_t hdr_crc;
+	jint32_t xid;		/* XATTR identifier number */
+	uint8_t xprefix;
+	uint8_t name_len;
+	jint16_t value_len;
+	jint32_t data_crc;
+	jint32_t node_crc;
+	uint8_t data[0];
+} __attribute__((packed));
+
+struct jffs2_raw_xref
+{
+	jint16_t magic;
+	jint16_t nodetype;	/* = JFFS2_NODETYPE_XREF */
+	jint32_t totlen;
+	jint32_t hdr_crc;
+	jint32_t seqno;		/* sequencial number */
+	jint32_t ino;		/* inode number */
+	jint32_t xid;		/* XATTR identifier number */
+	jint32_t node_crc;
+} __attribute__((packed));
+
 struct jffs2_raw_summary
 {
 	jint16_t magic;
@@ -191,6 +229,8 @@ union jffs2_node_union
 {
 	struct jffs2_raw_inode i;
 	struct jffs2_raw_dirent d;
+	struct jffs2_raw_xattr x;
+	struct jffs2_raw_xref r;
 	struct jffs2_raw_summary s;
 	struct jffs2_raw_ebh eh;
 	struct jffs2_unknown_node u;

--------------030702060801050301020401--
