Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q0Y1z-0006qS-QH
	for linux-mtd@lists.infradead.org; Fri, 18 Mar 2011 11:39:49 +0000
Received: from eru.research.nokia.com (esdhcp03787.research.nokia.com
	[172.21.37.87])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2IBdjmQ026183
	for <linux-mtd@lists.infradead.org>; Fri, 18 Mar 2011 13:39:45 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] mkfs.ubifs: deprecate squash-rino-perm options
Date: Fri, 18 Mar 2011 13:42:39 +0200
Message-Id: <1300448560-4166-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1300448560-4166-1-git-send-email-dedekind1@gmail.com>
References: <1300448560-4166-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

As we have planned, make --nosquash-rino-perm option to be the
default. Deprecate both options at the same time and print a
warning if they are used. Later we can remove them

Also, bump mkfs.ubifs version number.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 feature-removal-schedule.txt |   25 ++++++++++++-------------
 mkfs.ubifs/mkfs.ubifs.c      |   30 ++++++++++++------------------
 2 files changed, 24 insertions(+), 31 deletions(-)

diff --git a/feature-removal-schedule.txt b/feature-removal-schedule.txt
index 4e9824a..2899e34 100644
--- a/feature-removal-schedule.txt
+++ b/feature-removal-schedule.txt
@@ -13,19 +13,18 @@ a bug which was found too late, when mkfs.ubifs had already been used in
 production. To fix this bug, 2 new options were introduced:
 --squash-rino-perm which preserves the old behavior and --nosquash-rino-perm
 which makes mkfs.ubifs use the right permissions for the root
-inode. For now --squash-rino-perm is the default, and if neither
---squash-rino-perm nor --nosquash-rino-perm are used, mkfs.ubifs prints a
-warning. This was introduced in mtd-utils-1.4.0 (13 Sep 2010).
-
-So the plan is (to be done by Artem Bityutskiy):
-
-1. keep the warning for few releases to make sure users start using one of the
-   options. Update the mkfs.ubifs documentation at the web site.
-2. make --nosquash-rino-perm to be the default, and remove the warning.
-   Update the mkfs.ubifs documentation at the web site.
-3. eventually deprecate both options by:
-3.1 adding a warning to make users stop using them
-3.2 removing both options.
+inode.
+
+For a while (releases 1.4.0-1.4.3) --squash-rino-perm was the default, and if
+neither --squash-rino-perm nor --nosquash-rino-perm were used,
+mkfs.ubifs printed a warning. This was introduced in mtd-utils-1.4.0 (13 Sep 2010).
+
+Now we have removed a warning and made --nosquash-rino-perm to be the
+default. Also, both options are declared depricated, so users should try
+to stop using them.
+
+The further step is to remove both of them.
+
 ---------------------------
 2. nanddump: fail when the -s parameter is not page aligned
 
diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index bc0817f..e49a980 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -23,7 +23,7 @@
 #include "mkfs.ubifs.h"
 #include <crc32.h>
 
-#define PROGRAM_VERSION "1.4"
+#define PROGRAM_VERSION "1.5"
 
 /* Size (prime number) of hash table for link counting */
 #define HASH_TABLE_SIZE 10099
@@ -109,7 +109,7 @@ static char *output;
 static int out_fd;
 static int out_ubi;
 static int squash_owner;
-static int squash_rino_perm = -1;
+static int squash_rino_perm;
 
 /* The 'head' (position) which nodes are written */
 static int head_lnum;
@@ -195,10 +195,13 @@ static const char *helptext =
 "                         2 - files, 3 - more details)\n"
 "-Q, --squash-rino-perm   ignore permissions of the FS image directory (the one\n"
 "                         specified with --root) and make the UBIFS root inode\n"
-"			  permissions to be {uid=gid=root, u+rwx,go+rx}; this is\n"
-"                         see also the default so far, see explanations below\n"
+"                         permissions to be {uid=gid=root, u+rwx,go+rx}; this is\n"
+"                         a legacy compatibility option and it will be removed\n"
+"                         at some point, do not use it\n"
 "-q, --nosquash-rino-perm for the UBIFS root inode use permissions of the FS\n"
-"                         image directory (the one specified with --root)\n"
+"                         image directory (the one specified with --root); this\n"
+"                         is the default behavior; this option will be removed\n"
+"                         at some point, do not use it, see clarifications below;\n"
 "-h, --help               display this help text\n\n"
 "Note, SIZE is specified in bytes, but it may also be specified in Kilobytes,\n"
 "Megabytes, and Gigabytes if a KiB, MiB, or GiB suffix is used.\n\n"
@@ -217,12 +220,8 @@ static const char *helptext =
 "late, when mkfs.ubifs had already been used in production. To fix this bug, 2 new\n"
 "options were introduced: --squash-rino-perm which preserves the old behavior and\n"
 "--nosquash-rino-perm which makes mkfs.ubifs use the right permissions for the root\n"
-"inode. For now --squash-rino-perm is the default, and if neither --squash-rino-perm\n"
-"nor --nosquash-rino-perm are used, mkfs.ubifs prints a warning. The further plan is:\n"
-" o keep the warning for few releases to make sure users start using one of the\n"
-"   options\n"
-" o make --nosquash-rino-perm to be the default, and remove the warning\n"
-" o eventually deprecate both options\n";
+"inode. Now these options are considered depricated and they will be removed later, so\n"
+"do not use them.\n";
 
 /**
  * make_path - make a path name from a directory and a name.
@@ -666,9 +665,10 @@ static int get_options(int argc, char**argv)
 			break;
 		case 'Q':
 			squash_rino_perm = 1;
+			printf("WARNING: --squash-rino-perm is depricated, do not use it\n");
 			break;
 		case 'q':
-			squash_rino_perm = 0;
+			printf("WARNING: --nosquash-rino-perm is depricated, do not use it\n");
 			break;
 		}
 	}
@@ -1670,12 +1670,6 @@ static int write_data(void)
 		if (err)
 			return sys_err_msg("bad root file-system directory '%s'",
 					   root);
-		if (squash_rino_perm == -1) {
-			printf("WARNING: setting root UBIFS inode UID=GID=0 (root) and permissions "
-				 "to u+rwx,go+rx; use --squash-rino-perm or --nosquash-rino-perm "
-				 "to suppress this warning\n");
-			squash_rino_perm = 1;
-		}
 		if (squash_rino_perm) {
 			root_st.st_uid = root_st.st_gid = 0;
 			root_st.st_mode = mode;
-- 
1.7.2.3
