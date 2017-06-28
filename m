Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dQAqg-0006gb-5s
 for linux-mtd@lists.infradead.org; Wed, 28 Jun 2017 11:09:33 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id 69F5324E0015
 for <linux-mtd@lists.infradead.org>; Wed, 28 Jun 2017 13:08:44 +0200 (CEST)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 8/9] Silence warnings about unused arguments
Date: Wed, 28 Jun 2017 13:08:18 +0200
Message-Id: <20170628110819.30563-9-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20170628110819.30563-1-david.oberhollenzer@sigma-star.at>
References: <20170628110819.30563-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch deals with functions that need to have a certain signature,
but don't make use of all the arguments (e.g. signal handlers).

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 lib/execinfo.c                        | 3 +++
 tests/fs-tests/utils/fstest_monitor.c | 2 ++
 tests/jittertest/JitterTest.c         | 6 ++++++
 3 files changed, 11 insertions(+)

diff --git a/lib/execinfo.c b/lib/execinfo.c
index a59f6a9..499b0c3 100644
--- a/lib/execinfo.c
+++ b/lib/execinfo.c
@@ -7,6 +7,7 @@
 int backtrace(void **buffer, int size)
 {
 	void *addr = __builtin_return_address(0);
+	(void)buffer; (void)size;
 
 	errmsg("backtrace() is not implemented. Called from %p", addr);
 	return 0;
@@ -14,12 +15,14 @@ int backtrace(void **buffer, int size)
 
 char **backtrace_symbols(void *const *buffer, int size)
 {
+	(void)buffer; (void)size;
 	errmsg("backtrace_symbols() is not implemented");
 	return NULL;
 }
 
 void backtrace_symbols_fd(void *const *buffer, int size, int fd)
 {
+	(void)buffer; (void)size; (void)fd;
 	errmsg("backtrace_symbols_fd() is not implemented");
 }
 #endif /* !HAVE_EXECINFO_H */
diff --git a/tests/fs-tests/utils/fstest_monitor.c b/tests/fs-tests/utils/fstest_monitor.c
index 58946cc..afb951b 100644
--- a/tests/fs-tests/utils/fstest_monitor.c
+++ b/tests/fs-tests/utils/fstest_monitor.c
@@ -177,6 +177,7 @@ static int parse_command_line(char *cmdline, int *pargc, char ***pargv)
 
 static void signal_handler(int signum)
 {
+	(void)signum;
 	kill_children();
 }
 
@@ -185,6 +186,7 @@ int alarm_gone_off = 0;
 
 static void alarm_handler(int signum)
 {
+	(void)signum;
 	if (!result)
 		alarm_gone_off = 1;
 	kill_children();
diff --git a/tests/jittertest/JitterTest.c b/tests/jittertest/JitterTest.c
index 0364a00..4627fb0 100644
--- a/tests/jittertest/JitterTest.c
+++ b/tests/jittertest/JitterTest.c
@@ -426,6 +426,8 @@ void SignalHandler(
     char tmpBuf[200];
 
     /* Note sigNum not used. */
+    (void)sigNum;
+
     printf("Ctrl+C detected. Worst Jitter time was:%fms.\nJitterTest exiting.\n",
            (float)LastMaxDiff/1000.0);
 
@@ -458,6 +460,8 @@ static void doGrabKProfile(int jitterusec, char *fileName)
     int readBytes;
     char readBuf[4096];
 
+    (void)jitterusec;
+
     if((fdSnapshot = open(fileName, O_WRONLY | O_CREAT, S_IRWXU)) <= 0)
     {
         fprintf(stderr, "Could not open file %s.\n", fileName);
@@ -553,6 +557,8 @@ void AlarmHandler(
 				   if invoked < 1sec apart.
 				*/
 
+    (void)sigNum;
+
     if (gettimeofday(&CurrTimeVal, NULL) == (int) 0) {
 
         /*----------------------------------------------------------------
-- 
2.12.3
