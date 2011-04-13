Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nR-0003SA-OG
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:06 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFofd018740
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:56 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 16/27] fs-tests: integck: do not use tests_cat_pid
Date: Wed, 13 Apr 2011 18:18:56 +0300
Message-Id: <1302707947-6143-17-git-send-email-dedekind1@gmail.com>
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

Do not use the shared 'tests_cat_pid' function but use a simple
sprintf instead. This is another step to make integck independent
of the common code.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 546077c..c21b488 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1970,14 +1970,14 @@ static void update_test_data(void)
 
 static int integck(void)
 {
-	pid_t pid;
+	unsigned int pid;
 	int64_t rpt;
 	char dir_name[256];
 
 	/* Make our top directory */
 	pid = getpid();
-	normsg("pid is %u", (unsigned) pid);
-	tests_cat_pid(dir_name, "integck_test_dir_", pid);
+	normsg("pid is %u", pid);
+	CHECK(sprintf(dir_name, "integck_test_dir_%u", pid) > 0);
 	if (chdir(dir_name) != -1) {
 		/* Remove it if it is already there */
 		tests_clear_dir(".");
-- 
1.7.2.3
