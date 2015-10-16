Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zn6jQ-0003LI-2L
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2015 15:15:45 +0000
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>,
 Marc Kleine-Budde <mkl@pengutronix.de>
Subject: [PATCH 5/5] mkfs.ubifs: Optionally create extended attribute with
 inode number
Date: Fri, 16 Oct 2015 17:15:19 +0200
Message-Id: <1445008519-19928-6-git-send-email-mkl@pengutronix.de>
In-Reply-To: <1445008519-19928-1-git-send-email-mkl@pengutronix.de>
References: <1445008519-19928-1-git-send-email-mkl@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sascha Hauer <s.hauer@pengutronix.de>

This is done to allow creating images suitable for IMA directory
appraisal. IMA creates a hash for directories and attaches this
hash to the directory itself as an extended attribute. Among other
things the inode numbers of the files are hashed. So, to create
a valid hash in the UBIFS image the evmctl tool needs to know
the inode numbers which the files in the UBIFS image will have.
evmctl will read the inode numbers from the user.image-inode-number
extended attribute. Since extended attributes are inodes themselves
the inode numbers for the generated image will change when the
extended attributes change, so to generate a correctly hashed
UBIFS image, both evmctl and mkfs.ubifs must be run twice:

1) execute evmctl to iterate over the directory tree. This will
   create the security.ima and security.evm extended attributes.
   The existence of the attributes makes sure that subsequent
   calls to mkfs.ubifs will use the same inode numbers. evmctl
   will use the inode numbers from the host filesystem in this
   step which makes the resulting image unusable
2) execute mkfs.ubifs -a. This will create the user.image-inode-number
   extended attributes on files/directories added to the image.
3) execture evmctl again. This time evmctl will pick the inode
   numbers from the user.image-inode-number extended attribute
   instead of the ones from the host filesystem
4) execute mkfs.ubifs again. This will create the correct image.
   The now existing user.image-inode-number extended attributes
   are ignored and not added to the image.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 mkfs.ubifs/mkfs.ubifs.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index 30f80cf14992..cbc9db9b185a 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -113,6 +113,7 @@ static char *output;
 static int out_fd;
 static int out_ubi;
 static int squash_owner;
+static int do_create_inum_attr;
 
 /* The 'head' (position) which nodes are written */
 static int head_lnum;
@@ -135,7 +136,7 @@ static struct inum_mapping **hash_table;
 /* Inode creation sequence number */
 static unsigned long long creat_sqnum;
 
-static const char *optstring = "d:r:m:o:D:yh?vVe:c:g:f:Fp:k:x:X:j:R:l:j:UQq";
+static const char *optstring = "d:r:m:o:D:yh?vVe:c:g:f:Fp:k:x:X:j:R:l:j:UQqa";
 
 static const struct option longopts[] = {
 	{"root",               1, NULL, 'r'},
@@ -159,6 +160,7 @@ static const struct option longopts[] = {
 	{"log-lebs",           1, NULL, 'l'},
 	{"orph-lebs",          1, NULL, 'p'},
 	{"squash-uids" ,       0, NULL, 'U'},
+	{"set-inode-attr",     0, NULL, 'a'},
 	{NULL, 0, NULL, 0}
 };
 
@@ -199,6 +201,9 @@ static const char *helptext =
 "-V, --version            display version information\n"
 "-g, --debug=LEVEL        display debug information (0 - none, 1 - statistics,\n"
 "                         2 - files, 3 - more details)\n"
+"-a, --set-inum-attr      create user.image-inode-number extended attribute on files\n"
+"                         added to the image. The attribute will contain the inode\n"
+"                         number the file has in the generated image.\n"
 "-h, --help               display this help text\n\n"
 "Note, SIZE is specified in bytes, but it may also be specified in Kilobytes,\n"
 "Megabytes, and Gigabytes if a KiB, MiB, or GiB suffix is used.\n\n"
@@ -220,6 +225,25 @@ static const char *helptext =
 "flag may make the first mount very slow, because the \"free space fixup\" procedure\n"
 "takes time. This feature is supported by the Linux kernel starting from version 3.0.\n";
 
+static int create_inum_attr(ino_t inum, const char *name)
+{
+	char *str;
+	int ret;
+
+	if (!do_create_inum_attr)
+		return 0;
+
+	ret = asprintf(&str, "%llu", (unsigned long long)inum);
+	if (ret < 0)
+		return -1;
+
+	ret = lsetxattr(name, "user.image-inode-number", str, ret, 0);
+
+	free(str);
+
+	return ret;
+}
+
 /**
  * make_path - make a path name from a directory and a name.
  * @dir: directory path name
@@ -614,6 +638,10 @@ static int get_options(int argc, char**argv)
 		case 'U':
 			squash_owner = 1;
 			break;
+		case 'a':
+			do_create_inum_attr = 1;
+			break;
+
 		}
 	}
 
@@ -1103,6 +1131,24 @@ static int inode_add_xattr(struct ubifs_ino_node *host_ino,
 			goto out_free;
 		}
 
+		if (!strcmp(name, "user.image-inode-number")) {
+			ino_t inum_from_xattr;
+
+			inum_from_xattr = strtoull(attrval, NULL, 10);
+			if (inum != inum_from_xattr) {
+				errno = EINVAL;
+				sys_err_msg("calculated inum (%llu) doesn't match inum from xattr (%llu) on %s",
+					    (unsigned long long)inum,
+					    (unsigned long long)inum_from_xattr,
+					    path_name);
+				goto out_free;
+			}
+
+			free(attrval);
+			attrval = NULL;
+			continue;
+		}
+
 		nm.name = name;
 		nm.len = strlen(name);
 
@@ -1633,6 +1679,10 @@ static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
 				goto out_free;
 		}
 
+		err = create_inum_attr(inum, name);
+		if (err)
+			goto out_free;
+
 		err = add_dent_node(dir_inum, entry->d_name, inum, type);
 		if (err)
 			goto out_free;
@@ -1685,6 +1735,10 @@ static int add_directory(const char *dir_name, ino_t dir_inum, struct stat *st,
 				goto out_free;
 		}
 
+		err = create_inum_attr(inum, name);
+		if (err)
+			goto out_free;
+
 		err = add_dent_node(dir_inum, nh_elt->name, inum, type);
 		if (err)
 			goto out_free;
@@ -1754,6 +1808,11 @@ static int write_data(void)
 	}
 
 	head_flags = 0;
+
+	err = create_inum_attr(UBIFS_ROOT_INO, root);
+	if (err)
+		return err;
+
 	err = add_directory(root, UBIFS_ROOT_INO, &root_st, !!root);
 	if (err)
 		return err;
-- 
2.6.1
