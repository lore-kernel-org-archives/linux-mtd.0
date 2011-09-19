Received: from mga09.intel.com ([134.134.136.24])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R5bz1-0001jS-W0
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 11:25:57 +0000
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Artem Bityutskiy <artem.bityutskiy@intel.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 1/7] jffs2reader: update the header inclusion block
Date: Mon, 19 Sep 2011 14:25:18 +0300
Message-Id: <d94e72a2ae7292c5c890b1ad61f04bfdb983250c.1316431431.git.andriy.shevchenko@linux.intel.com>
Cc: Alexey Dokuchaev <danfe@nsu.ru>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Alexey Dokuchaev <danfe@nsu.ru>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 jffs2reader.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/jffs2reader.c b/jffs2reader.c
index d5a3d95..11f841d 100644
--- a/jffs2reader.c
+++ b/jffs2reader.c
@@ -64,7 +64,6 @@ BUGS:
 
 #define PROGRAM_NAME "jffs2reader"
 
-#include <errno.h>
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -74,9 +73,10 @@ BUGS:
 #include <time.h>
 #include <sys/types.h>
 #include <sys/stat.h>
-#include <sys/param.h>
 #include <dirent.h>
-#include <linux/jffs2.h>
+#include <zlib.h>
+
+#include "mtd/jffs2-user.h"
 #include "common.h"
 
 #define SCRATCH_SIZE (5*1024*1024)
-- 
1.7.5.4
