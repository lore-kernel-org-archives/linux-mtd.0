Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDK3W-0002ng-OM
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 17:22:14 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3MHM9nX025964
	for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2011 20:22:09 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 03/13] fs-tests: integck: print backtrace in case of failure
Date: Fri, 22 Apr 2011 20:25:14 +0300
Message-Id: <1303493124-7619-4-git-send-email-dedekind1@gmail.com>
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

This patch teaches the 'CHECK()' macro to print the back-trace in
case of failure which is sometimes very useful for debugging. This
patch also adds a helper function for the 'CHECK()' macro because
otherwise it becomes too large.

Note, since all functions in the test are static, the stack trace
does not really show symbols.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   39 ++++++++++++++++++++++++++---------
 1 files changed, 29 insertions(+), 10 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 522c6de..9822b3b 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -17,7 +17,6 @@
  *
  * Author: Adrian Hunter
  */
-
 #include <unistd.h>
 #include <stdlib.h>
 #include <stdio.h>
@@ -32,6 +31,7 @@
 #include <getopt.h>
 #include <assert.h>
 #include <mntent.h>
+#include <execinfo.h>
 #include <sys/mman.h>
 #include <sys/vfs.h>
 #include <sys/mount.h>
@@ -54,15 +54,9 @@
  */
 #define stringify1(x) #x
 #define stringify(x) stringify1(x)
-#define CHECK(cond) do {                                       \
-	if (!(cond)) {                                         \
-		int _err = errno;                              \
-		fflush(stdout);                                \
-		errmsg("condition '%s' failed at %s:%d",       \
-		       stringify(cond), __FILE__, __LINE__);   \
-		errmsg("error %d (%s)", _err, strerror(_err)); \
-		exit(EXIT_FAILURE);                            \
-	}                                                      \
+#define CHECK(cond) do {                                                     \
+	if (!(cond))                                                         \
+		check_failed(stringify(cond), __func__, __FILE__, __LINE__); \
 } while(0)
 
 #define pcv(fmt, ...) do {                                         \
@@ -215,6 +209,31 @@ static unsigned int check_run_no;
 static char *random_name_buf;
 
 /*
+ * This is a helper for the 'CHECK()' macro - prints a scary error message and
+ * terminates the program.
+ */
+static void check_failed(const char *cond, const char *func, const char *file,
+			 int line)
+{
+	int error = errno, count;
+	void *addresses[128];
+
+	fflush(stdout);
+	errmsg("condition '%s' failed in %s() at %s:%d",
+	       cond, func, __FILE__, __LINE__);
+	normsg("error %d (%s)", error, strerror(error));
+	/*
+	 * Note, to make this work well you need:
+	 * 1. Make all functions non-static - add "#define static'
+	 * 2. Compile with -rdynamic and -g gcc options
+	 * 3. Preferrably compile with -O0 to avoid inlining
+	 */
+	count = backtrace(addresses, 128);
+	backtrace_symbols_fd(addresses, count, fileno(stdout));
+	exit(EXIT_FAILURE);
+}
+
+/*
  * Is this 'struct write_info' actually holds information about a truncation?
  */
 static int is_truncation(struct write_info *w)
-- 
1.7.2.3
