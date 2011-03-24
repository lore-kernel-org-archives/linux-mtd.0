Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2fp3-0006B8-7D
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2011 08:23:14 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2O8NA5T011335
	for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2011 10:23:10 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] fs-tests: test_1: fix compilation warnings
Date: Thu, 24 Mar 2011 10:25:53 +0200
Message-Id: <1300955153-4626-1-git-send-email-dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Fix the following compilation warnings:
test_1.c: In function ‘test_1’:
test_1.c:67:4: warning: format ‘%llu’ expects type ‘long long unsigned int’, but argument 3 has type ‘uint64_t’
test_1.c:88:3: warning: format ‘%llu’ expects type ‘long long unsigned int’, but argument 3 has type ‘uint64_t’

The fix is to cast the argument with (unsigned long long).

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/simple/test_1.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/fs-tests/simple/test_1.c b/tests/fs-tests/simple/test_1.c
index 69eafe4..79fd0b9 100644
--- a/tests/fs-tests/simple/test_1.c
+++ b/tests/fs-tests/simple/test_1.c
@@ -64,7 +64,7 @@ void test_1(void)
 	/* Create files to file up the file system */
 	for (block = 1000000, i = 1; ; block /= 10) {
 		while (i != 0) {
-			sprintf(name, "fill_up_%llu", i);
+			sprintf(name, "fill_up_%llu", (unsigned long long)i);
 			actual_size = tests_create_file(name, block);
 			if (actual_size != 0)
 				++i;
@@ -85,7 +85,7 @@ void test_1(void)
 	i -= 1;
 	CHECK(tests_count_files_in_dir(".") == i);
 	for (; i > 0; --i) {
-		sprintf(name, "fill_up_%llu", i);
+		sprintf(name, "fill_up_%llu", (unsigned long long)i);
 		tests_check_filled_file(name);
 		tests_delete_file(name);
 	}
-- 
1.7.4
