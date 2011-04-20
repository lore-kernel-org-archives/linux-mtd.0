Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCURr-00063p-5K
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2011 10:15:56 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3KAFmD7009486
	for <linux-mtd@lists.infradead.org>; Wed, 20 Apr 2011 13:15:49 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 05/35] fs-tests: integck: handle errors when creating test data
Date: Wed, 20 Apr 2011 13:18:38 +0300
Message-Id: <1303294748-5492-6-git-send-email-dedekind1@gmail.com>
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

Make 'update_test_data()' and 'update_test_data()' check for errors
and return error in case of failure.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |  114 ++++++++++++++++++++++--------------
 1 files changed, 71 insertions(+), 43 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 5b1adc1..1703364 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -1953,16 +1953,21 @@ static void operate_on_an_open_file(void)
 		}
 }
 
-static void do_an_operation(void)
+static int do_an_operation(void)
 {
 	/* Half the time operate on already open files */
 	if (random_no(100) < 50)
 		operate_on_dir(top_dir);
 	else
 		operate_on_an_open_file();
+
+	return 0;
 }
 
-static void create_test_data(void)
+/*
+ * Fill the tested file-system with random stuff.
+ */
+static int create_test_data(void)
 {
 	uint64_t i, n;
 
@@ -1971,28 +1976,77 @@ static void create_test_data(void)
 	full = 0;
 	operation_count = 0;
 	while (!full) {
-		do_an_operation();
-		++operation_count;
+		if (do_an_operation())
+			return -1;
+		operation_count += 1;
 	}
+
+	/* Drop to less than 90% full */
 	grow = 0;
 	shrink = 1;
-	/* Drop to less than 90% full */
 	n = operation_count / 40;
 	while (n--) {
-		uint64_t free;
-		uint64_t total;
-		for (i = 0; i < 10; ++i)
-			do_an_operation();
+		uint64_t free, total;
+
+		for (i = 0; i < 10; i++)
+			if (do_an_operation())
+				return -1;
+
 		get_fs_space(&total, &free);
 		if ((free * 100) / total >= 10)
 			break;
 	}
+
+	grow = 0;
+	shrink = 0;
+	full = 0;
+	n = operation_count * 2;
+	for (i = 0; i < n; i++)
+		if (do_an_operation())
+			return -1;
+
+	return 0;
+}
+
+/*
+ * Do more random operation on the tested file-system.
+ */
+static int update_test_data(void)
+{
+	uint64_t i, n;
+
+	grow = 1;
+	shrink = 0;
+	full = 0;
+	while (!full)
+		if (do_an_operation())
+			return -1;
+
+	/* Drop to less than 50% full */
+	grow = 0;
+	shrink = 1;
+	n = operation_count / 10;
+	while (n--) {
+		uint64_t free, total;
+
+		for (i = 0; i < 10; i++)
+			if (do_an_operation())
+				return -1;
+
+		get_fs_space(&total, &free);
+		if ((free * 100) / total >= 50)
+			break;
+	}
+
 	grow = 0;
 	shrink = 0;
 	full = 0;
 	n = operation_count * 2;
-	for (i = 0; i < n; ++i)
-		do_an_operation();
+	for (i = 0; i < n; i++)
+		if (do_an_operation())
+			return -1;
+
+	return 0;
 }
 
 /*
@@ -2042,36 +2096,6 @@ static int rm_minus_rf_dir(const char *dir_name)
 	return 0;
 }
 
-static void update_test_data(void)
-{
-	uint64_t i, n;
-
-	grow = 1;
-	shrink = 0;
-	full = 0;
-	while (!full)
-		do_an_operation();
-	grow = 0;
-	shrink = 1;
-	/* Drop to less than 50% full */
-	n = operation_count / 10;
-	while (n--) {
-		uint64_t free;
-		uint64_t total;
-		for (i = 0; i < 10; ++i)
-			do_an_operation();
-		get_fs_space(&total, &free);
-		if ((free * 100) / total >= 50)
-			break;
-	}
-	grow = 0;
-	shrink = 0;
-	full = 0;
-	n = operation_count * 2;
-	for (i = 0; i < n; ++i)
-		do_an_operation();
-}
-
 /**
  * Re-mount the test file-system. This function randomly select how to
  * re-mount.
@@ -2193,7 +2217,9 @@ static int integck(void)
 	if (!top_dir)
 		return -1;
 
-	create_test_data();
+	ret = create_test_data();
+	if (ret)
+		return -1;
 
 	if (fsinfo.is_rootfs) {
 		close_open_files();
@@ -2208,7 +2234,9 @@ static int integck(void)
 	check_deleted_files();
 
 	for (rpt = 0; args.repeat_cnt == 0 || rpt < args.repeat_cnt; ++rpt) {
-		update_test_data();
+		ret = update_test_data();
+		if (ret)
+			return -1;
 
 		if (!fsinfo.is_rootfs) {
 			close_open_files();
-- 
1.7.2.3
