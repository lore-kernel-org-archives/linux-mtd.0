Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q76jD-0004Z0-Pu
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 13:55:36 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p35DtTqj011474
	for <linux-mtd@lists.infradead.org>; Tue, 5 Apr 2011 16:55:29 +0300
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCHv1 1/5] tests: checkfs: fix compiler warnings
Date: Tue,  5 Apr 2011 16:55:50 +0300
Message-Id: <f17ef71846bf870b69b04127ac0d7d924678ebee.1302011698.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <1302007944.2760.126.camel@localhost>
References: <1302007944.2760.126.camel@localhost>
Cc: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are two warnings:
 - strlen() is used without prototype
 - argument of printf() is unsigned long, but used specifier is for int

This patch fixes them.

Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
---
 tests/checkfs/checkfs.c |    2 +-
 tests/checkfs/comm.c    |    5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/tests/checkfs/checkfs.c b/tests/checkfs/checkfs.c
index da2d0c4..6ca2c0e 100644
--- a/tests/checkfs/checkfs.c
+++ b/tests/checkfs/checkfs.c
@@ -520,7 +520,7 @@ void processCmdLine(int argc, char **argv)
                 FileSizeMax = (float)atoi(argv[++cnt]);
                 if(FileSizeMax > (MAX_INTS_ALLOW*sizeof(int)))
                 {
-                    printf("Max file size allowd is %i.\n",
+                    printf("Max file size allowed is %lu.\n",
                            MAX_INTS_ALLOW*sizeof(int));
                     exit(0);
                 }
diff --git a/tests/checkfs/comm.c b/tests/checkfs/comm.c
index 57fc7ed..881a270 100644
--- a/tests/checkfs/comm.c
+++ b/tests/checkfs/comm.c
@@ -21,15 +21,12 @@
   Split the modbus comm part of the program (that sends the ok to pwr me down
   message) into another file "comm.c"
 
-
-
  */
 
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
-
-
+#include <string.h>
 
 /*
   This is the routine that forms and
-- 
1.6.3.3
