Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KSrhx-0008BR-Ej
	for linux-mtd@lists.infradead.org; Tue, 12 Aug 2008 11:06:33 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx09.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m7CB3aBc019327
	for <linux-mtd@lists.infradead.org>; Tue, 12 Aug 2008 06:06:26 -0500
Message-ID: <48A16F16.4080208@nokia.com>
Date: Tue, 12 Aug 2008 14:08:06 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/3] [MTD-UTILS] fs-tests: fix symlink bug in integrity test
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   23 ++++++++++++++++-------
 1 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index f1a544a..be93d3e 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1655,22 +1655,31 @@ static char *pick_symlink_target(const char *symlink_path)
 	return rel_path;
 }
 
-static void symlink_new(struct dir_info *dir, const char *name)
+static void symlink_new(struct dir_info *dir, const char *name_)
 {
 	struct symlink_info *s;
-	char *path;
+	char *path, *target, *name = copy_string(name_);
 	size_t sz;
 
+	path = dir_path(dir, name);
+	target = pick_symlink_target(path);
+	if (symlink(target, path) == -1) {
+		CHECK(errno == ENOSPC);
+		full = 1;
+		free(target);
+		free(path);
+		free(name);
+		return;
+	}
+	free(path);
+
 	sz = sizeof(struct symlink_info);
 	s = malloc(sz);
 	CHECK(s != NULL);
 	memset(s, 0, sz);
 	add_dir_entry(dir, 's', name, s);
-
-	path = dir_path(dir, name);
-	s->target_pathname = pick_symlink_target(path);
-	CHECK(symlink(s->target_pathname, path) != -1);
-	free(path);
+	s->target_pathname = target;
+	free(name);
 }
 
 static void symlink_remove(struct symlink_info *symlink)
-- 
1.5.2.5
