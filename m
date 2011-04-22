Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDK3W-0002ne-OI
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 17:22:14 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa01.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p3MHM8lI025936
	for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2011 20:22:08 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 01/13] fs-tests: integck: improve help message
Date: Fri, 22 Apr 2011 20:25:12 +0300
Message-Id: <1303493124-7619-2-git-send-email-dedekind1@gmail.com>
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

Fix typos, make it a bit more descriptive.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 tests/fs-tests/integrity/integck.c |   35 +++++++++++++++++++----------------
 1 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/integck.c
index 511739f..522c6de 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -2572,25 +2572,28 @@ static void get_tested_fs_info(void)
 
 static const char doc[] = PROGRAM_NAME " version " PROGRAM_VERSION
 " - a stress test which checks the file-system integrity.\n"
-"It creates a directory named \"integck_test_dir_pid\", where where pid is the\n"
-"process id. Then it randomly creates and deletes files, directories, symlinks\n"
-"and hardlinks, randomly writes and truncate files, sometimes makes holes in\n"
-"files, sometimes fsync()'s them. Then it un-mounts and re-mounts the test file\n"
-"system and checks the contents - everything (files, dirs, etc) should be there\n"
-"and the contents of the files should be correct. This is repeated a number of\n"
-"times (set with -n, default 1).\n\n"
-"This test is also able to perform powe cut testing. The underlying file-system\n"
-"or the device driver should be able to emulate power-cuts, e.g., but switching\n"
-"to R/O mode at random points of time. And the file-system should return EROFS\n"
-"(read-only file-system error) for all operations which modify it. In this case\n"
-"this test program re-mounts the file-system and checks that all files and\n"
-"directories which have been successfully synchronized before the power cut are\n"
-"there and contains correct data. Then the test continues.\n";
+"\n"
+"The test creates a directory named \"integck_test_dir_<pid>\", where where\n"
+"<pid> is the process id. Then it randomly creates and deletes files,\n"
+"directories, symlinks, and hardlinks, randomly writes and truncate files,\n"
+"sometimes makes holes in files, sometimes fsync()'s them. Then it un-mounts and\n"
+"re-mounts the tested file-system and checks the contents - everything (files,\n"
+"directories, etc) should be there and the contents of the files should be\n"
+"correct. This is repeated a number of times (set with -n, default 1).\n"
+"\n"
+"This test is also able to perform power cut testing. The underlying file-system\n"
+"or the device driver should be able to emulate power-cuts, by switching to R/O\n"
+"mode at random moments. And the file-system should return EROFS (read-only\n"
+"file-system error) for all operations which modify it. In this case this test\n"
+"program re-mounts the file-system and checks that all files and directories\n"
+"which have been successfully synchronized before the power cut. And the test\n"
+"continues forever.\n";
 
 static const char optionsstr[] =
 "-n, --repeat=<count> repeat count, default is 1; zero value - repeat forever\n"
-"-p, --power-cut      power cut testing mode\n"
-"-v, --verbose        be verbose about failure during power cut testing\n"
+"-p, --power-cut      power cut testing mode (-n parameter is ignored and the\n"
+"                     test continues forever)\n"
+"-v, --verbose        be verbose about failures during power cut testing\n"
 "-h, -?, --help       print help message\n"
 "-V, --version        print program version\n";
 
-- 
1.7.2.3
