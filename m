Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q74Uz-0002dm-KI
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 11:32:46 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p35BWclW018497
	for <linux-mtd@lists.infradead.org>; Tue, 5 Apr 2011 14:32:39 +0300
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCHv1 3/3] tests: fix compiler warnings
Date: Tue,  5 Apr 2011 14:33:10 +0300
Message-Id: <bbd26145dfa5e5c63c323e01cbd4917002bdde89.1302002802.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <d47b1aaa839631e454cbfeb14684ca851d941d43.1302002802.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <38fa03e74a299568e73f69b03ffcacd5ee38b62b.1302002802.git.ext-andriy.shevchenko@nokia.com>
References: <38fa03e74a299568e73f69b03ffcacd5ee38b62b.1302002802.git.ext-andriy.shevchenko@nokia.com>
	<d47b1aaa839631e454cbfeb14684ca851d941d43.1302002802.git.ext-andriy.shevchenko@nokia.com>
References: <38fa03e74a299568e73f69b03ffcacd5ee38b62b.1302002802.git.ext-andriy.shevchenko@nokia.com>
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
 tests/checkfs/checkfs.c              |    8 ++++----
 tests/checkfs/comm.c                 |    2 +-
 tests/fs-tests/lib/tests.c           |    3 ++-
 tests/fs-tests/stress/atoms/pdfrun.c |    5 ++++-
 tests/jittertest/JitterTest.c        |   11 ++++++++---
 tests/ubi-tests/integ.c              |    5 +++--
 6 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/tests/checkfs/checkfs.c b/tests/checkfs/checkfs.c
index da2d0c4..3224d2b 100644
--- a/tests/checkfs/checkfs.c
+++ b/tests/checkfs/checkfs.c
@@ -167,11 +167,11 @@ int setupSerial (const char *dev) {
 
     fd = open(dev,O_RDWR | O_NDELAY );
     if (fd < 0) {
-        fprintf(stderr, "%s: %s\n", dev, sys_errlist[errno]);
+        fprintf(stderr, "%s: %s\n", dev, strerror(errno));
         exit(1);
     }
     if (tcgetattr(fd, &tios) < 0) {
-        fprintf(stderr,"Could not get terminal attributes: %s",sys_errlist[errno]);
+        fprintf(stderr, "Could not get terminal attributes: %s", strerror(errno));
         exit(1);
     }
 
@@ -197,7 +197,7 @@ int setupSerial (const char *dev) {
     cfsetispeed (&tios, B9600);
 
     if (tcsetattr(fd, TCSAFLUSH, &tios) < 0) {
-        fprintf(stderr,"Could not set attributes: ,%s",sys_errlist[errno]);
+        fprintf(stderr, "Could not set attributes: ,%s", strerror(errno));
         exit(1);
     }
     return fd;
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
index 57fc7ed..f8c43fd 100644
--- a/tests/checkfs/comm.c
+++ b/tests/checkfs/comm.c
@@ -28,7 +28,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
-
+#include <string.h>
 
 
 /*
diff --git a/tests/fs-tests/lib/tests.c b/tests/fs-tests/lib/tests.c
index 00b94f9..8a6a5f5 100644
--- a/tests/fs-tests/lib/tests.c
+++ b/tests/fs-tests/lib/tests.c
@@ -1236,7 +1236,8 @@ void tests_try_to_clear_dir(const char *dir_name)
 			break;
 		}
 	}
-	chdir(buf);
+	if (chdir(buf) < 0)
+		perror("chdir");
 	closedir(dir);
 }
 
diff --git a/tests/fs-tests/stress/atoms/pdfrun.c b/tests/fs-tests/stress/atoms/pdfrun.c
index 3536580..46c70e1 100644
--- a/tests/fs-tests/stress/atoms/pdfrun.c
+++ b/tests/fs-tests/stress/atoms/pdfrun.c
@@ -40,8 +40,11 @@ void adjust_size(void)
 
 	total_memory = 0;
 	f = fopen("/proc/meminfo", "r");
-	fscanf(f, "%s %lu", dummy, &total_memory);
+	if (fscanf(f, "%s %lu", dummy, &total_memory) != 2)
+		perror("fscanf error");
 	fclose(f);
+
+
 	if (total_memory > 0 && tests_size_parameter > total_memory / 2)
 		tests_size_parameter = total_memory / 2;
 }
diff --git a/tests/jittertest/JitterTest.c b/tests/jittertest/JitterTest.c
index fcf8e0d..19392d5 100644
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
+            cntr = read(Fd2, tmpBuf, 1);
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
diff --git a/tests/ubi-tests/integ.c b/tests/ubi-tests/integ.c
index f293444..4e13b73 100644
--- a/tests/ubi-tests/integ.c
+++ b/tests/ubi-tests/integ.c
@@ -14,6 +14,7 @@
 #include <sys/stat.h>
 
 #include "libubi.h"
+#include "common.h"
 
 struct erase_block_info;
 struct volume_info;
@@ -586,7 +587,7 @@ static void reload_ubi(void)
 	sleep(1);
 }
 
-static void check_volume(struct volume_info *vol)
+static void integ_check_volume(struct volume_info *vol)
 {
 	struct erase_block_info *eb = vol->erase_blocks;
 	int pos;
@@ -607,7 +608,7 @@ static void check_ubi_device(struct ubi_device_info *ubi_device)
 
 	vol = ubi_device->volumes;
 	while (vol) {
-		check_volume(vol);
+		integ_check_volume(vol);
 		vol = vol->next;
 	}
 }
-- 
1.6.3.3
