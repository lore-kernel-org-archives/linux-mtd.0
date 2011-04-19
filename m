Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QC6Ol-00038O-GM
	for linux-mtd@lists.infradead.org; Tue, 19 Apr 2011 08:35:04 +0000
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
Subject: [PATCHv3 1/3] mkfs.jffs2: fix casting of __off64_t
Date: Tue, 19 Apr 2011 11:34:39 +0300
Message-Id: <971bada1c870aa0baf6e8d07784f95e31bb98213.1303202005.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <1303195429.2779.2.camel@localhost>
References: <1303195429.2779.2.camel@localhost>
Cc: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The casting of __off64_t to unsigned long potentially wrong for values higher
than ULONG_MAX.  Let's fix that by using PRIu64 classifier.

Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
---
 mkfs.jffs2.c |   25 +++++++++++++------------
 1 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index 7bb9ad1..468dfe5 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -72,8 +72,9 @@
 #endif
 #include <byteswap.h>
 #include <crc32.h>
-#include "rbtree.h"
+#include <inttypes.h>
 
+#include "rbtree.h"
 #include "common.h"
 
 /* Do not use the weird XPG version of basename */
@@ -1232,8 +1233,8 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
 		} else switch (e->sb.st_mode & S_IFMT) {
 			case S_IFDIR:
 				if (verbose) {
-					printf("\td %04o %9lu             %5d:%-3d %s\n",
-							e->sb.st_mode & ~S_IFMT, (unsigned long) e->sb.st_size,
+					printf("\td %04o %" PRIu64 "             %5d:%-3d %s\n",
+							e->sb.st_mode & ~S_IFMT, e->sb.st_size,
 							(int) (e->sb.st_uid), (int) (e->sb.st_gid),
 							e->name);
 				}
@@ -1242,8 +1243,8 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
 				break;
 			case S_IFSOCK:
 				if (verbose) {
-					printf("\ts %04o %9lu             %5d:%-3d %s\n",
-							e->sb.st_mode & ~S_IFMT, (unsigned long) e->sb.st_size,
+					printf("\ts %04o %" PRIu64 "             %5d:%-3d %s\n",
+							e->sb.st_mode & ~S_IFMT, e->sb.st_size,
 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
 				}
 				write_pipe(e);
@@ -1251,8 +1252,8 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
 				break;
 			case S_IFIFO:
 				if (verbose) {
-					printf("\tp %04o %9lu             %5d:%-3d %s\n",
-							e->sb.st_mode & ~S_IFMT, (unsigned long) e->sb.st_size,
+					printf("\tp %04o %" PRIu64 "             %5d:%-3d %s\n",
+							e->sb.st_mode & ~S_IFMT, e->sb.st_size,
 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
 				}
 				write_pipe(e);
@@ -1280,8 +1281,8 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
 				break;
 			case S_IFLNK:
 				if (verbose) {
-					printf("\tl %04o %9lu             %5d:%-3d %s -> %s\n",
-							e->sb.st_mode & ~S_IFMT, (unsigned long) e->sb.st_size,
+					printf("\tl %04o %" PRIu64 "             %5d:%-3d %s -> %s\n",
+							e->sb.st_mode & ~S_IFMT, e->sb.st_size,
 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name,
 							e->link);
 				}
@@ -1292,9 +1293,9 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
 				wrote = write_regular_file(e);
 				write_xattr_entry(e);
 				if (verbose) {
-					printf("\tf %04o %9lu (%9u) %5d:%-3d %s\n",
-							e->sb.st_mode & ~S_IFMT, (unsigned long) e->sb.st_size,
-							wrote, (int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
+					printf("\tf %04o %" PRIu64 " (%9u) %5d:%-3d %s\n",
+							e->sb.st_mode & ~S_IFMT, e->sb.st_size, wrote,
+							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
 				}
 				break;
 			default:
-- 
1.6.3.3
