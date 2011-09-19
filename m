Received: from mga14.intel.com ([143.182.124.37])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R5bzS-0001ob-36
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 11:26:23 +0000
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Artem Bityutskiy <artem.bityutskiy@intel.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 3/7] jffs2reader: introduce ADD_BYTES macro
Date: Mon, 19 Sep 2011 14:25:20 +0300
Message-Id: <8eaff6a30879c583f2f17944ea1868b51c9c2df2.1316431431.git.andriy.shevchenko@linux.intel.com>
In-Reply-To: <d94e72a2ae7292c5c890b1ad61f04bfdb983250c.1316431431.git.andriy.shevchenko@linux.intel.com>
References: <d94e72a2ae7292c5c890b1ad61f04bfdb983250c.1316431431.git.andriy.shevchenko@linux.intel.com>
In-Reply-To: <d94e72a2ae7292c5c890b1ad61f04bfdb983250c.1316431431.git.andriy.shevchenko@linux.intel.com>
References: <d94e72a2ae7292c5c890b1ad61f04bfdb983250c.1316431431.git.andriy.shevchenko@linux.intel.com>
Cc: Alexey Dokuchaev <danfe@nsu.ru>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This macro is dedicated to get rid of the compiler errors:
	lvalue required as left operand of assignment

Signed-off-by: Alexey Dokuchaev <danfe@nsu.ru>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 jffs2reader.c |   15 +++++++++------
 1 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/jffs2reader.c b/jffs2reader.c
index 1fc9e74..9aee92c 100644
--- a/jffs2reader.c
+++ b/jffs2reader.c
@@ -88,6 +88,9 @@ BUGS:
 #define MINOR(dev) ((dev)&0xff)
 #endif
 
+/* macro to avoid "lvalue required as left operand of assignment" error */
+#define ADD_BYTES(p, n)		((p) = (typeof(p))((char *)(p) + (n)))
+
 #define DIRENT_INO(dirent) ((dirent)!=NULL?je32_to_cpu((dirent)->ino):0)
 #define DIRENT_PINO(dirent) ((dirent)!=NULL?je32_to_cpu((dirent)->pino):0)
 
@@ -441,7 +444,7 @@ struct jffs2_raw_inode *find_raw_inode(char *o, size_t size, uint32_t ino)
 
 	do {
 		while (n < e && je16_to_cpu(n->u.magic) != JFFS2_MAGIC_BITMASK)
-			((char *) n) += 4;
+			ADD_BYTES(n, 4);
 
 		if (n < e && je16_to_cpu(n->u.magic) == JFFS2_MAGIC_BITMASK) {
 			if (je16_to_cpu(n->u.nodetype) == JFFS2_NODETYPE_INODE &&
@@ -459,7 +462,7 @@ struct jffs2_raw_inode *find_raw_inode(char *o, size_t size, uint32_t ino)
 					return (&(n->i));
 			}
 
-			((char *) n) += ((je32_to_cpu(n->u.totlen) + 3) & ~3);
+			ADD_BYTES(n, ((je32_to_cpu(n->u.totlen) + 3) & ~3));
 		} else
 			n = (union jffs2_node_union *) o;	/* we're at the end, rewind to the beginning */
 
@@ -509,7 +512,7 @@ struct dir *collectdir(char *o, size_t size, uint32_t ino, struct dir *d)
 
 	do {
 		while (n < e && je16_to_cpu(n->u.magic) != JFFS2_MAGIC_BITMASK)
-			((char *) n) += 4;
+			ADD_BYTES(n, 4);
 
 		if (n < e && je16_to_cpu(n->u.magic) == JFFS2_MAGIC_BITMASK) {
 			if (je16_to_cpu(n->u.nodetype) == JFFS2_NODETYPE_DIRENT &&
@@ -532,7 +535,7 @@ struct dir *collectdir(char *o, size_t size, uint32_t ino, struct dir *d)
 				}
 			}
 
-			((char *) n) += ((je32_to_cpu(n->u.totlen) + 3) & ~3);
+			ADD_BYTES(n, ((je32_to_cpu(n->u.totlen) + 3) & ~3));
 		} else
 			n = (union jffs2_node_union *) o;	/* we're at the end, rewind to the beginning */
 
@@ -596,7 +599,7 @@ struct jffs2_raw_dirent *resolvedirent(char *o, size_t size,
 
 	do {
 		while (n < e && je16_to_cpu(n->u.magic) != JFFS2_MAGIC_BITMASK)
-			((char *) n) += 4;
+			ADD_BYTES(n, 4);
 
 		if (n < e && je16_to_cpu(n->u.magic) == JFFS2_MAGIC_BITMASK) {
 			if (je16_to_cpu(n->u.nodetype) == JFFS2_NODETYPE_DIRENT &&
@@ -613,7 +616,7 @@ struct jffs2_raw_dirent *resolvedirent(char *o, size_t size,
 				}
 			}
 
-			((char *) n) += ((je32_to_cpu(n->u.totlen) + 3) & ~3);
+			ADD_BYTES(n, ((je32_to_cpu(n->u.totlen) + 3) & ~3));
 		} else
 			return dd;
 	} while (1);
-- 
1.7.5.4
