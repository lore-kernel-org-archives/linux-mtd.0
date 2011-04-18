Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QBjoi-0000uA-R5
	for linux-mtd@lists.infradead.org; Mon, 18 Apr 2011 08:28:25 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3I8SIVJ002200
	for <linux-mtd@lists.infradead.org>; Mon, 18 Apr 2011 11:28:18 +0300
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCHv2 2/2] mkfs.jffs2: fix casting of __off64_t
Date: Mon, 18 Apr 2011 11:31:48 +0300
Message-Id: <2285954c62e0401291aa3f5055bc79c6789149d7.1303115468.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <802c3655ae5130e95b01e5004710f206a3d9ef9c.1303115468.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <802c3655ae5130e95b01e5004710f206a3d9ef9c.1303115468.git.ext-andriy.shevchenko@nokia.com>
References: <1302783893.2796.27.camel@localhost>
	<802c3655ae5130e95b01e5004710f206a3d9ef9c.1303115468.git.ext-andriy.shevchenko@nokia.com>
References: <802c3655ae5130e95b01e5004710f206a3d9ef9c.1303115468.git.ext-andriy.shevchenko@nokia.com>
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
than ULONG_MAX.  Let's fix that.

Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
---
 mkfs.jffs2.c |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/mkfs.jffs2.c b/mkfs.jffs2.c
index 7bb9ad1..01db4be 100644
--- a/mkfs.jffs2.c
+++ b/mkfs.jffs2.c
@@ -1232,8 +1232,8 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
 		} else switch (e->sb.st_mode & S_IFMT) {
 			case S_IFDIR:
 				if (verbose) {
-					printf("\td %04o %9lu             %5d:%-3d %s\n",
-							e->sb.st_mode & ~S_IFMT, (unsigned long) e->sb.st_size,
+					printf("\td %04o %llu             %5d:%-3d %s\n",
+							e->sb.st_mode & ~S_IFMT, (unsigned long long) e->sb.st_size,
 							(int) (e->sb.st_uid), (int) (e->sb.st_gid),
 							e->name);
 				}
@@ -1242,8 +1242,8 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
 				break;
 			case S_IFSOCK:
 				if (verbose) {
-					printf("\ts %04o %9lu             %5d:%-3d %s\n",
-							e->sb.st_mode & ~S_IFMT, (unsigned long) e->sb.st_size,
+					printf("\ts %04o %llu             %5d:%-3d %s\n",
+							e->sb.st_mode & ~S_IFMT, (unsigned long long) e->sb.st_size,
 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
 				}
 				write_pipe(e);
@@ -1251,8 +1251,8 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
 				break;
 			case S_IFIFO:
 				if (verbose) {
-					printf("\tp %04o %9lu             %5d:%-3d %s\n",
-							e->sb.st_mode & ~S_IFMT, (unsigned long) e->sb.st_size,
+					printf("\tp %04o %llu             %5d:%-3d %s\n",
+							e->sb.st_mode & ~S_IFMT, (unsigned long long) e->sb.st_size,
 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
 				}
 				write_pipe(e);
@@ -1280,8 +1280,8 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
 				break;
 			case S_IFLNK:
 				if (verbose) {
-					printf("\tl %04o %9lu             %5d:%-3d %s -> %s\n",
-							e->sb.st_mode & ~S_IFMT, (unsigned long) e->sb.st_size,
+					printf("\tl %04o %llu             %5d:%-3d %s -> %s\n",
+							e->sb.st_mode & ~S_IFMT, (unsigned long long) e->sb.st_size,
 							(int) e->sb.st_uid, (int) e->sb.st_gid, e->name,
 							e->link);
 				}
@@ -1292,8 +1292,8 @@ static void recursive_populate_directory(struct filesystem_entry *dir)
 				wrote = write_regular_file(e);
 				write_xattr_entry(e);
 				if (verbose) {
-					printf("\tf %04o %9lu (%9u) %5d:%-3d %s\n",
-							e->sb.st_mode & ~S_IFMT, (unsigned long) e->sb.st_size,
+					printf("\tf %04o %llu (%9u) %5d:%-3d %s\n",
+							e->sb.st_mode & ~S_IFMT, (unsigned long long) e->sb.st_size,
 							wrote, (int) e->sb.st_uid, (int) e->sb.st_gid, e->name);
 				}
 				break;
-- 
1.6.3.3
