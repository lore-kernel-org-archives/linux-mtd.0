Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q74Uo-0002d6-8j
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 11:32:34 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p35BWQ86010158
	for <linux-mtd@lists.infradead.org>; Tue, 5 Apr 2011 14:32:26 +0300
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCHv1 1/3] tests: make jittertest buildable
Date: Tue,  5 Apr 2011 14:33:08 +0300
Message-Id: <38fa03e74a299568e73f69b03ffcacd5ee38b62b.1302002802.git.ext-andriy.shevchenko@nokia.com>
Cc: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
---
 tests/jittertest/JitterTest.c |    6 +++---
 tests/jittertest/Makefile     |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/jittertest/JitterTest.c b/tests/jittertest/JitterTest.c
index 13c64d9..fcf8e0d 100644
--- a/tests/jittertest/JitterTest.c
+++ b/tests/jittertest/JitterTest.c
@@ -292,7 +292,7 @@ int main(
     }
 
     /*------------------------- Initializations --------------------------*/
-    if((Fd1 = open(OutFileName, O_RDWR|O_CREAT|O_SYNC)) <= 0)
+    if((Fd1 = open(OutFileName, O_RDWR|O_CREAT|O_SYNC, S_IRWXU)) <= 0)
     {
         perror("Cannot open outfile for write:");
         exit(1);
@@ -304,7 +304,7 @@ int main(
     if(DoRead)
     {
 
-        if((Fd2 = open(ReadFile, O_RDWR|O_CREAT|O_SYNC|O_TRUNC)) <= 0)
+        if((Fd2 = open(ReadFile, O_RDWR|O_CREAT|O_SYNC|O_TRUNC, S_IRWXU)) <= 0)
         {
             perror("cannot open read file:");
             exit(1);
@@ -459,7 +459,7 @@ void doGrabKProfile(int jitterusec, char *fileName)
     int readBytes;
     char readBuf[4096];
 
-    if((fdSnapshot = open(fileName, O_WRONLY | O_CREAT)) <= 0)
+    if((fdSnapshot = open(fileName, O_WRONLY | O_CREAT, S_IRWXU)) <= 0)
     {
         fprintf(stderr, "Could not open file %s.\n", fileName);
         perror("Error:");
diff --git a/tests/jittertest/Makefile b/tests/jittertest/Makefile
index 2f11329..0209c63 100644
--- a/tests/jittertest/Makefile
+++ b/tests/jittertest/Makefile
@@ -1,6 +1,6 @@
 CC=gcc
 # uncomment following for performance
-CCFLAGS=-O3 -Wall -m486 -fomit-frame-pointer
+CCFLAGS=-O3 -Wall -fomit-frame-pointer
 
 # uncomment following for debugging. Uncomment either this or the one above. Not both.
 # CCFLAGS=-Wall -g
-- 
1.6.3.3
