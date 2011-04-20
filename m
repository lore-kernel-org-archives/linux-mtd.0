Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURq-00063j-FK
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:15:54 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFnlG009509
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:49 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 03/35] fs-tests: integck: handle write failures in dir_new
Date: Wed, 20 Apr 2011 13:18:36 +0300
Message-Id: <1303294748-5492-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303294748-5492-1-git-send-email-dedekind1@gmail.com>
References: <1303294748-5492-1-git-send-email-dedekind1@gmail.com>
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

Do not die in 'dir_new()' if it cannot create a new directory and
this is not because of ENOSPC. Return NULL for all errors.

Note, not all callers are ready to properly handle all errors so far.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   32 ++++++++++++++++----------------
 1 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index dd1ba1c..d138a7d 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -284,19 +284,12 @@ static char *cat_strings(const char *a, const char *b)
 static char *cat_paths(const char *a, const char *b)
 {
 	char *str;
-	size_t sz;
-	int as, bs;
-	size_t na, nb;
+	size_t sz, na, nb;
+	int as = 0, bs = 0;
 
-	if (a && !b)
-		return dup_string(a);
-	if (b && !a)
-		return dup_string(b);
-	if (!a && !b)
-		return NULL;
+	assert(a != NULL);
+	assert(b != NULL);
 
-	as = 0;
-	bs = 0;
 	na = strlen(a);
 	nb = strlen(b);
 	if (na && a[na - 1] == '/')
@@ -333,8 +326,7 @@ static void get_fs_space(uint64_t *total, uint64_t *free)
 
 static char *dir_path(struct dir_info *parent, const char *name)
 {
-	char *parent_path;
-	char *path;
+	char *parent_path, *path;
 
 	if (!parent)
 		return cat_paths(fsinfo.mount_point, name);
@@ -454,6 +446,12 @@ static void remove_dir_entry(struct dir_entry_info *entry)
 	free(entry);
 }
 
+/*
+ * Create a new directory "name" in the parent directory described by "parent"
+ * and add it to the in-memory list of directories. In case of success, returns
+ * a pointer to the new 'struct dir_info' object. Returns 'NULL' in case of
+ * failure.
+ */
 static struct dir_info *dir_new(struct dir_info *parent, const char *name)
 {
 	struct dir_info *dir;
@@ -461,8 +459,10 @@ static struct dir_info *dir_new(struct dir_info *parent, const char *name)
 
 	path = dir_path(parent, name);
 	if (mkdir(path, 0777) != 0) {
-		CHECK(errno == ENOSPC);
-		full = 1;
+		if (errno == ENOSPC)
+			full = 1;
+		else
+			pcv("cannot create directory %s", path);
 		free(path);
 		return NULL;
 	}
@@ -2167,7 +2167,7 @@ void remount_tested_fs(void)
 static int integck(void)
 {
 	int ret;
-	int64_t rpt;
+	long rpt;
 
 	CHECK(chdir(fsinfo.mount_point) == 0);
 
-- 
1.7.2.3
