Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nQ-0003RJ-FT
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:04 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFpWf018758
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:54 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 13/27] fs-tests: integck: add own get_free_space function
Date: Wed, 13 Apr 2011 18:18:53 +0300
Message-Id: <1302707947-6143-14-git-send-email-dedekind1@gmail.com>
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

Do not use the shared 'tests_get_free_space' function but use own
implementation instead. This is another step to make integck independent
on the common infrastructure.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   20 ++++++++++++++++----
 1 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index e29db49..bfedeb2 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -35,6 +35,7 @@
 #include <sys/mman.h>
 #include <sys/vfs.h>
 #include <sys/mount.h>
+#include <sys/statvfs.h>
 #include "tests.h"
 
 #define PROGRAM_VERSION "1.1"
@@ -258,6 +259,17 @@ static char *cat_paths(const char *a, const char *b)
 	return str;
 }
 
+/*
+ * Get the free space for the tested file system.
+ */
+static uint64_t get_free_space(void)
+{
+	struct statvfs st;
+
+	CHECK(statvfs(args.mount_point, &st) != -1);
+	return (uint64_t)st.f_bavail * (uint64_t)st.f_frsize;
+}
+
 static char *dir_path(struct dir_info *parent, const char *name)
 {
 	char *parent_path;
@@ -834,7 +846,7 @@ static void file_mmap_write(struct file_info *file)
 
 	if (!file->links)
 		return;
-	free_space = tests_get_free_space();
+	free_space = get_free_space();
 	if (!free_space)
 		return;
 	/* Randomly pick a written area of the file */
@@ -1911,7 +1923,7 @@ static void create_test_data(void)
 		uint64_t total;
 		for (i = 0; i < 10; ++i)
 			do_an_operation();
-		free = tests_get_free_space();
+		free = get_free_space();
 		total = tests_get_total_space();
 		if ((free * 100) / total >= 10)
 			break;
@@ -1942,7 +1954,7 @@ static void update_test_data(void)
 		uint64_t total;
 		for (i = 0; i < 10; ++i)
 			do_an_operation();
-		free = tests_get_free_space();
+		free = get_free_space();
 		total = tests_get_total_space();
 		if ((free * 100) / total >= 50)
 			break;
@@ -1972,7 +1984,7 @@ static int integck(void)
 		CHECK(chdir("..") != -1);
 		CHECK(rmdir(dir_name) != -1);
 	}
-	initial_free_space = tests_get_free_space();
+	initial_free_space = get_free_space();
 	log10_initial_free_space = 0;
 	for (z = initial_free_space; z >= 10; z /= 10)
 		++log10_initial_free_space;
-- 
1.7.2.3
