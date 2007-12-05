Received: from gmrelay.centrum.cz ([213.29.7.208])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IzqwD-0003zh-8m
	for linux-mtd@lists.infradead.org; Wed, 05 Dec 2007 09:53:12 +0000
Received: from mail1002.centrum.cz (mail1002.centrum.cz [213.29.7.174])
	by gmrelay.centrum.cz (Postfix) with ESMTP id 3254B90186825
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Dec 2007 10:52:35 +0100 (CET)
Received: by mail1002.centrum.cz id S53444640AbXLEJwX (ORCPT
	<rfc822;linux-mtd@lists.infradead.org>);
	Wed, 5 Dec 2007 10:52:23 +0100
Date: Wed, 05 Dec 2007 10:52:23 +0100
From: <milan.svoboda@centrum.cz>
To: <linux-mtd@lists.infradead.org>
MIME-Version: 1.0
Message-ID: <200712051052.32021@centrum.cz>
Subject: [PATCH] [MTD-UTILS] mkfs.jffs2 and device_table
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Using (-D, --devtable) with device table file filled with the complete
list of the files of the filesystem doubles the size of the result jffs2 image.

interpret_table_entry() calls find_filesystem_entry with mode, but the
function expects type. This causes that entry is never found.

This leads to adding that file into the image again!

find_filesystem_entry() also matches file types and only if they
matches, it tests if the current entry is directory and if it is
needed to descend into it.

If (e.g.) caller want to find a regular file, function never
tries to descend into the subdirectories of the current directory.

This also leads to adding file into the image again because entry is not found!

Diff is against mtd-utils.git-7a1db21c1806ee25a279ea8a71d2884b8080c805.tar.gz

Please apply.

Signed-off-by: Milan Svoboda <milan.svoboda@centrum.cz>
---
Index: mtd-utils.git/mkfs.jffs2.c
===================================================================
--- mtd-utils.git.orig/mkfs.jffs2.c
+++ mtd-utils.git/mkfs.jffs2.c
@@ -246,30 +246,30 @@ static struct filesystem_entry *find_fil
 		e = dir->files;
 	}
 	while (e) {
-		/* Only bother to do the expensive strcmp on matching file types */
-		if (type == (e->sb.st_mode & S_IFMT)) {
-			if (S_ISDIR(e->sb.st_mode)) {
-				int len = strlen(e->fullname);
+		/* Descend into the subdirectory if neccessary */
+		if (S_ISDIR(e->sb.st_mode)) {
+			int len = strlen(e->fullname);
 
-				/* Check if we are a parent of the correct path */
-				if (strncmp(e->fullname, fullname, len) == 0) {
-					/* Is this an _exact_ match? */
-					if (strcmp(fullname, e->fullname) == 0) {
-						return (e);
-					}
-					/* Looks like we found a parent of the correct path */
-					if (fullname[len] == '/') {
-						if (e->files) {
-							return (find_filesystem_entry (e, fullname, type));
-						} else {
-							return NULL;
-						}
-					}
-				}
-			} else {
+			/* Check if we are a parent of the correct path */
+			if (strncmp(e->fullname, fullname, len) == 0) {
+				/* Is this an _exact_ match? */
 				if (strcmp(fullname, e->fullname) == 0) {
 					return (e);
 				}
+				/* Looks like we found a parent of the correct path */
+				if (fullname[len] == '/') {
+					if (e->files) {
+						return (find_filesystem_entry (e, fullname, type));
+					} else {
+						return NULL;
+					}
+				}
+			}
+		}
+		/* Only bother to do the expensive strcmp on matching file types */
+		if (type == (e->sb.st_mode & S_IFMT)) {
+			if (strcmp(fullname, e->fullname) == 0) {
+				return (e);
 			}
 		}
 		e = e->next;
@@ -516,7 +516,7 @@ static int interpret_table_entry(struct 
 		default:
 			error_msg_and_die("Unsupported file type");
 	}
-	entry = find_filesystem_entry(root, name, mode);
+	entry = find_filesystem_entry(root, name, mode & S_IFMT);
 	if (entry) {
 		/* Ok, we just need to fixup the existing entry
 		 * and we will be all done... */
