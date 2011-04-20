Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCToD-0005l6-Fn
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 09:34:54 +0000
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCHv4 1/3] mkfs.jffs2: fix casting of __off64_t
Date: Wed, 20 Apr 2011 12:35:08 +0300
Message-Id: <54dce27649702199efe5afb3d14e8f3f6103da00.1303292025.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <BANLkTi=gsiTx9PHQ7HJpzuZT2DvzGU_OqA@mail.gmail.com>
References: <BANLkTi=gsiTx9PHQ7HJpzuZT2DvzGU_OqA@mail.gmail.com>
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
index 7bb9ad1..7abaf50 100644
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
+					printf("\td %04o %9" PRIu64 "             %5d:%-3d %s\n",
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
+					printf("\ts %04o %9" PRIu64 "             %5d:%-3d %s\n",
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
+					printf("\tp %04o %9" PRIu64 "             %5d:%-3d %s\n",
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
+					printf("\tl %04o %9" PRIu64 "             %5d:%-3d %s -> %s\n",
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
+					printf("\tf %04o %9" PRIu64 " (%9u) %5d:%-3d %s\n",
+							e->sb.st_mode & ~S_IFMT, e->sb.st_size, wrote,
+							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
 				}
 				break;
 			default:
-- 
1.6.3.3
