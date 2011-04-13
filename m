Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QA1nW-0003Uq-Fz
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 15:16:13 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DFFofg018740
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 18:16:00 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 26/27] fs-tests: integck: implement own version of CHECK
Date: Wed, 13 Apr 2011 18:19:06 +0300
Message-Id: <1302707947-6143-27-git-send-email-dedekind1@gmail.com>
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

Remove the final dependency on the common code - the CHECK() macro.
Now we are finally independent. The reason we needed this is that
we are going to improve integck to handle errors more gracefully,
in order to support failure testing better. And this requires changes
in the common code, but it is ancient and shared by many tests, and
we do not want to touch it. So we better make integck independent
and concentrate on integck only.

This patch also removes Makefile dependencies. And while on it, remove
the broken 'tests' target.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/Makefile  |    7 -------
 tests/fs-tests/integrity/integck.c |   17 ++++++++++++++++-
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/tests/fs-tests/integrity/Makefile b/tests/fs-tests/integrity/Makefile
index 364a732..03652a2 100644
--- a/tests/fs-tests/integrity/Makefile
+++ b/tests/fs-tests/integrity/Makefile
@@ -13,12 +13,5 @@ TARGETS = integck
 
 all: $(TARGETS)
 
-$(TARGETS): ../lib/tests.o
-
-../lib/tests.o: ../lib/tests.h
-
 clean:
 	rm -f *.o $(TARGETS)
-
-tests: all
-	./integck
diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 2dbe9de..387874c 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -36,7 +36,6 @@
 #include <sys/vfs.h>
 #include <sys/mount.h>
 #include <sys/statvfs.h>
-#include "tests.h"
 
 #define PROGRAM_VERSION "1.1"
 #define PROGRAM_NAME "integck"
@@ -47,6 +46,22 @@
 /* The pattern for the top directory where we run the test */
 #define TEST_DIR_PATTERN "integck_test_dir_%u"
 
+/*
+ * Check if a condition is true and die if not.
+ */
+#define stringify1(x) #x
+#define stringify(x) stringify1(x)
+#define CHECK(cond) do {                                         \
+	if (!(cond)) {                                           \
+		int _err = errno;                                \
+		fflush(stdout);                                  \
+		errmsg("condition '%s' failed at %s:%d\n",       \
+		       stringify(cond), __FILE__, __LINE__);     \
+		errmsg("error %d (%s)\n", _err, strerror(_err)); \
+		exit(EXIT_FAILURE);                              \
+	}                                                        \
+} while(0)
+
 /* The variables below are set by command line arguments */
 static struct {
 	long repeat_cnt;
-- 
1.7.2.3
