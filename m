Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q76iv-0004XL-9K
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 13:55:17 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p35DtB5f005254
	for <linux-mtd@lists.infradead.org>; Tue, 5 Apr 2011 16:55:11 +0300
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCHv1 3/5] tests: fs-tests: check return value of functions
Date: Tue,  5 Apr 2011 16:55:52 +0300
Message-Id: <aeae7a7b14f785f1bd3ee5fd74dea8e7521a160b.1302011698.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <112dd0ed24fca0a1af988a2c99f1258468184d68.1302011698.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <f17ef71846bf870b69b04127ac0d7d924678ebee.1302011698.git.ext-andriy.shevchenko@nokia.com>
References: <1302007944.2760.126.camel@localhost>
	<f17ef71846bf870b69b04127ac0d7d924678ebee.1302011698.git.ext-andriy.shevchenko@nokia.com>
	<112dd0ed24fca0a1af988a2c99f1258468184d68.1302011698.git.ext-andriy.shevchenko@nokia.com>
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

chdir() returns negative value in case of error.
fscanf() returns amount of successfully parsed parameters.

Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
---
 tests/fs-tests/lib/tests.c           |    3 ++-
 tests/fs-tests/stress/atoms/pdfrun.c |    5 ++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

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
-- 
1.6.3.3
