Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bOMDZ-00077E-3M
 for linux-mtd@lists.infradead.org; Sat, 16 Jul 2016 09:49:06 +0000
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: linux-mtd@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH mtd-utils] integck: only use execinfo.h when INTEGCK_DEBUG is
 enabled
Date: Sat, 16 Jul 2016 11:48:41 +0200
Message-Id: <1468662521-17780-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Guard the usage of execinfo.h by INTEGCK_DEBUG so that by defaut,
integck builds properly on systems without <execinfo.h> (uClibc and
musl based systems). As stated in the code, the backtrace()
functionality of <execinfo.h> will anyway only work properly when
INTEGCK_DEBUG is defined (it makes all functions non-static, which is
needed for backtrace to provide some useful information).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 tests/fs-tests/integrity/integck.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 8badd1f..6ef817e 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -31,7 +31,9 @@
 #include <getopt.h>
 #include <assert.h>
 #include <mntent.h>
+#ifdef INTEGCK_DEBUG
 #include <execinfo.h>
+#endif
 #include <bits/stdio_lim.h>
 #include <sys/mman.h>
 #include <sys/vfs.h>
@@ -248,14 +250,18 @@ static char *random_name_buf;
 static void check_failed(const char *cond, const char *func, const char *file,
 			 int line)
 {
-	int error = errno, count;
+	int error = errno;
+#ifdef INTEGCK_DEBUG
+	int count;
 	void *addresses[128];
+#endif
 
 	fflush(stdout);
 	fflush(stderr);
 	errmsg("condition '%s' failed in %s() at %s:%d",
 	       cond, func, file, line);
 	normsg("error %d (%s)", error, strerror(error));
+#ifdef INTEGCK_DEBUG
 	/*
 	 * Note, to make this work well you need:
 	 * 1. Make all functions non-static - add "#define static'
@@ -264,6 +270,7 @@ static void check_failed(const char *cond, const char *func, const char *file,
 	 */
 	count = backtrace(addresses, 128);
 	backtrace_symbols_fd(addresses, count, fileno(stdout));
+#endif
 	exit(EXIT_FAILURE);
 }
 
-- 
2.7.4
