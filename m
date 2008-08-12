Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KSriu-0000pP-Gj
	for linux-mtd@lists.infradead.org; Tue, 12 Aug 2008 11:07:33 +0000
Received: from vaebh105.NOE.Nokia.com (vaebh105.europe.nokia.com
	[10.160.244.31])
	by mgw-mx03.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m7CB7HCf015822
	for <linux-mtd@lists.infradead.org>; Tue, 12 Aug 2008 14:07:30 +0300
Message-ID: <48A16F1B.4040700@nokia.com>
Date: Tue, 12 Aug 2008 14:08:11 +0300
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/3] [MTD-UTILS] fs-tests: fix max file name length in
	integrity test
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
 tests/fs-tests/integrity/integck.c |    2 +-
 tests/fs-tests/lib/tests.c         |    4 ++++
 tests/fs-tests/lib/tests.h         |    3 +++
 3 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index f1a544a..ab69343 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1388,7 +1388,7 @@ static char *make_name(struct dir_info *dir)
 	do {
 		found = 0;
 		if (tests_random_no(5) == 1) {
-			int i, n = tests_random_no(255) + 1;
+			int i, n = tests_random_no(tests_max_fname_len) + 1;
 
 			CHECK(n > 0 && n < 256);
 			for (i = 0; i < n; i++)
diff --git a/tests/fs-tests/lib/tests.c b/tests/fs-tests/lib/tests.c
index 97e5207..570672f 100644
--- a/tests/fs-tests/lib/tests.c
+++ b/tests/fs-tests/lib/tests.c
@@ -83,6 +83,9 @@ int tests_hole_flag = 0;
 /* Whether it is ok to test on the root file system */
 static int rootok = 0;
 
+/* Maximum file name length of test file system (from statfs) */
+long tests_max_fname_len = 255;
+
 /* Function invoked by the CHECK macro */
 void tests_test(int test,const char *msg,const char *file,unsigned line)
 {
@@ -370,6 +373,7 @@ void tests_check_test_file_system(void)
 			"TEST_FILE_SYSTEM_MOUNT_DIR\n");
 		CHECK(0);
 	}
+	tests_max_fname_len = fs_info.f_namelen;
 	if (strcmp(tests_file_system_type, "jffs2") == 0 &&
 			fs_info.f_type != JFFS2_SUPER_MAGIC) {
 		fprintf(stderr,	"File system type is not jffs2\n");
diff --git a/tests/fs-tests/lib/tests.h b/tests/fs-tests/lib/tests.h
index 04c834d..01849bc 100644
--- a/tests/fs-tests/lib/tests.h
+++ b/tests/fs-tests/lib/tests.h
@@ -202,4 +202,7 @@ extern int tests_hole_flag;
 /* Program name from argv[0] */
 extern char *program_name;
 
+/* Maximum file name length of test file system (from statfs) */
+extern long tests_max_fname_len;
+
 #endif
-- 
1.5.4.3
