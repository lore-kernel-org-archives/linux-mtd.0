Received: from phobos.hpl.hp.com ([192.6.19.124])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dIdT-0000s3-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2002 22:21:19 +0000
Received: from friction.hpl.hp.com (friction.hpl.hp.com [15.0.48.214])
	by phobos.hpl.hp.com (8.9.3 (PHNE_24419)/HPL-PA Relay) with ESMTP id OAA14993
	for <linux-mtd@lists.infradead.org>; Tue, 19 Feb 2002 14:32:33 -0800 (PST)
Date: Tue, 19 Feb 2002 14:32:29 -0800
From: Christopher Hoover <ch@hpl.hp.com>
To: linux-mtd@lists.infradead.org
Subject: finer-grained squash support for mkfs.jffs2
Message-ID: <20020219143229.A14203@friction.hpl.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This patch adds the capability to mkfs.jffs2 to just squash uids (very
useful), just squash perms (not so useful), or both (the old
behavior).

Cheers.

-ch
mailto:ch@murgatroid.com
mailto:ch@hpl.hp.com



Index: util/mkfs.jffs2.c
===================================================================
RCS file: /home/cvs/mtd/util/mkfs.jffs2.c,v
retrieving revision 1.20
diff --unified -r1.20 mkfs.jffs2.c
--- util/mkfs.jffs2.c	2002/02/08 00:51:52	1.20
+++ util/mkfs.jffs2.c	2002/02/19 22:22:02
@@ -108,7 +108,8 @@
 static int fake_times = 0;
 
 /* Squash all permissions and make everything be owned by root */
-static int squash = 0;
+static int squash_uids = 0;
+static int squash_perms = 0;
 
 static int host_endian = __BYTE_ORDER;
 static int target_endian = __BYTE_ORDER;
@@ -323,11 +324,13 @@
 		}
 	}
 
-	if (squash) {
-		/* Squash all permissions so files are owned by
-		 * root, all timestamps are _right now_, and file
-		 * permissions have group and other write removed */
+	/* Squash all permissions so files are owned by root, all
+	 * timestamps are _right now_, and file permissions
+	 * have group and other write removed */
+	if (squash_uids) {
 		uid = gid = 0;
+	}
+	if (squash_perms) {
 		if (!S_ISLNK(mode)) {
 			mode &= ~(S_IWGRP | S_IWOTH);
 			mode &= ~(S_ISUID | S_ISGID);
@@ -375,11 +378,13 @@
 		timestamp = sb.st_mtime;
 	}
 
-	if (squash) {
-		/* Squash all permissions so files are owned by
-		 * root, all timestamps are _right now_, and file
-		 * permissions have group and other write removed */
+	/* Squash all permissions so files are owned by
+	 * root, all timestamps are _right now_, and file
+	 * permissions have group and other write removed */
+	if (squash_uids) {
 		uid = gid = 0;
+	}
+	if (squash_perms) {
 		mode &= ~(S_IWGRP | S_IWOTH);
 		mode &= ~(S_ISUID | S_ISGID);
 	}
@@ -423,11 +428,13 @@
 		timestamp = sb.st_mtime;
 	}
 
-	if (squash) {
+	if (squash_uids) {
 		/* Squash all permissions so files are owned by
 		 * root, all timestamps are _right now_, and file
 		 * permissions have group and other write removed */
 		uid = gid = 0;
+	}
+	if (squash_perms) {
 		mode &= ~(S_ISUID | S_ISGID);
 	}
 	if (fake_times) {
@@ -876,7 +883,8 @@
 
 	/* Turn off squash, since we must ensure that values
 	 * entered via the device table are not squashed */
-	squash = 0;
+	squash_uids = 0;
+	squash_perms = 0;
 
 	/* Looks ok so far.  The general plan now is to read in one
 	 * line at a time, check for leading comment delimiters ('#'),
@@ -1085,6 +1093,8 @@
 	{"big-endian", 0, NULL, 'b'},
 	{"little-endian", 0, NULL, 'l'},
 	{"squash", 0, NULL, 'q'},
+	{"squash-uids", 0, NULL, 'U'},
+	{"squash-perms", 0, NULL, 'P'},
 	{"faketime", 0, NULL, 'f'},
 	{"devtable", 1, NULL, 'D'},
 	{NULL, 0, NULL, 0}
@@ -1106,6 +1116,8 @@
 	"  -D, --devtable=FILE    Use the named FILE as a device table file\n"
 	"  -f, --faketime         Change all file times to '0' for regression testing\n"
 	"  -q, --squash           Squash permissions and owners making all files be owned by root\n"
+	"  -U, --squash-uids      Squash owners making all files be owned by root\n"
+	"  -P, --squash-perms     Squash permissions on all files\n"
 	"  -h, --help             Display this help text\n"
 	"  -v, --version          Display version information\n\n";
 
@@ -1171,7 +1183,16 @@
 			break;
 
 		case 'q':
-			squash = 1;
+			squash_uids = 1;
+			squash_perms = 1;
+			break;
+			
+		case 'U':
+			squash_uids = 1;
+			break;
+
+		case 'P':
+			squash_perms = 1;
 			break;
 
 		case 'f':
