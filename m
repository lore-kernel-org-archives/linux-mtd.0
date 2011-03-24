Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q2ikn-0007Pp-Pp
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2011 11:31:02 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2OBUwbk004218
	for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2011 13:30:59 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH] fs-tests: perf: fix compilation warning
Date: Thu, 24 Mar 2011 13:33:46 +0200
Message-Id: <1300966426-5760-1-git-send-email-dedekind1@gmail.com>
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

Fix the following compilation warning:
perf.c: In function ‘perf’:
perf.c:144: warning: format ‘%lld’ expects type ‘long long int’, but argument 2 has type ‘int64_t’

by adding a (long long int) cast.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/simple/perf.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/tests/fs-tests/simple/perf.c b/tests/fs-tests/simple/perf.c
index 43d708d..b98b98b 100644
--- a/tests/fs-tests/simple/perf.c
+++ b/tests/fs-tests/simple/perf.c
@@ -141,7 +141,8 @@ void perf(void)
 	/* Display timings */
 	printf("File system read and write speed\n");
 	printf("================================\n");
-	printf("Specfied file size: %lld\n", tests_size_parameter);
+	printf("Specfied file size: %lld\n",
+	       (unsigned long long)tests_size_parameter);
 	printf("Actual file size: %zu\n", actual_size);
 	printf("Write time (us): %lld\n", write_time);
 	printf("Unmount time (us): %lld\n", unmount_time);
-- 
1.7.2.3
