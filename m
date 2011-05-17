Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMEnT-0004h6-1V
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 07:34:28 +0000
Received: from eru.research.nokia.com (esdhcp038109.research.nokia.com
	[172.21.38.109])
	by mgw-da02.nokia.com (Switch-3.4.4/Switch-3.4.3) with ESMTP id
	p4H7YFX0006045
	for <linux-mtd@lists.infradead.org>; Tue, 17 May 2011 10:34:25 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 09/11] fs-tests: integck: fsync directories as well
Date: Tue, 17 May 2011 10:38:14 +0300
Message-Id: <1305617896-23711-10-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1305617896-23711-1-git-send-email-dedekind1@gmail.com>
References: <1305617896-23711-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Call 'fsync()' for directories sometimes as well, and check synchronized
directories after re-mount - cound of directory entries has to be correct.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   36 +++++++++++++++++++++++++++++++++++-
 1 files changed, 35 insertions(+), 1 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 83706f8..84e3bef 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -178,6 +178,7 @@ struct dir_info /* Each directory has one of these */
 	unsigned int number_of_entries;
 	struct dir_entry_info *first;
 	struct dir_entry_info *entry; /* Dir entry of this dir */
+	unsigned int clean:1; /* Non-zero if the directory is synchronized */
 };
 
 struct dir_entry_info /* Each entry in a directory has one of these */
@@ -452,6 +453,7 @@ static void *add_dir_entry(struct dir_info *parent, char type, const char *name,
 		parent->first->prev = entry;
 	parent->first = entry;
 	parent->number_of_entries += 1;
+	parent->clean = 0;
 
 	if (entry->type == 'f') {
 		struct file_info *file = target;
@@ -488,6 +490,7 @@ static void *add_dir_entry(struct dir_info *parent, char type, const char *name,
 
 static void remove_dir_entry(struct dir_entry_info *entry, int free_target)
 {
+	entry->parent->clean = 0;
 	entry->parent->number_of_entries -= 1;
 	if (entry->parent->first == entry)
 		entry->parent->first = entry->next;
@@ -1711,7 +1714,7 @@ static void dir_check(struct dir_info *dir)
 	 * because it is possible that they have not reached the media by the
 	 * time of the emulated power cut.
 	 */
-	if (!args.power_cut_mode)
+	if (!args.power_cut_mode || dir->clean)
 		CHECK(checked == dir->number_of_entries);
 
 	/* Now check each entry */
@@ -2232,6 +2235,37 @@ static int operate_on_dir(struct dir_info *dir)
 			ret = operate_on_entry(entry);
 	}
 
+	if (ret)
+		return ret;
+
+	/* Synchronize the directory sometimes */
+	if (random_no(100) >= 99) {
+		char *path;
+		int fd;
+
+		path = dir_path(dir->parent, dir->entry->name);
+		fd = open(path, O_RDONLY);
+		if (fd == -1) {
+			pcv("cannot open directory %s", path);
+			free(path);
+			return -1;
+		}
+
+		if (random_no(100) >= 50) {
+			ret = fsync(fd);
+			if (ret)
+				pcv("directory fsync failed for %s", path);
+		} else {
+			ret = fdatasync(fd);
+			if (ret)
+				pcv("directory fdatasync failed for %s", path);
+		}
+		close(fd);
+		free(path);
+		if (!ret)
+			dir->clean = 1;
+	}
+
 	return ret;
 }
 
-- 
1.7.2.3
