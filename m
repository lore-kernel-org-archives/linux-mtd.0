Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nU-0003To-Jg
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:11 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFoZg018749
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:59 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 22/27] fs-tests: integck: do not use tests_remount
Date: Wed, 13 Apr 2011 18:19:02 +0300
Message-Id: <1302707947-6143-23-git-send-email-dedekind1@gmail.com>
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

Implement our own version of 'tests_remount()' instead of depending
on the common implementation.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |  167 +++++++++++++++++++++++++++++++++++-
 1 files changed, 165 insertions(+), 2 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 7a4bcdc..9bf42af 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -67,6 +67,11 @@ static struct {
  * can_mmap: file-system supports share writable 'mmap()' operation
  * is_rootfs: the tested file-system the root file-system
  * fstype: file-system type (e.g., "ubifs")
+ * fsdev: the underlying device mounted by the tested file-system
+ * mount_opts: non-standard mount options of the tested file-system (non-standard
+ *             options are stored in string form as a comma-separated list)
+ * mount_flags: standard mount options of the tested file-system (standard
+ *              options as stored as a set of flags)
  * mount_point: tested file-system mount point path
  * test_dir: the directory on the tested file-system where we test
  */
@@ -78,6 +83,9 @@ static struct {
 	unsigned int can_mmap:1;
 	unsigned int is_rootfs:1;
 	const char *fstype;
+	const char *fsdev;
+	const char *mount_opts;
+	unsigned long mount_flags;
 	const char *mount_point;
 	const char *test_dir;
 } fsinfo = {
@@ -2011,6 +2019,98 @@ static void update_test_data(void)
 		do_an_operation();
 }
 
+/**
+ * Re-mount the test file-system. This function randomly select how to
+ * re-mount.
+ */
+void remount_tested_fs(void)
+{
+	char *wd_save;
+	int ret;
+	unsigned long flags;
+	unsigned int rorw1, um, um_ro, um_rorw, rorw2;
+
+	/* Save current working directory */
+	wd_save = malloc(PATH_MAX + 1);
+	CHECK(wd_save != NULL);
+	CHECK(getcwd(wd_save, PATH_MAX + 1) != NULL);
+
+	/* Temporarily change working directory to '/' */
+	CHECK(chdir("/") == 0);
+
+	/* Choose what to do */
+	rorw1 = rand() & 1;
+	um = rand() & 1;
+	um_ro = rand() & 1;
+	um_rorw = rand() & 1;
+	rorw2 = rand() & 1;
+
+	if (rorw1 + um + rorw2 == 0)
+		um = 1;
+
+	if (rorw1) {
+		flags = fsinfo.mount_flags | MS_RDONLY | MS_REMOUNT;
+		ret = mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,
+			    flags, fsinfo.mount_opts);
+		CHECK(ret == 0);
+
+		flags = fsinfo.mount_flags | MS_REMOUNT;
+		flags &= ~((unsigned long)MS_RDONLY);
+		ret = mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,
+			    flags, fsinfo.mount_opts);
+		CHECK(ret == 0);
+	}
+
+	if (um) {
+		if (um_ro) {
+			flags = fsinfo.mount_flags | MS_RDONLY | MS_REMOUNT;
+			ret = mount(fsinfo.fsdev, fsinfo.mount_point,
+				    fsinfo.fstype, flags, fsinfo.mount_opts);
+			CHECK(ret == 0);
+		}
+
+		CHECK(umount(fsinfo.mount_point) != -1);
+
+		if (!um_rorw) {
+			ret = mount(fsinfo.fsdev, fsinfo.mount_point,
+				    fsinfo.fstype, fsinfo.mount_flags,
+				    fsinfo.mount_opts);
+			CHECK(ret == 0);
+		} else {
+			ret = mount(fsinfo.fsdev, fsinfo.mount_point,
+				    fsinfo.fstype, fsinfo.mount_flags | MS_RDONLY,
+				    fsinfo.mount_opts);
+			CHECK(ret == 0);
+
+			flags = fsinfo.mount_flags | MS_REMOUNT;
+			flags &= ~((unsigned long)MS_RDONLY);
+			ret = mount(fsinfo.fsdev, fsinfo.mount_point,
+				    fsinfo.fstype, flags, fsinfo.mount_opts);
+			CHECK(ret == 0);
+		}
+	}
+
+	if (rorw2) {
+		flags = fsinfo.mount_flags | MS_RDONLY | MS_REMOUNT;
+		ret = mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,
+			    flags, fsinfo.mount_opts);
+		CHECK(ret == 0);
+
+		flags = fsinfo.mount_flags | MS_REMOUNT;
+		flags &= ~((unsigned long)MS_RDONLY);
+		ret = mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,
+			    flags, fsinfo.mount_opts);
+		CHECK(ret == 0);
+	}
+
+	/* Restore the previous working directory */
+	CHECK(chdir(wd_save) == 0);
+	free(wd_save);
+}
+
+/*
+ * Perform the test. Returns zero on success and -1 on failure.
+ */
 static int integck(void)
 {
 	int64_t rpt;
@@ -2030,7 +2130,7 @@ static int integck(void)
 
 	if (fsinfo.is_rootfs) {
 		close_open_files();
-		tests_remount(); /* Requires root access */
+		remount_tested_fs();
 	}
 
 	/* Check everything */
@@ -2043,7 +2143,7 @@ static int integck(void)
 
 		if (!fsinfo.is_rootfs) {
 			close_open_files();
-			tests_remount(); /* Requires root access */
+			remount_tested_fs();
 		}
 
 		/* Check everything */
@@ -2060,6 +2160,67 @@ static int integck(void)
 }
 
 /*
+ * This is a helper function for 'get_tested_fs_info()'. It parses file-system
+ * mount options string, extracts standard mount options from there, and saves
+ * them in the 'fsinfo.mount_flags' variable, and non-standard mount options
+ * are saved in the 'fsinfo.mount_opts' variable. The reason for this is that
+ * we want to preserve mount options when unmounting the file-system and
+ * mounting it again. This is because we cannot pass standard mount optins
+ * (like sync, ro, etc) as a string to the 'mount()' function, because it
+ * fails. It accepts standard mount options only as flags. And only the
+ * FS-specific mount options are accepted in form of a string.
+ */
+static void parse_mount_options(const char *mount_opts)
+{
+	char *tmp, *opts, *p;
+	const char *opt;
+
+	/*
+	 * We are going to use 'strtok()' which modifies the original string,
+	 * so duplicate it.
+	 */
+	tmp = dup_string(mount_opts);
+	p = opts = calloc(1, strlen(mount_opts) + 1);
+	CHECK(opts != NULL);
+
+	opt = strtok(tmp, ",");
+	while (opt) {
+		if (!strcmp(opt, "rw"))
+			;
+		else if (!strcmp(opt, "ro"))
+			fsinfo.mount_flags |= MS_RDONLY;
+		else if (!strcmp(opt, "dirsync"))
+			fsinfo.mount_flags |= MS_DIRSYNC;
+		else if (!strcmp(opt, "noatime"))
+			fsinfo.mount_flags |= MS_NOATIME;
+		else if (!strcmp(opt, "nodiratime"))
+			fsinfo.mount_flags |= MS_NODIRATIME;
+		else if (!strcmp(opt, "noexec"))
+			fsinfo.mount_flags |= MS_NOEXEC;
+		else if (!strcmp(opt, "nosuid"))
+			fsinfo.mount_flags |= MS_NOSUID;
+		else if (!strcmp(opt, "relatime"))
+			fsinfo.mount_flags |= MS_RELATIME;
+		else if (!strcmp(opt, "sync"))
+			fsinfo.mount_flags |= MS_SYNCHRONOUS;
+		else {
+			int len = strlen(opt);
+
+			if (p != opts)
+				*p++ = ',';
+			memcpy(p, opt, len);
+			p += len;
+			*p = '\0';
+		}
+
+		opt = strtok(NULL, ",");
+	}
+
+	free(tmp);
+	fsinfo.mount_opts = opts;
+}
+
+/*
  * Fill 'fsinfo' with information about the tested file-system.
  */
 static void get_tested_fs_info(void)
@@ -2104,6 +2265,8 @@ static void get_tested_fs_info(void)
         fclose(f);
 
 	fsinfo.fstype = dup_string(mntent->mnt_type);
+	fsinfo.fsdev = strdup(mntent->mnt_fsname);
+	parse_mount_options(mntent->mnt_opts);
 
 	/* Get memory page size for 'mmap()' */
 	fsinfo.page_size = sysconf(_SC_PAGE_SIZE);
-- 
1.7.2.3
