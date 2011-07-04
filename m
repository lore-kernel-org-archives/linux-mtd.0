Received: from mga03.intel.com ([143.182.124.21])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qdd6c-0001OH-Jx
	for linux-mtd@lists.infradead.org; Mon, 04 Jul 2011 06:58:08 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mkfs.ubifs: remove root inode squash feature
Date: Mon,  4 Jul 2011 09:59:04 +0300
Message-Id: <1309762745-20175-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove the -squash-rino-perm mkfs.ubifs option as this was planned. Remove
the corresponding record from the feature-removal-schedule.txt file.

Signed-off-by: Artem Bityutskiy <dedekind1@gmail.com>
---
 feature-removal-schedule.txt |   23 -----------------------
 mkfs.ubifs/mkfs.ubifs.c      |   36 ------------------------------------
 2 files changed, 0 insertions(+), 59 deletions(-)

diff --git a/feature-removal-schedule.txt b/feature-removal-schedule.txt
index 69a8155..ca8bb6c 100644
--- a/feature-removal-schedule.txt
+++ b/feature-removal-schedule.txt
@@ -3,26 +3,3 @@ removed in the mtd-utils source tree.  Every entry should contain what
 exactly is going away, why it is happening, and who is going to be doing
 the work.  When the feature is removed from the utils, it should also
 be removed from this file.
-
----------------------------
-1. Kill --squash-rino-perm and --nosquash-rino-perm parameters of mkfs.ubifs.
-
-Originally, mkfs.ubifs did not have these parameters, and it always set
-permissions for the UBIFS root inode to be {uid=gid=root, u+rwx,go+rx}. This was
-a bug which was found too late, when mkfs.ubifs had already been used in
-production. To fix this bug, 2 new options were introduced:
---squash-rino-perm which preserves the old behavior and --nosquash-rino-perm
-which makes mkfs.ubifs use the right permissions for the root
-inode.
-
-For a while (releases 1.4.0-1.4.3) --squash-rino-perm was the default, and if
-neither --squash-rino-perm nor --nosquash-rino-perm were used,
-mkfs.ubifs printed a warning. This was introduced in mtd-utils-1.4.0 (13 Sep 2010).
-
-Now we have removed a warning and made --nosquash-rino-perm to be the
-default. Also, both options are declared deprecated, so users should try
-to stop using them.
-
-The further step is to remove both of them.
-
----------------------------
diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index 733a3bb..79cc71d 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -110,7 +110,6 @@ static char *output;
 static int out_fd;
 static int out_ubi;
 static int squash_owner;
-static int squash_rino_perm;
 
 /* The 'head' (position) which nodes are written */
 static int head_lnum;
@@ -156,8 +155,6 @@ static const struct option longopts[] = {
 	{"log-lebs",           1, NULL, 'l'},
 	{"orph-lebs",          1, NULL, 'p'},
 	{"squash-uids" ,       0, NULL, 'U'},
-	{"squash-rino-perm",   0, NULL, 'Q'},
-	{"nosquash-rino-perm", 0, NULL, 'q'},
 	{NULL, 0, NULL, 0}
 };
 
@@ -197,15 +194,6 @@ static const char *helptext =
 "-V, --version            display version information\n"
 "-g, --debug=LEVEL        display debug information (0 - none, 1 - statistics,\n"
 "                         2 - files, 3 - more details)\n"
-"-Q, --squash-rino-perm   ignore permissions of the FS image directory (the one\n"
-"                         specified with --root) and make the UBIFS root inode\n"
-"                         permissions to be {uid=gid=root, u+rwx,go+rx}; this is\n"
-"                         a legacy compatibility option and it will be removed\n"
-"                         at some point, do not use it\n"
-"-q, --nosquash-rino-perm for the UBIFS root inode use permissions of the FS\n"
-"                         image directory (the one specified with --root); this\n"
-"                         is the default behavior; this option will be removed\n"
-"                         at some point, do not use it, see clarifications below;\n"
 "-h, --help               display this help text\n\n"
 "Note, SIZE is specified in bytes, but it may also be specified in Kilobytes,\n"
 "Megabytes, and Gigabytes if a KiB, MiB, or GiB suffix is used.\n\n"
@@ -217,15 +205,6 @@ static const char *helptext =
 "or more percent better than \"lzo\", mkfs.ubifs chooses \"lzo\", otherwise it chooses\n"
 "\"zlib\". The \"--favor-percent\" may specify arbitrary threshold instead of the\n"
 "default 20%.\n\n"
-"The -R parameter specifies amount of bytes reserved for the super-user.\n\n"
-"Some clarifications about --squash-rino-perm and --nosquash-rino-perm options.\n"
-"Originally, mkfs.ubifs did not have them, and it always set permissions for the UBIFS\n"
-"root inode to be {uid=gid=root, u+rwx,go+rx}. This was a bug which was found too\n"
-"late, when mkfs.ubifs had already been used in production. To fix this bug, 2 new\n"
-"options were introduced: --squash-rino-perm which preserves the old behavior and\n"
-"--nosquash-rino-perm which makes mkfs.ubifs use the right permissions for the root\n"
-"inode. Now these options are considered depricated and they will be removed later, so\n"
-"do not use them.\n\n"
 "The -F parameter is used to set the \"fix up free space\" flag in the superblock,\n"
 "which forces UBIFS to \"fixup\" all the free space which it is going to use. This\n"
 "option is useful to work-around the problem of double free space programming: if the\n"
@@ -674,13 +653,6 @@ static int get_options(int argc, char**argv)
 		case 'U':
 			squash_owner = 1;
 			break;
-		case 'Q':
-			squash_rino_perm = 1;
-			printf("WARNING: --squash-rino-perm is depricated, do not use it\n");
-			break;
-		case 'q':
-			printf("WARNING: --nosquash-rino-perm is depricated, do not use it\n");
-			break;
 		}
 	}
 
@@ -709,10 +681,6 @@ static int get_options(int argc, char**argv)
 		return err_msg("Maximum count of LEBs was not specified "
 			       "(use -h for help)");
 
-	if (squash_rino_perm != -1 && !root)
-		return err_msg("--squash-rino-perm and nosquash-rino-perm options "
-			       "can be used only with the --root option");
-
 	if (c->max_bud_bytes == -1) {
 		int lebs;
 
@@ -1682,10 +1650,6 @@ static int write_data(void)
 		if (err)
 			return sys_err_msg("bad root file-system directory '%s'",
 					   root);
-		if (squash_rino_perm) {
-			root_st.st_uid = root_st.st_gid = 0;
-			root_st.st_mode = mode;
-		}
 	} else {
 		root_st.st_mtime = time(NULL);
 		root_st.st_atime = root_st.st_ctime = root_st.st_mtime;
-- 
1.7.5.4
