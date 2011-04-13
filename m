Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nQ-0003RH-FH
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:04 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFnRu018697
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:51 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 06/27] fs-tests: integck: change tests defaults
Date: Wed, 13 Apr 2011 18:18:46 +0300
Message-Id: <1302707947-6143-7-git-send-email-dedekind1@gmail.com>
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

Currently integck assumes that by default the file-system cannot
do shared writable mmap-ing and does not preserve accurate file
size after ENOSPC errors. And then it overrides these default
settings if this is UBIFS.

But it seems that only JFFS2 has those limitations. So make the
defaults to be the opposite and override them for JFFS2 only.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   17 ++++++++++-------
 1 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 92e37a1..ea3684b 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -133,10 +133,10 @@ static uint64_t initial_free_space = 0; /* Free space on file system when
 					   test starts */
 static unsigned log10_initial_free_space = 0; /* log10 of initial_free_space */
 
-static int check_nospc_files = 0; /* Also check data in files that incurred a
+static int check_nospc_files = 1; /* Also check data in files that incurred a
 				     "no space" error */
 
-static int can_mmap = 0; /* Can write via mmap */
+static int can_mmap = 1; /* Can write via mmap */
 
 static long mem_page_size; /* Page size for mmap */
 
@@ -2027,16 +2027,19 @@ int main(int argc, char *argv[])
 			integck_get_description(), "n");
 	if (!run_test)
 		return 1;
+
 	/* Change directory to the file system and check it is ok for testing */
 	tests_check_test_file_system();
+
 	/*
-	 * We expect accurate file size from ubifs even after "no space"
-	 * errors. And we can mmap.
+	 * JFFS2 does not support shared writable mmap and it may report
+	 * incorrect file size after "no space" errors.
 	 */
-	if (strcmp(tests_file_system_type, "ubifs") == 0) {
-		check_nospc_files = 1;
-		can_mmap = 1;
+	if (strcmp(tests_file_system_type, "jffs2") == 0) {
+		check_nospc_files = 0;
+		can_mmap = 0;
 	}
+
 	/* Do the actual test */
 	integck();
 	return 0;
-- 
1.7.2.3
