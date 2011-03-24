Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2krH-0008Vw-Ld
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2011 13:45:52 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2ODjos1008931
	for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2011 15:45:50 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] fs-tests: integck: improve re-mounting test coverage
Date: Thu, 24 Mar 2011 15:48:41 +0200
Message-Id: <1300974521-9101-1-git-send-email-dedekind1@gmail.com>
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

The integck tests re-mounts the file-system from time to time
and checks the integrity afterwords. And it re-mounts always
the same-way: unmount and then mount R/W back. However, it is
better to do it differently some times, e.g.:

* re-mount R/O then re-mount R/W
* unmount then mount R/W
* both of the above
* unmount, mount R/O, then re-mount R/W
* etc.

This will give better test coverage. This patch does exactly
that by improving the 'tests_remount()' function.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/lib/tests.c |   84 +++++++++++++++++++++++++++++++++++++++----
 1 files changed, 76 insertions(+), 8 deletions(-)

diff --git a/tests/fs-tests/lib/tests.c b/tests/fs-tests/lib/tests.c
index 587eda8..00b94f9 100644
--- a/tests/fs-tests/lib/tests.c
+++ b/tests/fs-tests/lib/tests.c
@@ -1049,26 +1049,39 @@ out_mem:
 	return 1;
 }
 
-/* Un-mount and re-mount test file system */
+/*
+ * Re-mount test file system. Randomly choose how to do this: re-mount R/O then
+ * re-mount R/W, or unmount, then mount R/W, or unmount then mount R/O then
+ * re-mount R/W, etc. This should improve test coverage.
+ */
 void tests_remount(void)
 {
+	int err;
 	struct mntent mount_info;
-	char *source;
-	char *target;
-	char *filesystemtype;
-	unsigned long mountflags;
-	char *data;
+	char *source, *target, *filesystemtype, *data;
 	char cwd[4096];
+	unsigned long mountflags, flags;
+	unsigned int rorw1, um, um_ro, um_rorw, rorw2;
 
 	CHECK(tests_get_mount_info(&mount_info));
 
 	if (strcmp(mount_info.mnt_dir,"/") == 0)
 		return;
 
+	/* Save current working directory */
 	CHECK(getcwd(cwd, 4096) != NULL);
+	/* Temporarily change working directory to '/' */
 	CHECK(chdir("/") != -1);
 
-	CHECK(umount(tests_file_system_mount_dir) != -1);
+	/* Choose what to do */
+	rorw1 = tests_random_no(2);
+	um = tests_random_no(2);
+	um_ro = tests_random_no(2);
+	um_rorw = tests_random_no(2);
+	rorw2 = tests_random_no(2);
+
+	if (rorw1 + um + rorw2 == 0)
+		um = 1;
 
 	source = mount_info.mnt_fsname;
 	target = tests_file_system_mount_dir;
@@ -1076,7 +1089,62 @@ void tests_remount(void)
 	data = mount_info.mnt_opts;
 	process_mount_options(&data, &mountflags);
 
-	CHECK(mount(source, target, filesystemtype, mountflags, data) != -1);
+	if (rorw1) {
+		/* Re-mount R/O and then re-mount R/W */
+		flags = mountflags | MS_RDONLY | MS_REMOUNT;
+		err = mount(source, target, filesystemtype, flags, data);
+		CHECK(err != -1);
+
+		flags = mountflags | MS_REMOUNT;
+		flags &= ~((unsigned long)MS_RDONLY);
+		err = mount(source, target, filesystemtype, flags, data);
+		CHECK(err != -1);
+	}
+
+	if (um) {
+		/* Unmount and mount */
+		if (um_ro) {
+			/* But re-mount R/O before unmounting */
+			flags = mountflags | MS_RDONLY | MS_REMOUNT;
+			err = mount(source, target, filesystemtype,
+				    flags, data);
+			CHECK(err != -1);
+		}
+
+		CHECK(umount(target) != -1);
+
+		if (!um_rorw) {
+			/* Mount R/W straight away */
+			err = mount(source, target, filesystemtype,
+				    mountflags, data);
+			CHECK(err != -1);
+		} else {
+			/* Mount R/O and then re-mount R/W */
+			err = mount(source, target, filesystemtype,
+				    mountflags | MS_RDONLY, data);
+			CHECK(err != -1);
+
+			flags = mountflags | MS_REMOUNT;
+			flags &= ~((unsigned long)MS_RDONLY);
+			err = mount(source, target, filesystemtype,
+				    flags, data);
+			CHECK(err != -1);
+		}
+	}
+
+	if (rorw2) {
+		/* Re-mount R/O and then re-mount R/W */
+		flags = mountflags | MS_RDONLY | MS_REMOUNT;
+		err = mount(source, target, filesystemtype, flags, data);
+		CHECK(err != -1);
+
+		flags = mountflags | MS_REMOUNT;
+		flags &= ~((unsigned long)MS_RDONLY);
+		err = mount(source, target, filesystemtype, flags, data);
+		CHECK(err != -1);
+	}
+
+	/* Restore the previous working directory */
 	CHECK(chdir(cwd) != -1);
 }
 
-- 
1.7.2.3
