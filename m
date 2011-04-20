Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURq-00063k-Pf
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:15:54 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFnfG009522
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:49 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 04/35] fs-tests: integck: handle errors in remount_tested_fs
Date: Wed, 20 Apr 2011 13:18:37 +0300
Message-Id: <1303294748-5492-5-git-send-email-dedekind1@gmail.com>
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

Teach 'remount_tested_fs()' return error code when it fails
to mount the file-system.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   35 ++++++++++++++++++++++++-----------
 1 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index d138a7d..5b1adc1 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -2076,7 +2076,7 @@ static void update_test_data(void)
  * Re-mount the test file-system. This function randomly select how to
  * re-mount.
  */
-void remount_tested_fs(void)
+static int remount_tested_fs(void)
 {
 	char *wd_save;
 	int ret;
@@ -2105,13 +2105,15 @@ void remount_tested_fs(void)
 		flags = fsinfo.mount_flags | MS_RDONLY | MS_REMOUNT;
 		ret = mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,
 			    flags, fsinfo.mount_opts);
-		CHECK(ret == 0);
+		if (ret)
+			return -1;
 
 		flags = fsinfo.mount_flags | MS_REMOUNT;
 		flags &= ~((unsigned long)MS_RDONLY);
 		ret = mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,
 			    flags, fsinfo.mount_opts);
-		CHECK(ret == 0);
+		if (ret)
+			return -1;
 	}
 
 	if (um) {
@@ -2119,7 +2121,8 @@ void remount_tested_fs(void)
 			flags = fsinfo.mount_flags | MS_RDONLY | MS_REMOUNT;
 			ret = mount(fsinfo.fsdev, fsinfo.mount_point,
 				    fsinfo.fstype, flags, fsinfo.mount_opts);
-			CHECK(ret == 0);
+			if (ret)
+				return -1;
 		}
 
 		CHECK(umount(fsinfo.mount_point) != -1);
@@ -2128,18 +2131,21 @@ void remount_tested_fs(void)
 			ret = mount(fsinfo.fsdev, fsinfo.mount_point,
 				    fsinfo.fstype, fsinfo.mount_flags,
 				    fsinfo.mount_opts);
-			CHECK(ret == 0);
+			if (ret)
+				return -1;
 		} else {
 			ret = mount(fsinfo.fsdev, fsinfo.mount_point,
 				    fsinfo.fstype, fsinfo.mount_flags | MS_RDONLY,
 				    fsinfo.mount_opts);
-			CHECK(ret == 0);
+			if (ret)
+				return -1;
 
 			flags = fsinfo.mount_flags | MS_REMOUNT;
 			flags &= ~((unsigned long)MS_RDONLY);
 			ret = mount(fsinfo.fsdev, fsinfo.mount_point,
 				    fsinfo.fstype, flags, fsinfo.mount_opts);
-			CHECK(ret == 0);
+			if (ret)
+				return -1;
 		}
 	}
 
@@ -2147,18 +2153,21 @@ void remount_tested_fs(void)
 		flags = fsinfo.mount_flags | MS_RDONLY | MS_REMOUNT;
 		ret = mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,
 			    flags, fsinfo.mount_opts);
-		CHECK(ret == 0);
+		if (ret)
+			return -1;
 
 		flags = fsinfo.mount_flags | MS_REMOUNT;
 		flags &= ~((unsigned long)MS_RDONLY);
 		ret = mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,
 			    flags, fsinfo.mount_opts);
-		CHECK(ret == 0);
+		if (ret)
+			return -1;
 	}
 
 	/* Restore the previous working directory */
 	CHECK(chdir(wd_save) == 0);
 	free(wd_save);
+	return 0;
 }
 
 /*
@@ -2188,7 +2197,9 @@ static int integck(void)
 
 	if (fsinfo.is_rootfs) {
 		close_open_files();
-		remount_tested_fs();
+		ret = remount_tested_fs();
+		if (ret)
+			return -1;
 	}
 
 	/* Check everything */
@@ -2201,7 +2212,9 @@ static int integck(void)
 
 		if (!fsinfo.is_rootfs) {
 			close_open_files();
-			remount_tested_fs();
+			ret = remount_tested_fs();
+			if (ret)
+				return -1;
 		}
 
 		/* Check everything */
-- 
1.7.2.3
