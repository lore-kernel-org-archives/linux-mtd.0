Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9zxa-0002Ne-4c
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 13:18:19 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DDIGOw017986
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 16:18:16 +0300
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCHv1 1/5] mkfs.jffs2: fix casting of printf argument
Date: Wed, 13 Apr 2011 16:20:25 +0300
Message-Id: <ec50e9f8ced473683c8c8e981607737dfb015c3b.1302700658.git.ext-andriy.shevchenko@nokia.com>
Cc: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The compiler warns us about cast mismatch for %9lu specifier.  In original code
the argument has __off64_t type. Here is a simple type casting fix.

Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
---
 mkfs.jffs2.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index 3aab533..7bb9ad1 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -1233,7 +1233,7 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
 			case S_IFDIR:
 				if (verbose) {
 					printf("\td %04o %9lu             %5d:%-3d %s\n",
-							e->sb.st_mode & ~S_IFMT, e->sb.st_size,
+							e->sb.st_mode & ~S_IFMT, (unsigned long) e->sb.st_size,
 							(int) (e->sb.st_uid), (int) (e->sb.st_gid),
 							e->name);
 				}
@@ -1243,7 +1243,7 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
 			case S_IFSOCK:
 				if (verbose) {
 					printf("\ts %04o %9lu             %5d:%-3d %s\n",
-							e->sb.st_mode & ~S_IFMT, e->sb.st_size,
+							e->sb.st_mode & ~S_IFMT, (unsigned long) e->sb.st_size,
 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
 				}
 				write_pipe(e);
@@ -1252,7 +1252,7 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
 			case S_IFIFO:
 				if (verbose) {
 					printf("\tp %04o %9lu             %5d:%-3d %s\n",
-							e->sb.st_mode & ~S_IFMT, e->sb.st_size,
+							e->sb.st_mode & ~S_IFMT, (unsigned long) e->sb.st_size,
 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
 				}
 				write_pipe(e);
@@ -1281,7 +1281,7 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
 			case S_IFLNK:
 				if (verbose) {
 					printf("\tl %04o %9lu             %5d:%-3d %s -> %s\n",
-							e->sb.st_mode & ~S_IFMT, e->sb.st_size,
+							e->sb.st_mode & ~S_IFMT, (unsigned long) e->sb.st_size,
 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name,
 							e->link);
 				}
@@ -1293,8 +1293,8 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
 				write_xattr_entry(e);
 				if (verbose) {
 					printf("\tf %04o %9lu (%9u) %5d:%-3d %s\n",
-							e->sb.st_mode & ~S_IFMT, e->sb.st_size, wrote,
-							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
+							e->sb.st_mode & ~S_IFMT, (unsigned long) e->sb.st_size,
+							wrote, (int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
 				}
 				break;
 			default:
-- 
1.6.3.3
