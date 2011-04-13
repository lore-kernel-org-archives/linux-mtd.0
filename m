Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nR-0003Rq-BJ
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:05 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFnVQ018687
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:55 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 15/27] fs-tests: integck: remove trailing backslashes from
	mount point
Date: Wed, 13 Apr 2011 18:18:55 +0300
Message-Id: <1302707947-6143-16-git-send-email-dedekind1@gmail.com>
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

The test is not working if the user specified mount point with a trailing
back-slash at the end. Note, this had not worked before my changes as well.
Fix this.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   19 ++++++++++++++-----
 1 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 910f22a..546077c 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -63,6 +63,7 @@ static struct {
  *                ENOSPC error
  * can_mmap: file-system supports share writable 'mmap()' operation
  * fstype: file-system type (e.g., "ubifs")
+ * mount_point: tested file-system mount point path
  */
 static struct {
 	int max_name_len;
@@ -71,6 +72,7 @@ static struct {
 	unsigned int nospc_size_ok:1;
 	unsigned int can_mmap:1;
 	const char *fstype;
+	const char *mount_point;
 } fsinfo = {
 	.nospc_size_ok = 1,
 	.can_mmap = 1,
@@ -265,7 +267,7 @@ static uint64_t get_free_space(void)
 {
 	struct statvfs st;
 
-	CHECK(statvfs(args.mount_point, &st) != -1);
+	CHECK(statvfs(fsinfo.mount_point, &st) != -1);
 	return (uint64_t)st.f_bavail * (uint64_t)st.f_frsize;
 }
 
@@ -275,7 +277,7 @@ static char *dir_path(struct dir_info *parent, const char *name)
 	char *path;
 
 	if (!parent)
-		return cat_paths(args.mount_point, name);
+		return cat_paths(fsinfo.mount_point, name);
 	parent_path = dir_path(parent->parent, parent->name);
 	path = cat_paths(parent_path, name);
 	free(parent_path);
@@ -2033,9 +2035,16 @@ static void get_tested_fs_info(void)
 	const char *mp;
         FILE *f;
 	uint64_t z;
+	char *p;
 
-	CHECK(statfs(args.mount_point, &fs_info) == 0);
+	/* Remove trailing '/' symbols from the mount point */
+	p = dup_string(args.mount_point);
+	fsinfo.mount_point = p;
+	p += strlen(p);
+	while (*--p == '/');
+	*(p + 1) = '\0';
 
+	CHECK(statfs(fsinfo.mount_point, &fs_info) == 0);
 	fsinfo.max_name_len = fs_info.f_namelen;
 
 	mp = "/proc/mounts";
@@ -2053,7 +2062,7 @@ static void get_tested_fs_info(void)
 			CHECK(0);
 		}
 
-		if (!strcmp(mntent->mnt_dir, args.mount_point))
+		if (!strcmp(mntent->mnt_dir, fsinfo.mount_point))
 			break;
         }
         fclose(f);
@@ -2164,7 +2173,7 @@ int main(int argc, char *argv[])
 	get_tested_fs_info();
 
 	/* Temporary hack - will be fixed a bit later */
-	tests_file_system_mount_dir = (void *)args.mount_point;
+	tests_file_system_mount_dir = (void *)fsinfo.mount_point;
 	tests_file_system_type = (void *)fsinfo.fstype;
 
 	/* Do the actual test */
-- 
1.7.2.3
