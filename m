Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDK3Y-0002oL-53
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 17:22:18 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3MHM8Cq025953
	for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2011 20:22:10 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 07/13] fs-tests: integck: add debug compilation target
Date: Fri, 22 Apr 2011 20:25:18 +0300
Message-Id: <1303493124-7619-8-git-send-email-dedekind1@gmail.com>
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

I often need to use gdb to debug integck, or sometimes even attach
already running integck. But when it is compiled with optimizations, it
is nearly impossible to use gdb. Introduce 'debug' target to compile
integck without optimizations.

Additionally, to make the stack backtraces work, add a dirty hack to
integck.c to remove all the static keywords - this turns static
functions to non-static and makes them appear in stack backtraces.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/Makefile  |    5 +++++
 tests/fs-tests/integrity/integck.c |   10 ++++++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/tests/fs-tests/integrity/Makefile b/tests/fs-tests/integrity/Makefile
index 976c3ce..2cdd470 100644
--- a/tests/fs-tests/integrity/Makefile
+++ b/tests/fs-tests/integrity/Makefile
@@ -13,5 +13,10 @@ TARGETS = integck
 
 all: $(TARGETS)
 
+# Disable optimizations to make it possible to use gdb comfortably
+# Use -rdynamic to have stack backtraces
+debug:
+	gcc $(CFLAGS) -O0 -D INTEGCK_DEBUG -rdynamic integck.c -o integck
+
 clean:
 	rm -f *.o $(TARGETS)
diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index f09cfaf..fbd6cc5 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -41,6 +41,16 @@
 #define PROGRAM_NAME "integck"
 #include "common.h"
 
+/*
+ * WARNING! This is a dirty hack! The symbols for static functions are not
+ * printed in the stack backtrace. So we remove ths 'static' keyword using the
+ * pre-processor. This is really error-prone because this won't work if, e.g.,
+ * local static variables were used.
+ */
+#ifdef INTEGCK_DEBUG
+#define static
+#endif
+
 #define MAX_RANDOM_SEED 10000000
 
 /* The pattern for the top directory where we run the test */
-- 
1.7.2.3
