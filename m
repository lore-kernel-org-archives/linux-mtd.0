Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nV-0003U4-3P
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:11 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFoZh018749
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:59 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 23/27] fs-tests: integck: do not use tests_get_total_space
Date: Wed, 13 Apr 2011 18:19:03 +0300
Message-Id: <1302707947-6143-24-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1302707947-6143-1-git-send-email-dedekind1@gmail.com>
References: <1302707947-6143-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Do not use the common tests_get_total_space but extend our own
get_free_space function and make it return both free and total
amount of space.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   18 ++++++++++--------
 1 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 9bf42af..a53be64 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -278,12 +278,15 @@ static char *cat_paths(const char *a, const char *b)
 /*
  * Get the free space for the tested file system.
  */
-static uint64_t get_free_space(void)
+static void get_fs_space(uint64_t *total, uint64_t *free)
 {
 	struct statvfs st;
 
 	CHECK(statvfs(fsinfo.mount_point, &st) == 0);
-	return (uint64_t)st.f_bavail * (uint64_t)st.f_frsize;
+	if (total)
+		*total = (uint64_t)st.f_blocks * (uint64_t)st.f_frsize;
+	if (free)
+		*free =  (uint64_t)st.f_bavail * (uint64_t)st.f_frsize;
 }
 
 static char *dir_path(struct dir_info *parent, const char *name)
@@ -862,7 +865,7 @@ static void file_mmap_write(struct file_info *file)
 
 	if (!file->links)
 		return;
-	free_space = get_free_space();
+	get_fs_space(NULL, &free_space);
 	if (!free_space)
 		return;
 	/* Randomly pick a written area of the file */
@@ -1939,8 +1942,7 @@ static void create_test_data(void)
 		uint64_t total;
 		for (i = 0; i < 10; ++i)
 			do_an_operation();
-		free = get_free_space();
-		total = tests_get_total_space();
+		get_fs_space(&total, &free);
 		if ((free * 100) / total >= 10)
 			break;
 	}
@@ -2006,8 +2008,7 @@ static void update_test_data(void)
 		uint64_t total;
 		for (i = 0; i < 10; ++i)
 			do_an_operation();
-		free = get_free_space();
-		total = tests_get_total_space();
+		get_fs_space(&total, &free);
 		if ((free * 100) / total >= 50)
 			break;
 	}
@@ -2281,7 +2282,8 @@ static void get_tested_fs_info(void)
 		fsinfo.can_mmap = 0;
 	}
 
-	for (z = get_free_space(); z >= 10; z /= 10)
+	get_fs_space(NULL, &z);
+	for (; z >= 10; z /= 10)
 		fsinfo.log10_initial_free += 1;
 
 	/* Pick the test directory name */
-- 
1.7.2.3
