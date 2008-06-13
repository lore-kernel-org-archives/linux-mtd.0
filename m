Received: from relay03.pair.com ([209.68.5.17])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K7BTz-0005ms-NO
	for linux-mtd@lists.infradead.org; Fri, 13 Jun 2008 15:46:31 +0000
From: Grant Erickson <gerickson@nuovations.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD-UTILS] mkfs.jffs2: Remove Incorrect Find Optimization
Date: Fri, 13 Jun 2008 08:46:29 -0700
Message-Id: <1213371989-23442-1-git-send-email-gerickson@nuovations.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove performance optimization in find_filesystem_entry that prevented 
the successful simultaneous use of --root and --devtable where the 
latter is only used to fix-up permissions and ownership and to create 
device nodes.

As it stood, the performance optimization prevented a successful find 
where directory recursion was required or where the file being searched 
for had any mode permission bits set.

See http://lists.infradead.org/pipermail/linux-mtd/2008-June/021997.html
for additional information.

Signed-off-by: Grant Erickson <gerickson@nuovations.com>
---
 mkfs.jffs2.c |   39 ++++++++++++++++++---------------------
 1 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index cdf2a5a..f042ae7 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -276,30 +276,27 @@ static struct filesystem_entry *find_filesystem_entry(
 		e = dir->files;
 	}
 	while (e) {
-		/* Only bother to do the expensive strcmp on matching file types */
-		if (type == (e->sb.st_mode & S_IFMT)) {
-			if (S_ISDIR(e->sb.st_mode)) {
-				int len = strlen(e->fullname);
-
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
+		if (S_ISDIR(e->sb.st_mode)) {
+			int len = strlen(e->fullname);
+
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
+		} else {
+			if (strcmp(fullname, e->fullname) == 0) {
+				return (e);
 			}
 		}
 		e = e->next;
-- 
1.5.4.3
