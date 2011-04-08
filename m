Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8DNZ-0001Ok-Ea
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 15:13:47 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p38FDhLw017768
	for <linux-mtd@lists.infradead.org>; Fri, 8 Apr 2011 18:13:44 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/6] fs-tests: integck: include the common mtd-utils header
Date: Fri,  8 Apr 2011 18:16:49 +0300
Message-Id: <1302275810-12632-6-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1302275810-12632-1-git-send-email-dedekind1@gmail.com>
References: <1302275810-12632-1-git-send-email-dedekind1@gmail.com>
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

Include the commong mtd-utils "common.h" header in integck test to
make it possible to use shared macros.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/Makefile  |    4 +++-
 tests/fs-tests/integrity/integck.c |    4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/fs-tests/integrity/Makefile b/tests/fs-tests/integrity/Makefile
index a35f4d0..364a732 100644
--- a/tests/fs-tests/integrity/Makefile
+++ b/tests/fs-tests/integrity/Makefile
@@ -3,7 +3,9 @@ ifeq ($(origin CC),default)
 CC = gcc
 endif
 
-CFLAGS := $(CFLAGS) -Wall -g -O2 -I../lib
+COMMON_HEADERS_DIR := ../../../include
+
+CFLAGS := $(CFLAGS) -Wall -g -O2 -I../lib -I$(COMMON_HEADERS_DIR)
 
 LDFLAGS := $(LDFLAGS)
 
diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 155b619..ed32b52 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -30,9 +30,11 @@
 #include <limits.h>
 #include <dirent.h>
 #include <sys/mman.h>
-
 #include "tests.h"
 
+#define PROGRAM_NAME "integck"
+#include "common.h"
+
 /* Structures to store data written to the test file system,
    so that we can check whether the file system is correct. */
 
-- 
1.7.2.3
