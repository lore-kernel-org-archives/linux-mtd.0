Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q77ID-0005HR-9q
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 14:31:45 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p35EVasG010506
	for <linux-mtd@lists.infradead.org>; Tue, 5 Apr 2011 17:31:39 +0300
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCHv2] tests: jittertest: fix set of compiler warnings
Date: Tue,  5 Apr 2011 17:32:29 +0300
Message-Id: <7c7a314f7d09b032f4cff10070853ad360588f30.1302013906.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <1302013204.2760.135.camel@localhost>
References: <1302013204.2760.135.camel@localhost>
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

Don't continue to read the /proc/profile in case when write was failed.

Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
---
 tests/jittertest/JitterTest.c |   13 ++++++++++---
 1 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/jittertest/JitterTest.c b/tests/jittertest/JitterTest.c
index fcf8e0d..76371e8 100644
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
@@ -475,7 +476,11 @@ void doGrabKProfile(int jitterusec, char *fileName)
 
     while((readBytes = read(fdProfile, readBuf, sizeof(readBuf))) > 0)
     {
-        write(fdSnapshot, readBuf, readBytes);
+	int writeBytes = write(fdSnapshot, readBuf, readBytes);
+	if (writeBytes != readBytes) {
+		perror("write error");
+		break;
+	}
     }
 
     close(fdSnapshot);
@@ -650,7 +655,9 @@ void AlarmHandler(
         if(DoRead)
         {
 
-            read(Fd2, tmpBuf, 1);
+	    cntr = read(Fd2, tmpBuf, 1);
+	    if (cntr < 0)
+		perror("read error");
             lseek(Fd2, 0, SEEK_SET); /* back to start */
         }
 
@@ -1032,7 +1039,7 @@ int Write(int fd, void *buf, size_t bytes, int lineNo)
     if(err < bytes)
     {
 
-        printf("Write Error at line %i! Wanted to write %i bytes, but wrote only %i bytes.\n",
+        printf("Write Error at line %i! Wanted to write %zu bytes, but wrote only %i bytes.\n",
                lineNo, bytes, err);
         perror("Write did not complete. Error. Bye:"); /* show error from errno. */
 	exit(1);
-- 
1.6.3.3
