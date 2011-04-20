Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURv-00066x-JC
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:16:07 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFlpI009474
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:54 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 17/35] fs-tests: integck: teach symlink_new to return error on
	creation failure
Date: Wed, 20 Apr 2011 13:18:50 +0300
Message-Id: <1303294748-5492-18-git-send-email-dedekind1@gmail.com>
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

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   23 +++++++++++++++++------
 1 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index e69d4c4..fbf24fb 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1806,21 +1806,31 @@ static char *pick_symlink_target(const char *symlink_path)
 	return rel_path;
 }
 
-static void symlink_new(struct dir_info *dir, const char *name_)
+static int symlink_new(struct dir_info *dir, const char *nm)
 {
 	struct symlink_info *s;
-	char *path, *target, *name = dup_string(name_);
+	char *path, *target, *name = dup_string(nm);
 
+	/*
+	 * Note, we need to duplicate the input 'name' string because of the
+	 * shared random_name_buf.
+	 */
 	path = dir_path(dir, name);
 	target = pick_symlink_target(path);
 	if (symlink(target, path) != 0) {
-		CHECK(errno == ENOSPC || errno == ENAMETOOLONG);
+		int ret = 0;
+
 		if (errno == ENOSPC)
 			full = 1;
+		else if (errno != ENAMETOOLONG) {
+			pcv("cannot create symlink %s in directory %s to file %s",
+			    path, dir->name, target);
+			ret = -1;
+		}
 		free(target);
-		free(path);
 		free(name);
-		return;
+		free(path);
+		return ret;
 	}
 	free(path);
 
@@ -1828,6 +1838,7 @@ static void symlink_new(struct dir_info *dir, const char *name_)
 	add_dir_entry(dir, 's', name, s);
 	s->target_pathname = target;
 	free(name);
+	return 0;
 }
 
 static void symlink_remove(struct symlink_info *symlink)
@@ -1944,7 +1955,7 @@ static int operate_on_dir(struct dir_info *dir)
 		link_new(dir, make_name(dir), file);
 	else if (r == 3 && grow && random_no(5) == 0)
 		/* When growing, 1 time in 70 create a symbolic link */
-		symlink_new(dir, make_name(dir));
+		return symlink_new(dir, make_name(dir));
 	else {
 		/* Otherwise randomly select an entry to operate on */
 		r = random_no(dir->number_of_entries);
-- 
1.7.2.3
