Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9zxS-0002N1-8u
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2011 13:18:10 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3DDI8xQ013941
	for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2011 16:18:08 +0300
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCHv1 4/5] tests: checkfs: adjust Makefile
Date: Wed, 13 Apr 2011 16:20:28 +0300
Message-Id: <6cb173d447de7eb92ead54f450da7752a40e476c.1302700658.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <8aa731c3a7a071bb9216500d72c9a8d7a7e2b830.1302700658.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <ec50e9f8ced473683c8c8e981607737dfb015c3b.1302700658.git.ext-andriy.shevchenko@nokia.com>
References: <ec50e9f8ced473683c8c8e981607737dfb015c3b.1302700658.git.ext-andriy.shevchenko@nokia.com>
	<865774bea767bf615bbaf79139448aef65d55202.1302700658.git.ext-andriy.shevchenko@nokia.com>
	<8aa731c3a7a071bb9216500d72c9a8d7a7e2b830.1302700658.git.ext-andriy.shevchenko@nokia.com>
References: <ec50e9f8ced473683c8c8e981607737dfb015c3b.1302700658.git.ext-andriy.shevchenko@nokia.com>
Cc: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch brings common Makefile (in terms of mtd-utils project) to the
checkfs test suite. Additionally it fixes a build error related to usage of
open().

Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
---
 tests/checkfs/Makefile  |   14 +++-----------
 tests/checkfs/checkfs.c |    2 +-
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/tests/checkfs/Makefile b/tests/checkfs/Makefile
index ac94dde..0a77682 100644
--- a/tests/checkfs/Makefile
+++ b/tests/checkfs/Makefile
@@ -1,14 +1,6 @@
+TARGETS = checkfs makefiles
 
-all: checkfs makefiles
+include ../../common.mk
 
-checkfs: checkfs.c Makefile common.h comm.o
-	gcc -g -Wall checkfs.c comm.o -o checkfs
+$(TARGETS): $(addprefix $(BUILDDIR)/, comm.o)
 
-comm.o: comm.c Makefile
-	gcc -g -Wall -c comm.c -o comm.o
-
-makefiles: makefiles.c Makefile common.h
-	gcc -g -Wall makefiles.c -o makefiles
-
-clean:
-	rm -f makefiles checkfs *~ *.o
diff --git a/tests/checkfs/checkfs.c b/tests/checkfs/checkfs.c
index 3224d2b..8e74da8 100644
--- a/tests/checkfs/checkfs.c
+++ b/tests/checkfs/checkfs.c
@@ -414,7 +414,7 @@ void make_new_file(char *filename){
 
     fprintf(stderr, "Creating File:%s. ", filename);
 
-    if((dfd = open(filename, O_RDWR | O_CREAT | O_SYNC)) <= 0)
+    if((dfd = open(filename, O_RDWR | O_CREAT | O_SYNC, S_IRWXU)) <= 0)
     {
         printf("Error! Cannot open file: %s\n",filename);
         perror("Error");
-- 
1.6.3.3
