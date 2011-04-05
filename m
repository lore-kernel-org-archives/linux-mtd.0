Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q76jD-0004Z1-Q0
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 13:55:36 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p35DtUsd011479
	for <linux-mtd@lists.infradead.org>; Tue, 5 Apr 2011 16:55:30 +0300
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCHv1 4/5] tests: jittertest: fix set of compiler warnings
Date: Tue,  5 Apr 2011 16:55:53 +0300
Message-Id: <741f4ff14ea8ad70001e78a94e98e01dbe783b3b.1302011698.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <aeae7a7b14f785f1bd3ee5fd74dea8e7521a160b.1302011698.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <f17ef71846bf870b69b04127ac0d7d924678ebee.1302011698.git.ext-andriy.shevchenko@nokia.com>
References: <1302007944.2760.126.camel@localhost>
	<f17ef71846bf870b69b04127ac0d7d924678ebee.1302011698.git.ext-andriy.shevchenko@nokia.com>
	<112dd0ed24fca0a1af988a2c99f1258468184d68.1302011698.git.ext-andriy.shevchenko@nokia.com>
	<aeae7a7b14f785f1bd3ee5fd74dea8e7521a160b.1302011698.git.ext-andriy.shevchenko@nokia.com>
References: <f17ef71846bf870b69b04127ac0d7d924678ebee.1302011698.git.ext-andriy.shevchenko@nokia.com>
Cc: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

- time() was used without prototype.
- the return value of read() and write() wasn't checked
- classificator in printf() was wrong for argument of size_t type

Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
---
 tests/jittertest/JitterTest.c |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/jittertest/JitterTest.c b/tests/jittertest/JitterTest.c
index fcf8e0d..11dc8f5 100644
--- a/tests/jittertest/JitterTest.c
+++ b/tests/jittertest/JitterTest.c
@@ -82,6 +82,7 @@
 #include <string.h>     /* strcpy, strcmp */
 #include <stdlib.h>     /* exit, atol, atoi */
 #include <sys/time.h>   /* setitimer, settimeofday, gettimeofday */
+#include <time.h>	/* time */
 #include <signal.h>     /* signal */
 #include <sched.h>      /* sched_setscheduler, sched_get_priority_min,*/
 /*   sched_get_priority_max */
@@ -475,7 +476,9 @@ void doGrabKProfile(int jitterusec, char *fileName)
 
     while((readBytes = read(fdProfile, readBuf, sizeof(readBuf))) > 0)
     {
-        write(fdSnapshot, readBuf, readBytes);
+	int writeBytes = write(fdSnapshot, readBuf, readBytes);
+	if (writeBytes < 0)
+		perror("write error");
     }
 
     close(fdSnapshot);
@@ -650,7 +653,9 @@ void AlarmHandler(
         if(DoRead)
         {
 
-            read(Fd2, tmpBuf, 1);
+	    cntr = read(Fd2, tmpBuf, 1);
+	    if (cntr < 0)
+		perror("read error");
             lseek(Fd2, 0, SEEK_SET); /* back to start */
         }
 
@@ -1032,7 +1037,7 @@ int Write(int fd, void *buf, size_t bytes, int lineNo)
     if(err < bytes)
     {
 
-        printf("Write Error at line %i! Wanted to write %i bytes, but wrote only %i bytes.\n",
+        printf("Write Error at line %i! Wanted to write %zu bytes, but wrote only %i bytes.\n",
                lineNo, bytes, err);
         perror("Write did not complete. Error. Bye:"); /* show error from errno. */
 	exit(1);
-- 
1.6.3.3
