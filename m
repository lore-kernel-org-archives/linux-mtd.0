Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDK3Y-0002on-IF
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 17:22:18 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3MHM8lJ025936
	for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2011 20:22:11 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 08/13] fs-tests: use independent random generators for ops and
	data
Date: Fri, 22 Apr 2011 20:25:19 +0300
Message-Id: <1303493124-7619-9-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1303493124-7619-1-git-send-email-dedekind1@gmail.com>
References: <1303493124-7619-1-git-send-email-dedekind1@gmail.com>
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

Currently integck uses the same global random generator for everything -
for choosing the operation, generating the data, and for checking. This
makes integck to become stuck sometimes. My guess this is because of
we somehow re-set it back with srand() when checking files.

This patch makes integck use different generators for data and for
choosing operations by using rand_r() with own seed for operations.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index fbd6cc5..5fb990e 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -214,6 +214,8 @@ static uint64_t operation_count = 0; /* Number of operations used to fill
                                         up the file system */
 static unsigned int check_run_no;
 
+static unsigned int random_seed;
+
 /*
  * A buffer which is used by 'make_name()' to return the generated random name.
  */
@@ -260,7 +262,7 @@ static unsigned int random_no(unsigned int max)
 	assert(max < RAND_MAX);
 	if (max == 0)
 		return 0;
-	return rand() % max;
+	return rand_r(&random_seed) % max;
 }
 
 /*
@@ -2952,6 +2954,7 @@ int main(int argc, char *argv[])
 {
 	int ret;
 	long rpt;
+	unsigned int pid = getpid();
 
 	ret = parse_opts(argc, argv);
 	if (ret)
@@ -2960,7 +2963,8 @@ int main(int argc, char *argv[])
 	get_tested_fs_info();
 
 	/* Seed the random generator with out PID */
-	srand(getpid());
+	srand(pid);
+	random_seed = pid;
 
 	random_name_buf = malloc(fsinfo.max_name_len + 1);
 	CHECK(random_name_buf != NULL);
-- 
1.7.2.3
