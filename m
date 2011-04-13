Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nO-0003Qd-Ts
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:00 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFofb018740
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:15:53 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 10/27] fs-tests: integck: make integck function return error
Date: Wed, 13 Apr 2011 18:18:50 +0300
Message-Id: <1302707947-6143-11-git-send-email-dedekind1@gmail.com>
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

Turn the 'void integck(void)' function into 'static int integck(void)'.
We need to teach the test to gracefully handle some error cases like
'EROFS' instead of failing and exiting straight away. And the ground
work for this is making all functions return errors. This is the first
tiny step in this direction.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   13 +++++++++----
 1 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index ebe4995..3ee20b2 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1951,7 +1951,7 @@ static void update_test_data(void)
 		do_an_operation();
 }
 
-void integck(void)
+static int integck(void)
 {
 	pid_t pid;
 	int64_t rpt;
@@ -1978,7 +1978,7 @@ void integck(void)
 	top_dir = dir_new(NULL, dir_name);
 
 	if (!top_dir)
-		return;
+		return -1;
 
 	srand(pid);
 
@@ -2012,6 +2012,8 @@ void integck(void)
 	close_open_files();
 	tests_clear_dir(dir_name);
 	CHECK(rmdir(dir_name) != -1);
+
+	return 0;
 }
 
 /*
@@ -2151,6 +2153,9 @@ int main(int argc, char *argv[])
 	}
 
 	/* Do the actual test */
-	integck();
-	return 0;
+	ret = integck();
+	if (ret)
+		return EXIT_FAILURE;
+
+	return EXIT_SUCCESS;
 }
-- 
1.7.2.3
